\NeedsTeXFormat{LaTeX2e}[2020/10/01]	\RequirePackage{ iftex, xparse, l3keys2e, }%
%%!TEX root = gWmaths.dtx
%%!TEX encoding = UTF-8
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ProvidesExplClass%
 	{gWmaths}	{2021/01/14}	{0.3.0}%
 		{COVID-19 Quarantine Accessible TeX Project}
\RequirePackage{ iftex, etoolbox,	}%
\RequirePackage{ gWmaths,	}%xparse, expl3
\GetFileInfo{\CurrentFile}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifx\filename\jobname%\iffalse
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%
%% Copy the following lines to the *top* of your \LaTeX document
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\documentclass[english,lecture]{gWmaths}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
\date{Fall 2020}  % \LaTeXe uses \today if you don't specify any \date{}
\author{Diana Pell}
\title{TITLE OF DOCUMENT}
%%
\addto\captionsenglish{%
	\renewcommand{\abstractname}{What To Expect}% Heading of Intro section
}
%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
\fi%		Copy the *above* lines to the top of your \LaTeX document
%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\gW@addGlobalOption{utf8} % All documents are UTF-8 in the 21st century. If not, fix your document.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Specify some requirements, but this is mostly redundant...
%%

%%%TODO:
%% http://mirrors.ctan.org/macros/latex/base/slides.pdf
%% http://mirrors.ctan.org/macros/latex209/contrib/eslides/eslides.pdf
%%hypcap
%% http://mirrors.ctan.org/macros/latex/contrib/etoolbox/etoolbox.pdf
%%% \newbool & \newtoggle
%% http://mirrors.ctan.org/macros/latex/contrib/siunitx/siunitx.pdf
%% http://mirrors.ctan.org/macros/latex/contrib/noindentafter/noindentafter.pdf
%% http://ctan.math.washington.edu/tex-archive/support/latexmk/latexmk.pdf
%% http://mirrors.ctan.org/macros/latex/contrib/bookmark/bookmark.pdf
%% https://tex.stackexchange.com/a/31658 use \ifdefined\foo\else\fi
%% https://tex.stackexchange.com/a/472044 \string fuckery

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set up our options and defaults
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\keys_define:nn { gWmaths }
{
	hyperref	.bool_set:N	= \gW@hyperref	,

	ntheorem	.bool_set:N	= \gW@ntheorem	,

	amsmath	.bool_set:N	= \gW@amsmath	,

	hypdoc	.bool_set:N	= \gW@hypdoc	,

	amsthm	.bool_set:N	= \gW@amsthm	,

	accessibility	.bool_set:N	= \gW@accessibility	,

	axessibility	.bool_set:N	= \gW@axessibility	,

	videolecture	.bool_set:N	= \gW@videolecture	,
	oneinch	.bool_set:N	= \gW@oneinch	,
	
	titlesec	.bool_set:N	= \gW@titlesec	,
	%http://mirrors.ctan.org/macros/latex/contrib/titlesec/titlesec.pdf

	documentClass	.tl_set:N	= \gW@documentClass	,
	documentClass	.default:n	= article	,
	syllabus	.meta:n	= {
		documentClass	= article	,
			}	,
	syllabus	.value_forbidden:n	= true	,
	exam	.meta:n	= {
		documentClass	= exam	,
			}	,
	exam	.value_forbidden:n	= true	,
	lecture	.meta:n	= {
		documentClass	= article
			}	,
	lecture	.value_forbidden:n	= true	,
	course	.meta:n	= {
		documentClass	= article
			}	,
	course	.value_forbidden:n	= true	,
	quiz	.meta:n	= {
		documentClass	= article
			}	,
	quiz	.value_forbidden:n	= true	,
	handout	.meta:n	= {
		documentClass	= article
			}	,
	handout	.value_forbidden:n	= true	,

}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\keys_set:nn { gWmaths }{% Set our default options
	hyperref,
	ntheorem,
	hypdoc,
	documentClass=article,
	amsmath,
		}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Prepare arguments for all the packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set up modern defaults for encodings:
\PassOptionsToPackage{% `inputenc`
	utf8 % All documents are UTF-8 in the 21st century. If not, fix your document.
		}{inputenc}
