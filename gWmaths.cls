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
	%% docs: http://mirrors.ctan.org/macros/latex/base/ifthen.pdf
		]{ifthen}
\RequirePackage[
	%% docs: http://mirrors.ctan.org/macros/generic/iftex/iftex.pdf
		]{iftex}

\ifPDFTeX
	\RequirePackage[utf8]{inputenc}[2015/01/01]
	% When using older engines, this tells the engine to read all files as UTF-8.
	% XeTeX and LuaTeX always read UTF-8 and ignore this package. 
	% LaTeX circa 2018 and newer default to UTF-8 as well. 
\fi

%% ref: https://www.overleaf.com/learn/latex/Writing_your_own_class
%% ref: https://www.latex-project.org/help/documentation/clsguide.pdf
\DeclareOption{accessibility}{\OptionNotUsed}
\DeclareOption{axessibility}{\OptionNotUsed}

\DeclareOption{course}{\OptionNotUsed} % root document
\DeclareOption{syllabus}{\OptionNotUsed} %
\DeclareOption{exam}{\OptionNotUsed} % 
\DeclareOption{quiz}{\OptionNotUsed} % 
\DeclareOption{lecture}{\OptionNotUsed} % Notes for lecturer / overhead
\DeclareOption{videolecture}{\OptionNotUsed} % Adaptation for use with Show Me
\DeclareOption{handout}{\OptionNotUsed} % Passed out to students during lecture

\newif\ifgW@myoption% create a flag for this option
\DeclareOption{someoption}{\ifgW@myoptiontrue}% if the option is set, then raise the flag

% We start by inheriting from the regular "Article" class:
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\ifgW@myoption % if the flag is set, then do some thing
   code active only for this option
\fi


\ifTUTeX % matches LuaTeX and/or XeTeX
	\RequirePackage[
		%% docs: http://mirrors.ctan.org/macros/unicodetex/latex/fontspec/fontspec.pdf
		]{fontspec} % Modern font handling.
	\defaultfontfeatures{Ligatures=TeX} % Make ASCII nicer
	%\usepackage{unicode-math} % Use unicode symbols
	
	%% Post-2017, don't use EU1/EU2 font encoding (nor T1, nor TS1, nor OT1) 
	%% Post-2017, don't use xunicode package
	%% Post-2017, default `tuenc` package uses TU font encoding, full unicode.
\else % pdfTeX or older
	\pdfminorversion=6 %fucking hack for `accessibility`

	\RequirePackage[noTeX]{mmap}
	% `mmap` is `cmap` plus some math-specifics. 
	% `cmap` extends default character mapping to include unicode codepoints.
	% something about ASCII or Unicode fonts: ...Package[noTeX]{mmap}

	\RequirePackage[T1]{fontenc}
	% `fontenc` specifies which font format to import.
	% T1 fonts extend the old OT1 format to allow greater than 128 characters
\fi


\RequirePackage{tagpdf} % official work-in-progress package for future integrated tagging

%\RequirePackage[
	%% docs: http://mirrors.ctan.org/macros/latex/contrib/standalone/standalone.pdf
%	subpreambles=false % do not automatically collect preambles
%		]{standalone}
%\documentclass[class=gWmaths,crop=false]{standalone}
%\standaloneconfig

