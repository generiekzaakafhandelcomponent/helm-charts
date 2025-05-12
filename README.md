# Valtimo GZAC Helm charts

This repository contains the helm charts for the Valtimo GZAC application.

We maintain three branches, `Release/1.x.x`, `Release/2.x.x` and `main` that are compatible with respectively Valtimo GZAC 10.x, 11.x and 12.x.
Please pick the right chart version to ensure the proper configmap/envvars are setup in your cluster.

| Chart Version | App version |
| ------------- | ----------- |
| `1.x.y`       | `>=10.0.0`  |
| `2.x.y`       | `>=11.0.0`  |
| `3.x.y`       | `>=12.2.0`  |

Note that **the Helm Charts do not follow semver**.

The Chart versioning scheme is `<app-compatibility>.<breaking-change>.<non-breaking-change>`.

Find the helm configuration values here:

- [GZAC Backend](https://github.com/generiekzaakafhandelcomponent/helm-charts/blob/main/charts/gzac-backend/gzac-backend/README.md)
- [GZAC Frontend](https://github.com/generiekzaakafhandelcomponent/helm-charts/tree/main/charts/gzac-frontend/gzac-frontend/README.md)

The generated list of published helm releases can be found [here](https://generiekzaakafhandelcomponent.github.io/helm-charts/index.yaml).
