# Easy project setup
SHELL := bash
ANSIBLE_VER :=2.9.7
TERRAFORM_VER := 0.12.24
.DEFAULT_GOAL := install

install: venv
	.venv/bin/pip install --upgrade ansible==${ANSIBLE_VER}
	wget https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/terraform_${TERRAFORM_VER}_linux_amd64.zip
	unzip -d .venv/bin terraform_${TERRAFORM_VER}_linux_amd64.zip && rm terraform_${TERRAFORM_VER}_linux_amd64.zip

venv: clean
	python3 -m venv .venv
	.venv/bin/pip install --upgrade pip setuptools wheel

clean:
	rm -rf .venv
