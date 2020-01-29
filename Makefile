oc-client-setup:
	oc apply -f 1-setup/oc-client

report-server-setup:
	helm template 1-setup/report-server | oc apply -f -

sonarqube-setup:
	helm template 1-setup/sonarqube | oc apply -f -

tekton-ui-setup:
	oc apply -f 1-setup/tekton-ui

triggers-setup:
	oc apply -f 1-setup/triggers

setup: oc-client-setup report-server-setup sonarqube-setup tekton-ui-setup triggers-setup
	echo "Env setup is done"

print-env:
	tkn tasks list
	tkn taskruns list
	tkn pipelines list
	tkn pipelineruns list
	tkn resource list

tkn-clean-all:
	oc get taskrun  | grep kbit | cut -f1 -d' ' | xargs oc delete taskrun
	oc get pipelinerun  | grep kbit | cut -f1 -d' ' | xargs oc delete pipelinerun
	oc get pipelineresources  | grep kbit | cut -f1 -d' ' | xargs oc delete pipelineresources



demo-clean-all:
	oc delete -f 10-simple-task/
	oc delete -f 20-cluster-task/
	oc delete -f 30-code-scan/
	oc delete -f 40-integration-tests/
	oc delete -f 50-pipeline/
	oc delete -f 60-triggers
