# gzac-backend

![Version: 3.0.10](https://img.shields.io/badge/Version-3.0.10-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 12.2.0](https://img.shields.io/badge/AppVersion-12.2.0-informational?style=flat-square)

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
| fullnameOverride | string | `""` | String to fully override valitmo-backend.fullname |
| image.pullPolicy | string | `"IfNotPresent"` | Pull policy for the image |
| image.repository | string | `"ritense/gzac-backend"` | Domain of the image repository |
| image.tag | string | `"12.2.1"` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` | Image pull secrets |
| ingress.annotations | object | `{}` | Ingress annotations |
| ingress.enabled | bool | `false` | Expose the gzac-backend UI through an ingress |
| ingress.hosts[0] | object | `{"host":"chart-example.local","paths":[{"backend":{"service":{"name":null,"port":{"number":null}}},"path":"/api","pathType":"Prefix"},{"backend":{"service":{"name":null,"port":{"number":null}}},"path":"/v3","pathType":"Prefix"},{"backend":{"service":{"name":null,"port":{"number":null}}},"path":"/camunda","pathType":"Prefix"}]}` | Ingress hostname |
| ingress.hosts[0].paths[0] | object | `{"backend":{"service":{"name":null,"port":{"number":null}}},"path":"/api","pathType":"Prefix"}` | Ingress path |
| ingress.hosts[0].paths[0].pathType | string | `"Prefix"` | Ingress path type |
| ingress.ingressClassName | string | `""` | Ingress Class which will be used to implement the Ingress |
| ingress.tls | list | `[]` | Enable TLS for the Ingress |
| keycloak | object | `{"auth":{"adminPassword":"","adminUser":"user","existingSecret":""}}` | Keycloak subchart by Bitnami. See https://artifacthub.io/packages/helm/bitnami/keycloak?modal=values for all possible values |
| livenessProbe.failureThreshold | int | `6` | Failure threshold for livenessProbe |
| livenessProbe.initialDelaySeconds | int | `40` | Initial delay seconds for livenessProbe |
| livenessProbe.periodSeconds | int | `10` | Period seconds for livenessProbe |
| livenessProbe.successThreshold | int | `1` | Success threshold for livenessProbe |
| livenessProbe.timeoutSeconds | int | `1` | Timeout seconds for livenessProbe |
| mysql | object | `{"auth":{"existingSecret":"","rootPassword":""}}` | MySQL subchart by Bitnami. See https://artifacthub.io/packages/helm/bitnami/mysql?modal=values for all possible values |
| nameOverride | string | `""` | Name override for gzac-Backend |
| nodeSelector | object | `{}` | Node labels for gzac-backend pods assignment |
| persistence.annotations | object | `{}` |  |
| persistence.enabled | bool | `false` | Enable/disable persistent volumes for Gzac-backend |
| persistence.existingClaim | string | `nil` | persistence.existingClaim The name of an existing PVC to use for persistence |
| persistence.mountPath | string | `"/tmp"` | persistence.mountPath Path to mount the volume at. |
| persistence.size | string | `"1Gi"` | persistence.size Size of data volume |
| persistence.storageClass | string | `""` |  |
| podAnnotations | object | `{}` | Annotations for gzac-backend pods |
| podLabels | object | `{}` | Labels for gzac-backend pods |
| podSecurityContext.fsGroup | int | `1000` | Set gzac-backend's pod security fsGroup |
| postgresql | object | `{"auth":{"existingSecret":"","postgresPassword":"","secretKeys":{"adminPasswordKey":"","replicationPasswordKey":"","userPasswordKey":""}}}` | Postgresql subchart by Bitnami. See https://artifacthub.io/packages/helm/bitnami/postgresql?modal=values for all possible values |
| readinessProbe.failureThreshold | int | `6` | Failure threshold for readinessProbe |
| readinessProbe.initialDelaySeconds | int | `20` | Initial delay seconds for readinessProbe |
| readinessProbe.periodSeconds | int | `10` | Period seconds for readinessProbe |
| readinessProbe.successThreshold | int | `1` | Success threshold for readinessProbe |
| readinessProbe.timeoutSeconds | int | `1` | Timeout seconds for readinessProbe |
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
| settings.camunda.adminUserPassword | string | `""` | Default Camunda admin password |
| settings.gzac.appHostName | string | `nil` | The hostname which exposes gzac-backend |
| settings.gzac.connectorEncryptionSecret | string | `""` | Encryption secret |
| settings.gzac.databaseType | string | `"postgres"` | Type of database to use (can by either 'postgres' or 'mysql') |
| settings.gzac.serverPort | int | `8080` | The port on which gzac-backend is listening |
| settings.keycloak.authServerURL | string | `nil` | URL of Keycloak |
| settings.keycloak.client | string | `nil` | Keycloak client - used to retrieve client roles |
| settings.keycloak.clientID | string | `nil` | Client-ID to connect with Keycloak |
| settings.keycloak.clientSecret | string | `""` | Client-Secret to connect with Keycloak |
| settings.keycloak.publicKey | string | `nil` | Keycloak's Public Key used to verify signature of JWTs |
| settings.keycloak.realm | string | `nil` | Keycloak realm |
| settings.spring.actuator.password | string | `""` | Password to access the Spring actuator endpoint |
| settings.spring.actuator.username | string | `"admin"` | Username to access the Spring actuator endpoint |
| settings.spring.datasource.password | string | `""` | Password for the database |
| settings.spring.datasource.url | string | `nil` | URL for the database |
| settings.spring.datasource.username | string | `nil` | Username for the database |
| settings.spring.profiles.active | string | `"cloud"` | Activated Spring profiles |
| settings.spring.security | object | `{"oauth2":{"client":{"provider":{"keycloakapi":{"issuerUri":null},"keycloakjwt":{"issuerUri":null}},"registration":{"keycloakapi":{"clientId":null,"clientSecret":null},"keycloakjwt":{"clientId":null}}},"resourceserver":{"jwt":{"jwkSetUri":null}}}}` | oauth2 for keycloak. Use either this or the keycloak config |
| tags.keycloak | bool | `true` | Deploy a Keycloak instance |
| tags.mysql | bool | `false` | Deploy a MySQL instance |
| tags.postgresql | bool | `true` | Deploy a PostgreSQL instance |
| tolerations | list | `[]` | Tolerations for gzac-backend pods assignment |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
