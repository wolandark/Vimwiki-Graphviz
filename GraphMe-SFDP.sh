#!/usr/bin/env bash 

echo -e "digraph G {
fontname=\"Helvetica,Arial,sans-serif\"
	node [fontname=\"Helvetica,Arial,sans-serif\" color=\"#00FF22\" fontcolor=\"#f8f8f8\"]
	edge [fontname=\"Helvetica,Arial,sans-serif\" color=cyan fontcolor=\"#f8f8f8\"]
	layout=sfdp
	graph [ranksep=3, root=\"189E\", overlap=prism bgcolor=\"#1e1e2e\" ];"

link1='\[[^]]*\]\(([^#][^)]*)\)' 
link2='\[\[([^#].*?)\]\]'        
IFS=$'\n'

for from in $(find . -name "*.wiki" -type f | sort); do
    to_list=$(sed -En "s/.*($link1|$link2).*/\1/p" "$from" | sed -E 's/\[|\]//g' | grep -vE '^#' | sort | uniq)
    for to in $to_list; do
        if [[ -f $to.wiki ]]; then
            printf '    "%s" -> "%s"\n' $(basename -s .wiki "$from") $to
        fi
    done
done
echo "}"