\PassOptionsToPackage{% `fontenc`
	T1		% T1 fonts extend the old OT1 format to allow greater than 128 characters
		}{fontenc}
\PassOptionsToPackage{% `mmap`
	noTeX % use unicode codepoints, not TeX names.
		}{mmap} % Allows copy/pasta from PDF.
\PassOptionsToPackage{%
	atend,%
		}{bookmark}
%% Set up \HyperTeX (hyperref, et al), which is basically the structural core of the document:
\bool_if:nTF \gW@hyperref{
\PassOptionsToPackage{% `hyperref`
	implicit, % Redefine \LaTeX internals, already default
	hypertexnames, % Use guessable names for anchors, already default
	bookmarks, % Write TOC as PDF bookmarks
	driverfallback=hypertex, % if can't autodetect, then just use the most basic

	%hyperfigures, % make figures hyper links
	%hyperfootnotes, % set up hyperlinked footnotes, already default
	%hyperindex, % set up hyperlinked indices, already default

	colorlinks, % set hyperlinks in color
	linkcolor=blue, % default is fucking 'red'

	%hyperindex, % links index entries back to main text, conflicts with hypdoc
	linktoc=all, % link section name *and* page number from toc
	%backref, % link back from bib entries to main text

	%pdfencoding=unicode, % set 'auto' to prefer PDFEncoding over UTF-16; default for \TUTeX
	%pdflang=en-us, % `hyperxmp` automatically sets this from the language of `babel`
	pdfusetitle, % use \title{} for PDF metadata
	pdfdisplaydoctitle, % set PDF display \title{} in UI title bar
	pdfpagelabels, % tag pages with page numbers from \LaTeX ("ii" or whatever)
	keeppdfinfo % `hyperxmp` strips Author and Keywords by default; don't do that.
		}{hyperref}
%% Inform *all* packages that `hyperref` is in use:
\gW@addGlobalOption{hyperref}
%%
}{}% \@gWhyperref

%% Set up `scrbase` not to argue with iftex.
\PassOptionsToPackage{% `scrbase`
	internalonly % don't define macros to conflict with `iftex`
		}{scrbase} % KOMA-Script base package

%% Set up documentation utilities from `hyperref` documentation package.
\bool_if:nTF \gW@hypdoc{
\PassOptionsToPackage{% `hyperref`
	hyperindex=false, % do *not* link page numbers from index...conflict w/ hypdoc...
		}{hyperref}
}{}%\gW@hypdoc

%% Set up colors now that we have color printers and video screens...
\PassOptionsToPackage{% `xcolor`
	xcdraw, % use PS/PDF commands to draw frames and boxes, in dvips, pdftex, dvipdfm
	fixinclude, % prevents dvips from explicitly resetting current color to black before actually inserting an .eps file
	%fixpdftex % Load the `pdfcolmk` package; useless stub
	dvipsnames, % Load a set of predefined colors according to \TeX.
	svgnames, % Load a set of predefined colors according to SVG 1.1.
	x11names*, % Load a set of predefined colors according to Unix/X11, delayed.
	table, % Load the `colortbl` package
		}{xcolor}

%% Set up a much nicer set of theorem environments:
\bool_if:nTF \gW@ntheorem{
\PassOptionsToPackage{% `ntheorem`
	thmmarks, % enables the automatical placement of endmarks
	thref, % enables the extended reference features
	standard % load predefined environments
		}{ntheorem}
%% Inform *all* packages that `ntheorem` is in use:
\gW@addGlobalOption{ntheorem}
%%
\PassOptionsToClass{% `beamer`
	noamsthm % prevent from loading `amsthm`, which conflicts with `ntheorem`
		}{beamer}
}{}%\gW@ntheorem

%% Set up the most common mathematics package:
\bool_if:nTF \gW@amsmath{
\PassOptionsToPackage{% `amsmath`
		}{amsmath}

%% Inform *all* packages that `amsmath` is in use:
\gW@addGlobalOption{amsmath}
%%
}{}

