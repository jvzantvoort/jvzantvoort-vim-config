#!/usr/bin/python
# -----------------------------------------------------------------------------
"""
                                 Python Script
"""
# -----------------------------------------------------------------------------

__author__      = "John van Zantvoort"
__credits__     = ["John van Zantvoort"]
__version__     = "0.1"
__maintainer__  = "John van Zantvoort"
__email__       = "John@vanZantvoort.org"
__status__      = "Development"

# Import the libraries
import os, os.path
import sys
# import pprint
from optparse import OptionParser

# Some helpful constants and inits

# SCRIPTNAME = os.path.abspath( __file__ )
# DIRNAME = os.path.dirname( SCRIPTNAME )

# Get the uid of the current user
# UID = os.getuid()

# this enables the dumping of variables in readable structures.
# pp = pprint.PrettyPrinter(indent=4)

def main(args):
    """
    main
    """

if __name__ == '__main__':
    # main(sys.argv[1:])
    description = """
SCRIPTNAME: [command] [arguments]
"""
    parser = OptionParser( version="%prog 0.1", usage="usage: %prog [options] command", description=description )
    parser.add_option( "-s", "--server", dest="SERVER_ADDRESS", help="server address" )

    (options, args) = parser.parse_args()

    if options.SERVER_ADDRESS:
        print options.SERVER_ADDRESS

    if len( args ) == 0:
        exit( parser.print_help, 1 )
    operation = args.pop( 0 )

    # only root is allowed to execute this script
    if uid != 0:
       sys.stderr.write("you are not allowed to execute this tool\n")
       sys.exit(1)

