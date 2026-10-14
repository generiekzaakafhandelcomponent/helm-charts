{{/*
Expand the name of the chart.
*/}}
{{- define "gzac-backend.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "gzac-backend.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "gzac-backend.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "gzac-backend.labels" -}}
helm.sh/chart: {{ include "gzac-backend.chart" . }}
{{ include "gzac-backend.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "gzac-backend.selectorLabels" -}}
app.kubernetes.io/name: {{ include "gzac-backend.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "gzac-backend.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "gzac-backend.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Name of the bootstrap Job and of the hook resources it uses
*/}}
{{- define "gzac-backend.bootstrapName" -}}
{{- printf "%s-bootstrap" (include "gzac-backend.fullname" . | trunc 53 | trimSuffix "-") }}
{{- end }}

{{/*
bootstrapJob.healthPath with one leading slash and no trailing one
*/}}
{{- define "gzac-backend.bootstrapHealthPath" -}}
{{- printf "/%s" (required "bootstrapJob.healthPath is not set: `helm upgrade --reuse-values` keeps the values of a chart without bootstrapJob, so use --reset-then-reuse-values" .Values.bootstrapJob.healthPath | trimAll "/") }}
{{- end }}

{{/*
A probe, with its httpGet path moved to the bootstrap-aware health group when bootstrapJob is enabled
*/}}
{{- define "gzac-backend.probe" -}}
{{- $probe := deepCopy .probe }}
{{- if and (.context.Values.bootstrapJob | default dict).enabled $probe.httpGet }}
{{- $_ := set $probe.httpGet "path" (printf "%s/%s" (include "gzac-backend.bootstrapHealthPath" .context) .group) }}
{{- end }}
{{- toYaml $probe }}
{{- end }}

{{/*
extraEnvVars rendered without the entries named in .names
*/}}
{{- define "gzac-backend.extraEnvVarsWithout" -}}
{{- $env := .context.Values.extraEnvVars }}
{{- if kindIs "slice" $env }}
{{- $kept := list }}
{{- range $env }}
{{- if not (has (toString .name) $.names) }}
{{- $kept = append $kept . }}
{{- end }}
{{- end }}
{{- $env = $kept }}
{{- end }}
{{- if $env }}
{{- include "gzac-backend.tplvalues.render" (dict "value" $env "context" .context) }}
{{- end }}
{{- end }}

{{/*
"true" when extraEnvVars sets the variable .name
*/}}
{{- define "gzac-backend.extraEnvVarsSet" -}}
{{- if kindIs "slice" .context.Values.extraEnvVars }}
{{- range .context.Values.extraEnvVars }}
{{- if eq (toString .name) $.name }}true{{ end }}
{{- end }}
{{- end }}
{{- end }}

{{/* vim: set filetype=mustache: */}}
{{/*
Renders a value that contains template.
Usage:
{{ include "gzac-backend.tplvalues.render" ( dict "value" .Values.path.to.the.Value "context" $) }}
*/}}
{{- define "gzac-backend.tplvalues.render" -}}
    {{- if typeIs "string" .value }}
        {{- tpl .value .context }}
    {{- else }}
        {{- tpl (.value | toYaml) .context }}
    {{- end }}
{{- end -}}
