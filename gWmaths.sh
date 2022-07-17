#!/bin/bash -eu
set -xo pipefail
##
# Generate the appropriate upload artifact for CTAN, using `git archive` so as to take advantage of the `export-subst` feature.
# This used to be pefrormed by: ctanify --pkgname=gwmaths --tdsonly='gWmaths.sty' --tdsonly='*.cls' gWmaths.{dtx,pdf} *.{sty,cls,txt}
##

# git tag -a v0.6.5 -m 'Second CTAN Candidate' && git push

git archive --prefix=doc/latex/gwmaths/ --add-file=gWmaths.pdf --add-file=LICENSE.txt --prefix=tex/latex/gwmaths/ --add-file=gWmaths.{sty,cls,def} --prefix source/latex/gwmaths/ --output=gWmaths.tds.zip --worktree-attributes --verbose "${1?}"

git archive --add-file=gWmaths.tds.zip --prefix=gwmaths/ --output=gWmaths.tar.gz --worktree-attributes --verbose "${1?}"

# gh release create --draft --generate-notes --prerelease "${1?}" gWmaths.tar.gz gWmaths.tds.zip gWmaths.pdf
