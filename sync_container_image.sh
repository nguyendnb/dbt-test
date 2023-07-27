#!/usr/bin/env bash\

IMAGE="dbt-test"
ARTIFACT_REGION=asia-southeast1-docker.pkg.dev
PROJECT_ID=joon-sandbox
REPO_NAME=airflow-dev-container
FULL_DEST=$ARTIFACT_REGION/$PROJECT_ID/$REPO_NAME/$IMAGE

docker build -t $IMAGE .
docker tag $IMAGE $FULL_DEST
docker push $FULL_DEST