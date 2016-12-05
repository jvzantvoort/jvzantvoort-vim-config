#!/bin/bash
#===============================================================================
#
#         FILE:  export_vimrc.sh
#
#  DESCRIPTION:  Bootstrap the vimrc setup. For lazyness.
#
#===============================================================================

# --------------------------------------
# VARIABLES
# --------------------------------------
CONST_SCRIPTFILE="$(readlink -f $0)"
CONST_SCRIPTDIR="$(dirname $CONST_SCRIPTFILE)"
CONST_APPNAME="$(basename $CONST_SCRIPTFILE)"

CONST_URL_PATHOGEN="https://tpo.pe/pathogen.vim"

# If not in jenkins
if [ ! "$WORKSPACE" ]
then
  WORKSPACE="$HOME/tmp"
fi

#===  FUNCTION  ================================================================
#         NAME:  remark
#  DESCRIPTION:  simple function for printing information.
#        NOTES:  make sure you define CONST_APPNAME="$(basename $0)" for
#                example like this:
#
#                  CONST_APPNAME="$(basename $0)"
#
#   PARAMETERS:  none
#      RETURNS:  0, oke
#                1, not oke
#===============================================================================
function remark() {
  echo "$CONST_APPNAME: $@"
} # end: remark

#===  FUNCTION  ================================================================
#         NAME:  die
#  DESCRIPTION:  shell version of the perl die
#   PARAMETERS:  none
#      RETURNS:  0, oke
#                1, not oke
#===============================================================================
function die() {
  remark "DIED: $@"
  exit 8
} # end: die

#===  FUNCTION  ================================================================
#         NAME:  git_clone
#  DESCRIPTION:  export a git repo to a select destination
#   PARAMETERS:  STRING, source url
#                STRING, dest dir
#      RETURNS:  nothing
#===============================================================================
function git_clone()
{
    local SOURCEURL=$1
    local DESTDIR=$2
    local BASENAME=$(basename $SOURCEURL .git)
    local STRING="git clone ${BASENAME}.git into ${DESTDIR}"
    remark "${STRING}, start"
    remark "sourceurl: $SOURCEURL"
    remark "destdir: $DESTDIR"
    remark "basename: $BASENAME"
    cd $DESTDIR
    git clone $SOURCEURL
    cd -
    remark "${STRING}, end"
} # end: git_clone

function __mkdirp()
#===  FUNCTION  ================================================================
#         NAME:  __mkdirp
#  DESCRIPTION:  wrapper for mkdir
#   PARAMETERS:  STRING, directory name
#      RETURNS:  0: oke, 1: not oke
#===============================================================================
{
    local DIRNAME="$1"
    local STRING="create directory ${DIRNAME}"
    local RETV=0

    remark "${STRING}, start"

    if [ -d "$DIRNAME" ]
    then
      remark "${STRING}, not needed"
      remark "${STRING}, end"
      return 0
    fi

    if ! mkdir -p "${DIRNAME}"
    then
      RETV=$?
      remark "${STRING}, failed"
    fi
    remark "${STRING}, end"
}

#===============================================================================
# MAIN
#===============================================================================

[[ "$(basename $CONST_SCRIPTDIR)" = ".vim" ]] || die "this is not a vim directory"

[[ -e "$HOME/.vimrc" ]] && mv -v "$HOME/.vimrc" "$HOME/.vimrc.orig"
ln -s "${CONST_SCRIPTDIR}/main.vim" "$HOME/.vimrc"

__mkdirp $CONST_SCRIPTDIR/autoload || die "failed to create autoload directory"
__mkdirp $CONST_SCRIPTDIR/bundle   || die "failed to create bundle directory"

curl -LSso $CONST_SCRIPTDIR/autoload/pathogen.vim ${CONST_URL_PATHOGEN}
cat << EOF > ${CONST_SCRIPTDIR}/settings/local.vim

execute pathogen#infect()

EOF

git_clone "https://github.com/tomtom/tlib_vim.git" \
     "${CONST_SCRIPTDIR}/bundle"

git_clone "https://github.com/MarcWeber/vim-addon-mw-utils.git" \
     "${CONST_SCRIPTDIR}/bundle"

git_clone "https://github.com/garbas/vim-snipmate.git" \
     "${CONST_SCRIPTDIR}/bundle"

git_clone "https://github.com/scrooloose/nerdtree.git" \
     "${CONST_SCRIPTDIR}/bundle"

#===============================================================================
# END
#===============================================================================
