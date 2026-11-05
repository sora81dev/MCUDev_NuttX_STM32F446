export CONFIG_APPS_DIR="."
export CONFIG_INT_ENTRYPOINT="main"

curd=$(pwd)
cd ~/nuttxspace/nuttx/
make clean

cd $curd
