% *============================================================================*
%                 UNIVERSITY OF MELBOURNE THESIS CLASS
% *============================================================================*

% +----------------------------------------------------------------------------+
%  This is a LaTeX class designed to meet the guidelines for a thesis at the
%  University of Melbourne. These guidelines describe the required structure of
%  a thesis but provide little information on the style beyond using A4 paper
%  with left and right margins of at least 3 cm when printed. As such most of
%  the style decisions made here reflect the preferences of the authors.
% +----------------------------------------------------------------------------+

% +----------------------------------------------------------------------------+
%  Changes:
%
%  2018-10-10 (Luke Zappia)
%    * Create first draft class
% +----------------------------------------------------------------------------+

% *============================================================================*
%  DECLARE CLASS
% *============================================================================*

\ProvidesClass{unimelbthesis}[2018/10/10]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass{book}

\RequirePackage{fancyhdr}

% *============================================================================*
%  MACROS
%
%  Pieces of code that perform various functions
% *============================================================================*

% +-----Tightlist--------------------------------------------------------------+
%  Required by Pandoc > 1.14 to allow formatting of "loose" and "compact" lists,
%  see http://pandoc.org/MANUAL.html#lists for details.
% +----------------------------------------------------------------------------+

\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}

% *============================================================================*
%  VARIABLES
%
%  Named commands used to store values, usually from the RMarkdown YAML
% *============================================================================*

