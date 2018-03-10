
#! /bin/bash

ps -ef | grep agent | grep -v grep | awk '{print $2}' | xargs kill
