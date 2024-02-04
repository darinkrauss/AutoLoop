#!/bin/sh -eu

SCRIPT="$(basename "${0}")"
DIRECTORY="$(dirname -- "$(readlink -f -- "${0}")")"

ROOT_DIRECTORY="$(dirname "${DIRECTORY}")"

GREEN="\033[32m"
RED="\033[31m"
CLEAR="\033[m"

usage() {
    echo "Usage: ${SCRIPT} <directory>" >&2
}

usage_error() {
    echo "${RED}ERROR: ${*}${CLEAR}" >&2
    usage
    exit 1
}

error() {
    echo "${RED}ERROR: ${*}${CLEAR}" >&2
    exit 1
}

info() {
    echo "${GREEN}${*}${CLEAR}" >&2
}

if [ ${#} -lt 1 ]; then
  usage_error "Missing arguments"
fi

LOOP_WORKSPACE_DIRECTORY="${1}"
shift 1

if [ ${#} -ne 0 ]; then
    usage_error "Unexpected arguments: ${*}"
fi

if [ -e "${LOOP_WORKSPACE_DIRECTORY}" ]; then
    error "${LOOP_WORKSPACE_DIRECTORY} already exists"
fi

info "Cloning LoopWorkspace..."
mkdir -p "${LOOP_WORKSPACE_DIRECTORY}"
git clone --quiet --branch=main --recurse-submodules https://github.com/LoopKit/LoopWorkspace.git "${LOOP_WORKSPACE_DIRECTORY}"

info "Patching Loop AppIcon..."
rm -rf "${LOOP_WORKSPACE_DIRECTORY}/OverrideAssetsLoop.xcassets/AppIcon.appiconset"
cp -r "${ROOT_DIRECTORY}/patches/LoopWorkspace/OverrideAssetsLoop.xcassets/AppIcon.appiconset" "${LOOP_WORKSPACE_DIRECTORY}/OverrideAssetsLoop.xcassets/AppIcon.appiconset"

info "Patching WatchApp AppIcon..."
rm -rf "${LOOP_WORKSPACE_DIRECTORY}/OverrideAssetsWatchApp.xcassets/AppIcon.appiconset"
cp -r "${ROOT_DIRECTORY}/patches/LoopWorkspace/OverrideAssetsWatchApp.xcassets/AppIcon.appiconset" "${LOOP_WORKSPACE_DIRECTORY}/OverrideAssetsWatchApp.xcassets/AppIcon.appiconset"

info "Patching LoopConfigOverride..."
patch -u "${LOOP_WORKSPACE_DIRECTORY}/LoopConfigOverride.xcconfig" -i "${ROOT_DIRECTORY}/patches/LoopWorkspace/LoopConfigOverride.xcconfig.patch"

info "Opening Xcode..."
xed "${LOOP_WORKSPACE_DIRECTORY}/LoopWorkspace.xcworkspace"

info "Done."
