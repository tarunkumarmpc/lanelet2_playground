#!/usr/bin/env bash

until docker ps > /dev/null
do
    echo "Waiting for docker server"
    sleep 1
done


set swd=%~dp0
set img=lanelet2-playground

echo "Starting container %img% ..."

docker run ^
      -it ^
      --rm ^
      --net host ^
      -v %swd%/../notebooks:/home/developer/workspace/notebooks ^
      -v %swd%/../data:/home/developer/workspace/data ^
      -v %swd%/../Lanelet2:/home/developer/workspace/src/lanelet2_modules ^
      -v %swd%/install_jupyter.sh:/home/developer/workspace/install_jupyter.sh ^
      -v %swd%/setup.sh:/home/developer/workspace/setup_lanelet2.sh ^
      %img%

