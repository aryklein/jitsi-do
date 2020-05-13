#!/bin/bash
#
# Name          : setup.sh
# Description   : Easy setup. Install Terraform and Ansible in a virtual environment.
# Usage         : ./setup.sh {install|clean}
# Author        : Ary Kleinerman
# Date          : 2019-05-13

# variable definition
ANSIBLE_VER=2.9.7
TERRAFORM_VER=0.12.24
VENV_DIR=.env

# setup virtual environment: install Ansible and Terraform
function install {
    if [[ -d ${VENV_DIR} ]]; then
        echo "There is already a virtual environment."
        echo "Nothing was installed."
        exit 1
    fi

    echo "Installing Ansible v${ANSIBLE_VER} in a virtual environment"
    echo "--------------------------------------------------"
    python3 -m venv ${VENV_DIR}
    ${VENV_DIR}/bin/pip install --upgrade pip setuptools wheel
    ${VENV_DIR}/bin/pip install --upgrade ansible==${ANSIBLE_VER}
    
    echo -e "\nDownloading Terraform v${TERRAFORM_VER}"
    echo "------------------------------"
    curl -O https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/terraform_${TERRAFORM_VER}_linux_amd64.zip
    unzip -d ${VENV_DIR}/bin terraform_${TERRAFORM_VER}_linux_amd64.zip && rm terraform_${TERRAFORM_VER}_linux_amd64.zip
    
    echo ""
    echo -e "\nVirtual environment created."
    echo "Usage: source ${VENV_DIR}/bin/activate"
}

# clean virtual environment
function clean {
    if [[ -d ${VENV_DIR} ]]; then
        rm -rf ${VENV_DIR}
        echo "Virtual environment removed."
    fi
}

# main
case "$1" in
    install)
        install
        ;;

    clean)
        clean
        ;;
    *)
        echo $"Usage: $0 {install|clean}"
        exit 1

esac
