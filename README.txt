A DTX file is parsed as a whole multiple times from within itself through multiple different parsers. Additionally, portions are extracted to entirely separate files, which are then imported during parsing of the DTX itself such that some lines are processed multiple times during a single parse (of many parses). Programmers believe in a form of ritual hazing called `recursion', and the ability to construct a working DTX is somewhat of a rite of passage before being allowed to publish a \LaTeX* package. Consider this my proof of qualification.

During the great pandemic of 2020, the \cls{gWmaths} class was created to shorten the common preamble from a set of my wife's \LaTeXe* lectures, transparencies, slides, and handouts. It was initially \cls{pellmaths} and was just a shortcut for 80 lines of boilerplate at the top of every darn file.

With the first week of 2021 declaring "hold my beer", some effort was made to expand and improve. The class was renamed to \cls{gWmaths.cls}, partially split out to a \pkg{gWmaths.sty} package, and updated to \LaTeXx*. Meanwhile, the source transformed to require build via \pkg{docstrip} and was brought under version control.

This work has the LPPL maintenance status `maintained'.

The Current Maintainer of this work is
John Pell
.

The list of all files belonging to `gWmaths' is given in the file `manifest.txt'.

ctanify --pkgname=gWmaths gWmaths.dtx gWmaths.sty gWmaths.cls gWmaths.pdf DEPENDS.txt README.txt
gh release create v0.5.0 --title 2021-02-14 gWmaths.tar.gz gWmaths.tds.zip gWmaths.pdf DEPENDS.txt README.txt

use release notes from a file
gh release create v1.2.3 -F changelog.md

upload a release asset with a display label
gh release create v1.2.3 '/path/to/asset.zip\#My display label'

Options
  -d, --draft             Save the release as a draft instead of publishing it
  -n, --notes string      Release notes
  -F, --notes-file file   Read release notes from file
  -p, --prerelease        Mark the release as a prerelease
      --target branch     Target branch or commit SHA (default: main branch)
  -t, --title string      Release title
