#!/usr/bin/env bash
# Publishes artifacts to the local maven repository, also setting the version to a SNAPSHOT version to avoid confusion
# with the artifacts published to artifactory.

VERSION="$(./gradlew -q getVersion)-SNAPSHOT"

echo "Publishing GMA $VERSION to..."

./gradlew publish -Pversion="${VERSION}"

if [ $? = 0 ]; then
  echo "Published GMA $VERSION"
else
  exit 1
fi