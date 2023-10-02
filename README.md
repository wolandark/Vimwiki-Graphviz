# Vimwiki-Graphviz

Yet Another VimWiki Graph Generator 

Generate a stylish graphical chart from your vimwiki links. Creating an image of your second brain.

# Usage
__Place the `VimWiki-Graphviz.sh` script inside your vimwiki root. Run the script.__
```
./VimWiki-Graphviz.sh > MyGraph.txt

or

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
