#fswatch -r -0 docs-source/source | xargs -0 -I % sh -c "make doc; ./reload.sh"

fswatch -r -0 docs-source/source/installation \
 -e ".*" \
 -i "\\.rst$"  | xargs -0 -I % sh -c "make; make view"
