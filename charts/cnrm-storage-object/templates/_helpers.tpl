{{/*
Expand the name of the chart.
*/}}
{{- define "storage-object.name" -}}
{{- default .Release.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "storage-object.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Values.global.projectID .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "storage-object.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "storage-object.labels" -}}
helm.sh/chart: {{ include "storage-object.chart" . }}
{{ include "storage-object.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "storage-object.selectorLabels" -}}
app.kubernetes.io/name: {{ include "storage-object.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "storage-object.serviceAccountName" -}}
{{- if .Values.global.serviceAccount.name }}
{{- .Values.global.serviceAccount.name }}
{{- else }}
{{-  include "storage-object.name" . }}
{{- end }}
{{- end }}

{{/*
Create custom role name
Custom role can not contain any other characters but [a-z0-9\.]
*/}}
{{- define "storage-object.customRoleNamePrefix" -}}
{{- (include "storage-object.serviceAccountName" .) | replace "-" "." | replace "_" "." | trimSuffix "." }}
{{- end }}