\renewcommand{\title}[1]{\def\@title{#1}}
\newcommand{\letters}[1]{\def\@letters{#1}}
\newcommand{\orcid}[1]{\def\@orcid{#1}}
\newcommand{\degree}[1]{\def\@degree{#1}}
\newcommand{\submissionmonth}[1]{\def\@submissionmonth{#1}}
\newcommand{\submissionyear}[1]{\def\@submissionyear{#1}}
\newcommand{\department}[1]{\def\@department{#1}}
\newcommand{\university}[1]{\def\@university{#1}}
\newcommand{\statement}[1]{\def\@statement{#1}}

% *============================================================================*
%  MARGINS
%
%  Set page margins. Guidelines specify that theses must "have left and right
%  margins of at least 3 cm when printed".
% *============================================================================*

% +-----A4 paper---------------------------------------------------------------+
\paperwidth 210mm
\paperheight 297mm

% +-----Binding margin---------------------------------------------------------+
\newlength{\bindmargin}
	\addtolength{\bindmargin}{3.5cm}

% +-----Other margin-----------------------------------------------------------+
\newlength{\othermargin}
	\addtolength{\othermargin}{3.0cm}

% +-----Header height----------------------------------------------------------+
\headheight 14pt
\voffset -2cm

% +-----Paragraph margins------------------------------------------------------+
\marginparwidth 0pt
\marginparsep 0pt

% +-----Text width-------------------------------------------------------------+
%  paper width - bind margin - other margin
% +----------------------------------------------------------------------------+

\textwidth \paperwidth
	\addtolength{\textwidth}{-\bindmargin}
	\addtolength{\textwidth}{-\othermargin}

% +-----Text height------------------------------------------------------------+
\textheight \paperheight
	\addtolength{\textheight}{-2.5cm}
	\addtolength{\textheight}{-\headsep}
	\addtolength{\textheight}{-\footskip}
	\addtolength{\textheight}{-\headheight}
	\addtolength{\textheight}{-\topmargin}
	\addtolength{\textheight}{-\voffset}
	\addtolength{\textheight}{-0.5cm}

% +-----Set margins------------------------------------------------------------+
\evensidemargin \paperwidth
	\addtolength{\evensidemargin}{-\textwidth}
	\addtolength{\evensidemargin}{-\bindmargin}
	\addtolength{\evensidemargin}{-2.5cm}

\oddsidemargin \paperwidth
	\addtolength{\oddsidemargin}{-\textwidth}
	\addtolength{\oddsidemargin}{-\othermargin}
	\addtolength{\oddsidemargin}{-2.5cm}

% *============================================================================*
%  HEADERS AND FOOTERS
% *============================================================================*

\pagestyle{fancy}

% Override the chapter and section header markings
\renewcommand{\chaptermark}[1]{\markboth{\thechapter~~#1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection~~#1}}

% +-----Front matter-----------------------------------------------------------+
%  No headings for the front matter, only a footer page number
% +----------------------------------------------------------------------------+
\newcommand{\frontmatterheadings}{
	\pagestyle{plain}
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
	% To maintain the same size as the main matter...
	\addtolength{\headheight}{0.5pt}
	\fancypagestyle{plain}{%
		\fancyhead{}
		% Add in the page number to the footer on this page only
		\fancyfoot{}
		\fancyfoot[CF]{\thepage}
		\renewcommand{\headrulewidth}{0pt}
	}
}

% +-----Main matter------------------------------------------------------------+
\newcommand{\mainmatterheadings}{
	\fancyhf{}
	\fancyhead[LE,RO]{\thepage}
	\fancyhead[LO]{\rightmark}
	\fancyhead[RE]{\leftmark}
	\renewcommand{\headrulewidth}{0.5pt}
	\renewcommand{\footrulewidth}{0pt}
	\addtolength{\headheight}{0.5pt}
	\fancypagestyle{plain}{%
		\fancyhead{}
		% Add in the page number to the footer on this page only
		\fancyfoot{}
		%\fancyfoot[CF]{\thepage}
		\renewcommand{\headrulewidth}{0pt}
	}
}




% *============================================================================*
%  PAGE FORMATTING
%
%  Control how figures are text are placed on the page
% *============================================================================*

% +-----Floats-----------------------------------------------------------------+
%  See https://robjhyndman.com/hyndsight/latex-floats/ for info
% +----------------------------------------------------------------------------+

% Percentage of page that can be a float
\renewcommand{\topfraction}{0.9}    % From top
\renewcommand{\bottomfraction}{0.6} % From bottom

% Number of floats per page
\setcounter{topnumber}{2}
\setcounter{bottomnumber}{1}
\setcounter{totalnumber}{3}

% Minimum fraction of float page that should have floats
\renewcommand{\floatpagefraction}{0.7}
\renewcommand{\dblfloatpagefraction}{0.7}

% +-----Text-----------------------------------------------------------------+

% Minimum percentage of page for text
\renewcommand{\textfraction}{0.07}

% Penalise widow lines
\widowpenalty=10000

% Allow space at bottom of page
\raggedbottom

% *============================================================================*
%  BLANK PAGES
%
%  Make blank pages blank, without a header. Originally taken from the fancyhdr
%  package documentation.
% *============================================================================*

% Commenting out this line will mark blank pages with
% "This page is intentionally left blank."
\newcommand{\markblankpages}{}

\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}
\vspace*{\fill}
\ifx\markblankpages\undefined
  \begin{center}
    This page intentionally left blank.
  \end{center}
\fi
\vspace{\fill}
\thispagestyle{empty}
\newpage
\if@twocolumn\hbox{}\newpage\fi\fi\fi}

% *============================================================================*
%  CHAPTER HEADINGS
%
%  Modified from book.cls.
% *============================================================================*

% \def\@makechapterhead#1{
%  \vspace*{25\p@}
%  {\parindent \z@ \raggedright \normalfont \singlespacing
%    \ifnum \c@secnumdepth >\m@ne
%      \if@mainmatter
%        \huge\centering \@chapapp\space \thechapter
%        \par\nobreak
%        \vskip 10\p@
%      \fi
%    \fi
%    \interlinepenalty\@M
%    \Huge #1\par\nobreak
%    \vskip 40\p@
%  }
% }

% \def\@makeschapterhead#1{
%  \vspace*{50\p@}
%  {\parindent \z@ \raggedright
%    \normalfont
%    \interlinepenalty\@M
%    \Huge\centering #1\par\nobreak
%    \vskip 40\p@
%  }
% }

% *============================================================================*
%  QUOTATIONS
%
%  Modified from https://tex.stackexchange.com/questions/191914/chapter-heading-design/191918
% *============================================================================*

\renewenvironment{quote}{
	\list{}{
		\rightmargin\leftmargin
	}
	\raggedleft
	\color{black!50}
	\item
	\relax
}{
	\endlist
	\clearpage
}

% *============================================================================*
%  BIBLIOGRAPHY
%
%  Modified from book.cls.
% *============================================================================*

\renewenvironment{thebibliography}[1]
  {\list{\@biblabel{\@arabic\c@enumiv}}
        {\settowidth\labelwidth{\@biblabel{#1}}
        \leftmargin\labelwidth
        \advance\leftmargin\labelsep
        \@openbib@code
        \usecounter{enumiv}
        \let\p@enumiv\@empty
        \renewcommand\theenumiv{\@arabic\c@enumiv}}
  \sloppy
  \clubpenalty4000
  \@clubpenalty \clubpenalty
  \widowpenalty4000
  \sfcode`\.\@m}
  {\def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}
  \endlist}

% *============================================================================*
%  FRONT MATTER
%
%  These macros define the front matter sections.
% *============================================================================*

% +-----Title page-------------------------------------------------------------+

\renewcommand\maketitle{
  \newpage
	{
		% Title page has no headings
		\thispagestyle{empty}
		% Call this page 1
		\setcounter{page}{1}
		% Use single spacing
		\singlespacing
			\let\footnotesize\small
			\let\footnoterule\relax
		   \null\vfil
			\begin{center}
				\large
				{\Huge\bfseries {\@title} \par}
					\vspace{2cm}
				{\Large \@author} \par
                ORCID ID: {\@orcid} \par
					\vspace{3cm}
        {\LARGE \@degree} \par
          \vspace{4cm}
        {\@submissionmonth} {\@submissionyear} \par
          \vspace{1cm}
				{\@department} \par
				{\@university} \par
					\vspace{1.5cm}
        {\@statement} \par
			\end{center}
			\vfil\null
	}

	% Start the footnote counter
	\setcounter{footnote}{0}
}

% +-----Abstract---------------------------------------------------------------+

\newenvironment{abstract}{
	\chapter*{Abstract}
}{
	\vfill\null
}

% +-----Declaration------------------------------------------------------------+

\newenvironment{declaration}{
	\chapter*{Declaration}
}{
	\vspace{5cm}
	% Ideally, this length should be changed so the line
	% is symmetrically spaced with the text beneath it.
	\underline{\hspace{7.52cm}} \par
	{\@author}, {\@submissionmonth} {\@submissionyear} \par
	\vfill\null
}


% +-----Preface----------------------------------------------------------------+

\newenvironment{preface}{
	\chapter*{Preface}
}{
	\vfill\null
}

% +-----Acknowledgements-------------------------------------------------------+

\newenvironment{acknowledgements}{%
	\chapter*{Acknowledgements}
}{%
	\vfill\null
}

% +-----Table of contents------------------------------------------------------+

\renewcommand{\contentsname}{Table of Contents}

% +-----List of copyright------------------------------------------------------+
%  This may need to be adjusted depending on what you want to show in here
% +----------------------------------------------------------------------------+

\newenvironment{copyrightlist}{%
	\chapter*{List of Copyright Material}
}{%
	\vfill\null
}


% +-----Matt's changes ------------------------------------------------------+
% figure placement:
\usepackage{float}
\floatplacement{figure}{H}

% increase line spacing 
\usepackage{setspace}\onehalfspacing 

% increase space between paragraphs
\setlength{\parskip}{8pt}

% remove header
\renewcommand{\headrulewidth}{0pt} % Remove header rule
\fancyhead{} % Remove all header contents

% reduce size of figure captions
\usepackage{caption}
\captionsetup[figure]{font=small}

% stop url's extending into the margins
\usepackage{xurl}
