#!/bin/sh
echo "Running sonarqube analysis"
PROPERTIES="${XCS_SOURCE_DIR}/Test/sonar-project.properties"
INFOPLIST="${XCS_SOURCE_DIR}/Test/FantasticView/Info.plist"
buildNumber=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" $INFOPLIST)
buildVersion=$(/usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" $INFOPLIST)

echo "sonar.host.url=$1" >> $PROPERTIES
echo "sonar.login=$2" >> $PROPERTIES
if [ -z "$3" ]
then
	echo "sonar.password=$3" >> $PROPERTIES
fi
echo "sonar.projectVersion=$buildVersion.$buildNumber.${XCS_INTEGRATION_NUMBER}" >> $PROPERTIES
whoami
sh "run-sonar-swift.sh"
