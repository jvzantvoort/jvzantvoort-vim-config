#!/bin/bash
#===============================================================================
#
#         FILE:  export_vimrc.sh
#
#  DESCRIPTION:  Export the vimrc setup. For restricted locations.
#
#===============================================================================

# --------------------------------------
# VARIABLES
# --------------------------------------
APPNAME="$(basename $0)"

# If not in jenkins
if [ ! "$WORKSPACE" ]
then
  WORKSPACE="$HOME/tmp"
fi

#===  FUNCTION  ================================================================
#         NAME:  remark
#  DESCRIPTION:  simple function for printing information.
#        NOTES:  make sure you define APPNAME="$(basename $0)" for example like
#                this:
#
#                  APPNAME="$(basename $0)"
#
#   PARAMETERS:  none
#      RETURNS:  0, oke
#                1, not oke
#===============================================================================
remark() {
  echo "$APPNAME: $@"
} # end: remark

#===  FUNCTION  ================================================================
#         NAME:  die
#  DESCRIPTION:  shell version of the perl die
#   PARAMETERS:  none
#      RETURNS:  0, oke
#                1, not oke
#===============================================================================
die() {
  remark "DIED: $@"
  exit 8
} # end: die

#===  FUNCTION  ================================================================
#         NAME:  mkstaging_area
#  DESCRIPTION:  Creates a temporary staging area and set the variable
#                $STAGING_AREA to point to it
#   PARAMETERS:  STRING, mktemp template (optional)
#      RETURNS:  0, oke
#                1, not oke
#===============================================================================
mkstaging_area()
{
  local TEMPLATE RETV
  TEMPLATE="${WORKSPACE}/jvzantvoort-vim-config.XXXXXXXX"

  [[ -z "$1" ]] || TEMPLATE="$1"

  STAGING_AREA=$(mktemp -d ${TEMPLATE})
  RETV=$?

  if [ $RETV == 0 ]
  then
    return 0
  else
    remark "mkstaging_area failed $RETV"
    return 1
  fi

  return 0
} # end: mkstaging_area

#===  FUNCTION  ================================================================
#         NAME:  git_exp
#  DESCRIPTION:  export a git repo to a select destination
#   PARAMETERS:  STRING, source url
#                STRING, dest dir
#      RETURNS:  nothing
#===============================================================================
git_exp()
{
    SOURCEURL=$1
    DESTDIR=$2
    BASENAME=$(basename $SOURCEURL .git)

    remark "sourceurl: $SOURCEURL"
    remark "destdir: $DESTDIR"
    remark "basename: $BASENAME"
    mkdir -p $STAGING_AREA/src
    cd $STAGING_AREA/src
    git clone $SOURCEURL
    mkdir -p $DESTDIR
    cd $BASENAME
    git archive --format=tar HEAD | tar -xf - -C $DESTDIR
    cd ..
    rm -rf "${BASENAME}"
} # end: git_exp

#===============================================================================
# MAIN
#===============================================================================
TIMESTAMP=$(date +%Y%m%d%H%M%S)
OUTPUTDIR="vimconfig_${TIMESTAMP}"
remark "create staging area"

[[ -d "${WORKSPACE}" ]] || mkdir -p "${WORKSPACE}"

mkstaging_area || die "mkstaging_area failed"
[[ -z "$STAGING_AREA" ]] && die "STAGING_AREA variable is empty"

mkdir -p $STAGING_AREA/src || die "cannot create src dir"
mkdir -p $STAGING_AREA/$OUTPUTDIR/.vim/autoload || die "autoload dir not created"
mkdir -p $STAGING_AREA/$OUTPUTDIR/.vim/bundle || die "bundle dir not created"
git archive --format=tar HEAD | tar -xf - -C "$STAGING_AREA/$OUTPUTDIR/.vim"

git_exp "https://github.com/tomtom/tlib_vim.git" \
     "$STAGING_AREA/$OUTPUTDIR/.vim/bundle/tlib_vim"

git_exp "https://github.com/MarcWeber/vim-addon-mw-utils.git" \
     "$STAGING_AREA/$OUTPUTDIR/.vim/bundle/vim-addon-mw-utils"

git_exp "https://github.com/garbas/vim-snipmate.git" \
     "$STAGING_AREA/$OUTPUTDIR/.vim/bundle/vim-snipmate"

git_exp "https://github.com/scrooloose/nerdtree.git" \
     "$STAGING_AREA/$OUTPUTDIR/.vim/bundle/nerdtree"

curl -LSso $STAGING_AREA/$OUTPUTDIR/.vim/autoload/pathogen.vim \
        https://tpo.pe/pathogen.vim

[[ -f "$STAGING_AREA/$OUTPUTDIR/.vim/.gitignore" ]] && \
    rm -f "$STAGING_AREA/$OUTPUTDIR/.vim/.gitignore"

[[ -f "$STAGING_AREA/$OUTPUTDIR/.vim/export_vimrc.sh" ]] && \
    rm -f "$STAGING_AREA/$OUTPUTDIR/.vim/export_vimrc.sh"

cat << EOF > $STAGING_AREA/$OUTPUTDIR/.vim/settings/local.vim

execute pathogen#infect()

EOF

cd $STAGING_AREA

tar -jcf $WORKSPACE/${OUTPUTDIR}.tar.bz2 $OUTPUTDIR
cd
rm -rf $STAGING_AREA
echo "check results in $WORKSPACE/${OUTPUTDIR}.tar.bz2"

#===============================================================================
# END
#===============================================================================