%% Set up formatting for telephone numbers:
\PassOptionsToPackage{% `phonenumbers`
	country=US, % switch defaults from DE to US.
	foreign=international, % Use sensible defaults for full ITU numbers.
	home-country=none, % Do not strip the country code (default).
	home-area-code=none, % Do *not* strip area code, ever (default).
	link=on % clickable tel: link (default).
		}{phonenumbers}

%% Set up a nicer quotation package:
\PassOptionsToPackage{% `csquotes`
	autostyle=try, % use `babel` if available
	%autopunct % look ahead for trailing punctuation to move inside marks
		}{csquotes}

\PassOptionsToPackage{% `currfile`
	abspath, %-recorder (default in latexmk)
	realmainfile,
	parent,
	%parents,
		}{currfile}

\PassOptionsToClass{% `beamer`
	t % ?
		}{beamer}

	%english % The language can be tagged on the \documentclass declaration!
		%}{babel}

\PassOptionsToPackage{%
	%heightrounded % round off to avoid overfull alrgn;earujs
		}{geometry}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Input encoding, font loading, Unicode
%% ref: https://tex.stackexchange.com/a/64457
%% ref: https://tex.stackexchange.com/a/677
%% ref: https://tex.stackexchange.com/a/147206
%% ref: https://tex.stackexchange.com/a/2869
%% ref: https://tex.stackexchange.com/a/44701
%% ref: https://tex.stackexchange.com/a/413046
%% ref: https://tex.stackexchange.com/a/54077
%% ref: http://www.texfaq.org/FAQ-why-inp-font
%% ref: https://tex.stackexchange.com/a/78103
%% ref: https://robjhyndman.com/hyndsight/xelatex/
%% ref: http://ipagwww.med.yale.edu/latex/hyperref.pdf % page size
%% ref: https://tex.stackexchange.com/q/1863
%% ref: https://tex.stackexchange.com/questions/331597/trouble-transitioning-from-paralist-to-enumitem
%% https://tex.stackexchange.com/a/202301



\let\@classoptionslist\gW@classoptionslist

\bool_if:nTF \gW@accessibility{
	\requirePDFTeX
}{}



\ProcessKeysOptions{gWmaths}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\gW@documentClass}}
\ProcessOptions\relax

\ifpdf
	\pdfminorversion=6 %fucking hack for `accessibility`
\fi

\providecommand{\LoadPackagesNow}{}% reduce code churn by providing a stub for running without `pkgloader`

\ifTUTeX\else% engine is not unicode-native
	\RequirePackage[utf8]{inputenc}[2015/01/01]
	% When using older engines, this tells the engine to read all files as UTF-8.
	% XeTeX and LuaTeX always read UTF-8 and ignore this package.
	% LaTeX circa 2018 and newer default to UTF-8 as well.
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Load the base document class
\LoadClass{\gW@documentClass}
%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Begin actually loading packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
\RequirePackage{% `hyperxmp` required *before* `hyperref`
	babel,		% http://mirrors.ctan.org/macros/latex/required/babel/base/babel.pdf
	hyperxmp		% http://mirrors.ctan.org/macros/latex/contrib/hyperxmp/hyperxmp.pdf
		}%	% babel cannot set the pdf-lang option for hyperref, but it can through hyperxmp!

\RequirePackage{%
	amsfonts,		% http://mirrors.ctan.org/fonts/amsfonts/doc/amsfndoc.pdf
	amssymb,		% http://mirrors.ctan.org/fonts/amsfonts/doc/amssymb.pdf
	amsmath,		% http://mirrors.ctan.org/macros/latex/required/amsmath/amsldoc.pdf
	%mathtools,		%http://mirrors.ctan.org/macros/latex/contrib/mathtools/mathtools.pdf
%%don't use: http://mirrors.ctan.org/macros/latex/required/amscls/doc/amsthdoc.pdf
		}%

\RequirePackage{%
	venndiagram
		}%https://tex.stackexchange.com/a/381249

\bool_if:nTF \gW@ntheorem{
\RequirePackage{% improves theorem-like environments, conflicts with `amsthm`, must load *after* `babel` and *after* amsmath and *after* mathtools/empheq
	ntheorem		% http://mirrors.ctan.org/macros/latex/contrib/ntheorem/ntheorem.pdf
		}	%https://tex.stackexchange.com/a/5633
}{}%\gW@ntheorem

