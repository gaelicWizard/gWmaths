\ProvidesClass{gWmaths}[2020/01/04 v0.2.3 %
	COVID19 Quarantine Accessible TeX Project] 
\NeedsTeXFormat{LaTeX2e}[2018/03/24] %  2020/10/01
%!TEX program = pdflatexmk
%!TEX encoding = UTF-8
%!TEX spellcheck = en-US
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Developed for Diana Pell by John Pell
%% 
%%% % !TeX root = class.tex
%%% % ! /// BiB program = bibtex (or biber)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage% load early b/c we needs it
	{iftex}% http://mirrors.ctan.org/macros/generic/iftex/iftex.pdf

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\PassOptionsToPackage{% `scrbase`
	internalonly % don't define macros to conflict with `iftex`
		}{scrbase} % KOMA-Script base package

\PassOptionsToPackage{% `xcolor`
	xcdraw, % use PS/PDF commands to draw frames and boxes, in dvips, pdftex, dvipdfm
	fixinclude, % prevents dvips from explicitly resetting current color to black before actually inserting an .eps file
	%fixpdftex % Load the `pdfcolmk` package; useless stub
	dvipsnames, % Load a set of predefined colors.
	svgnames, % Load a set of predefined colors according to SVG 1.1.
	x11names*, % Load a set of predefined colors according to Unix/X11, delayed.
	table, % Load the `colortbl` package
	hyperref % Support the hyperref package in terms of color expressions by defining additional keys
		}{xcolor}

\PassOptionsToPackage{% `inputenc`
	utf8 % UTF-8
		}{inputenc}

\PassOptionsToPackage{% `mmap`
	noTeX % use unicode codepoints, not TeX names
		}{mmap}

\PassOptionsToPackage{% `fontenc`
	T1 % use font format from this century
		}{fontenc}

\PassOptionsToPackage{% `ntheorem`
	hyperref, % cope with `hyperref`
	amsmath, % cope with `amsmath`
	thmmarks, % enables the automatical placement of endmarks
	thref, % enables the extended reference features
	standard % load predefined environments
		}{ntheorem}

\PassOptionsToClass{% `beamer`
	%noamsthm
	t
		}{beamer}

\PassOptionsToPackage{% `empheq`
	ntheorem % cope with `ntheorem`
		}{empheq}

\PassOptionsToPackage{% `csquotes`
	autostyle=try, % use `babel` if available
	%autopunct % look ahead for trailing punctuation to move inside marks
		}{csquotes}

\PassOptionsToPackage{% `phonenumbers`
	country=US, % switch defaults from DE to US.
	foreign=international, % Use sensible defaults for full ITU numbers.
	home-country=none, % Do not strip the country code (default).
	home-area-code=none, % Do *not* strip area code, ever (default).
	link=on % clickable tel: link (default).
		}{phonenumbers}

\PassOptionsToPackage{% `hyperref`
	colorlinks, % set hyperlinks in color
	hyperindex=false, % do *not* link page numbers from index...conflict w/ hypdoc...
	linktoc=all, % link section name *and* page number from toc
	%pdfencoding=auto, % use unicode or WTFncode in PDF tags
	pdfusetitle, % use \title{} for PDF metadata
	pdfdisplaydoctitle, % set PDF display \title{} in UI title bar
	pdfpagelabels, % tag pages with page numbers from \LaTeX ("ii" or whatever) 
	keeppdfinfo % `hyperxmp` strips Author and Keywords by default; don't do that.
		}{hyperref}

\PassOptionsToPackage{% `babel`
	english % The language can be tagged on the \documentclass declaration!
		}{babel}

\PassOptionsToPackage{%
	%heightrounded % round off to avoid overfull alrgn;earujs
		}{geometry} 


