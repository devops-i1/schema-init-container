source /data/secrets

if [ -z "${DB_HOST}" ]; then
  echo DB_HOST is missing
  exit 1
fi

if [ -z "${RDS_USER}" ]; then
  echo RDS_USER is missing
  exit 1
fi

if [ -z "${RDS_PASS}" ]; then
  echo RDS_PASS is missing
  exit 1
fi

if [ -z "${COMPONENT}" ]; then
  echo COMPONENT is missing
  exit 1
fi

if [ -z "${PROJECT_NAME}" ]; then
  echo PROJECT_NAME is missing
  exit 1
fi

git clone https://github.com/devops-i1/${PROJECT_NAME}-${COMPONENT}
cd ${PROJECT_NAME}-$COMPONENT

mysql -h${DB_HOST} -u${RDS_USER} -p${RDS_PASS} <schema/${COMPONENT}.sql