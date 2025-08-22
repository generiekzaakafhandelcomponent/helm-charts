# camunda-cockpit-keycloak

![Version: 0.0.0](https://img.shields.io/badge/Version-0.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.1.0](https://img.shields.io/badge/AppVersion-v0.1.0-informational?style=flat-square)

A Helm chart for deploying the Camunda Cockpit Keycloak application.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `10` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| existingSecret | string | `nil` |  |
| fullnameOverride | string | `""` | To override the name used primarily as name for the resources. |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/ritense/camunda-cockpit-keycloak"` |  |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` | A list that references secrets in the same namespace. |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` | Set the ingress class name, unless the default class is sufficient. |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| livenessProbe.failureThreshold | int | `6` |  |
| livenessProbe.initialDelaySeconds | int | `40` |  |
| livenessProbe.periodSeconds | int | `10` |  |
| livenessProbe.successThreshold | int | `1` |  |
| livenessProbe.timeoutSeconds | int | `1` |  |
| nameOverride | string | `""` | To override the name of the chart deployed. |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{"fsGroup":1000,"runAsGroup":1000,"runAsUser":1000}` | An intentional strict default pod context. Adjust accordingly or configure  container specific settings using the 'securityContext' value. |
| readinessProbe.failureThreshold | int | `6` |  |
| readinessProbe.initialDelaySeconds | int | `20` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| readinessProbe.successThreshold | int | `1` |  |
| readinessProbe.timeoutSeconds | int | `1` |  |
| replicaCount | int | `1` | Number of replicas, only in use if autoscaling is disabled. |
| resources.limits.cpu | string | `"250m"` |  |
| resources.limits.memory | string | `"512Mi"` |  |
| securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsNonRoot":true,"seccompProfile":{"type":"RuntimeDefault"}}` | An intentional strict default container context. Adjust accordingly. |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.automountServiceAccountToken | bool | `false` | Whether or not the service account token should be mounted into the pod.  Mounting is only required when Kubernetes API access is needed. |
| serviceAccount.create | bool | `true` | By default, the service account is created to avoid security risks when using the 'default' Kubernetes service account. |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| settings.camunda.authorization.enabled | bool | `true` |  |
| settings.camunda.database.type | string | `"postgres"` |  |
| settings.camunda.historyLevel | string | `"audit"` |  |
| settings.camunda.jobExecution.deploymentAware | bool | `true` |  |
| settings.camunda.jobExecution.enabled | bool | `false` |  |
| settings.camunda.webapp.applicationPath | string | `nil` |  |
| settings.logLevelSpringSecurity | string | `"DEBUG"` |  |
| settings.management.endpoint.health.showDetails | string | `"when_authorized"` |  |
| settings.management.endpoints.jmx.exposure.exclude | string | `"*"` |  |
| settings.management.endpoints.web.basePath | string | `"/management"` |  |
| settings.management.endpoints.web.exposure.include[0] | string | `"health"` |  |
| settings.management.endpoints.web.exposure.include[1] | string | `"info"` |  |
| settings.management.info.build.enabled | bool | `true` |  |
| settings.management.info.env.enabled | bool | `true` |  |
| settings.management.info.git.enabled | bool | `true` |  |
| settings.management.info.git.mode | string | `"simple"` |  |
| settings.plugin.administratorGroupName | string | `"camunda-admin"` |  |
| settings.plugin.disableSSLCertificateValidation | bool | `true` |  |
| settings.plugin.enforceSubgroupsInGroupQuery | bool | `true` |  |
| settings.plugin.keycloakAdminUrl | string | `nil` |  |
| settings.plugin.useEmailAsCamundaUserId | bool | `false` |  |
| settings.plugin.useGroupPathAsCamundaGroupId | bool | `true` |  |
| settings.plugin.useUsernameAsCamundaUserId | bool | `true` |  |
| settings.server.port | int | `8084` |  |
| settings.server.servlet.contextPath | string | `"/camunda"` |  |
| settings.spring.application.name | string | `"camunda-cockpit"` |  |
| settings.spring.datasource.driverClassName | string | `"org.postgresql.Driver"` |  |
| settings.spring.datasource.password | string | `nil` |  |
| settings.spring.datasource.url | string | `nil` |  |
| settings.spring.datasource.username | string | `nil` |  |
| settings.spring.keycloak.authorizationGrantType | string | `"authorization_code"` |  |
| settings.spring.keycloak.clientId | string | `"camunda-identity-service"` |  |
| settings.spring.keycloak.clientSecret | string | `nil` |  |
| settings.spring.keycloak.provider | string | `"keycloak"` |  |
| settings.spring.keycloak.providerIssuerUri | string | `"http://localhost/auth/realms/valtimo"` |  |
| settings.spring.keycloak.providerUserNameAttribute | string | `"preferred_username"` |  |
| settings.spring.keycloak.redirectUri | string | `"{baseUrl}/{action}/oauth2/code/{registrationId}"` |  |
| settings.spring.keycloak.scope | string | `"openid, profile, email"` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
