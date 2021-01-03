\ProvidesClass{gWmaths}[COVID19 Quarantine Accessible TeX Project] 
\NeedsTeXFormat{LaTeX2e} 

%!TEX program = pdflatexmk
%!TEX encoding = UTF-8
%!TEX spellcheck = en-US
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% % !TeX root = class.tex
%%% % ! /// BiB program = bibtex (or biber)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Developed for Diana Pell by John Pell
%% 
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


\RequirePackage[
	%% docs: http://ctan.mirrors.hoobly.com/macros/latex/base/ifthen.pdf
		]{ifthen}
\RequirePackage[
	%% docs: https://mirror.las.iastate.edu/tex-archive/macros/generic/iftex/iftex.pdf
		]{iftex}

\ifPDFTeX
	\RequirePackage[utf8]{inputenc} 
	% When using older backends, this tells the backend to read all files as UTF-8.
	% XeTeX and LuaTeX always read UTF-8 and ignore this package. 
	% LaTeX circa 2018 and newer default to UTF-8 as well. 
\fi

%% ref: https://www.overleaf.com/learn/latex/Writing_your_own_class
%% ref: https://www.latex-project.org/help/documentation/clsguide.pdf
\DeclareOption{accessibility}{\OptionNotUsed}
\DeclareOption{axessibility}{\OptionNotUsed}
% We start by inheriting from the regular "Article" class:
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}


\ifTUTeX % matches LuaTeX or XeTeX
	\RequirePackage{fontspec} % Modern font handling.
	\defaultfontfeatures{Ligatures=TeX} % Make ASCII nicer
	%\usepackage{unicode-math} % Use unicode symbols
\else % pdfTeX or older
	\pdfminorversion=6 %fucking hack for `accessibility`

	\RequirePackage{mmap}
	% `mmap` is `cmap` plus some math-specifics. 
	% `cmap` extends default character mapping to include unicode codepoints.
	% something about ASCII or Unicode fonts: ...Package[noTeX]{mmap}

	\RequirePackage[T1]{fontenc}
	% `fontenc` specifies which font format to import.
	% T1 fonts extend the old OT1 format to allow greater than 128 characters
\fi







% These packages are either required for some of our features, or are just really nice to have set up:
\RequirePackage[ % `fancyhdr` may have issues with `accessibility`
	%% docs: http://mirrors.ibiblio.org/CTAN/macros/latex/contrib/fancyhdr/fancyhdr.pdf
		]{fancyhdr}
\RequirePackage[ % `paralist` redefines {itemize}, {enumerate} environments
	%% docs: http://ctan.math.washington.edu/tex-archive/macros/latex/contrib/paralist/paralist.pdf
		]{paralist}
%\RequirePackage[ % `enumitem` redefines {itemize}, {enumerate} environments
	% `enumitem` is substantially more complex than `paralist`
	%% docs: http://ctan.mirrors.hoobly.com/macros/latex/contrib/enumitem/enumitem.pdf
	%shortlabels, % compatible with `enumerate`
	%unboxed % avoid problems nesting environments
		%]{enumitem}
\RequirePackage[
	%% docs: http://ctan.mirrors.hoobly.com/macros/latex/required/amsmath/amsldoc.pdf
		]{amsfonts, amssymb, amsmath}
\RequirePackage[
	%% docs: http://ctan.math.utah.edu/ctan/tex-archive/macros/latex/required/graphics/grfguide.pdf
		]{graphicx}
\RequirePackage[ % `xcolor` defines color names for any driver
	%% docs: https://mirror.las.iastate.edu/tex-archive/macros/latex/contrib/xcolor/xcolor.pdf
	hyperref, 
	dvipsnames, 
	svgnames, 
	table
		]{xcolor}
%\RequirePackage[ % `pdfpages` improves inserting PDF clippings over graphicx
	%% docs: http://mirrors.ibiblio.org/CTAN/macros/latex/contrib/pdfpages/pdfpages.pdf
		%]{pdfpages}

\RequirePackage[ % `babel` allows for i18n, and l10n 
	%% docs: http://ctan.math.utah.edu/ctan/tex-archive/macros/latex/required/babel/base/babel.pdf
	% babel cannot set the pdf-lang option for hyperref
	english % The language can be tagged on the \documentclass declaration!
		]{babel}


\RequirePackage[ % improves theorem-like environments, conflicts with `amsthm`, must load *after* `babel`
	%% docs: http://ctan.math.washington.edu/tex-archive/macros/latex/contrib/ntheorem/ntheorem.pdf
	hyperref,
	amsmath,
	thmmarks,
	thref,
	standard % load predefined environments
		]{ntheorem}





\ifPDFTeX % not XeTeX nor LuaTeX
	% This package is the magic that associates, structures, and tags the TeX sources to show up in the PDF:
	\RequirePackage[tagged]{accessibility}
\fi
%\RequirePackage{axessibility}



\RequirePackage[ % `hyperref` claims to be about hypertext, but it's actually a significant structural support!
	%% docs: https://mirrors.concertpass.com/tex-archive/macros/latex/contrib/hyperref/doc/manual.html
	pdfencoding=auto,
	pdflang={en-US},
	linktoc=all,
	colorlinks,
	linktoc=all,
	pdfusetitle,
	pdfdisplaydoctitle
	%% NOTE: https://tex.stackexchange.com/q/1863
		]{hyperref}
%%also: https://mirrors.concertpass.com/tex-archive/macros/latex/contrib/hyperref/doc/manual.html#x1-520009


\RequirePackage[ % `pdfcomment` requires `hyperref` to be loaded first
	%% docs: https://mirror.las.iastate.edu/tex-archive/macros/latex/contrib/pdfcomment/doc/pdfcomment.pdf
	linewidth = 1 % TODO: what is `linewidth` for?
		]{pdfcomment} % requires `hyperref` to load first
\RequirePackage{geometry} 



%\HyperSetup






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



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Begin user defined commands

\newcommand{\map}[1]{\xrightarrow{#1}}

\newcommand{\bc}{\mathbb C}
\newcommand{\bF}{\mathbb F}
\newcommand{\bH}{\mathbb H}
\newcommand{\bn}{\mathbb N}
\newcommand{\bz}{\mathbb Z}
\newcommand{\bp}{\mathbb{P}}
\newcommand{\bq}{\mathbb Q}
\newcommand{\br}{\mathbb R}


\newcommand{\zbar}{\overline{\mathbb{Z}}}
\newcommand{\qbar}{\overline{\mathbb{Q}}}

\newcommand{\la}{\langle}
\newcommand{\ra}{\rangle}
\newcommand{\lra}{\longrightarrow}
\newcommand{\hra}{\hookrightarrow}
\newcommand{\bs}{\backslash}

\newcommand{\al}{\alpha}
\newcommand{\be}{\beta}

\DeclareMathOperator{\Aut}{Aut}
\DeclareMathOperator{\Aff}{Aff}
\DeclareMathOperator{\End}{End}
\DeclareMathOperator{\Hom}{Hom}
\DeclareMathOperator{\im}{im}

%\renewcommand{\labelenumi}{(\alphaph{enumi})}

\def\blankpage{%
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




