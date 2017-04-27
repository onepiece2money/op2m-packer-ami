#
PROFILE?= onepiece2money

#
.PHONY: build

#
build:
	@echo 'Use "make <something>" to build AMIs.'

dns-slave:
	AWS_PROFILE=${PROFILE} packer build packer-dns-slave.json

ntp:
	AWS_PROFILE=${PROFILE} packer build packer-ntp.json

php70:
	AWS_PROFILE=${PROFILE} packer build packer-template-php70.json

php71:
	AWS_PROFILE=${PROFILE} packer build packer-template-php71.json
