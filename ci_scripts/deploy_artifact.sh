set -e

FILENAME=$1
GROUP=$2
ARTIFACT=$3
VERSION=$4
REPO_USER=$5
REPO_PWD=$6
SERVER="https://maven.jtrim777.dev/releases"

GROUP_PATH=$(echo "$GROUP" | sed 's/\./\//g')

REZ=$(curl --output /dev/stderr \
  --write-out "%{http_code}" \
  -u "$REPO_USER:$REPO_PWD" \
  --upload-file "$FILENAME" \
  "$SERVER/$GROUP_PATH/$VERSION/$ARTIFACT")

if [[ ${REZ} -lt 200 || ${REZ} -gt 299 ]] ; then
    exit 22
fi
