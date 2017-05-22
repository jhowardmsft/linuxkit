#!/bin/sh
# SUMMARY: Sanity check on the kernel config file
# LABELS:
# REPEAT:
# AUTHOR: Dave Tucker <dt@docker.com>

set -e

# Source libraries. Uncomment if needed/defined
#. "${RT_LIB}"
. "${RT_PROJECT_ROOT}/_lib/lib.sh"

clean_up() {
	find . -iname "test-kernel-config*" -not -iname "*.yml" -exec rm -rf {} \;
}
trap clean_up EXIT

# Test code goes here
moby build test-kernel-config
RESULT="$(linuxkit run qemu test-kernel-config)"
echo "${RESULT}" | grep -q "suite PASSED"

exit 0
