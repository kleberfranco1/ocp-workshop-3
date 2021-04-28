oc project app-management
oc set volume deploy/mapit --add --name=mapit-storage -t pvc --claim-mode=ReadWriteOnce --claim-size=1Gi --claim-name=mapit-storage --mount-path=/app-storage
oc get deploy mapit
oc get pod
oc describe deploy mapit
oc get storageclass
oc get persistentvolume
oc get persistentvolumeclaim -n app-management
oc rsh $(oc get pods -l deployment=mapit -o name)
oc rsh $(oc get pods -l deployment=mapit -o name) cat /app-storage/hello.txt
oc delete pods -l deployment=mapit && oc get pod
oc rsh $(oc get pods -l deployment=mapit -o name) cat /app-storage/hello.txt
clear
oc get machineset -n openshift-machine-api
oc get machine -n openshift-machine-api
oc get nodes
oc get machineset -n openshift-machine-api
oc scale machineset cluster-83e6-gpf84-worker-us-east-2c -n openshift-machine-api --replicas=2
oc get machines -n openshift-machine-api
oc get nodes
oc get machines -n openshift-machine-api
oc get nodes
oc scale machineset cluster-83e6-gpf84-worker-us-east-2c -n openshift-machine-api --replicas=1
oc get machines -n openshift-machine-api
oc get nodes
oc get machines -n openshift-machine-api
oc get nodes
oc get machines -n openshift-machine-api
oc get machineset -n openshift-machine-api -o yaml cluster-83e6-gpf84-worker-us-east-2c
bash /opt/app-root/src/support/machineset-generator.sh 1 infra 0 | oc create -f -
export MACHINESET=$(oc get machineset -n openshift-machine-api -l machine.openshift.io/cluster-api-machine-role=infra -o jsonpath='{.items[0].metadata.name}')
oc patch machineset $MACHINESET -n openshift-machine-api --type='json' -p='[{"op": "add", "path": "/spec/template/spec/metadata/labels", "value":{"node-role.kubernetes.io/worker":"", "node-role.kubernetes.io/infra":""} }]'
oc scale machineset $MACHINESET -n openshift-machine-api --replicas=3
oc get machineset -n openshift-machine-api
bash /opt/app-root/src/support/machineset-generator.sh 1 infra 0 | oc create -f -
export MACHINESET=$(oc get machineset -n openshift-machine-api -l machine.openshift.io/cluster-api-machine-role=infra -o jsonpath='{.items[0].metadata.name}')
oc patch machineset $MACHINESET -n openshift-machine-api --type='json' -p='[{"op": "add", "path": "/spec/template/spec/metadata/labels", "value":{"node-role.kubernetes.io/worker":"", "node-role.kubernetes.io/infra":""} }]'
oc scale machineset $MACHINESET -n openshift-machine-api --replicas=3
bash /opt/app-root/src/support/machineset-generator.sh 1 infra 0 | oc create -f -
export MACHINESET=$(oc get machineset -n openshift-machine-api -l machine.openshift.io/cluster-api-machine-role=infra -o jsonpath='{.items[0].metadata.name}')
oc patch machineset $MACHINESET -n openshift-machine-api --type='json' -p='[{"op": "add", "path": "/spec/template/spec/metadata/labels", "value":{"node-role.kubernetes.io/worker":"", "node-role.kubernetes.io/infra":""} }]'
oc scale machineset $MACHINESET -n openshift-machine-api --replicas=3
oc get machineset -n openshift-machine-api
cat /opt/app-root/src/support/machineset-generator.sh
echo ${BASH_SOURCE[0]}
cd /opt/app-root/src/support/
ls
cat machineset-cli 
cd
clear
oc get machineset -n openshift-machine-api
oc get machineset -n openshift-machine-api -o yaml cluster-83e6-gpf84-worker-us-east-2c
bash /opt/app-root/src/support/machineset-generator.sh 1 infra 0 | oc create -f -
export MACHINESET=$(oc get machineset -n openshift-machine-api -l machine.openshift.io/cluster-api-machine-role=infra -o jsonpath='{.items[0].metadata.name}')
oc patch machineset $MACHINESET -n openshift-machine-api --type='json' -p='[{"op": "add", "path": "/spec/template/spec/metadata/labels", "value":{"node-role.kubernetes.io/worker":"", "node-role.kubernetes.io/infra":""} }]'
oc scale machineset $MACHINESET -n openshift-machine-api --replicas=3
cat /opt/app-root/src/support/machineset-generator.sh
oc get machineset -n openshift-machine-api
oc get nodes
oc get node ip-10-0-142-50.us-east-2.compute.internal --show-labels
oc get pod -n openshift-ingress-operator
oc get pods -n openshift-ingress -o wide
oc get node ip-10-0-141-36.us-east-
2.compute.internal
oc get node ip-10-0-141-36.us-east-2.compute.internal
oc get ingresses.config.openshift.io cluster -o yaml
oc get ingresscontrollers.operator.openshift.io default -n openshift-ingress-operator -o yaml
oc apply -f /opt/app-root/src/support/ingresscontroller.yaml
cat /opt/app-root/src/support/ingresscontroller.yaml
oc get pod -n openshift-ingress -o wide
oc get node ip-10-0-146-101.us-east-2.compute.internal
oc get configs.imageregistry.operator.openshift.io/cluster -o yaml
oc patch configs.imageregistry.operator.openshift.io/cluster -p '{"spec":{"nodeSelector":{"node-role.kubernetes.io/infra": ""}}}' --type=merge
oc get pod -n openshift-image-registry
oc get configmap cluster-monitoring-config -n openshift-monitoring
oc get configmap -n openshift-monitoring
oc create -f /opt/app-root/src/support/cluster-monitoring-configmap.yaml
cat /opt/app-root/src/support/cluster-monitoring-configmap.yaml
watch 'oc get pod -n openshift-monitoring'
oc get pod -w -n openshift-monitoring
oc get nodes -l node-role.kubernetes.io/worker -l '!node-role.kubernetes.io/infra','!node-role.kubernetes.io/master'
oc get machinesets -n openshift-machine-api | grep -v infra
bash /opt/app-root/src/support/machineset-generator.sh 3 workerocs 0 | oc create -f -
oc get machineset -n openshift-machine-api -l machine.openshift.io/cluster-api-machine-role=workerocs -o name | xargs oc patch -n openshift-machine-api --type='json' -p '[{"op": "add", "path": "/spec/template/spec/metadata/labels", "value":{"node-role.kubernetes.io/worker":"", "role":"storage-node", "cluster.ocs.openshift.io/openshift-storage":""} }]'
oc get machineset -n openshift-machine-api -l machine.openshift.io/cluster-api-machine-role=workerocs -o name | xargs oc scale -n openshift-machine-api --replicas=1
oc get machines -n openshift-machine-api | egrep 'NAME|workerocs'
cat /opt/app-root/src/support/machineset-generator.sh
oc get infrastructures.config.openshift.io cluster -o jsonpath='{.status.infrastructure
Name}'
oc get infrastructures.config.openshift.io cluster -o jsonpath='{.status.infrastructureName}'
oc get infrastructures.config.openshift.io cluster -o jsonpath='{.status.platformStatus.aws.region}'
oc get machines -n openshift-machine-api | egrep 'NAME|workerocs'
watch "oc get machinesets -n openshift-machine-api | egrep 'NAME|workerocs'"
oc get machinesets -n openshift-machine-api | egrep 'NAME|workerocs'
oc get nodes -l node-role.kubernetes.io/worker -l '!node-role.kubernetes.io/infra','!node-role.kubernetes.io/master'
oc get nodes -l cluster.ocs.openshift.io/openshift-storage=
oc create namespace openshift-storage
oc label namespace openshift-storage "openshift.io/cluster-monitoring=true"
oc -n openshift-storage -w get csv
oc -n openshift-storage get csv -w
watch oc -n openshift-storage get csv
oc -n openshift-storage get csv -w
oc -n openshift-storage get pods
oc get nodes --show-labels | grep ocs | cut -d ' ' -f1
oc -n openshift-storage get pods
oc get storagecluster -n openshift-storage
oc get storagecluster -n openshift-storage ocs-storagecluster -o jsonpath='{.status.phase}{"\n"}'
oc -n openshift-storage get sc
oc patch OCSInitialization ocsinit -n openshift-storage --type json --patch  '[{ "op": "replace", "path": "/spec/enableCephTools", "value": true }]'
TOOLS_POD=$(oc get pods -n openshift-storage -l app=rook-ceph-tools -o name)
oc rsh -n openshift-storage $TOOLS_POD
oc new-project my-database-app
oc new-app -f /opt/app-root/src/support/ocslab_rails-app.yaml -p STORAGE_CLASS=ocs-storagecluster-ceph-rbd -p VOLUME_CAPACITY=5Gi
oc delete project my-database-app
oc new-project my-database-app
oc delete project my-database-app
oc new-project my-database-app
oc new-app -f /opt/app-root/src/support/ocslab_rails-app.yaml -p STORAGE_CLASS=ocs-storagecluster-ceph-rbd -p VOLUME_CAPACITY=5Gi
cat /opt/app-root/src/support/ocslab_rails-app.yaml
oc status
oc get pvc -n my-database-app
watch oc get pods -n my-database-app
oc get pods -n my-database-app -w
oc get route rails-pgsql-persistent -n my-database-app -o jsonpath --template="http://{.spec.host}/articles{'\n'}"
TOOLS_POD=$(oc get pods -n openshift-storage -l app=rook-ceph-tools -o name)
oc rsh -n openshift-storage $TOOLS_POD
exit
oc get pv -o 'custom-columns=NAME:.spec.claimRef.name,PVNAME:.metadata.name,STORAGECLASS:.spec.storageClassName,VOLUMEHANDLE:.spec.csi.volumeHandle'
CSIVOL=$(oc get pv $(oc get pv | grep my-database-app | awk '{ print $1 }') -o jsonpath='{.spec.csi.volumeHandle}' | cut -d '-' -f 6- | awk '{print "csi-vol-"$1}')
echo $CSIVOL
TOOLS_POD=$(oc get pods -n openshift-storage -l app=rook-ceph-tools -o name)
oc rsh -n openshift-storage $TOOLS_POD rbd -p ocs-storagecluster-cephblockpool info $CSIVOL
oc rsh -n my-database-app $(oc get pods -n my-database-app|grep postgresql | grep -v deploy | awk {'print $1}')
oc get pvc postgresql -n my-database-app -o yaml > pvc.yaml
cat pvc.yaml 
vi pvc.yaml 
cat pvc.yaml 
oc apply -f pvc.yaml -n my-database-app
oc describe pvc postgresql -n my-database-app
oc get pvc -n my-database-app
vi pvc.yaml 
cat pvc.yaml 
oc apply -f pvc.yaml -n my-database-app
oc get pvc postgresql -n my-database-app -o yaml > pvc.yaml
vi pvc.yaml 
cat pvc.yaml 
oc apply -f pvc.yaml -n my-database-app
oc describe pvc postgresql -n my-database-app
oc get pvc -n my-database-app
echo $(oc get pvc postgresql -n my-database-app -o jsonpath='{.status.capacity.storage}')
echo $(oc get pvc postgresql -n my-database-app -o jsonpath='{.spec.resources.requests.storage}')
oc new-project my-shared-storage
oc new-app openshift/php:7.2-ubi8~https://github.com/christianh814/openshift-php-upload-demo --name=file-uploader
oc logs -f bc/file-uploader -n my-shared-storage
oc expose svc/file-uploader -n my-shared-storage
oc scale --replicas=3 deploy/file-uploader -n my-shared-storage
oc get pods -n my-shared-storage
oc set volume deploy/file-uploader --add --name=my-shared-storage -t pvc --claim-mode=ReadWriteMany --claim-size=1Gi --claim-name=my-shared-storage --claim-class=ocs-storagecluster-cephfs --mount-path=/opt/app-root/src/uploaded -n my-shared-storage
oc get pvc -n my-shared-storage
oc get route file-uploader -n my-shared-storage -o jsonpath --template="http://{.spec.host}{'\n'}"
oc patch pvc my-shared-storage -n my-shared-storage --type json --patch  '[{ "op": "replace", "path": "/spec/resources/requests/storage", "value": "5Gi" }]'
echo $(oc get pvc my-shared-storage -n my-shared-storage -o jsonpath='{.spec.resources.requests.storage}')
echo $(oc get pvc my-shared-storage -n my-shared-storage -o jsonpath='{.status.capacity.storage}')
oc get pvc -n my-database-app | awk {'print $1}'
oc get route rails-pgsql-persistent -n my-database-app -o jsonpath --template="http://{.spec.host}/articles{'\n'}"
oc apply -f /opt/app-root/src/support/postgresql-clone.yaml
cat /opt/app-root/src/support/postgresql-clone.yaml
oc get pvc -n my-database-app | grep clone
oc rsh -n my-database-app $(oc get pods -n my-database-app|grep postgresql | grep -v deploy | awk {'print $1}') psql -c "\c root" -c "\d+" -c "drop table articles cascade;" -c "\d+"
clear
oc rsh -n my-database-app $(oc get pods -n my-database-app|grep postgresql | grep -v deploy | awk {'print $1}') psql -c "\c root" -c "\d+" -c "drop table articles cascade;" -c "\d+"
oc get route rails-pgsql-persistent -n my-database-app -o jsonpath --template="http://{.spec.host}/articles{'\n'}"
oc scale deploymentconfig rails-pgsql-persistent -n my-database-app --replicas=0
oc get pods -n my-database-app | grep rails | egrep -v 'deploy|build|hook' | awk {'print $1}'
oc patch dc postgresql -n my-database-app --type json --patch  '[{ "op": "replace", "path": "/spec/template/spec/volumes/0/persistentVolumeClaim/claimName", "value": "postgresql-clone" }]'
oc scale deploymentconfig rails-pgsql-persistent -n my-database-app --replicas=1
oc get pods -n my-database-app | egrep 'rails|postgresql' | egrep -v 'deploy|build|hook'
oc get route rails-pgsql-persistent -n my-database-app -o jsonpath --template="http://{.spec.host}/articles{'\n'}"
oc get volumesnapshotclasses
oc apply -f /opt/app-root/src/support/my-shared-storage-snapshot.yaml
cat /opt/app-root/src/support/my-shared-storage-snapshot.yaml
oc get volumesnapshot -n my-shared-storage
oc get pvc -n my-shared-storage | grep restore
oc get pods,pvc -n openshift-monitoring
oc -n openshift-monitoring get configmap cluster-monitoring-config
cat /opt/app-root/src/support/ocslab_cluster-monitoring-noinfra.yaml 
oc -n openshift-monitoring get configmap cluster-monitoring-config -o yaml | more
oc get pods,pvc -n openshift-monitoring
noobaa status -n openshift-storage
cd /opt/app-root/src/support/photo-album
./demo.sh
t 
cat demo.sh 
pwd
ls
cat app.yaml
cat demo.sh 
oc -n demo get pods
oc -n demo get obc
oc get ob
oc -n demo get cm photo-album -o yaml | more
-n demo get secret photo-album -o yaml | more
oc -n demo get secret photo-album -o yaml | more
cat /opt/app-root/src/support/photo-album/app.yaml | more
oc get route photo-album -n demo -o jsonpath --template="http://{.spec.host}{'\n'}"
oc get machinesets -n openshift-machine-api | egrep 'NAME|workerocs'
oc get machinesets -n openshift-machine-api -o name | grep workerocs | xargs -n1 -t oc scale -n openshift-machine-api --replicas=2
watch "oc get machinesets -n openshift-machine-api | egrep 'NAME|workerocs'"
oc get machinesets -n openshift-machine-api | egrep 'NAME|workerocs'
oc get machinesets -n openshift-machine-api | egrep 'NAME|workerocs' -w
oc get machinesets -n openshift-machine-api | egrep 'NAME|workerocs'
oc get nodes -l cluster.ocs.openshift.io/openshift-storage -o jsonpath='{range .items[*]}{.metadata.name}{"\n"}'
oc get machinesets -n openshift-machine-api | egrep 'NAME|workerocs'
oc get pod -o=custom-columns=NAME:.metadata.name,STATUS:.status.phase,NODE:.spec.nodeName -n openshift-storage | grep osd | grep -v prepare
TOOLS_POD=$(oc get pods -n openshift-storage -l app=rook-ceph-tools -o name)
oc rsh -n openshift-storage $TOOLS_POD
oc adm must-gather
oc adm must-gather -h
exit
oc create -f /opt/app-root/src/support/openshift_logging_namespace.yaml
cat [~/support/photo-album] $ oc adm must-gather -h
Launch a pod to gather debugging information
 This command will launch a pod in a temporary namespace on your cluster that gathers debugging
information and then downloads the gathered information.
 Experimental: This command is under active development and may change without notice.
Usage:
  oc adm must-gather [flags]
Examples:
  # gather information using the default plug-in image and command, writing into
./must-gather.local.<rand>
  oc adm must-gather
clear
exit
oc create -f /opt/app-root/src/support/openshift_logging_namespace.yaml
cat /opt/app-root/src/support/openshift_logging_namespace.yaml
oc get pods -n openshift-logging
oc get daemonset -n openshift-logging
oc get pvc -n openshift-logging
oc get route -n openshift-logging
oc new-project external-logs
oc create -f /opt/app-root/src/support/extlogs-syslog.yaml -n external-logs
cat /opt/app-root/src/support/extlogs-syslog.yaml
oc create -f /opt/app-root/src/support/extlogs-clusterlogforwarder.yaml
cat /opt/app-root/src/support/extlogs-clusterlogforwarder.yaml
oc delete pod --selector logging-infra=fluentd -n openshift-logging
oc get pod --selector logging-infra=fluentd -n openshift-logging
clear
exit
oc get oauth cluster -o yaml
oc get secret -n kube-system kubeadmin -o yaml
oc create secret generic ldap-secret --from-literal=bindPassword=b1ndP^ssword -n openshift-config
wget https://ssl-ccp.godaddy.com/repository/gd-class2-root.crt -O /opt/app-root/src/support/ca.crt
oc create configmap ca-config-map --from-file=/opt/app-root/src/support/ca.crt -n openshift-config
oc apply -f /opt/app-root/src/support/oauth-cluster.yaml
cat /opt/app-root/src/support/oauth-cluster.yaml
cat /opt/app-root/src/support/groupsync.yaml
oc adm groups sync --sync-config=/opt/app-root/src/support/groupsync.yaml --confirm
oc get groups
oc get group ose-fancy-dev -o yaml
oc get user
oc adm policy add-cluster-role-to-group cluster-reader ose-fancy-dev
oc login -u normaluser1 -p Op#nSh1ft
oc get projects
oc login -u fancyuser1 -p Op#nSh1ft
oc get projects
oc login -u kubeadmin -p MjmXE-BzJXB-XJAyJ-dtXJM
oc adm new-project app-dev --display-name="Application Development"
oc adm new-project app-test --display-name="Application Testing"
oc adm new-project app-prod --display-name="Application Production"
oc adm policy add-role-to-group edit ose-teamed-app -n app-dev
oc adm policy add-role-to-group edit ose-teamed-app -n app-test
oc adm policy add-role-to-group view ose-teamed-app -n app-prod
oc adm policy add-role-to-group edit ose-fancy-dev -n app-prod
oc login -u normaluser1 -p Op#nSh1ft
oc get projects
oc login -u teamuser1 -p Op#nSh1ft
oc get projects
oc project app-prod
oc new-app docker.io/siamaksade/mapit
oc login -u fancyuser1 -p Op#nSh1ft
oc get route prometheus-k8s -n openshift-monitoring -o jsonpath='{.spec.host}{"\n"}'
oc login -u kubeadmin -p MjmXE-BzJXB-XJAyJ-dtXJM
exit
oc adm create-bootstrap-project-template -o yaml
oc new-project -h
cat /opt/app-root/src/support/project_request_template.yaml
oc create -f /opt/app-root/src/support/project_request_template.yaml -n openshift-config
oc get template -n openshift-config
oc get cm config -n openshift-apiserver -o jsonpath --template="{.data.config\.yaml}" | jq
cat /opt/app-root/src/support/project_request_template.yaml
oc apply -f /opt/app-root/src/support/cr_project_request.yaml -n openshift-config
cat /opt/app-root/src/support/cr_project_request.yaml
sleep 30
oc rollout status deploy apiserver -n openshift-apiserver
oc get cm config -n openshift-apiserver -o jsonpath --template="{.data.config\.yaml}" | jq
oc new-project template-test
oc describe project template-test
oc describe quota -n template-test
oc get limitrange -n template-test
oc delete project template-test
exit
oc project default
bash /opt/app-root/src/support/create-net-projects.sh
cat /opt/app-root/src/support/create-net-projects.sh
cd /opt/app-root/src/support/
cat netproj-template.yaml 
cat /opt/app-root/src/support/create-net-projects.sh
oc get pods -n netproj-a
oc get pods -n netproj-b
bash /opt/app-root/src/support/test-connectivity.sh
cat /opt/app-root/src/support/test-connectivity.sh
bash /opt/app-root/src/support/test-connectivity.sh
oc create -n netproj-b -f /opt/app-root/src/support/network-policy-block-all.yaml
cat /opt/app-root/src/support/network-policy-block-all.yaml
bash /opt/app-root/src/support/test-connectivity.sh
oc get networkpolicy -n netproj-b
oc create -n netproj-b -f /opt/app-root/src/support/network-policy-allow-all-from-netproj-a.yaml
cat /opt/app-root/src/support/network-policy-allow-all-from-netproj-a.yaml
oc get networkpolicy -n netproj-b
bash /opt/app-root/src/support/test-connectivity.sh
oc login -u kubeadmin -p MjmXE-BzJXB-XJAyJ-dtXJM
oc describe clusterrolebinding.rbac self-provisioners
oc get clusterrolebinding.rbac self-provisioners -o yaml
oc patch clusterrolebinding.rbac self-provisioners -p '{"subjects": null}'
oc patch clusterrolebinding.rbac self-provisioners -p '{ "metadata": { "annotations": { "rbac.authorization.kubernetes.io/autoupdate": "false" } } }'
oc get clusterrolebinding.rbac self-provisioners -o yaml
oc login -u fancyuser1 -p Op#nSh1ft
oc new-project fancyuserproject
oc login -u kubeadmin -p MjmXE-BzJXB-XJAyJ-dtXJM
oc patch --type=merge project.config.openshift.io cluster -p '{"spec":{"projectRequestMessage":"Please visit https://ticket.example.com to request a project"}}'
oc rollout status -n  openshift-apiserver deploy/apiserver
oc login -u fancyuser1 -p Op#nSh1ft
oc new-project fancyuserproject
oc login -u kubeadmin -p MjmXE-BzJXB-XJAyJ-dtXJM
oc patch clusterrolebinding.rbac self-provisioners -p '{"subjects":[{"apiGroup":"rbac.authorization.k8s.io","kind":"Group","name":"system:authenticated:oauth"}]}'
oc patch clusterrolebinding.rbac self-provisioners -p '{"metadata":{"annotations":{"rbac.authorization.kubernetes.io/autoupdate":"true"}}}'
oc patch --type=json project.config.openshift.io cluster -p '[{"op": "remove", "path": "/spec/projectRequestMessage"}]'
exit
