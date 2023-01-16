#! /usr/bin/env bash

REPOSITORY=home/ubuntu/app
cd $REPOSITORY

APP_NAME=cicd-test
JAR_NAME=$(ls $REPOSITORY/build/libs/ | grep 'SNAPSHOT.jar' | tail -n 1)
JAR_PATH=$REPOSITORY/build/libs/$JAR_NAME

CURRENT_PID=$(pgrep -f $APP_NAME)

if [ -z $CURRENT_PID ]
then
  echo "> 구동중인 애플리케이션이 없으므로 종료하지 않습니다."
else
  echo "> kill -9 $CURRENT_PID"
  kill -15 $CURRENT_PID
  sleep 5
fi

echo "> $JAR_PATH 배포"
nohup jave -jar $JAR_PATH > /dev/null 2> /dev/null < /dev/null &

#BUILD_JAR=$(ls /home/ubuntu/app/build/libs/*.jar)
#JAR_NAME=$(basename $BUILD_JAR)
#
##echo "> 현재 시간: $(date)" >> /home/ubuntu/app/deploy.log
#
#echo "> build 파일명: $JAR_NAME" >> /home/ubuntu/app/deploy.log
#
#echo "> build 파일 복사" >> home/ubuntu/app/deploy.log
#DEPLOY_PATH=/home/ubuntu/app/
#cp $BUILD_JAR $DEPLOY_PATH
#
#echo "> 현재 실행중인 애플리케이션 pid 확인" >> /home/ubuntu/app/deploy.log
#CURRENT_PID=$(pgrep -f $JAR_NAME)
#
#if [ -z $CURRENT_PID ]
#then
#  echo "> 현재 구동중인 애플리케이션이 없으므로 종료하지 않습니다." >> /home/ubuntu/app/deploy.log
#else
#  echo "> kill -9 $CURRENT_PID" >> /home/ubuntu/app/deploy.log
#  sudo kill -9 $CURRENT_PID
#  sleep 5
#fi
#DEPLOY_JAR=$DEPLOY_PATH$JAR_NAME
#echo "> DEPLOY_JAR 배포" >> /home/ubuntu/app/deploy.log
#sudo java -jar $DEPLOY_JAR >> /home/ubuntu/app/deploy.log 2>/home/ubuntu/app/deploy_err.log &