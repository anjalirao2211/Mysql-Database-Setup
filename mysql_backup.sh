#!/bin/bash
Today=`date +"%d%b%Y"`
############################update below values########################
DB_BACKUP_PATH='./backup'
MYSQL_HOST='localhost'
MYSQL_PORT='3306'
MYSQL_USER='root'
MYSQL_PASSWORD='anjali'
DATABASE_NAME='mysql'
BACKUP_RETAIN_DAYS=30 ## NUMBER OF DAYS TO KEEP LOCAL BACKLUP COPY ###

mkdir -p ${DB_BACKUP_PATH}/${TODAY}
echo "Backup started for databse - ${DATABASE_NAME}"

mysqldump -h ${MYSQL_HOST} \
  -P ${MYSQL_PORT} \
  -U ${MYSQL_USER} \
  -p${MYSQL_PASSWORD} \
  ${DATABASE_NAME} | gzip > ${DB_BACKUP_PATH}/${TODAY}/${DATABASE_NAME}-${TODAY}.sql.gz // witin dir one more dir get creats with .gz format
  
  if [ $? -eq 0 ]; then  //$? going to be check previous command ran succefully or not 
    echo "Database backup successfully completed"
  else
    echo "Error found during backup"
    exit 1
   fi
   
   #### remove backups older than {BACKUP_RETAIN_DAYS} days ####
   
   DBDELDATE=`date +"%d%b%Y" --date="${BACKUP_RETAIN_DAYS} days ago"`
   
   if [ ! -z ${DB_BACKUP_PATH} ]; then
         cd ${DB_BACKUP_PATH}
         if [ ! -z ${DBDELDATE} ] && [ -d ${DBDELDATE} ]; then
               rm -rf ${DBDELDATE}
         fi
   fi
   
   --------END OF SCRIPT--------
