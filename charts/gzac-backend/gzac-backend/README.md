# gzac-backend

![Version: 3.3.1](https://img.shields.io/badge/Version-3.3.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 12.12.0](https://img.shields.io/badge/AppVersion-12.12.0-informational?style=flat-square)

A Helm chart for Kubernetes

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry-1.docker.io/bitnamicharts | keycloak | ~15.1.2 |
| oci://registry-1.docker.io/bitnamicharts | mysql | ~9.10.1 |
| oci://registry-1.docker.io/bitnamicharts | postgresql | ~12.5.6 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity for gzac-backend pods assignment |
| autoscaling.enabled | bool | `false` | Enable/disable autoscaling for the gzac-backend deployment |
| autoscaling.maxReplicas | int | `100` | Maximum replicas for the gzac-backend deployment |
| autoscaling.minReplicas | int | `1` | Minimum replicas for the gzac-backend deployment |
| autoscaling.targetCPUUtilizationPercentage | int | `80` | gzac-backend Deployment autoscaling target CPU percentage |
| autoscaling.targetMemoryUtilizationPercentage | int | `80` | gzac-backend Deployment autoscaling target Mem utilization percentage |
| existingSecret | string | `nil` | Refer to an existing secret to avoid managing secrets through Helm. |
| extraEnvVars | list | `[]` | Array with extra environment variables to add |
| extraVolumeMounts | list | `[]` | Optionally specify extra list of additional volumeMounts |
| extraVolumes | list | `[]` | Optionally specify extra list of additional volumes |
| fullnameOverride | string | `""` | String to fully override gzac-backend.fullname |
| image.pullPolicy | string | `"IfNotPresent"` | Pull policy for the image |
| image.repository | string | `"ritense/gzac-backend"` | Domain of the image repository |
| image.tag | string | `"12.2.1"` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` | Image pull secrets |
| ingress.annotations | object | `{}` | Ingress annotations |
| ingress.enabled | bool | `false` | Expose the gzac-backend UI through an ingress |
| ingress.hosts[0].host | string | `"chart-example.local"` | Ingress hostname |
| ingress.hosts[0].paths | list | `[{"backend":{"service":{"name":null,"port":{"number":null}}},"path":"/api","pathType":"Prefix"},{"backend":{"service":{"name":null,"port":{"number":null}}},"path":"/v3","pathType":"Prefix"},{"backend":{"service":{"name":null,"port":{"number":null}}},"path":"/camunda","pathType":"Prefix"}]` | Ingress paths to route to the gzac backend. Recommended to keep these default values. |
| ingress.ingressClassName | string | `""` | Ingress Class which will be used to implement the Ingress |
| ingress.tls | list | `[]` | Enable TLS for the Ingress |
| keycloak | object | `{"auth":{"adminPassword":"","adminUser":"user","existingSecret":""}}` | Keycloak subchart by Bitnami. See https://artifacthub.io/packages/helm/bitnami/keycloak?modal=values for all possible values |
| livenessProbe.failureThreshold | int | `3` | Failure threshold for livenessProbe |
| livenessProbe.httpGet.path | string | `"/api/v1/ping"` |  |
| livenessProbe.httpGet.port | int | `8080` |  |
| livenessProbe.initialDelaySeconds | int | `10` | Initial delay seconds for livenessProbe |
| livenessProbe.periodSeconds | int | `40` | Period seconds for livenessProbe |
| mysql | object | `{"auth":{"existingSecret":"","rootPassword":""}}` | MySQL subchart by Bitnami. See https://artifacthub.io/packages/helm/bitnami/mysql?modal=values for all possible values |
| nameOverride | string | `""` | Name override for gzac-backend |
| nodeSelector | object | `{}` | Node labels for gzac-backend pods assignment |
| persistence.annotations | object | `{}` |  |
| persistence.enabled | bool | `false` | Enable/disable persistent volumes for Gzac-backend |
| persistence.existingClaim | string | `nil` | persistence.existingClaim The name of an existing PVC to use for persistence |
| persistence.mountPath | string | `"/tmp"` | persistence.mountPath Path to mount the volume at. |
| persistence.size | string | `"1Gi"` | persistence.size Size of data volume |
| persistence.storageClassName | string | `""` |  |
| podAnnotations | object | `{}` | Annotations for gzac-backend pods |
| podLabels | object | `{}` | Labels for gzac-backend pods |
| podSecurityContext.fsGroup | int | `1000` | Set gzac-backend's pod security fsGroup |
| postgresql | object | `{"auth":{"existingSecret":"","postgresPassword":"","secretKeys":{"adminPasswordKey":"","replicationPasswordKey":"","userPasswordKey":""}}}` | Postgresql subchart by Bitnami. See https://artifacthub.io/packages/helm/bitnami/postgresql?modal=values for all possible values |
| readinessProbe.failureThreshold | int | `3` | Failure threshold for readinessProbe |
| readinessProbe.httpGet.path | string | `"/api/v1/ping"` |  |
| readinessProbe.httpGet.port | int | `8080` |  |
| readinessProbe.initialDelaySeconds | int | `10` | Initial delay seconds for readinessProbe |
| readinessProbe.periodSeconds | int | `20` | Period seconds for readinessProbe |
| replicaCount | int | `1` | Amount of replicas running the gzac-backend |
| resources | object | `{}` | Resources for gzac-backend |
| securityContext.capabilities.drop | list | `["ALL"]` | gzac-backend's container security context capabilities to be dropped |
| securityContext.readOnlyRootFilesystem | bool | `false` | gzac-backend's container security context readOnlyRootFilesystem |
| securityContext.runAsNonRoot | bool | `true` | Run gzac-backend containers as non-root |
| securityContext.runAsUser | int | `1000` | Run gzac-backend containers under this user-ID |
| service.port | int | `80` | gzac-backend service port |
| service.type | string | `"ClusterIP"` | gzac-backend service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | If not set and create is true, a name is generated using the fullname template |
| settings.camunda.adminUserID | string | `"admin"` | Default Camunda admin user |
| settings.camunda.adminUserPassword | string | `""` | Default Camunda admin password.  Or, if using existingSecret: `CAMUNDA_BPM_ADMINUSER_PASSWORD` |
| settings.gzac.appHostName | string | `nil` | The hostname which exposes gzac-backend |
| settings.gzac.connectorEncryptionSecret | string | `""` | Encryption secret Or, if using existingSecret: `VALTIMO_CONNECTORENCRYPTION_SECRET` |
| settings.gzac.databaseType | string | `"postgres"` | Type of database to use (can by either 'postgres' or 'mysql') |
| settings.gzac.serverPort | int | `8080` | The port on which gzac-backend is listening |
| settings.keycloak.authServerURL | string | `nil` | URL of Keycloak - Required |
| settings.keycloak.clientID | string | `"valtimo-user-m2m-client"` | Client-ID to connect with Keycloak |
| settings.keycloak.clientRoleID | string | `"valtimo-console"` | Client-ID for using Valtimo with Keycloak client roles. More info: https://docs.valtimo.nl/running-valtimo/application-configuration/configuring-keycloak#client-roles Set to `null` to disable client roles entirely and use realm roles instead. |
| settings.keycloak.clientSecret | string | `""` | Client-Secret to connect with Keycloak. Or, if using existingSecret: `KEYCLOAK_CREDENTIALS_SECRET` and `SPRING_SECURITY_OAUTH2_CLIENT_REGISTRATION_KEYCLOAKAPI_CLIENTSECRET` (must set both) |
| settings.keycloak.publicKey | string | `""` | Keycloak's Public Key used to verify signature of JWTs - Required. In Keycloak, this can be found under (in the realm you're using): 'Realm settings' -> 'Keys'.  Use the public key with Use: 'SIG' and Provider: 'rsa-generated'. |
| settings.keycloak.realm | string | `nil` | Keycloak realm - Required |
| settings.keycloak.version | string | `""` | Keycloak version you are running against - Required |
| settings.spring.actuator.password | string | `""` | Password to access the Spring actuator endpoint. Or, if using existingSecret: `SPRINGACTUATOR_PASSWORD` |
| settings.spring.actuator.username | string | `"admin"` | Username to access the Spring actuator endpoint |
| settings.spring.datasource.password | string | `""` | Password for the database. Or, if using existingSecret: `SPRINGACTUATOR_PASSWORD` |
| settings.spring.datasource.url | string | `nil` | URL for the database |
| settings.spring.datasource.username | string | `nil` | Username for the database |
| settings.spring.profiles.active | string | `"cloud"` | Activated Spring profiles |
| startupProbe.failureThreshold | int | `90` |  |
| startupProbe.httpGet | object | `{"path":"/api/v1/ping","port":8080}` | Startup probe endpoint and parameters If app does not start after 15 minutes, fail the startup probe |
| startupProbe.periodSeconds | int | `10` |  |
| tags.keycloak | bool | `true` | Deploy a Keycloak instance |
| tags.mysql | bool | `false` | Deploy a MySQL instance |
| tags.postgresql | bool | `true` | Deploy a PostgreSQL instance |
| tolerations | list | `[]` | Tolerations for gzac-backend pods assignment |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
