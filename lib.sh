
hn=$(hostname)
if [ $hn == "localhost" ]
then
    pkg upgrade
    pkg update
    pkg install python
    py=python
    pkg install redis
    pi=$py" -m pip"
    $pi install --upgrade pip
    pkg install libxml2 libxslt
    pkg install libjpeg-turbo
    pkg install ffmpeg
    pkg install qpdf
    pkg install zlib
    redis-server --daemonize yes
    $pi install -r requirements.txt

else
    sudo apt install software-properties-common -y
    sudo add-apt-repository ppa:deadsnakes/ppa -y
    sudo apt update -y
    sudo apt install python3.6 -y
    sudo apt install python3-pip -y
    sudo apt install ffmpeg -y
    sudo apt install redis-server -y
    sudo apt install clang lib{jpeg-turbo,webp}-dev python3.6{,-dev} zlib-dev
    sudo service redis-server restart
    sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.6 10
    py=python
    pi=$py" -m pip"
    $pi install --upgrade pip
    $pi install setuptools
    $pi install -r requirements.txt
    $pi install tensorflow
fi