#!/usr/bin/env bash

# ---------------------------------------------------------------------------- #
#
#         FILE:  install_go_tools
#
#        USAGE:  
#
#  DESCRIPTION:  install tools needed for working with golang
#
#      CREATED:  04/16/2023
#
# ---------------------------------------------------------------------------- #

#------------------------------------------------------------------------------#
#                                    Main                                      #
#------------------------------------------------------------------------------#

if ! which go >/dev/null 2>&1
then
  echo "No go?"
  exit
fi

if [[ -e "/etc/centos-release" ]] || [[ -e "/etc/redhat-release" ]]
then
  version=$(cat /etc/*release|grep -E -o "[0-9]\.[0-9][0-9]*"|sort -u)
  if ! which gcc >/dev/null 2>&1
  then
    case "${version}" in
      7.*)
        sudo yum -y groupinstall "Development Tools"
      ;;
      8.*)
        sudo yum -y groupinstall "Development Tools"
      ;;
    esac
  fi
fi

go install github.com/klauspost/asmfmt/cmd/asmfmt@latest
go install github.com/go-delve/delve/cmd/dlv@latest
go install github.com/kisielk/errcheck@latest
go install github.com/davidrjenni/reftools/cmd/fillstruct@master
go install github.com/rogpeppe/godef@latest
go install golang.org/x/tools/cmd/goimports@master
go install golang.org/x/lint/golint@master
go install golang.org/x/tools/gopls@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install honnef.co/go/tools/cmd/staticcheck@latest
go install github.com/fatih/gomodifytags@latest
go install golang.org/x/tools/cmd/gorename@master
go install github.com/jstemmer/gotags@master
go install golang.org/x/tools/cmd/guru@master
go install github.com/josharian/impl@master
go install honnef.co/go/tools/cmd/keyify@master
go install github.com/fatih/motion@latest
go install github.com/koron/iferr@master

#------------------------------------------------------------------------------#
#                                  The End                                     #
#------------------------------------------------------------------------------#
