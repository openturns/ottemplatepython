#!/bin/sh
#                                               -*- Shell-script -*-
#
#  Copyright 2005-2020 Airbus-EDF-IMACS-Phimeca
#
#  This library is free software; you can redistribute it and/or
#  modify it under the terms of the GNU Lesser General Public
#  License as published by the Free Software Foundation; either
#  version 2.1 of the License.
#
#  This library is distributed in the hope that it will be useful
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#  Lesser General Public License for more details.
#
#  You should have received a copy of the GNU Lesser General Public
#  License along with this library; if not, write to the Free Software
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
#
#  This file customizes the file tree to the user's needs
#

if test $# -lt 2
then
  echo "usage: $0 ModuleName ClassName [ filename ]"
  echo "example: $0 MyModule MyClass"
  echo "         will convert all template files so they will define a new module named MyModule with a class named MyClass"
  echo "         Please notice the upper/lower cases in names"
  exit 1
fi

# change module name
module_Oldname="OTTemplate"
module_Newname=$1

module_OLDNAME=$(echo $module_Oldname | tr "[:lower:]" "[:upper:]")
module_NEWNAME=$(echo $module_Newname | tr "[:lower:]" "[:upper:]")
module_oldname=$(echo $module_Oldname | tr "[:upper:]" "[:lower:]")
module_newname=$(echo $module_Newname | tr "[:upper:]" "[:lower:]")


# We convert Oldname to Newname, OLDNAME to NEWNAME, oldname to newname, etc.
Oldname="MyClass"
Newname=$2

# Upper/lower cases
OLDNAME=$(echo $Oldname | tr "[:lower:]" "[:upper:]")
NEWNAME=$(echo $Newname | tr "[:lower:]" "[:upper:]")

oldname=$(echo $Oldname | tr "[:upper:]" "[:lower:]")
newname=$(echo $Newname | tr "[:upper:]" "[:lower:]")

echo "Conversion of $Oldname to $Newname"
echo "Conversion of $OLDNAME to $NEWNAME"
echo "Conversion of $oldname to $newname"

echo "Conversion of $module_Oldname to $module_Newname"
echo "Conversion of $module_OLDNAME to $module_NEWNAME"
echo "Conversion of $module_oldname to $module_newname"

# docstring test depends on module name size 
new_size=`echo "${module_newname}" | wc -m`
dots_len=`expr 60 - ${new_size}`
dots=`head -c "${dots_len}" < /dev/zero | tr '\0' '.'`
sed -i "s|ottemplate .................................................     0 tests failed|${module_newname} ${dots}     0 tests failed|g" python/test/t_docstring.expout

