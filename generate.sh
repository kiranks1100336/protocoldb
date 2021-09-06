#!bash

# get template version
file=./context/codegen.properties
templateVersion=`sed '/^\#/d' $file | grep 'codegen.template.version'  | tail -n 1 | cut -d "=" -f2- | sed 's/^[[:space:]]*//;s/[[:space:]]*$//'`
echo "template-version : ${templateVersion}"

######################################################################
# Log methods
######################################################################
logInfo() {
	echo "`date` INFO $1" 
}

logDebug() {	
	echo "`date` DEBUG $1" 
}

logError() {	
	echo "`date` ERROR $1" 
}

logWarning() {
	echo "`date` WARNING $1" 
}

#Do windows specific conversions 
UNAME=$(uname)
CURRENT_PATH=`pwd`

#Make compatible with windows using gitbash
if [[ "$UNAME" == CYGWIN* || "$UNAME" == MINGW* ]] ; then
	logInfo "Windows env detected"
	PATH_TO_MOUNT=`cygpath.exe -w "$CURRENT_PATH" `
else 
	PATH_TO_MOUNT="$CURRENT_PATH"
fi
export USER_ID=`id -u`
export GROUP_ID=`id -g`
logInfo "Generating source code framework in ${PATH_TO_MOUNT}"
#docker run --rm --user=${USER_ID}:${GROUP_ID} -v ${PATH_TO_MOUNT}:/local/work hc-us-east-aws-artifactory.cloud.health.ge.com/docker-ctprem-prod/springboot-micro-service-code-generator:"${templateVersion}"
docker run --rm --user=${USER_ID}:${GROUP_ID} -v ${PATH_TO_MOUNT}:/local/work  hc-us-east-aws-artifactory.cloud.health.ge.com/docker-imgplatform-release/template-java-springboot-micro-service/template-java-springboot-micro-service:"${templateVersion}"
#$MAVEN_HOME/bin/mvn clean generate-resources -P build -s ./settings.xml -f ./codegen-pom.xml -X
