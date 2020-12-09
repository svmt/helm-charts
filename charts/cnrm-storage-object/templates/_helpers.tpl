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
