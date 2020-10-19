#!/bin/sh

APP_HOME=/Users/mridwana/Project/hello-world-pytho

# User specific aliases and functions
PYTHONPATH="${PYTHONPATH}:${APP_HOME}"
export PYTHONPATH

PYTHON_BIN=/usr/local/Cellar/python3/3.6.3/Frameworks/Python.framework/Versions/3.6/bin/python3.6

APP_FOLDER=${APP_HOME}/runner
PROGRAM_NAME=hello_world_conn_db.py
CONFIG_DIR=${APP_HOME}/config
DIST_DIR=${APP_HOME}/dist
LOG_DIR=${APP_HOME}/logs

RUN_COMMAND="${PYTHON_BIN} ${APP_FOLDER}/${PROGRAM_NAME}  --configdir ${CONFIG_DIR} --logdir ${LOG_DIR}"
PID=$(ps -ef | grep ${PROGRAM_NAME} | grep -v grep | awk '{print $2}')
if [ "$PID" = "" ]; then
  echo "${RUN_COMMAND}"
  rm -f ${LOG_DIR}/${PROGRAM_NAME}.out
  ${RUN_COMMAND} >${LOG_DIR}/${PROGRAM_NAME}.out &
fi
