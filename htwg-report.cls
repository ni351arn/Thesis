%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% HTWG Corporate Identity LaTeX Template
%% for Reports and Theses
%%
%% Based on 'tudelft-report-latex':
%% https://github.com/praseodym/tudelft-report-latex/tree/4983bea3e88ae9010bc25576f36ebefed3257228
%%
%% HTWG Corporate Design:
%% https://www.htwg-konstanz.de/hochschule/einrichtungen/stabsstelle-kommunikation/corporate-design-logo/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{htwg-report}[2018/04/27 v1. HTWG Konstanz report class]

\newif\if@german
\newif\if@english
\DeclareOption{german}{\@germantrue\@englishfalse}
\DeclareOption{english}{\@germanfalse\@englishtrue}
\newif\if@nativefonts
\DeclareOption{nativefonts}{\@nativefontstrue}
\newif\if@print
\DeclareOption{print}{\@printtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ExecuteOptions{english}
\ProcessOptions\relax

\LoadClass[11pt,oneside]{book}

\RequirePackage{setspace}
\onehalfspacing

\RequirePackage{amsmath}
\RequirePackage{amssymb}
%% English is the default language, but this can be changed to German by
%% specifying the 'german' option to the document class.
\if@german
    \RequirePackage[ngerman]{babel}
\else
    %% Even for English reports, some sections might be in german, for example on
    %% the title page.
    \RequirePackage[ngerman,english]{babel}
\fi
\RequirePackage[nooneline,footnotesize]{caption}
\RequirePackage{fancyhdr}
\RequirePackage[flushmargin,hang]{footmisc}
\RequirePackage{ifpdf}
\RequirePackage{ifxetex}
\RequirePackage[hyphens]{url}
\RequirePackage{listings}
\RequirePackage{rotating}
\RequirePackage[table]{xcolor}
\RequirePackage{longtable}

\lstset{basicstyle=\footnotesize\ttfamily,breaklines=true}
\lstset{framextopmargin=50pt}

%% 'background' includes 'graphicx' as well
\RequirePackage[firstpage=true,contents={}]{background}

%% 'eso-pic' for individual background picture
%% like at the title page
\RequirePackage{eso-pic}

\ifxetex
    \RequirePackage[xetex]{geometry}
    \RequirePackage[xetex]{hyperref}
    \RequirePackage{fontspec}
    \RequirePackage{xltxtra}
    \defaultfontfeatures{Ligatures=TeX}
\else
    \ifpdf
        \RequirePackage[pdftex]{geometry}
        \RequirePackage[pdftex]{hyperref}
    \else
        \RequirePackage[dvips]{geometry}
        \RequirePackage[hypertex]{hyperref}
    \fi
\fi
\RequirePackage{metalogo}
\RequirePackage{tikz}
\RequirePackage[noindentafter]{titlesec}
\RequirePackage{titletoc}

\RequirePackage{xkeyval}

%% BIB
\RequirePackage[
	backend=biber,
	style=numeric,
	sorting=none
]{biblatex}
\if@german
\DefineBibliographyStrings{german}{%
  bibliography = {Literaturverzeichnis},
}
\else
\DefineBibliographyStrings{english}{%
  bibliography = {References},
}
\fi


\ifxetex
    %% If the document is compiled with XeLaTeX, we load the
    %% HTWG CI style font: swis721 Regular and Bold (sans serif)
    %%
    %% As serif font we load: Georgia Regular and Bold and Italic (serif)
    \newfontfamily\htwgsffamily[
        Path = fonts/,
        Extension = .ttf,
        BoldFont = *-Bold,
        ItalicFont = *,
        BoldItalicFont = *
    ]{swis721}
    \newfontfamily\htwgrmfamily[
        Path = fonts/,
        Extension = .ttf,
        BoldFont = *-Bold,
        ItalicFont = *-Italic,
        BoldItalicFont = *-Bold-Italic
    ]{Georgia}
\else
    %% If the document is not compiled with XeLaTeX, we need to use the native
    %% fonts.
    \@nativefontstrue
    \newcommand*\htwgrmfamily{\rmfamily}
    \newcommand*\htwgsffamily{\sffamily}
\fi

\if@nativefonts
    %% As a fallback, we use Arial
    %% The native font is Utopia Regular with Fourier math. We use Latin Modern
    %% as a fallback, since Utopia lacks support for sans-serif and monospace.

    \RequirePackage{helvet}
    \renewcommand{\familydefault}{\sfdefault}
\else
    %% swis721 for sans serif [main font]
    %% Georgia for sans
    %% Courier New for monospace
    %% Cambria for math
    \RequirePackage{unicode-math}
    \setmainfont[
        Path = fonts/,
        Extension = .ttf,
        BoldFont = *-Bold,
        ItalicFont = *,
        BoldItalicFont = *
    ]{swis721}
    \setsansfont[
        Path = fonts/,
        Extension = .ttf,
        BoldFont = *-Bold,
        ItalicFont = *-Italic,
        BoldItalicFont = *-Bold-Italic
    ]{Georgia}
    \setmonofont[
        Path = fonts/,
        Extension = .ttf,
        UprightFont = *MT,
        BoldFont = *-BoldMT,
        ItalicFont = *-ItalicMT,
        BoldItalicFont = *-BoldItalicMT
    ]{CourierNewPS}
    \setmathfont[
        Path = fonts/,
        Extension = .ttf
    ]{CambriaMath}
    %% The default style for text
    \renewcommand*\familydefault{\rmdefault}
\fi


%%%%%%%%%%%%
%% HTWG CI Colors
%%%%%%%%%%%%
\definecolor{htwg-white}{cmyk}{0.0,0.0,0.0,0.0}
\definecolor{htwg-black}{cmyk}{0.0,0.0,0.0,1.0}
\definecolor{htwg-black-90}{cmyk}{0.0,0.0,0.0,0.9}
\definecolor{htwg-black-80}{cmyk}{0.0,0.0,0.0,0.8}
\definecolor{htwg-black-70}{cmyk}{0.0,0.0,0.0,0.7}
\definecolor{htwg-black-60}{cmyk}{0.0,0.0,0.0,0.6}
\definecolor{htwg-black-50}{cmyk}{0.0,0.0,0.0,0.5}
\definecolor{htwg-black-40}{cmyk}{0.0,0.0,0.0,0.4}
\definecolor{htwg-black-30}{cmyk}{0.0,0.0,0.0,0.3}
\definecolor{htwg-black-20}{cmyk}{0.0,0.0,0.0,0.2}
\definecolor{htwg-black-10}{cmyk}{0.0,0.0,0.0,0.1}
\definecolor{htwg-soft-blue}{cmyk}{0.1,0.0,0.0,0.1}
\definecolor{htwg-dark-blue}{cmyk}{0.8,0.62,0.42,0.45}
\definecolor{htwg-teal}{cmyk}{1.0,0.0,0.5,0.0}

%% Use HTWG Teal as the color for titles, unless the 'print' option is
%% specified.
\if@print
    \colorlet{title}{black}
\else
    \colorlet{title}{htwg-teal}
\fi

%% We use A4 paper with default margins (scale = 0.7).
\geometry{a4paper,hscale=0.7,vscale=0.75}

%% Redefine the title command to accept an optional subtitle.
\renewcommand*\title[2][]{%
    \def\@subtitle{#1}%
    \def\@title{#2}%
    %% Add the title to the PDF meta data.
    \hypersetup{pdftitle=#2}%
}
%% Redefine the author command to add the name to the PDF meta data.
\renewcommand*\author[1]{%
    \def\@author{#1}%
    \hypersetup{pdfauthor=#1}%
}

%%% Define Command for background image for Title Page
\newcommand\BackgroundImgTitelPage{
    \put(0,0){
        \parbox[b][\paperheight]{\paperwidth}{%
            \vfill
            \centering
            \includegraphics[height=\paperheight,width=\paperwidth,
            keepaspectratio]{report_titel_page.pdf}%
            \vfill
        }
    }
}

%% Table Settings
\renewcommand{\arraystretch}{2}
\rowcolors{2}{htwg-black-10}{white}

% Setting the graphicspath
\graphicspath{{figs/}} 

%%% Report-Type
% 'bachelor'
% 'master'
% [other]
\newcommand\reporttype[1]{\def\@report@type{#1}}
\newcommand\reporttypetext[1]{\def\@report@typetext{#1}}
\def\bachelor{bachelor}
\def\master{master}

%%% Student
\newcommand\studentnumber[1]{\def\@student@number{#1}}
\newcommand\studentemail[1]{\def\@student@email{#1}}

%%% Document
\newcommand\doclocation[1]{\def\@doc@location{#1}}
\newcommand\docdate[1]{\def\@doc@date{#1}}

%%% Supervisor
\newcommand\supervisor[1]{\def\@supervisor{#1}}
\newcommand\secondexaminer[1]{\def\@second@examiner{#1}}

%% Remove the header and page number on empty pages.
\def\cleardoublepage{%
    \clearpage%
    \if@twoside%
        \ifodd\c@page%
        \else%
            \thispagestyle{empty}%
            \vspace*{\fill}%
            \newpage%
        \fi%
    \fi%
}

%% Page style for title pages.
\fancypagestyle{plain}{%
    \fancyhf{}
    \renewcommand*\headrulewidth{0pt}
    \renewcommand*\footrulewidth{0pt}
    \fancyfoot[C]{\thepage}
}

%% Fancy style for the main matter.
\fancypagestyle{mainmatter}{%
    \fancyhf{}
    %% Page numbers on the top left and top right.
    \fancyhead[LE,RO]{\thepage}
    %% Chapter name on the left (even) page.
    \fancyhead[RE]{\nouppercase{\leftmark}}
    %% Section name on the right (odd) page.
    \fancyhead[LO]{\nouppercase{\rightmark}}
}

%% The mainmatter style is default for normal pages.
\pagestyle{mainmatter}

%% Print the current chapter and section at the top of the page in cyan.
\renewcommand*\chaptermark[1]{\markboth{\thechapter.\ \color{title}#1}{}}
\renewcommand*\sectionmark[1]{\markright{\thesection.\ \color{title}#1}}

%% The setheader command can be used to print the title of unnumbered chapters
%% in the page header.
\newcommand*\setheader[1]{\markboth{\color{title}#1}{\color{title}#1}}

%% Change the headrule command (from fancyhdr.sty) to draw the line below the
%% header in the title color.
\renewcommand*\headrule{%
    \if@fancyplain%
        \let\headrulewidth\plainheadrulewidth%
    \fi%
    {\color{title}\hrule\@height\headrulewidth\@width\headwidth}%
    \vskip-\headrulewidth%
}

%% Draw the line above a footnote in the title color as well.
\renewcommand*\footnoterule{%
    \vspace*{20pt}%
    {\color{title}\hrule width 0.5\textwidth height 0.4pt}%
    \vspace*{3pt}%
}

%% A part title starts with a huge (96pt) bold black number, flushed to the
%% right, followed by the part name on the next line in the title color.
\titleformat{\part}[display]
    {\flushright}
    {\fontsize{96pt}{96pt}\selectfont\bfseries\thepart}
    {0pt}
    {\Huge\color{title}}
%% Separate the title from the text by two empty lines.
\titlespacing{\part}{0pt}{0pt}{2\baselineskip}
%% In the table of contents, the part name is preceded by an empty line, printed
%% in bold, and not followed by a line of dots.
\dottedcontents{part}[0em]{\vspace{\baselineskip}\bfseries}{1.5em}{0pc}

%% Chapter titles have the same layout as parts.
\titleformat{\chapter}[display]
    {\flushright}
    {\fontsize{96pt}{96pt}\selectfont\bfseries\thechapter}
    {0pt}
    {\Huge\color{title}}
\titlespacing{\chapter}{0pt}{0pt}{2\baselineskip}
%% In the table of contents, a chapter is similar to a part, except that it is
%% preceded by half an empty line.
\dottedcontents{chapter}[1.5em]{\vspace{0.5\baselineskip}\bfseries}{1.5em}{0pc}

%% Section titles start with the number in bold, followed by the name printed
%% in the title color.
\titleformat{\section}
    {\Large}
    {\bfseries\thesection.\ }
    {0pt}
    {\color{title}}
%% Sections are preceded by an empty line.
\titlespacing{\section}{0pt}{2\baselineskip}{1.5\baselineskip}
%% In the table of contents, section names are followed by a line of dots 8pt
%% apart.
\dottedcontents{section}[3.8em]{}{2.3em}{8pt}

%% Subsection titles have the same layout as section titles, except in a smaller
%% font.
\titleformat{\subsection}
    {\large}
    {\bfseries\thesubsection.\ }
    {0pt}
    {\color{title}}
\titlespacing{\subsection}{0pt}{1.5\baselineskip}{\baselineskip}
\dottedcontents{subsection}[7em]{}{3.2em}{8pt}

%% Subsubsections have the same font and color as sections and subsections, but
%% are not preceded by a number.
\titleformat{\subsubsection}
    {}
    {}
    {0pt}
    {\color{title}}
%% Subsubsections are preceded by an empty line and do not appear in the table
%% of contents.
\titlespacing{\subsubsection}{0pt}{\bigskipamount}{0pt}

%% Color the bullets of the itemize environment and make the symbol of the third
%% level a diamond instead of an asterisk.
\renewcommand*\labelitemi{\color{title}\textbullet}
\renewcommand*\labelitemii{\color{title}--}
\renewcommand*\labelitemiii{\color{title}$\diamond$}
\renewcommand*\labelitemiv{\color{title}\textperiodcentered}

%% Hyperlinks are cyan, except in print mode, when they are all black.
\hypersetup{
    colorlinks = true,
    citecolor = title,
    linkcolor = title,
    urlcolor = title
}
