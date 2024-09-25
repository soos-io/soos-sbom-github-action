# [SOOS SBOM](https://soos.io/products/sbom-manager)

SOOS is an independent software security company, located in Winooski, VT USA, building security software for your team. [SOOS, Software security, simplified](https://soos.io).

Use SOOS to scan your software for [vulnerabilities](https://app.soos.io/research/vulnerabilities) and [open source license](https://app.soos.io/research/licenses) issues with [SOOS Core SCA](https://soos.io/products/sca). [Generate and ingest SBOMs](https://soos.io/products/sbom-manager). [Export reports](https://kb.soos.io/help/soos-reports-for-export) to industry standards. Govern your open source dependencies. Run the [SOOS DAST vulnerability scanner](https://soos.io/products/dast) against your web apps or APIs. [Scan your Docker containers](https://soos.io/products/containers) for vulnerabilities. Check your source code for issues with [SAST Analysis](https://soos.io/products/sast).

[Demo SOOS](https://app.soos.io/demo) or [Register for a Free Trial](https://app.soos.io/register).

If you maintain an Open Source project, sign up for the Free as in Beer [SOOS Community Edition](https://soos.io/products/community-edition).

## How to use it:

You can use the Action as follows:

- Update the `.github/workflows/main.yml` file to include a step like this
``` yaml
on: [push]

jobs:
  soos_sbom_analysis_example:
    name: SOOS SBOM Analysis Example
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@master
      - name: Run SOOS SBOM Analysis
        uses: soos-io/soos-sbom-github-action@v1
        with:
          client_id: ${{ secrets.SOOS_CLIENT_ID }}
          api_key: ${{ secrets.SOOS_API_KEY }}
          project_name: "My Project Name"
          sbom_path: "SBOM path relative to the repository or empty if it's on the root"

```

## Parameters

| Property               | Default                      | Description                                                                                                                  |
|------------------------|------------------------------|------------------------------------------------------------------------------------------------------------------------------|
| api_key                | [none]                       | The Api Key provided to you when subscribing to SOOS services.                                                               |
| api_url                | "https://api.soos.io/api/"   | The API BASE URI provided to you when subscribing to SOOS services.                                                          |
| branch_name            | [none]                       | Branch Name to create scan under.                                                                                            |
| branch_uri             | [none]                       | URI to branch from SCM system.                                                                                               |
| build_uri              | [none]                       | URI to CI build info.                                                                                                        |
| build_version          | [none]                       | Version of application build artifacts.                                                                                      |
| client_id              | [none]                       | The Client Id provided to you when subscribing to SOOS services.                                                             |
| directories_to_exclude | `**/node_modules/**, "**/bin/**", "**/obj/**", "**/lib/**` | Listing of directories or patterns to exclude from the search for SBOM files. eg: **bin/start/**, **/start/** |
| files_to_exclude       | [none]                       | Listing of files or patterns patterns to exclude from the search for SBOM files. eg: **/int**.spdx.json/, **/internal.spdx.json |
| log_level              | 'INFO'                       | Log level to show: DEBUG, INFO, WARN, FAIL, ERROR.                                                                           |
| operating_environment | ${{ runner.os }}             | System info regarding operating system, etc.                                                                                  |
| project_name          | ${{ github.repository }}     | The project name that will be displayed on the dashboard. By Default is owner/repository_name.                                |
| sbom_path             | [none]                       | The SBOM file or folder to scan. When a folder is specified all SBOMs found in the folder and sub-folders will be scanned. When this parameter is specified it should be indicated relative to the repository (eg: sboms/your_sbom.cdx.json) |
