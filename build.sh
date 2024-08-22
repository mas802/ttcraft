#!/bin/bash

java -jar vtl-cli.jar --yaml-context context.yml game.vm > gen/$1.yaml
java -Dfile.encoding=UTF-8 -jar vtl-cli.jar -ie UTF8 --yaml-context context.yml audio_script.vm > gen/audio_script.sh 
if [ $# -gt 1 ]
  then
    sh gen/audio_script.sh
fi
~/tttool-1.9/osx/tttool assemble gen/$1.yaml