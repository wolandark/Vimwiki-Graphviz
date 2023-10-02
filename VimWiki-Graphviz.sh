#!/bin/bash

###############################################
# Written By Woland

# Desc
#   generate sexy graphs from vimwiki files
#   works both for .wiki and .md wikis

# Dependency:
#          POSIX Env
#          graphviz

# https://github.com/wolandark
# https://github.com/wolandark/Vimwiki-Graphviz
###############################################

layout="sfdp"
overlap="prism"
format="wiki"

while getopts "hnvxm" opt; do
  case $opt in
     h)
      echo -e "\nUsage:\n\t $0 [-h This Msg] [-n Layout twopi] [-v overlap voronoi] [-x overlap scalexy] [-m operate on md files] \n"
      exit 0
      ;;
    n)
      layout="twopi"
      ;;
    v)
      overlap="voronoi"
      ;;
    x)
      overlap="scalexy"
      ;;
    m)
      format="md"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      echo "Usage: $0 [-n]"
      exit 1
      ;;
  esac
done

shift $((OPTIND-1))

if [ "$#" -ne 0 ]; then
    echo "Usage: $0 [-n]"
    exit 1
fi

echo -e "digraph G {
fontname=\"Helvetica,Arial,sans-serif\"
node [fontname=\"Helvetica,Arial,sans-serif\" color=\"#00FF22\" fontcolor=\"#f8f8f8\"]
edge [fontname=\"Helvetica,Arial,sans-serif\" color=cyan fontcolor=\"#f8f8f8\"]
layout=$layout
graph [ranksep=3, overlap=$overlap bgcolor=\"#1e1e2e\" ];"

link1='\[[^]]*\]\(([^#][^)]*)\)' 
link2='\[\[([^#].*?)\]\]'        
IFS=$'\n'

for from in $(find . -name "*.$format" -type f | sort); do
    to_list=$(sed -En "s/.*($link1|$link2).*/\1/p" "$from" | sed -E 's/\[|\]//g' | grep -vE '^#' | sort | uniq)
    for to in $to_list; do
        if [[ -f $to.$format ]]; then
            printf '    "%s" -> "%s"\n' $(basename -s .$format "$from") $to
        fi
    done
done
echo "}"