%\PassOptionsToPackage{%
%\PassOptionsToPackage{%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

\ifeTeX\else
	\RequireeTeX% LaTeX requires eTeX now
\fi

\ifpdf
	\pdfminorversion=6 %fucking hack for `accessibility`
\fi

\ifTUTeX\else
	\RequirePackage[utf8]{inputenc}[2015/01/01]
	% When using older engines, this tells the engine to read all files as UTF-8.
	% XeTeX and LuaTeX always read UTF-8 and ignore this package. 
	% LaTeX circa 2018 and newer default to UTF-8 as well. 
\fi

\RequirePackage% required *before* `hyperref`
	{hyperxmp} % http://mirrors.ctan.org/macros/latex/contrib/hyperxmp/hyperxmp.pdf


%% ref: https://www.overleaf.com/learn/latex/Writing_your_own_class
%% ref: https://www.latex-project.org/help/documentation/clsguide.pdf
\DeclareOption{accessibility}{\OptionNotUsed}
\DeclareOption{axessibility}{\OptionNotUsed}

\DeclareOption{course}{\OptionNotUsed} % root document
\DeclareOption{syllabus}{\OptionNotUsed} %
\DeclareOption{exam}{\OptionNotUsed} % 
\DeclareOption{quiz}{\OptionNotUsed} % 
\DeclareOption{lecture}{\OptionNotUsed} % Notes for lecturer / overhead
%\DeclareOption{videolecture}{\OptionNotUsed} % Adaptation for use with Show Me
\DeclareOption{handout}{\OptionNotUsed} % Passed out to students during lecture

\newif\ifgW@videolecture% create a flag for this option
\DeclareOption{videolecture}{\gW@videolecturetrue}% if the option is set, then raise the flag

%declare option for setting margin to 1"
\newif\ifgW@oneinch% create a flag for this option
\DeclareOption{1in}{\gW@oneinchtrue}% if the option is set, then raise the flag


\newif\ifgW@myoption% create a flag for this option
\DeclareOption{someoption}{\gW@myoptiontrue}% if the option is set, then raise the flag


%\gW@videolecturetrue

\ifgW@videolecture
	\providecommand\gWclassToLoad{beamer}
	%\usetheme{Madrid}
\else % Inherit from LaTeX `Article` class
	\providecommand\gWclassToLoad{article}
	%\RequirePackage{beamerarticle}
\fi

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\gWclassToLoad}}
\ProcessOptions\relax

\RequirePackage%
	{amsfonts, % http://mirrors.ctan.org/fonts/amsfonts/doc/amsfndoc.pdf
	amssymb} % http://mirrors.ctan.org/fonts/amsfonts/doc/amssymb.pdf
\RequirePackage%
	{amsmath} % http://mirrors.ctan.org/macros/latex/required/amsmath/amsldoc.pdf
%http://mirrors.ctan.org/macros/latex/contrib/mathtools/mathtools.pdf
%don't use: http://mirrors.ctan.org/macros/latex/required/amscls/doc/amsthdoc.pdf
\ifgW@videolecture\else
	\RequirePackage% improves theorem-like environments, conflicts with `amsthm`, must load *after* `babel` and *after* amsmath and *after* mathtools/empheq
		{ntheorem} % http://mirrors.ctan.org/macros/latex/contrib/ntheorem/ntheorem.pdf 
			%https://tex.stackexchange.com/a/5633
\fi

\LoadClass{\gWclassToLoad}



\ifgW@oneinch % if the flag is set, then do some thing
	\AtEndOfClass{
		\geometry{
			%letterpaper, % screen % try to get this to auto-detect or something so \documentclass[a4paper,landscape]{gWmaths} works
			margin=1in
				}
			}
\fi

\ifgW@myoption % if the flag is set, then do some thing
   code active only for this option
\fi

\ifXeTeX
	%% docs: http://mirrors.ctan.org/info/xetexref/xetex-reference.pdf
\fi

\ifPDFTeX
\ifgW@videolecture\else
	\RequirePackage%
		{mmap} %https://ctan.org/pkg/mmap
	% `mmap` is `cmap` plus some math-specifics. 
	% `cmap` extends default character mapping to include unicode codepoints.
	% something about ASCII or Unicode fonts: ...Package[noTeX]{mmap}
\fi\fi

\ifTUTeX % "Unicode TeX" matches LuaTeX and/or XeTeX
	\RequirePackage% must load *after* maths fonts (specifically euler)
		{fontspec} % http://mirrors.ctan.org/macros/unicodetex/latex/fontspec/fontspec.pdf
	\defaultfontfeatures{Ligatures=TeX} % Make ASCII nicer
	
	%% Post-2017, don't use EU1/EU2 font encoding (nor T1, nor TS1, nor OT1) 
	%% Post-2017, don't use xunicode package
	%% Post-2017, default `tuenc` package uses TU font encoding, full unicode.
\else % pdfTeX or older
	\RequirePackage[T1]{fontenc}
	% `fontenc` specifies which font format to import.
	% T1 fonts extend the old OT1 format to allow greater than 128 characters
\fi



%\RequirePackage[%
	%% docs: http://mirrors.ctan.org/macros/latex/contrib/standalone/standalone.pdf
%	subpreambles=false % do not automatically collect preambles
%		]{standalone}
%\documentclass[class=gWmaths,crop=false]{standalone}
%\standaloneconfig

