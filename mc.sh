#!/bin/bash
# MContact
# author : Mostafa Asadi
# url    : http://ma73.ir
# Email  : mostafaasadi73@gmail.com
#
# chmod +x mc.sh
# ./mc.sh
#
# -l                       show list of your contact
# -s keyword               search keyword in your contacts
# -a name::number          add new contact , the "::" is necessary and invariable
# -v                       script version
# -h                       more help
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the
# Free Software Foundation, Inc.,
# 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.


clear screen
echo -e "\n\n\t\t\t\t\t MContact \n\n"

wlc_function (){
echo -e "\n\t\t\t [1] Add new contact "
echo -e "\t\t\t [2] Show list "
echo -e "\t\t\t [3] Search contacts "
echo -e "\t\t\t [4] Help "
echo -e "\t\t\t [5] Version"
echo -e "\t\t\t [6] Exit \n "
read -p "                                 option >>  " opt1
}

add_function () {
  read -p "                                         name : " name
  read -p "                                         number : " number
  echo "$name::$number" >> .mcdb.txt
  echo -e "\n\t\t\t\t $name saved . \n "
  wlc_function
}

search_function (){
  read -p "                                    keyword : " keyword
  clear
  echo -e "\n\n"
  echo "id:name::number"
  grep -n "$keyword" .mcdb.txt
  echo -e "\n\n"
}
help_function (){
  echo -e "\n\t\t\t MContact script runs in both with arguments and without arguments mode "
  echo -e "\t\t\t for simple use without arguments just type ./mc.sh "
  echo -e "\n\t\t\t for fast use with arguments follow this afew MContact arguments "
  echo -e "\n\t\t\t -l                       show list of your contact "
  echo -e "\t\t\t\t EX : ./mc.sh -l "
  echo -e "\n\t\t\t -s keyword               search keyword in your contacts"
  echo -e "\t\t\t\t EX : ./mc.sh -s keyword "
  echo -e "\n\t\t\t -a name::number          add new contact , the "::" is necessary and invariable"
  echo -e "\t\t\t\t EX : ./mc.sh -a mohammad::09169169116 "
  echo -e "\n\t\t\t -v                       script version"
  echo -e "\n\t\t\t -h                       show this help\n\n"
}
version_function (){
  echo -e "\n\t\t MContact version 0.2 "
  echo -e "\n\t\t author : Mostafa Asadi"
  echo -e "\t\t url    : http://ma73.ir"
  echo -e "\t\t Email  : mostafaasadi73@gmail.com\n"
  echo -e "\n\t\tThis program is free software; you can redistribute it and/or modify
  \t\tit under the terms of the GNU General Public License as published by
  \t\tthe Free Software Foundation; either version 2 of the License, or
  \t\t(at your option) any later version.

  \t\tThis program is distributed in the hope that it will be useful,
  \t\tbut WITHOUT ANY WARRANTY; without even the implied warranty of
  \t\tMERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  \t\tGNU General Public License for more details.

  \t\tYou should have received a copy of the GNU General Public License
  \t\talong with this program; if not, write to the
  \t\tFree Software Foundation, Inc.,
  \t\t51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.\n\n"
}
while getopts "a:s:lvh" options;do
  case "$options" in
    a)
    echo "$OPTARG" >> .mcdb.txt
    ;;
    l)
    clear
    echo -e "\n\n"
    echo "name::number"
    cat .mcdb.txt | sort
    echo -e "\n\n"
    ;;
    s)
    echo -e "\n\n"
    echo "id:name::number"
    grep -n "$OPTARG" .mcdb.txt
    echo -e "\n\n"
    ;;
    v)
    version_function
    ;;
    h)
    help_function
    ;;
    esac
  done
wlc_function
case_function (){
case "$opt1" in
  1)
  add_function
  ;;
  2)
  clear
  echo -e "\n\n"
  echo "name::number"
  cat .mcdb.txt | sort
  echo -e "\n\n"
  ;;
  3)
  search_function
  ;;
  4)
  help_function
  ;;
  5)
  version_function
  ;;
  6)
  exit
  ;;
esac
}
case_function
