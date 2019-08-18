#!/usr/bin/env bash

function main() {
	
	THIS_DIR=$(cd $(dirname $BASH_SOURCE); pwd)
	
	local version
	version=$(cat ${THIS_DIR}/../../VERSION)
	
	cp ${THIS_DIR}/../../bin/dream ${THIS_DIR}/
	
	cat <<EOS > ${THIS_DIR}/setup.py
#!/usr/bin/env python
# -*- coding: utf-8 -*-

from setuptools import setup
import io

setup(
    name='dream',
    version='${version}',
    description='Dream is a sleep like tool',
    url='',
    author='Takahide Nogayama',
    author_email='nogayama@gmail.com',
    license='MIT',
    zip_safe=False,
    include_package_data=True,
    scripts=[
        'dream',
    ],
)
EOS

	python setup.py sdist

}

if [[ "$0" == "${BASH_SOURCE[0]}" ]] ; then
	set -eE
	main "${@}"
fi
