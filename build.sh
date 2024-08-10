#!/bin/bash

set -e


# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Define text effects
BOLD='\033[1m'
UNDERLINE='\033[4m'

build_type=Release
source_dir=$(pwd)
export_pkg=0
build_custom=0
build_custom_flag=""

function do_build() {
    local build_dir=${source_dir}/build/${build_type}
    local install_dir=${source_dir}/install/${build_type}
    if [ ${build_custom} = 1 ]; then 
       conan build . -of ${build_dir} -s build_type=${build_type} -pr:h=x64 -pr:b=x64 \
           --build=${build_custom_flag}
    else 
       conan build . -of ${build_dir} -s build_type=${build_type} -pr:h=x64 -pr:b=x64 \
           --build=missing
    fi
    echo -e "${GREEN}------------------------------------------${NC}"
    echo -e "${GREEN}build success${NC}"
    echo -e "${GREEN}------------------------------------------${NC}"
    if [ ${export_pkg} = 1 ]; then
       conan export-pkg . -of ${build_dir} --user sii --channel dev -pr:h=x64 -pr:b=x64
       echo -e "${GREEN}------------------------------------------${NC}"
       echo -e "${GREEN}conan export finished${NC}"
       echo -e "${GREEN}------------------------------------------${NC}"
       return 0
    fi  

}


while getopts ":b:B:ce" opt; do
    case ${opt} in
        b)
            case $OPTARG in
                Release|release)
                    echo -e "using Release build type"
                    build_type=Release
                    ;;
                Debug|debug)
                    echo -e "using Debug build type"
                    build_type=Debug
                    ;;
                *)
                    echo "Unsupported build type ${OPTARG}"
                    exit 1
                    ;;
            esac
            ;;
        B)
          build_custom=1
          build_custom_flag=${OPTARG}
          ;;
        c)
          rm -rf build install
          echo -e "${YELLOW}------------------------------------------${NC}"
          echo -e "${YELLOW}cleanup success${NC}"
          echo -e "${YELLOW}------------------------------------------${NC}"
          exit 0
          ;;
        e)
          echo "export package"
          export_pkg=1
          ;;
    esac
done

do_build

exit 0