%\RequirePackage[%
	%activeospeccharacters, % don't fuck with < and > 
	%notheorems?
		%]{beamerarticle}
%\documentclass[ignorenonframetext]{beamer}
%\documentclass[trans]{beamer}
%Note: When using \include or \input commands, conversions of modes must be controlled manually. See Section 21.3 for details
%\mode<article>{\usepackage{fullpage}}
%\mode<presentation>{\usetheme{Berlin}}
%\subsection<article>{Article-Only Section}
%\only<article>{\item This particular item is only part of the article version.}
%\item<presentation:only@0> This text is also only part of the article.
%The command \setjobnamebeamerversion{main.beamer} tells the article version where to find the presentation version. This is necessary if you wish to include slides from the presentation version in an article as figures.
%By adjusting the frame template, you can “mimic” the appearance of frames typeset by beamer in your articles.


%https://tex.stackexchange.com/a/5231

%pdflatex --jobname=Cookies %\jobname


% These packages are either required for some of our features, or are just really nice to have set up:
\RequirePackage% `fancyhdr` may have issues with `accessibility`
	{fancyhdr} % http://mirrors.ctan.org/macros/latex/contrib/fancyhdr/fancyhdr.pdf

\ifgW@videolecture\else
	\RequirePackage% `paralist` redefines {itemize}, {enumerate} environments
		{paralist} % http://mirrors.ctan.org/macros/latex/contrib/paralist/paralist.pdf
%\RequirePackage[ % `enumitem` redefines {itemize}, {enumerate} environments
	% `enumitem` is substantially more complex than `paralist`
	%% docs: http://mirrors.ctan.org/macros/latex/contrib/enumitem/enumitem.pdf
	%shortlabels, % compatible with `enumerate`
	%unboxed % avoid problems nesting environments
		%]{enumitem}
\fi



\ifTUTeX % Unicode TeX
	\RequirePackage % Use unicode symbols
		{unicode-math} % http://mirrors.ctan.org/macros/unicodetex/latex/unicode-math/unicode-math.pdf
\fi

\RequirePackage%
	{graphics,graphicx} % http://mirrors.ctan.org/macros/latex/required/graphics/grfguide.pdf
\RequirePackage%
	{xcolor} % http://mirrors.ctan.org/macros/latex/contrib/xcolor/xcolor.pdf

%\RequirePackage% `pdfpages` improves inserting PDF clippings over graphicx
	%{pdfpages} % http://mirrors.ctan.org/macros/latex/contrib/pdfpages/pdfpages.pdf

\RequirePackage% `babel` allows for i18n, and l10n 
	% babel cannot set the pdf-lang option for hyperref, but it can through hyperxmp!
	{babel} % http://mirrors.ctan.org/macros/latex/required/babel/base/babel.pdf

\RequirePackage% pretty printing and formatting
	{phonenumbers} % http://mirrors.ctan.org/macros/latex/contrib/phonenumbers/doc/phonenumbers-en.pdf

\RequirePackage% quotes, block quotes, citations
	{csquotes} % http://mirrors.ctan.org/macros/latex/contrib/csquotes/csquotes.pdf

\ifgW@videolecture\else
	\RequirePackage% un-dumb \maketitle
		{titling} % http://mirrors.ctan.org/macros/latex/contrib/titling/titling.pdf
\fi

%define new \listofXs
%% docs: http://mirrors.ctan.org/macros/latex/contrib/tocloft/tocloft.pdf

\ifPDFTeX % not XeTeX nor LuaTeX
	% This package is the magic that associates, structures, and tags the TeX sources to show up in the PDF:
	%\RequirePDFTEX
	\ifgW@videolecture\else
		\RequirePackage[tagged]{accessibility}
	\fi
\fi

\ifXeTeX\else% seems like XeTeX is actually kind of a hack and maybe not much future...
	\RequirePackage[
		%% docs: 
			]{tagpdf} % official work-in-progress package for future integrated tagging
	\RequirePackage[%
		%% docs: http://mirrors.ctan.org/macros/latex/contrib/axessibility/axessibility.pdf
			]{axessibility}
\fi

%http://mirrors.ctan.org/macros/latex/contrib/titlesec/titlesec.pdf % too complex

\RequirePackage% `hyperref` claims to be about hypertext, but it's actually a significant structural support!
	%% NOTE: https://tex.stackexchange.com/q/1863
	{hyperref} % http://mirrors.ctan.org/macros/latex/contrib/hyperref/doc/manual.pdf
%%also: http://mirrors.ctan.org/macros/latex/contrib/hyperref/doc/manual.html#x1-520009

