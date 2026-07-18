#!/bin/sh
# shellcheck shell=sh
#
# Shared functions for bin/sandbox. Sourced, never executed directly.

set -eu

WORKSPACE_DIR="${WORKSPACE_DIR:-/workspace}"
SANDBOX_ARTIFACT_CONTEXT="${SANDBOX_ARTIFACT_CONTEXT:?SANDBOX_ARTIFACT_CONTEXT not set}"
SANDBOX_IMAGE_NAME="${SANDBOX_IMAGE_NAME:-${SANDBOX_ARTIFACT_CONTEXT}}"
SANDBOX_ARTIFACT_NAME="${SANDBOX_ARTIFACT_NAME:-${SANDBOX_ARTIFACT_CONTEXT}.tgz}"
SANDBOX_DIR_CONTEXT="${SANDBOX_DIR_CONTEXT:-}"

log()  { printf '%s\n' "$*" >&2; }
die()  { log "ERROR: $*"; exit 1; }

container_name_for_tag() {
    printf '%s' "$1" | tr ':/' '--'
}

strip_localhost_prefix() {
    sed 's#^localhost/##'
}

detect_artifact() {
    mode="$1"

    if [ "$mode" = "tgz" ]; then
        expected="${WORKSPACE_DIR}/${SANDBOX_ARTIFACT_CONTEXT}/${SANDBOX_ARTIFACT_NAME}"
        if [ -f "$expected" ]; then
            log "Artefact (expected path): $expected"
            printf 'tgz:%s\n' "$expected"
            return
        fi
        log "NOTE: expected .tgz not found at:"
        log "  $expected"
        log "(SANDBOX_ARTIFACT_CONTEXT=${SANDBOX_ARTIFACT_CONTEXT}, SANDBOX_ARTIFACT_NAME=${SANDBOX_ARTIFACT_NAME} - check .env if this target uses different values)"
        log "Falling back to a search by most recent modification time under ${WORKSPACE_DIR}..."
        picked=$(_search_most_recent "$WORKSPACE_DIR" -type f -name '*.tgz')
        [ -n "$picked" ] || die "no .tgz found anywhere under ${WORKSPACE_DIR}. Build with the *-test.yaml config first."
        printf 'tgz:%s\n' "$picked"
        return
    fi

    if [ "$mode" = "dir" ]; then
        search_root="$WORKSPACE_DIR"
        if [ -n "$SANDBOX_DIR_CONTEXT" ]; then
            search_root="${WORKSPACE_DIR}/${SANDBOX_DIR_CONTEXT}"
            log "Searching under ${search_root} (SANDBOX_DIR_CONTEXT set)..."
        else
            log "Searching for a filesystem/ directory under ${WORKSPACE_DIR} (no SANDBOX_DIR_CONTEXT set, most recent wins)..."
        fi
        picked=$(_search_most_recent "$search_root" -type d -name 'filesystem')
        [ -n "$picked" ] || die "no filesystem/ directory found under ${search_root}. Build with -f first."
        printf 'dir:%s\n' "$picked"
        return
    fi

    die "detect_artifact: unknown mode '${mode}' (expected tgz or dir)"
}

_search_most_recent() {
    root="$1"; shift
    candidates=$(find "$root" -maxdepth 3 "$@" -printf '%T@ %p\n' 2>/dev/null | sort -rn)
    [ -n "$candidates" ] || return 0

    count=$(printf '%s\n' "$candidates" | wc -l)
    if [ "$count" -gt 1 ]; then
        log "WARNING: multiple candidates found, picking the most recently modified one:"
        printf '%s\n' "$candidates" | while read -r _ts f; do log "  - $f"; done
    fi
    printf '%s\n' "$candidates" | head -n1 | cut -d' ' -f2-
}

auto_tag_for_artifact() {
    artifact="$1"
    stamp=$(date -r "$artifact" +%Y%m%d-%H%M%S)
    printf '%s:%s\n' "$SANDBOX_IMAGE_NAME" "$stamp"
}

list_image_tags() {
    podman images --format '{{.Repository}}:{{.Tag}}|{{.CreatedAt}}' 2>/dev/null \
        | strip_localhost_prefix \
        | awk -F'|' -v want="${SANDBOX_IMAGE_NAME}:" 'index($1, want) == 1 {print $2"|"$1}' \
        | sort -r \
        | cut -d'|' -f2
}

latest_image_tag() {
    list_image_tags | head -n1
}

image_exists() {
    podman image exists "$1" 2>/dev/null
}