\bool_if:nTF \gW@oneinch{ % if the flag is set, then do some thing
	\AtEndOfClass{
		\geometry{
			%letterpaper, % screen % try to get this to auto-detect or something so \documentclass[a4paper,landscape]{gWmaths} works
			margin=1in
				}
			}
}{}%\gW@oneinch


\ifXeTeX
	%% docs: http://mirrors.ctan.org/info/xetexref/xetex-reference.pdf
\fi

\RequirePackage% load *before* `fontspec`
	{graphicx} % http://mirrors.ctan.org/macros/latex/required/graphics/grfguide.pdf
		% docs say to only load one, and package/classes should  `s` not `x` as the user may s->x but not back
		% literally the only difference is the `keyval` package, therefore just use `x`.

\ifTUTeX % "Unicode TeX" matches LuaTeX and/or XeTeX
	\RequirePackage% must load *after* maths fonts (specifically euler)
		{fontspec} % http://mirrors.ctan.org/macros/unicodetex/latex/fontspec/fontspec.pdf
	\defaultfontfeatures{Ligatures=TeX} % Make ASCII nicer
	
	%% Post-2017, don't use EU1/EU2 font encoding (nor T1, nor TS1, nor OT1)
	%% Post-2017, don't use xunicode package
	%% Post-2017, default `tuenc` package uses TU font encoding, full unicode.
\else % pdfTeX or older
	\RequirePackage{%
		mmap,	% `mmap` must load *after* `hyperref` % https://ctan.org/pkg/mmap
		fontenc,	% `fontenc` must load *after* `mmap`/`cmap`	% `fontenc` specifies which font format to import.
			}%
	% T1 fonts extend the old OT1 format to allow greater than 128 characters
	% `mmap` is `cmap` plus some math-specifics.
	% `cmap` extends default character mapping to include unicode codepoints.
	% something about ASCII or Unicode fonts: ...Package[noTeX]{mmap}
\fi

	%% docs: http://mirrors.ctan.org/macros/latex/contrib/standalone/standalone.pdf

	%activeospeccharacters, % don't fuck with < and >
	%notheorems?
		%]{beamerarticle}



\RequirePackage% `fancyhdr` may have issues with `accessibility`, must load *before* `hyperref`
	{fancyhdr} % http://mirrors.ctan.org/macros/latex/contrib/fancyhdr/fancyhdr.pdf

\bool_if:nTF \gW@videolecture{}{
	\RequirePackage% `paralist` redefines {itemize}, {enumerate} environments
		{paralist} % http://mirrors.ctan.org/macros/latex/contrib/paralist/paralist.pdf
	% `enumitem` is substantially more complex than `paralist`
	%% docs: http://mirrors.ctan.org/macros/latex/contrib/enumitem/enumitem.pdf
	%shortlabels, % compatible with `enumerate`
	%unboxed % avoid problems nesting environments
		%]{enumitem}
}%\gW@videolecture

\ifTUTeX % Unicode TeX
	\RequirePackage % Use unicode symbols
		{unicode-math} % http://mirrors.ctan.org/macros/unicodetex/latex/unicode-math/unicode-math.pdf
\fi


\RequirePackage{%
	xcolor,	% http://mirrors.ctan.org/macros/latex/contrib/xcolor/xcolor.pdf
	phonenumbers,	% http://mirrors.ctan.org/macros/latex/contrib/phonenumbers/doc/phonenumbers-en.pdf
	csquotes,	% http://mirrors.ctan.org/macros/latex/contrib/csquotes/csquotes.pdf
	geometry,	% http://mirrors.ctan.org/macros/latex/contrib/geometry/geometry.pdf
	filemod,	% http://mirrors.ctan.org/macros/latex/contrib/filemod/filemod.pdf
	ifdraft,
		}

\bool_if:nTF \gW@videolecture{}{
	\RequirePackage% un-dumb \maketitle
		{titling} % http://mirrors.ctan.org/macros/latex/contrib/titling/titling.pdf
}%\gW@videolecture


