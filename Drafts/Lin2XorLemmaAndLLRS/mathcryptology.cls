%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mathematical Cryptology Journal Article
% LaTeX Class
% Version 1.0 (19/10/2019)
%
% This template was created by:
% Vel (enquiries@latextypesetting.com)
% LaTeXTypesetting.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mathcryptology}[2019/10/19 Mathematical Cryptology Article Class v1.0]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}} % Pass through any options to the base class
\ProcessOptions\relax % Process given options

\LoadClass[twoside]{article} % Load the base class with fixed options (twoside for differentiation between even and odd pages for the header)

%----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES AND MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

\usepackage{graphicx} % Required for including images
\graphicspath{{Figures/}{./}} % Specifies where to look for included images (trailing slash required)

\usepackage{booktabs} % Required for better horizontal rules in tables

\usepackage{changepage} % Required for temporarily indenting text blocks

\usepackage{lastpage} % Required to determine the total number of pages

\usepackage{stfloats} % Required for placing two column figures and tables on the bottom of the page

\usepackage{amsmath, amsfonts, amssymb, amsthm} % For math equations, theorems, symbols, etc
\newtheorem{lemma}{Lemma}
\newtheorem{theorem}{Theorem}
\newtheorem{proposition}{Proposition}
\newtheorem{corollary}{Corollary}
\newtheorem{definition}{Definition}
\newtheorem{remark}{Remark}
\newtheorem{example}{Example}

% Environment to suppress all indentation within it and restore previous indentation after
\newlength\storedparindent
\newenvironment{suppressindent}{%
	\setlength{\storedparindent}{\the\parindent}
	\setlength{\parindent}{0pt}
}{%
	\setlength{\parindent}{\storedparindent}
}

%----------------------------------------------------------------------------------------
%	MARGINS
%----------------------------------------------------------------------------------------

\usepackage[
	a4paper, % Paper size
	top=2.5cm, % Top margin
	bottom=2.5cm, % Bottom margin
	inner=2.5cm, % Inner margin
	outer=2.5cm, % Outer margin
	footskip=1.4cm, % Space from the bottom margin to the baseline of the footer
	headsep=0.8cm, % Space from the top margin to the baseline of the header
	headheight=1cm, % Height of the header
	%showframe % Uncomment to show the frames around the margins for debugging purposes
]{geometry}

%----------------------------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------------------------

\usepackage[utf8]{inputenc} % Required for inputting international characters
\usepackage[T1]{fontenc} % Output font encoding for international characters

\usepackage{newtxtext} % Use a variant of Times as the text typeface and a variant of Helvetica for the sans typeface
\usepackage{newtxmath} % Use a variant of the Times Italic font for math symbols and letters

%----------------------------------------------------------------------------------------
%	HEADERS AND FOOTERS
%----------------------------------------------------------------------------------------

\usepackage{fancyhdr} % Required for customising headers and footers

\pagestyle{fancy} % Use the default style for headers and footers defined in this section

\fancyhf{} % Clear default headers/footers

\fancyhead[CO]{\textit{\articletitle}} % Centre header on odd pages
\fancyhead[CE]{\textit{\citationauthors}} % Centre header on even pages

\fancyfoot[C]{\thepage} % Centre footer on all pages

%------------------------------------------------

% Define the first page headers/footers style
\fancypagestyle{firstpage}{
	\fancyhf{} % Clear default headers/footers
	\fancyhead[C]{\textit{Mathematical Cryptology}, {\textbf{\volume}}(\issue): \startpage--\pageref{LastPage}} % Centre header
	\fancyfoot[C]{\thepage} % Centre footer
}

\thispagestyle{firstpage} % Use the firstpage headers/footers style only on the first page

%----------------------------------------------------------------------------------------
%	SECTIONS
%----------------------------------------------------------------------------------------

\usepackage{titlesec} % Required for modifying sections

