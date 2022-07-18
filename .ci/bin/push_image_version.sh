#!/bin/sh

VERSION="${1}"
COMPONENTS="mda mta db filter ssl virus web"

if [ "${VERSION}" = "" ]
then
    echo "Expected version string!"

    exit 1
fi

for component in $COMPONENTS
do
    docker tag jc01rho/mailserver-$component:latest jc01rho/mailserver-$component:${VERSION}
    
    if [ "${VERSION}" != "next" ]
    then
        docker push jc01rho/mailserver-$component:latest
    fi
    
    docker push jc01rho/mailserver-$component:${VERSION}
done
