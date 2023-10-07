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
# Flags
- `-h` Help Msg
- `-n` Network Map Layout
- `-v` Vonorai overlap (defaults to prism)
- `-x` Scalexy overlap (defaults to prism)
- `-m` Crawk MD files. (Only if your wiki is in Markdown)

# Output
__Run the script without arguments to get a SFDP type layout.__
![gr1](https://github.com/wolandark/Vimwiki-Graphviz/assets/107309764/d225d612-d577-4245-8fa0-a7142d7ba782)


__Run the script with `-n` to get a Network Map type layout.__
![gr2](https://github.com/wolandark/Vimwiki-Graphviz/assets/107309764/28c75109-b215-455e-9f65-61cfc196f497)

__Run with `-v` to get a voronai overlap style.__
![layout-1-voronoi-](https://github.com/wolandark/Vimwiki-Graphviz/assets/107309764/f7bad3e6-9bc8-41fe-a97c-1fd319b84b7d)

__Run with `-x` to get a scalexy overlap style.__
![layout-1-scalexy-](https://github.com/wolandark/Vimwiki-Graphviz/assets/107309764/268484d7-d680-4be9-8ec6-b33d3e6a8986)


# Notes
If you're on windows, consider using [the python version of this script](https://github.com/dustractor/vimwiki2dot2png). I may or may not provide a batch version in the future.
You can define more layouts and change the colors. The script should be easy to read and alter (minus the regex) if you know a little bash.

This script was inspired by a [similar script](https://gitlab.com/vobijs/vimwiki-graph), yet that one uses perl and outputs a plain graph that can turn out to be a vertically stretched out graph that is basically useless.
I have converted the nasty perl bit into sed and elevated the functionality of the script to support layouts and work with wiki files as well as markdown files. <br>
This script should run on any posix machine.

I chose these layouts and colors to mimic obsidians graph looks (even though I literally only saw it once). It's nice to see one's second brain and how complex it has gotten in time. 

It's a pretty thing to look at. 
Like all arts, this script is quite useless. (Oscar Wylde)