%\RequirePackage[
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
\RequirePackage[ % `fancyhdr` may have issues with `accessibility`
	%% docs: http://mirrors.ctan.org/macros/latex/contrib/fancyhdr/fancyhdr.pdf
		]{fancyhdr}
\RequirePackage[ % `paralist` redefines {itemize}, {enumerate} environments
	%% docs: http://mirrors.ctan.org/macros/latex/contrib/paralist/paralist.pdf
		]{paralist}
%\RequirePackage[ % `enumitem` redefines {itemize}, {enumerate} environments
	% `enumitem` is substantially more complex than `paralist`
	%% docs: http://mirrors.ctan.org/macros/latex/contrib/enumitem/enumitem.pdf
	%shortlabels, % compatible with `enumerate`
	%unboxed % avoid problems nesting environments
		%]{enumitem}
\RequirePackage[
	%% docs: http://mirrors.ctan.org/macros/latex/required/amsmath/amsldoc.pdf
		]{amsfonts, amssymb, amsmath}
\RequirePackage[
	%% docs: http://mirrors.ctan.org/macros/latex/required/graphics/grfguide.pdf
		]{graphicx}
\RequirePackage[ % `xcolor` defines color names for any driver
	%% docs: http://mirrors.ctan.org/macros/latex/contrib/xcolor/xcolor.pdf
	hyperref, 
	dvipsnames, 
	svgnames, 
	table
		]{xcolor}
%\RequirePackage[ % `pdfpages` improves inserting PDF clippings over graphicx
	%% docs: http://mirrors.ctan.org/macros/latex/contrib/pdfpages/pdfpages.pdf
		%]{pdfpages}

\RequirePackage[ % `babel` allows for i18n, and l10n 
	%% docs: http://mirrors.ctan.org/macros/latex/required/babel/base/babel.pdf
	% babel cannot set the pdf-lang option for hyperref
	english % The language can be tagged on the \documentclass declaration!
		]{babel}

\RequirePackage[
	%% docs: http://mirrors.ctan.org/macros/latex/contrib/phonenumbers/doc/phonenumbers-en.pdf
	country=US, % switch default from DE to US.
	foreign=international, % Use sensible defaults for full ITU numbers.
	home-country=none, % Do not strip the country code (default).
	home-area-code=none, % Do *not* strip area code, ever (default).
	link=on % clickable tel: link (default).
		]{phonenumbers}

\RequirePackage[ % improves theorem-like environments, conflicts with `amsthm`, must load *after* `babel`
	%% docs: http://mirrors.ctan.org/macros/latex/contrib/ntheorem/ntheorem.pdf
	hyperref,
	amsmath,
	thmmarks,
	thref,
	standard % load predefined environments
		]{ntheorem}

\RequirePackage[
	%% docs: http://mirrors.ctan.org/macros/latex/contrib/csquotes/csquotes.pdf
	autostyle=try, % use `babel` if available
	%autopunct % look ahead for trailing punctuation to move inside marks
		]{csquotes}

%define new \listofXs
%% docs: http://mirrors.ctan.org/macros/latex/contrib/tocloft/tocloft.pdf


\ifPDFTeX % not XeTeX nor LuaTeX
	% This package is the magic that associates, structures, and tags the TeX sources to show up in the PDF:
	%\RequirePDFTEX
	\RequirePackage[tagged]{accessibility}
\fi

\RequirePackage[
	%% docs: http://mirrors.ctan.org/macros/latex/contrib/axessibility/axessibility.pdf
		]{axessibility}


\RequirePackage[ % required *before* `hyperref`
	%% docs: http://mirrors.ctan.org/macros/latex/contrib/hyperxmp/hyperxmp.pdf
		]{hyperxmp} 
\RequirePackage[ % `hyperref` claims to be about hypertext, but it's actually a significant structural support!
	%% docs: http://mirrors.ctan.org/macros/latex/contrib/hyperref/doc/manual.pdf
	colorlinks, % set hyperlinks in color
	hyperindex=false, % do *not* link page numbers from index...conflict w/ hypdoc...
	linktoc=all, % link section name *and* page number from toc
	pdfencoding=auto, % use unicode or WTFncode in PDF tags
	pdfusetitle, % use \title{} for PDF metadata
	pdfdisplaydoctitle, % set PDF display \title{} in UI title bar
	pdfpagelabels, % tag pages with page numbers from \LaTeX ("ii" or whatever) 
	keeppdfinfo % `hyperxmp` strips Author and Keywords by default; don't do that.
	%% NOTE: https://tex.stackexchange.com/q/1863
		]{hyperref}
%%also: http://mirrors.ctan.org/macros/latex/contrib/hyperref/doc/manual.html#x1-520009

\RequirePackage[
	%% docs: http://mirrors.ctan.org/macros/latex/contrib/oberdiek/hypdoc.pdf
		]{hypdoc} % hypdoc

\RequirePackage[ % `pdfcomment` requires `hyperref` to be loaded first
	%% docs: http://mirrors.ctan.org/macros/latex/contrib/pdfcomment/doc/pdfcomment.pdf
	linewidth = 1 % TODO: what is `linewidth` for?
		]{pdfcomment} % requires `hyperref` to load first
\RequirePackage{geometry} 

%\RequirePackage[
	%% docs: http://mirrors.ctan.org/macros/latex/contrib/currfile/currfile.pdf
		%]{currfile} %\currfilename

\ifLuaTeX
	%\RequirePackage{pdftexcmds}
\fi

\RequirePackage[
	%% docs: http://mirrors.ctan.org/macros/latex/contrib/filemod/filemod.pdf
		]{filemod}


%http://mirrors.ctan.org/macros/latex/base/ltfilehook-doc.pdf
\GetFileInfo{\CurrentFile}
\AtEndOfClass{
	\GetFileInfo{\jobname.tex} % read \ProvidesFile{}[] from the ultimate TeX
	%\listfiles % track loaded files in this job
	%\@getclass
	\date{\filemodprintdate{\jobname.tex}}
		}

%\RequirePackage{fixltx2e}[2015/01/01]

\hypersetup{
	pdfsubject={\fileinfo}, % this takes the name/description of the *class*...
	%pdflang={en-US}, % `hyperxmp` will ask `babel` for the language code!
	hyperindex % turn this shit back on, JFC.
		}

\AtBeginDocument{
	\listfiles % track loaded files in this job
	%\date{omg}
	\hypersetup{
		%pdfdate={\pdffilemoddate{\jobname.tex}}, % 2020 or 2020-01 or 2020-01-04
		pdfcreationdate={\pdffilemoddate{\jobname.tex}},
		pdfrendition=default, %screen,
		%pdfsubject={},
		%pdfsubtitle={},
		%pdfurl={}, % full path to *this* PDF
		pdfinfo={
			%CreationDate={\pdffilemoddate{\jobname.tex}}
				},
		%pdfsource={\jobname.tex} % default
		pdfuapart=1 % that's the whole point, but we're lacking...
			}
		}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{
	\makeatletter
	\let\thetitle\@title
	\let\theauthor\@author
	\let\thethanks\@thanks
	\let\thedate\@date
	\makeatother
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




