{{/*
Create the name of the service account to use
*/}}
{{- define "iambase.serviceAccountName" -}}
{{- if .Values.global.serviceAccount.name }}
{{- .Values.global.serviceAccount.name }}
{{- else }}
{{- .Release.Name }}
{{- end }}
{{- end }}