\ifgW@videolecture\else
	\RequirePackage%
		{hypdoc} % http://mirrors.ctan.org/macros/latex/contrib/oberdiek/hypdoc.pdf
\fi

\RequirePackage[ % `pdfcomment` requires `hyperref` to be loaded first
	%% docs: http://mirrors.ctan.org/macros/latex/contrib/pdfcomment/doc/pdfcomment.pdf
	%linewidth = 1 % TODO: what is `linewidth` for?
		]{pdfcomment} % http://mirrors.ctan.org/macros/latex/contrib/pdfcomment/doc/pdfcomment.pdf
\RequirePackage%
	{geometry} % http://mirrors.ctan.org/macros/latex/contrib/geometry/geometry.pdf

%hack for some releases of TeX Live which disable auto-detection
\ifXeTeX\geometry{xetex}\fi% 
\ifLuaTeX\geometry{luatex}\fi% 

%\RequirePackage% \currfilename
	%{currfile} % http://mirrors.ctan.org/macros/latex/contrib/currfile/currfile.pdf

\ifLuaTeX
	%\RequirePackage{pdftexcmds}
\fi

\RequirePackage%
	{filemod} % http://mirrors.ctan.org/macros/latex/contrib/filemod/filemod.pdf



%\RequirePackage%
	%{ifthen} % http://mirrors.ctan.org/macros/latex/base/ifthen.pdf




\@ifundefined{GetFileInfo}{}{% https://tex.stackexchange.com/a/30486
	%http://mirrors.ctan.org/macros/latex/base/ltfilehook-doc.pdf
	\GetFileInfo{\CurrentFile}
	\hypersetup{
		pdfsubject={\fileinfo}, % this takes the name/description of the *class*...
			}

	\AtEndOfClass{%
		\GetFileInfo{\jobname.tex} % read \ProvidesFile{}[] from the ultimate TeX
		%\listfiles % track loaded files in this job
		%\@getclass
		\date{\filemodprintdate{\jobname.tex}}
			}
		}% \GetFileInfo

%\RequirePackage{fixltx2e}[2015/01/01]

\hypersetup{%
	%pdflang={en-US}, % `hyperxmp` will ask `babel` for the language code!
	hyperindex % turn this shit back on, JFC.
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\AtBeginDocument{%
%	\makeatletter
%	\let\thetitle\@title
%	\let\theauthor\@author
%	\let\thethanks\@thanks
%	\let\thedate\@date
%	\makeatother
%		}



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
\RequirePackage[%
	%% docs: http://mirrors.ctan.org/macros/latex/contrib/hologo/hologo.pdf
		]{hologo}
\AtBeginDocument{%
	\hologoSetup{%
		break=false
			}
		}

\providecommand	{\tex}		{\hologo{TeX}\xspace}
\providecommand	{\etex}	{\hologo{eTeX}\xspace}
\providecommand	{\xetex}	{\hologo{XeTeX}\xspace}
\providecommand	{\pdftex}	{\hologo{pdfTeX}\xspace}
\providecommand	{\luatex}	{\hologo{LuaTeX}\xspace}
%\providecommand	{\latex}	{\hologo{LaTeX}\xspace}
\providecommand	{\latex}	{\hologo{LaTeX2e}\xspace}
%\providecommand{\latex2e}	{\hologo{LaTeX2e}\xspace}
%\providecommand{\latex3}		{\hologo{LaTeX3}\xspace}

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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parts, Chapters, Sections, Subsections, Subsubsections, Paragraphs, Subparagraphs
%%
% https://www.overleaf.com/learn/latex/sections_and_chapters
% https://en.wikibooks.org/wiki/LaTeX/Document_Structure#Sectioning_commands
%%

% Set our header depth to maximum 3:
\setcounter{secnumdepth}{3} % '3' is default, and numbers to subsubsections not paragraphs
\setcounter{tocdepth}{2} % number to subsection, not subsubsection
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\ifgW@videolecture
	\providecommand*{\theorembreak}{\usebeamertemplate{theorem end}\framebreak\usebeamertemplate{theorem begin}}
\fi



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Begin user defined commands

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

%\renewcommand{\labelenumi}{(\alphaph{enumi})}

\providecommand{\blankpage}	{%
      \clearpage%
      \thispagestyle{empty}%
      \addtocounter{page}{-1}%
      \null%
      \clearpage}

%  End user defined commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% These establish different environments for stating Theorems, Lemmas, Remarks, etc.

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


% End environments 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%












%\begin{filecontents*}{latexmkrc}
%\end{filecontents}