\ifPDFTeX%\ifPDFTeX % not XeTeX nor LuaTeX
	% This package is the magic that associates, structures, and tags the TeX sources to show up in the PDF:
	\RequirePackage[% `accessibility` is badly hacked together and quite old...
		tagged
			]{accessibility}
\fi%\ifPDFTeX

\ifXeTeX\else% seems like XeTeX is actually kind of a hack and maybe not much future...
	\RequirePackage[
		%% docs:
			]{tagpdf} % official work-in-progress package for future integrated tagging
	\RequirePackage[%
		%% docs: http://mirrors.ctan.org/macros/latex/contrib/axessibility/axessibility.pdf
			]{axessibility}
\fi


\RequirePackage{% `hyperref` claims to be about hypertext, but it's actually a significant structural support!
	%% NOTE: https://tex.stackexchange.com/q/1863
	hyperref,		% http://mirrors.ctan.org/macros/latex/contrib/hyperref/doc/manual.pdf
	bookmark,		% http://mirrors.ctan.org/macros/latex/contrib/bookmark/bookmark.pdf
	%pdfcomment,	% http://mirrors.ctan.org/macros/latex/contrib/pdfcomment/doc/pdfcomment.pdf
		}% %also: http://mirrors.ctan.org/macros/latex/contrib/hyperref/doc/manual.html#x1-520009

\bool_if:nTF \gW@videolecture{}{
	\RequirePackage%
		{hypdoc} % http://mirrors.ctan.org/macros/latex/contrib/oberdiek/hypdoc.pdf
}%\gW@videolecture

	%% docs: http://mirrors.ctan.org/macros/latex/contrib/pdfcomment/doc/pdfcomment.pdf
	%linewidth = 1 % TODO: what is `linewidth` for?
		%]{pdfcomment} % http://mirrors.ctan.org/macros/latex/contrib/pdfcomment/doc/pdfcomment.pdf

\ifXeTeX\geometry{xetex}\fi%
\ifLuaTeX\geometry{luatex}\fi%


\ifLuaTeX
\fi

\RequirePackage%
	{filehook,currfile}%
		[2020/09/29]%

\RequirePackage%
	{gitinfo2}%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadPackagesNow% `pkgloader`

\@ifundefined{GetFileInfo}{}{% https://tex.stackexchange.com/a/30486
	%http://mirrors.ctan.org/macros/latex/base/ltfilehook-doc.pdf
	\GetFileInfo{\CurrentFile}
	\hypersetup{
		pdfsubject={\fileinfo}, % this takes the name/description of the *class*...
			}

	\AtEndOfClass{%
		%\GetFileInfo{\jobname.tex} % read \ProvidesFile{}[] from the ultimate TeX
		%\listfiles % track loaded files in this job
		%\@getclass
		\date{\filemodprintdate{\filename}}
			}
		}% \GetFileInfo

\hypersetup{%
	%pdflang={en-US}, % `hyperxmp` will ask `babel` for the language code!
	%hyperindex % turn this shit back on, JFC.
		}

\AtBeginDocument{%
	\listfiles % track loaded files in this job
	%\date{omg}
	\hypersetup{%
		%pdfdate={\pdffilemoddate{\jobname.tex}}, % 2020 or 2020-01 or 2020-01-04
		pdfcreationdate={\pdffilemoddate{\jobname.tex}},
		pdfrendition=default, %screen,
		%pdfsubject={},
		%pdfsubtitle={},
		%pdfurl={}, % full path to *this* PDF
		pdfinfo={%
			%CreationDate={\pdffilemoddate{\jobname.tex}}
				},
		%pdfsource={\jobname.tex} % default
		pdfuapart=1 % that's the whole point, but we're lacking...
			}
		}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% preserve document metadata...
\AtEndPreamble
{
	%\let\doctitle\@title
	%\let\docauthor\@author
	%\let\docthanks\@thanks % this is bjorked due to missing macros
	%\let\docdate\@date
}