\titleformat
	{\section} % Section type being modified
	[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{\Large\sffamily\bfseries} % Format of the whole section
	{\thesection} % Format of the section label
	{5pt} % Space between the title and label
	{\MakeUppercase} % Code before the label
	[] % Code after the label

\titlespacing{\section}{0pt}{\baselineskip}{4pt} % Spacing around section titles, the order is: left, before and after

%------------------------------------------------

\titleformat
	{\subsection} % Section type being modified
	[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{\large\sffamily\bfseries} % Format of the whole section
	{\thesubsection} % Format of the section label
	{5pt} % Space between the title and label
	{\MakeUppercase} % Code before the label
	[] % Code after the label

\titlespacing{\subsection}{0pt}{\baselineskip}{4pt} % Spacing around section titles, the order is: left, before and after

%------------------------------------------------

\titleformat
	{\subsubsection} % Section type being modified
	[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{\sffamily\bfseries} % Format of the whole section
	{\thesubsubsection} % Format of the section label
	{5pt} % Space between the title and label
	{\MakeUppercase} % Code before the label
	[] % Code after the label

\titlespacing{\subsubsection}{0pt}{\baselineskip}{4pt} % Spacing around section titles, the order is: left, before and after

%----------------------------------------------------------------------------------------
%	BIBLIOGRAPHY
%----------------------------------------------------------------------------------------

\usepackage[
	backend=biber, % Use the biber backend (the bibliography needs to be compiled with biber)
	style=numeric, % Numeric citation style (e.g. [1])
	sorting=nyt, % Sort references by author name, year, then title
]{biblatex}

%----------------------------------------------------------------------------------------
%	LISTS
%----------------------------------------------------------------------------------------

\usepackage{enumitem} % Required for list customisation
\setlist{itemsep=0pt, topsep=0pt} % Remove spacing above lists and between list items

%----------------------------------------------------------------------------------------
%	COLOURS
%----------------------------------------------------------------------------------------

\usepackage[usenames, svgnames]{xcolor} % Required for defining and using custom colours

%\definecolor{cyan}{RGB}{0, 255, 255}
%\definecolor{green}{HTML}{00FF00}

%----------------------------------------------------------------------------------------
%	LINKS
%----------------------------------------------------------------------------------------

\usepackage{hyperref} % Required for links

\hypersetup{
	colorlinks=false,
	hidelinks, % Hide the default boxes around links
	%urlcolor=DarkSlateGrey, % Colour for \url and \href links
	%linkcolor=DarkSlateGrey, % Colour for \nameref links
}

%----------------------------------------------------------------------------------------
%	TITLE SECTION STYLING
%----------------------------------------------------------------------------------------

\newcommand*{\aff}[1]{\textsuperscript{#1}} % Style affiliations

% To output the article information section at the start of the article
\newcommand{\articleinformation}{
	\setcounter{page}{\startpage} % Change the starting page number
	
	\begin{suppressindent} % Suppress indentation
	
		% Handle two column mode
		\makeatletter
			\if@twocolumn
				\twocolumn[ % Output the article information spanning both columns (i.e. as a single column)
			\fi
		\makeatother
		
		%------------------------------------------------
		
		{\Huge\textbf{\articletitle}} % Article title
		
		\bigskip
		
		{\Large\articleauthors} % Authors
		
		\medskip
		
		\articleaffiliations % Affiliations
		
		\medskip
		
		{\small\itshape Received: \receiveddate~~|~~Revised: \revisiondate~~|~~Accepted: \accepteddate} % Dates
		
		%------------------------------------------------
		
		\bigskip
	
		\textbf{Abstract} \textit{\abstract} % Abstract
		
		%------------------------------------------------
		
		\bigskip
		
		\textbf{Keywords:} \keywords % Keywords
		
		\smallskip
		
		\textbf{2010 Mathematics Subject Classification:} \MSClassification % Keywords
		
		\bigskip % Whitespace under the article information
		
		%------------------------------------------------
		
		% Handle two column mode
		\makeatletter
			\if@twocolumn
				\bigskip % Extra whitespace under the article information
				] % Go back to two columns of text
			\fi
		\makeatother
	
	\end{suppressindent}
	
	%------------------------------------------------
	
	\renewcommand{\thefootnote}{\fnsymbol{footnote}} % Stop footnote numbering
	\footnotetext{\aff{*}Corresponding Author: \email{\correspondingauthoremail}} % Corresponding author footnote
	\renewcommand{\thefootnote}{\arabic{footnote}} % Resume footnote numbering
}

%----------------------------------------------------------------------------------------
%	CUSTOM COMMANDS
%----------------------------------------------------------------------------------------

\newcommand{\articletitle}[1]{\renewcommand{\articletitle}{#1}}
\newcommand{\articleauthors}[1]{\renewcommand{\articleauthors}{#1}}
\newcommand{\citationauthors}[1]{\renewcommand{\citationauthors}{#1}}
\newcommand{\articleaffiliations}[1]{\renewcommand{\articleaffiliations}{#1}}
\newcommand{\correspondingauthoremail}[1]{\renewcommand{\correspondingauthoremail}{#1}}
\renewcommand{\abstract}[1]{\renewcommand{\abstract}{#1}}
\newcommand{\volume}[1]{\renewcommand{\volume}{#1}}
\newcommand{\issue}[1]{\renewcommand{\issue}{#1}}
\newcommand{\receiveddate}[1]{\renewcommand{\receiveddate}{#1}}
\newcommand{\revisiondate}[1]{\renewcommand{\revisiondate}{#1}}
\newcommand{\accepteddate}[1]{\renewcommand{\accepteddate}{#1}}
\newcommand{\keywords}[1]{\renewcommand{\keywords}{#1}}
\newcommand{\MSClassification}[1]{\renewcommand{\MSClassification}{#1}}
\newcommand{\startpage}[1]{\renewcommand{\startpage}{#1}}

\newcommand{\email}[1]{\href{mailto:#1}{#1}} % Command to output an email address with a link that opens the user's email client
