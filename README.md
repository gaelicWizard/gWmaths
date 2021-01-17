\NeedsTeXFormat{LaTeX2e}[2020/10/01]	\RequirePackage{ iftex, xparse, l3keys2e, }%
%%!TEX root = gWmaths.dtx
%%!TEX encoding = UTF-8
%%
%% During the great pandemic of 2020, \cls{gWmaths} class was created to shorten the common preamble from a set of my wife's \LaTeXe\ lectures, transparencies, slides, and handouts. It was initially \cls{pellmaths} and was just a shortcut for 80 lines of boilerplate at the top of every darn file.
%% With the first week of 2021 declaring "hold my beer", some effort was made to expand and improve. The class was renamed to \cls{gWmaths.cls}, partially split out to a \pkg{gWmaths.sty} package, and updated to \LaTeX3. Meanwhile, the source transformed to require build via \pkg{docstrip} and was brought under version control. \cs{tehMacro} %\marg{m} \oarg{p} \parg{picture mode argument}. \file{\jobname} / \env{\jobname} / \pkg{\jobname} / \cls{\jobname}. \NB{tehNote}{some notes}
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ProvidesExplFile%
 	{gWmaths}	{2021/01/14}	{0.3.0}%
 		{COVID-19 Quarantine Accessible TeX Project}
\RequirePackage{ iftex, etoolbox,	}%
