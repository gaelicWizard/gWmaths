%!TEX TS-program = pdflatexmk
\NeedsTeXFormat{LaTeX2e} 
\ProvidesClass{gWmaths}[COVID-19 Quarantine Accessible TeX Project] 

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

%\RequirePackage{mmap}
% `mmap` is `cmap` plus some math-specifics. 
% `cmap` extends default character mapping to include unicode codepoints.
% `mmap`/`cmap` must(?) be loaded early / before inputenc and fontenc
% something about ASCII or Unicode fonts: ...Package[noTeX]{mmap}

%\RequirePackage[utf8]{inputenc} 
% When using older backends, this tells the backend to read all files as UTF-8.
% pdfTeX and newer always read UTF-8 and ignore this package. 

%\RequirePackage[T1]{fontenc}
% `fontenc` specifies which font format to import.
% T1 fonts extend the old OT1 format to allow greater than 128 characters

%%TODO switch to fontspec



% We start by inheriting from the regular "Article" class:
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{cmap}

% These packages are either required for some of our features, or are just really nice to have set up:
\RequirePackage[english]{babel}
\RequirePackage[%
	pdflang={en-US},
	linktocpage,
	colorlinks,
	linktoc=all,
	pdfusetitle]{hyperref}
\RequirePackage[linewidth = 1]{pdfcomment}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{paralist}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{amsfonts, amssymb, amsmath}
\RequirePackage{ifthen}
\RequirePackage{graphicx}
\RequirePackage{ntheorem}
\RequirePackage[usenames, dvipsnames, svgnames, table]{xcolor}
\RequirePackage{pdfpages}

%\RequirePackage{lmodern}
% `lmodern` includes a slightly newer set of default font glyphs

% This package is the magic that associates, structures, and tags the TeX sources to show up in the PDF:
\RequirePackage[tagged]{accessibility}

%\usepackage{axessibility} % superseded?


% Set our header depth to maximum 3:
\setcounter{secnumdepth}{3}


\newtheorem{theorem}{Theorem}[section]
\newtheorem{corollary}{Corollary}[theorem]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{exercise}{Exercise}[section]

%\providecommand\phantomsection{} % ??


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




