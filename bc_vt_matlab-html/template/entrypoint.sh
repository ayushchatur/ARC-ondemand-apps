#!/bin/bash

export MLM_LICENSE_FILE=/opt/matlab/licenses/license.dat
### pushing these into a matlab.rc file
#ENV APP_PORT="8888"
#ENV BASE_URL="/matlab"
#ENV MATLAB_LOG_DIR="/tmp"
#ENV EXT_URL="ood.arc.vt.edu"
source /matlab.rc

echo retrieved ENV variables from matlab.rc
echo APP_PORT=$APP_PORT
echo BASE_URL=$BASE_URL
echo MATLAB_LOG_DIR=$MATLAB_LOG_DIR
echo EXT_URL=$EXT_URL


if [ -z "${EXT_URL}" ] ; then
    EXT_URL="localhost:${APP_PORT}"
fi
echo ""
echo "To use the web-desktop: http://${EXT_URL}${BASE_URL}/index.html"
echo ""

echo starting web matlab
matlab-jupyter-app