\providecommand*{\q}[2][]{\blockquote[#1][]{#2}}
	% Short-hand for quotes via `csquotes`
	% TODO: \blockcquote
	% \providencommand can't more than one optional argument...
	%% ref: https://tex.stackexchange.com/a/29975
	%% ref: https://www.overleaf.com/learn/latex/Commands
	%% ref: https://tex.stackexchange.com/questions/321435/newcommand-and-renewcommand-difficulty-in-class-file
	%% ref: https://stackoverflow.com/questions/1812214/latex-optional-arguments
	%% ref: https://tex.stackexchange.com/a/1057
	

\RequirePackage[%
	%% docs: http://mirrors.ctan.org/macros/latex/required/tools/xspace.pdf
		]{xspace}
\AtBeginDocument{%
	\hologoSetup{%
		break=false
			}
		}

\RequirePackage[%
	%% docs: http://mirrors.ctan.org/macros/latex/contrib/layouts/layman.pdf
		]{layouts}
\providecommand{\drawlayouts}	{%
	\drawdimensionstrue
	\printinunitsof{in}
	\pagediagram   % draws diagram with all layout vernacular identified (except bottom margin)
	\pagevalues
	\currentpage
		}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%

\setcounter{secnumdepth}{3} % '3' is default, and numbers to subsubsections not paragraphs
\setcounter{tocdepth}{2} % number to subsection, not subsubsection
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\bool_if:nTF \gW@videolecture{
	\providecommand*{\theorembreak}{\usebeamertemplate{theorem end}\framebreak\usebeamertemplate{theorem begin}}
}{}%\gW@videolecture

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\let\IfPackageLoaded\@ifpackageloaded

\NewDocumentCommand \gWmathssetup { m } {
	\keys_set:nn { gWmaths } { #1 }
}

\ExplSyntaxOff

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\providecommand{\map}[1]{\xrightarrow{#1}}

\providecommand{\bc}{\mathbb C}
\providecommand{\bF}{\mathbb F}
\providecommand{\bH}{\mathbb H}
\providecommand{\bn}{\mathbb N}
\providecommand{\bz}{\mathbb Z}
\providecommand{\bp}{\mathbb{P}}
\providecommand{\bq}{\mathbb Q}
\providecommand{\br}{\mathbb R}

\providecommand{\zbar}{\overline{\mathbb{Z}}}
\providecommand{\qbar}{\overline{\mathbb{Q}}}

\providecommand{\la}{\langle}
\providecommand{\ra}{\rangle}
\providecommand{\lra}{\longrightarrow}
\providecommand{\hra}{\hookrightarrow}
\providecommand{\bs}{\backslash}

\providecommand{\al}{\alpha}
\providecommand{\be}{\beta}

\DeclareMathOperator{\Aut}{Aut}
\DeclareMathOperator{\Aff}{Aff}
\DeclareMathOperator{\End}{End}
\DeclareMathOperator{\Hom}{Hom}
\DeclareMathOperator{\im}{im}


\providecommand{\blankpage}	{%
      \clearpage%
      \thispagestyle{empty}%
      \addtocounter{page}{-1}%
      \null%
      \clearpage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newtheorem{Pf}{Proof}

\newtheorem{Thm}{Theorem}
\newtheorem{Prop}[Thm]{Proposition}
\newtheorem{Lem}[Thm]{Lemma}
\newtheorem{Cor}[Thm]{Corollary}

\theoremstyle{definition}
\newtheorem{Def}[Thm]{Definition}

\theoremstyle{remark}
\newtheorem{Rem}[Thm]{Remark}
\newtheorem{Ex}[Thm]{Example}

\theoremstyle{definition}
\newtheorem{Exercise}{Exercise}

\newenvironment{Solution}{\noindent{\it Solution.}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 %% git update-index --assume-unchanged from https://stackoverflow.com/a/10755704
 %% BUT WAIT: https://stackoverflow.com/a/13631525

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifx\filename\jobname%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\tagpdfsetup{}
\hypersetup{
	colorlinks=true,
	linkcolor=blue,
	filecolor=magenta,
	urlcolor=cyan,
		}%\hypersetup
\urlstyle{
	%same, % Use the 'same' style as surrounding text, default is monospace font
		}%\urlstyle
\bookmarksetup{}
\geometry{}
\graphicspath{}

\GetFileInfo{\CurrentFile}
\title{\fileinfo}
\date{\filedate}

\begin{document}

\end{document}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\fi%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
