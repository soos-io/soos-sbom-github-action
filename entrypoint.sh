#!/bin/bash -l

SOOS_APP_VERSION=${GITHUB_ACTION_REF}

SOOS_INTEGRATION_NAME="GitHub"
SOOS_INTEGRATION_TYPE="Plugin"

SOOS_BRANCH_NAME=${SOOS_BRANCH_NAME:-${GITHUB_REF}}
SOOS_SBOM_PATH=${SOOS_SBOM_PATH:-${GITHUB_WORKSPACE}}

PARAMS=(
    "--apiKey ${SOOS_API_KEY}"
    "--apiURL ${SOOS_API_URL}"
    "--appVersion ${SOOS_APP_VERSION}"
    "--branchName ${SOOS_BRANCH_NAME}"
    ${SOOS_BRANCH_URI:+--branchUri ${SOOS_BRANCH_URI}}
    ${SOOS_BUILD_URI:+--buildUri ${SOOS_BUILD_URI}}
    ${SOOS_BUILD_VERSION:+--buildVersion ${SOOS_BUILD_VERSION}}
    "--clientId ${SOOS_CLIENT_ID}"
    "--commitHash ${GITHUB_SHA}"
    "--integrationName ${SOOS_INTEGRATION_NAME}"
    "--integrationType ${SOOS_INTEGRATION_TYPE}"
    "--projectName ${SOOS_PROJECT_NAME}"
    ${SOOS_VERBOSE:+--verbose}
)

PARAMS_STRING="${PARAMS[@]}"

soos-sbom "${SOOS_SBOM_PATH}" ${PARAMS_STRING}
