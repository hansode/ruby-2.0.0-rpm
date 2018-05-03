#!/bin/bash
# Author: Alfredo Baldoceda
# Description: Simple build script to create ruby2.0.0 rpm using ruby200.spec file
# spectool and rpmbuild are required
# Uncomment for debugging:
# set -x

spec_file=ruby200.spec

if [ -z $RPM_HOME ]
then
	RPM_HOME=$HOME
fi

echo '%_topdir %(echo $RPM_HOME)/rpmbuild' > ~/.rpmmacros

mkdir -p $RPM_HOME/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
cp -av $spec_file $RPM_HOME/rpmbuild/SPECS/
spectool -g -R $RPM_HOME/rpmbuild/SPECS/$spec_file
rpmbuild -ba $RPM_HOME/rpmbuild/SPECS/$spec_file
