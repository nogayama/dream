#!/usr/bin/env bash

function main() {
	
	local -r THIS_DIR=$(cd $(dirname $BASH_SOURCE); pwd)
	cd ${THIS_DIR}
	
	local -r to_be_removed_files=$(\
		ls -1 "${THIS_DIR}" \
			| grep -v build.sh \
			| grep -v clean.sh)
	
	echo "Deleting files: ${to_be_removed_files}" 1>&2
	rm -rf ${to_be_removed_files}
}

if [[ "$0" == "${BASH_SOURCE[0]}" ]] ; then
	set -eE
	main "${@}"
fi