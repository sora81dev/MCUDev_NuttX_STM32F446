export CONFIG_APPS_DIR="."
export CONFIG_INIT_ENTRYPOINT="main"

curd=$(pwd)
cd ~/nuttxspace/nuttx/
make

cd $curd