case $# in
  2)

    filelist_1="README.rst cmake/UseOTTemplate.cmake cmake/OTTemplateConfig.cmake.in CMakeLists.txt lib/CMakeLists.txt lib/include/CMakeLists.txt lib/include/ottemplate/OTTemplateprivate.hxx lib/include/ottemplate/OTTemplate.hxx lib/src/ottemplate/MyClass.hxx lib/src/MyClass.cxx lib/src/ottemplate/MyClassImplementation.hxx lib/src/MyClassImplementation.cxx lib/src/CMakeLists.txt lib/test/t_MyClass_std.cxx lib/test/t_MyClass_std.expout lib/test/CMakeLists.txt python/test/t_MyClass_std.py python/test/CMakeLists.txt python/src/__init__.py python/src/MyClass.i python/src/MyClass_doc.i.in python/src/CMakeLists.txt python/src/MyClassImplementation.i python/src/MyClassImplementation_doc.i.in python/src/ottemplate_module.i distro/debian/changelog distro/debian/control distro/debian/rules distro/windows/installer.nsi distro/windows/README.txt python/doc/index.rst python/doc/conf.py.in python/doc/user_manual/user_manual.rst python/doc/developer_guide/architecture/architecture.rst distro/rpm/ottemplate.spec python/test/t_docstring.py python/test/t_docstring.expout"
    for file in $filelist_1
    do
      if test -f "$file"
      then
        echo -n "Converting $file... "
        sed -e "s/${module_oldname}/${module_newname}/g" -e "s/${module_Oldname}/${module_Newname}/g" -e "s/${module_OLDNAME}/${module_NEWNAME}/g" -i $file
        echo "OK"
      else
        echo "$file not found"
      fi
    done

    filelist_2="cmake/UseOTTemplate.cmake cmake/OTTemplateConfig.cmake.in lib/src/ottemplate lib/include/ottemplate lib/include/${module_newname}/OTTemplateprivate.hxx lib/include/${module_newname}/OTTemplate.hxx python/src/ottemplate_module.i distro/rpm/ottemplate.spec"

    for file in $filelist_2
    do
     if test -e "$file"
     then
       echo -n "Renaming... "
       newfile=$(echo $file | sed -e "s/${module_oldname}/${module_newname}/g" -e "s/${module_Oldname}/${module_Newname}/g")
       mv -v $file $newfile
     else
       echo "$file not found"
     fi
    done







    filelist_1="python/src/${module_newname}_module.i CMakeLists.txt python/src/MyClass.i python/src/MyClass_doc.i.in python/src/CMakeLists.txt python/src/MyClassImplementation.i python/src/MyClassImplementation_doc.i.in lib/src/${module_newname}/MyClass.hxx lib/src/MyClass.cxx lib/src/${module_newname}/MyClassImplementation.hxx lib/include/${module_newname}/${module_Newname}.hxx lib/src/MyClassImplementation.cxx lib/src/CMakeLists.txt lib/test/CMakeLists.txt lib/test/t_MyClass_std.cxx lib/test/t_MyClass_std.expout python/test/CMakeLists.txt python/test/t_MyClass_std.py python/doc/user_manual/user_manual.rst python/test/t_MyClass_std.expout"

    for file in $filelist_1
    do
     if test -f "$file"
     then
       echo -n "Converting $file... "
       sed -e "s/${oldname}/${newname}/g" -e "s/${OLDNAME}/${NEWNAME}/g" -e "s/${Oldname}/${Newname}/g" -i $file
       echo "OK"
     else
       echo "$file not found"
     fi
    done

    filelist_2="python/src/MyClass.i python/src/MyClass_doc.i.in python/src/MyClassImplementation.i python/src/MyClassImplementation_doc.i.in lib/src/MyClass.cxx lib/src/MyClassImplementation.cxx lib/src/${module_newname}/MyClassImplementation.hxx lib/src/${module_newname}/MyClass.hxx lib/test/t_MyClass_std.cxx lib/test/t_MyClass_std.expout python/test/t_MyClass_std.py python/test/t_MyClass_std.expout"

    for file in $filelist_2
    do
     if test -e "$file"
     then
       echo -n "Renaming... "
       newfile=$(echo $file | sed -e "s/${oldname}/${newname}/g" -e "s/${OLDNAME}/${NEWNAME}/g" -e "s/${Oldname}/${Newname}/g")
       mv -v $file $newfile
     else
       echo "$file not found"
     fi
    done
    ;;

  3)
    file=$3
    if test -f "$file"
    then
       echo -n "Converting $file... "
       sed -e "s/${oldname}/${newname}/g" -e "s/${OLDNAME}/${NEWNAME}/g" -e "s/${Oldname}/${Newname}/g" < $file > $file.mod && mv $file.mod $file
       echo "OK"
       echo -n "Renaming... "
       newfile=$(echo $file | sed -e "s/${oldname}/${newname}/g" -e "s/${OLDNAME}/${NEWNAME}/g" -e "s/${Oldname}/${Newname}/g")
       test "$file" != "$newfile" && mv -v $file $newfile
    else
      echo "$file not found"
      exit 1
    fi
    ;;
esac

