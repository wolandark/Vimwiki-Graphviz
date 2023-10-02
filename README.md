# Vimwiki-Graphviz

Yet Another VimWiki Graph Generator 

Generate a stylish graphical chart from your vimwiki links. Creating an image of your second brain.

# Usage
__Place the `VimWiki-Graphviz.sh` script inside your vimwiki root. Run the script.__
```
./VimWiki-Graphviz.sh > MyGraph.txt
```
or generate a networkmap layout:
```
./VimWiki-Graphviz.sh -n > MyGraph.txt
```
Paste the output in any dot viewer [like this one](https://dreampuf.github.io/GraphvizOnline/). (_Note that not all dot viewers support sfdp layout, but no matter, we can do it ourselves_).

## Do it yourself

Install the `graphvis` package for your distro.
<br>

Then generate an image based on the script's output:
```
dot -Tpng MyGraph.txt -o MyGraph.png
```
__Then you can open the PNG file with your favorite image viewer, or automate it like this:__
```
dot -Tpng MyGraph.txt -o MyGraph.png && sxiv MyGraph.txt
```

# Output
__Run the script without arguments and get a SFDP type layout.__
![gr1](https://github.com/wolandark/Vimwiki-Graphviz/assets/107309764/d225d612-d577-4245-8fa0-a7142d7ba782)


__Run the script with `-n` arguments and get a Network Map type layout.__
![gr2](https://github.com/wolandark/Vimwiki-Graphviz/assets/107309764/28c75109-b215-455e-9f65-61cfc196f497)

# Notes
You can define more layouts and change the colors. The script should be easy to read and alter (minus the regex) if you know a little bash.

This script was inspired by a similar script, yet that one uses perl and outputs a plain graph that can turn out to be a vertically stretched out graph that is basically useless.

I chose these layouts and colors to mimic obsidians graph looks (even though I literally only saw it once). It's nice to see one's second brain and how complex it has gotten in time. 

Like all art, this script is indeed useless (Oscar Wylde).

