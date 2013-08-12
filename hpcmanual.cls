%==================================================
%% hpcmanual.cls for manual documentation in HPC center of SJTU
%% Encoding: UTF-8
%% ==================================================

% Production of a PDF requires that a LaTeX engine be installed (see --latex-engine, below), and assumes that the following LaTeX packages are available: amssymb, amsmath, ifxetex, ifluatex, listings (if the --listings option is used), fancyvrb, longtable, url, graphicx, hyperref, ulem, xltxtra and xunicode (if xelatex is used).
% Check pandoc -D latex for more advice

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{hpcmanual.cls}[2013/07/06 v0.1 hpcmanual document class]
\newif\ifhpc@typeinfo \hpc@typeinfotrue
\DeclareOption{notypeinfo}{\hpc@typeinfofalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions
\LoadClass[fancyhdr,fntef,UTF8,adobefonts]{ctexart}[2005/11/25]

%% Import hpcmanual.cfg file
\AtEndOfPackage{\makeatletter\input{hpcmanual.cfg}\makeatother}

%% XeTeX Fonts Specification
\RequirePackage{fontspec}
\setmainfont{TeX Gyre Termes}

%% Page Layout
\oddsidemargin 1.5 true cm
\if@twoside
  \evensidemargin 0 true cm
\else
  \evensidemargin 1.5 true cm
\fi
\textheight 21 true cm
\textwidth 14.5 true cm
\headheight 15pt
\parskip 0.5ex plus 0.25ex minus 0.25ex
\addtolength{\voffset}{-0.5cm}

%% Hyperref
\RequirePackage[setpagesize=false, % page size defined by xetex
            unicode=false, % unicode breaks when used with xetex
            xetex]{hyperref}
\hypersetup{breaklinks=true,
            bookmarks=true,
            % pdfauthor={$author-meta$},
            % pdftitle={$title-meta$},
            colorlinks=true,
            % urlcolor=$if(urlcolor)$$urlcolor$$else$blue$endif$,
            % linkcolor=$if(linkcolor)$$linkcolor$$else$magenta$endif$,
            pdfborder={0 0 0}}
\urlstyle{same}  % don't use monospace font for urls

%% Listings
\RequirePackage{listings}

%% Longtable
\RequirePackage{longtable}

%% End of file hpcmanual.cls
\endinput
