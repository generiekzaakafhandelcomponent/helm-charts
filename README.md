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
