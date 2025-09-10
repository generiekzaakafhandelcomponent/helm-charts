# Valtimo GZAC Helm charts

This repository contains the helm charts for the Valtimo GZAC application and a Keycloak-compatible version of Camunda Cockpit to run alongside it.

For the GZAC backend, please pick the right chart version to ensure the proper configmap/envvars are setup in your cluster.

| Chart Version | GZAC Backend version | Git Branch version |
| ------------- | -------------------- | ------------------ |
| `1.x.y`       | `>=10.0.0`           | `Release/1.x.x`    |
| `2.x.y`       | `>=11.0.0`           | `Release/2.x.x`    |
| `3.x.y`       | `>=12.0.0`           | `Release/3.x.x`    |
| `4.x.y`       | `>=13.0.0`           | `main`             |

Note that **the Helm Charts do not follow semver**.

The Chart versioning scheme is `<app-compatibility>.<breaking-change>.<non-breaking-change>`.

Find the helm configuration values here:

- [GZAC Backend](/charts/gzac-backend/gzac-backend/README.md)
- [GZAC Frontend](/charts/gzac-frontend/gzac-frontend/README.md)
- [Camunda Cockpit](/charts/camunda-cockpit-keycloak/README.md)

The generated list of published helm releases can be found [here](https://generiekzaakafhandelcomponent.github.io/helm-charts/index.yaml).

## Migration guides

### GZAC backend Helm chart version 3 to 4

- Ingress
  - Old: `ingress.hosts`
  - New: Remove `ingress.hosts` completely. Set `ingress.host` (singular) to the GZAC backend hostname. Default Ingress rules are inferred from this.
- Operaton (was Camunda)
  - `settings.camunda.adminUserID` → `settings.operaton.adminUserID`
  - `settings.camunda.adminUserPassword` → `settings.operaton.adminUserPassword`
  - Update secret key `CAMUNDA_BPM_ADMINUSER_PASSWORD` to `OPERATON_BPM_ADMINUSER_PASSWORD`.
- Subcharts
  - Provision DB/Keycloak externally or install separate charts; remove old subchart values from overrides.
- Keycloak
  - If your Keycloak has `KC_HTTP_RELATIVE_PATH` configured to a non-default: Set `settings.keycloak.httpRelativePath`
- API URL
  - If the GZAC backend is served from a different domain than the frontend: Set `gzac.apiUrl` to the backend URL
