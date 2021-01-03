%!TEX TS-program = pdflatexmk
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pellmaths}[2020 Quarantine Accessible TeX Project]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% These packages are either required for some of our features, or are just really nice to have set up:
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{cmap}
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
\RequirePackage{amsfonts,amssymb,amsmath}
\RequirePackage{ifthen}
\RequirePackage{graphicx}
\RequirePackage{ntheorem}
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\RequirePackage{pdfpages}

\RequirePackage[tagged]{accessibility}

%\usepackage{axessibility} % superseded?



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




