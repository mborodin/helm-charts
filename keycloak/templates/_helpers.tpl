{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{- define "postgres.fullname" -}}
{{- printf "%s-%s" .Release.Name .Values.postgres.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "labels" -}}
app: "{{ .Release.Name }}"
component: "{{ default .Chart.Name .Values.nameOverride }}"
component_version: "{{ .Chart.Version}}"
heritage: "{{ .Release.Service }}"
{{- end -}}

{{- define "template.labels" -}}
app: "{{ .Release.Name }}"
component: "{{ default .Chart.Name .Values.nameOverride }}"
{{- end -}}

{{- define "hostname" -}}
{{ default (printf "%s.%s" .Release.Name .Values.ingress.hostbase) .Values.ingress.hostname }}
{{- end -}}
