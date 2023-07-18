#!/bin/bash
TARGET=example
TIMESTAMP=$(date +%m-%d-%Y)

# wikijs files
rsync --delete-after -ta ${TARGET}:/var/compose/wikijs $HOME/archive/${TARGET}/

# wikijs postgresql
BACKUP_DIR=$HOME/archive/${TARGET}/postgresql
DUMP_FILE=/var/lib/postgresql/wikijs_${TIMESTAMP}.dump.bz2
ssh root@${TARGET} "doas -u postgres /usr/bin/pg_dump -Fc wikijs | /usr/bin/bzip2 > ${DUMP_FILE}"
mkdir -p $HOME/archive/${TARGET}/postgresql/
rsync -tav ${TARGET}:${DUMP_FILE} $HOME/archive/${TARGET}/postgresql/
ssh root@${TARGET} rm -v ${DUMP_FILE}
