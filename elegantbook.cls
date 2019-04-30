%%%%%%%%%%%%%%%%%%%%%%
%% start of file `elegantbook.cls'.
%% Copyright 2013-2019 ElegantLaTeX (elegantlatex2e@gmail.com)
%%
%% This work may be distributed and/or modified freely
%% available at https://github.com/ElegantLaTeX/ElegantBook
% 
%%%%%%%%%%%%%%%%%%%%%
% % !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{elegantbook}[2019/04/25 v3.07 ElegantBook document class]

\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=ELEGANT, prefix=ELEGANT@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{ELEGANT}{#1}}

% ----- Class options -----
\DeclareStringOption[blue]{color}
\DeclareStringOption[en]{lang}
\DeclareStringOption[answer]{result}
\DeclareStringOption[fancy]{mode}
\DeclareStringOption[show]{base}
\DeclareStringOption[hang]{titlestyle}[hang]

% ----- backward compatibility
\DeclareVoidOption{green}{\ekv{color = green}}
\DeclareVoidOption{cyan}{\ekv{color = cyan}}
\DeclareVoidOption{blue}{\ekv{color = blue}}
\DeclareVoidOption{gray}{\ekv{color = gray}}
\DeclareVoidOption{black}{\ekv{color = black}}
\DeclareVoidOption{nocolor}{\ekv{color = none}}

\DeclareVoidOption{en}{\ekv{lang=en}}
\DeclareVoidOption{cn}{\ekv{lang=cn}}

\DeclareVoidOption{answer}{\ekv{result = answer}}
\DeclareVoidOption{noanswer}{\ekv{result = noanswer}}

\DeclareVoidOption{fancy}{\ekv{mode=fancy}}
\DeclareVoidOption{simple}{\ekv{mode=simple}}

\DeclareVoidOption{hide}{\ekv{base = hide}}
\DeclareVoidOption{show}{\ekv{base = show}}

\DeclareVoidOption{hang}{\ekv{titlestyle = hang}}
\DeclareVoidOption{display}{\ekv{titlestyle = display}}


% ----- Default Options -----
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{book}}

\ProcessKeyvalOptions*\relax
\LoadClass[a4paper,oneside,openany]{book}

\RequirePackage{comment}



% fontsetting

\PassOptionsToPackage{no-math}{fontspec}
\ifdefstring{\ELEGANT@lang}{cn}{
  \RequirePackage[UTF8, scheme=plain]{ctex}
}

\RequirePackage{ifxetex}

% font setting for text and math
\ifxetex
	\RequirePackage{fontenc}
\else
	\RequirePackage[T1]{fontenc}
\fi

\RequirePackage{newtxtext}
\RequirePackage{newtxmath}
\RequirePackage{anyfontsize}

\DeclareSymbolFont{CMlargesymbols}{OMX}{cmex}{m}{n}%

\let\intop\relax
\let\sumop\relax
\let\ointop\relax
\let\prodop\relax
\DeclareMathSymbol{\sumop}{\mathop}{CMlargesymbols}{"50}
\DeclareMathSymbol{\intop}{\mathop}{CMlargesymbols}{"52}
\DeclareMathSymbol{\ointop}{\mathop}{CMlargesymbols}{"49}
\DeclareMathSymbol{\prodop}{\mathop}{CMlargesymbols}{"59}

% ----- Handle Colors -----


% corlor definition
\RequirePackage{xcolor}

\newcommand\@color@define{%
  \ifdefstring{\ELEGANT@color}{green}{%
  	\definecolor{structure} {RGB}{0,120,2}%
  	\definecolor{main}      {RGB}{0,120,2}%
  	\definecolor{second}    {RGB}{230,90,7}%
  	\definecolor{third}     {RGB}{0,160,152}%
  }{\relax}%
  \ifdefstring{\ELEGANT@color}{cyan}{%
  	\definecolor{structure} {RGB}{31,186,190}%
  	\definecolor{main}      {RGB}{59,180,5}%
  	\definecolor{second}    {RGB}{175,153,8}%
  	\definecolor{third}     {RGB}{244,105,102}%
  }{\relax}%
  \ifdefstring{\ELEGANT@color}{blue}{%
  	\definecolor{structure} {RGB}{60,113,183}%
  	\definecolor{main}      {RGB}{0,166,82}%
  	\definecolor{second}    {RGB}{255,134,24}%
  	\definecolor{third}     {RGB}{0,174,247}%
  }{\relax}%
  \ifdefstring{\ELEGANT@color}{gray}{%
  	\definecolor{structure} {RGB}{100,100,100}%
  	\definecolor{main}      {RGB}{100,100,100}%
  	\definecolor{second}    {RGB}{100,100,100}%
  	\definecolor{third}     {RGB}{100,100,100}%
  }{\relax}%
  \ifdefstring{\ELEGANT@color}{black}{%
  	\definecolor{structure} {RGB}{0,0,0}%
  	\definecolor{main}      {RGB}{0,0,0}%
  	\definecolor{second}    {RGB}{0,0,0}%
  	\definecolor{third}     {RGB}{0,0,0}%
  }{\relax}%
}
\@color@define

\definecolor{winered}       {rgb}{0.5,0,0}
\definecolor{bule}          {RGB}{18,29,57}

%% 章节以及页脚图形
\newcommand{\base}[2]{%
	\nointerlineskip \vspace{0.1\baselineskip}\hspace{\fill}
	{\color{#1}
		\resizebox{0.3\linewidth}{1.5ex}
		{{%
				{\begin{tikzpicture}
					\node  (C) at (0,0) {};
					\node (D) at (4,0) {};
					\path (C) to [ornament=#2] (D);
					\end{tikzpicture}}}}}%
	\hspace{\fill}
	\par\nointerlineskip \vspace{0.1\baselineskip}
}

% ----- Math option -----
\newcommand\mailto[1]{\href{mailto:#1}{\nolinkurl{#1}}}

% ----- Title Style -----
\ifdefstring{\ELEGANT@titlestyle}{hang}{\def\style{hang}}{\relax}
\ifdefstring{\ELEGANT@titlestyle}{display}{\def\style{display}}{\relax}

% unify using \@<cmd> to store content, instead of using \newtoks\<cmd>
\newcommand*{\institute}[1]{\gdef\@institute{#1}}
\newcommand*{\version}[1]{\gdef\@version{#1}}
\newcommand*{\equote}[1]{\def\@equote{#1}}

\newtoks\subtitle

\RequirePackage{natbib}
\setlength{\bibsep}{0.0pt}
\def\bibfont{\footnotesize}



\RequirePackage{enumerate}
% list/itemize/enumerate setting
\RequirePackage[shortlabels]{enumitem}
\setlist{nolistsep}

% caption settings 
\RequirePackage{caption}
\captionsetup{labelfont = bf}
\RequirePackage[font=small,labelfont={bf,color=structure}]{caption} 
\captionsetup[table]{skip=3pt}
\captionsetup[figure]{skip=3pt}

%% 常用宏包
% \linespread{1.3}
\RequirePackage{graphicx}
%\RequirePackage{enumerate}
\RequirePackage{amsmath,mathrsfs,amsfonts,amssymb}
\RequirePackage{booktabs}
\RequirePackage{multicol}
\RequirePackage{xcolor}
\RequirePackage{fancyvrb}
\RequirePackage{makecell,lipsum,hologo,setspace}


%%中文结构名字
\ifdefstring{\ELEGANT@lang}{cn}{
  \renewcommand{\contentsname}{目\hspace{2em}录}
  \renewcommand{\figurename}{图}
  \renewcommand{\tablename}{表}
  \renewcommand{\partname}{第 \thepart\; 部分}
  \renewcommand{\chaptername}{第 \thechapter\;章}
  \renewcommand{\listfigurename}{插图目录}
  \renewcommand{\listtablename}{表格目录}
  \renewcommand{\bibname}{参考文献}
  \renewcommand{\appendixname}{附录}
  \renewcommand{\indexname}{索\hspace{2em}引}
  
  \newcommand\figref[1]{\textbf{\figurename}~\ref{#1}}
  \newcommand\tabref[1]{\textbf{\tablename}~\ref{#1}}

  \RequirePackage[authoryear]{gbt7714}
  % \bibliographystyle{aer}
  
  % meta info prefix
  \newcommand*\@format@metaInfo{\kaishu}
  \newcommand*\@pre@author    {作者：}
  \newcommand*\@pre@institute {机构：}
  \newcommand*\@pre@date      {日期：}
  \newcommand*\@pre@version   {版本：}
}{\relax}
\ifdefstring{\ELEGANT@lang}{en}{
  \newcommand\figref[1]{\textbf{Figure}~\ref{#1}}
  \newcommand\tabref[1]{\textbf{Table}~\ref{#1}}
  \renewcommand{\chaptername}{Chapter \thechapter}
  
  \bibliographystyle{aer}
  
  % meta info prefix
  \newcommand*\@format@metaInfo{\bfseries}
  \newcommand*\@pre@author    {Author: }
  \newcommand*\@pre@institute {Institute: }
  \newcommand*\@pre@date      {Date: }
  \newcommand*\@pre@version   {Version: }
}{\relax}


\graphicspath{{./figure/}{./figures/}{./image/}{./images/}{./graphics/}{./graphic/}{./pictures/}{./picture/}}

\RequirePackage{tikz}
\usetikzlibrary{backgrounds,calc,shadows}
\usepackage[object=vectorian]{pgfornament}

\newcommand*{\eitemi}{\tikz \draw [baseline, ball color=structure, draw=none] circle (2pt);}
\newcommand*{\eitemii}{\tikz \draw [baseline, fill=structure,draw=none,circular drop shadow] circle (2pt);}
\newcommand*{\eitemiii}{\tikz \draw [baseline, fill=structure,draw=none] circle (2pt);}
\setlist[enumerate,1]{label=\color{structure}\arabic*.}
\setlist[enumerate,2]{label=\color{structure}(\alph*).}
\setlist[enumerate,3]{label=\color{structure}\Roman*.}
\setlist[enumerate,4]{label=\color{structure}\Alph*.}
\setlist[itemize,1]{label={\eitemi}}
\setlist[itemize,2]{label={\eitemii}}
\setlist[itemize,3]{label={\eitemiii}}


%% device settings

% \RequirePackage{geometry}
% \geometry{
% 	a4paper,
% 	top=25.4mm, bottom=25.4mm,
% 	headheight=2.17cm,
% 	headsep=4mm,
% 	footskip=12mm
% }


\RequirePackage{hyperref}
\hypersetup{
	breaklinks,
	unicode,
	linktoc=all,
	bookmarksnumbered=true,
	bookmarksopen=true,
	pdfkeywords={ElegantBook},
	colorlinks,
	linkcolor=winered,
	citecolor=winered,
	urlcolor  = winered,
	plainpages=false,
	pdfstartview=FitH,
	pdfborder={0 0 0},
	linktocpage
}
\let\email\relax
\newcommand\email[1]{\href{mailto:#1}{\nolinkurl{#1}}}

%%   章节设置
\RequirePackage[center,pagestyles]{titlesec}
\RequirePackage{apptools}
\RequirePackage[toc,page]{appendix}

\setcounter{secnumdepth}{5}

\titleformat{\chapter}[\style]
  {\bfseries}
  {%
    \filcenter\LARGE\enspace\bfseries
    {\color{structure}\IfAppendix{\appendixname}{\chaptername}\enspace}%
  }
  {1pt}
  {\bfseries\color{structure}\LARGE\filcenter}
  [\ifdefstring{\ELEGANT@base}{hide}{}{\filcenter\base{structure}{88}}]

\titleformat{\section}[hang]
  {\bfseries}
  {\hspace{-2.45em}\Large\bfseries{\color{structure}\thesection}\enspace}
  {1pt}
  {\color{structure}\Large\bfseries\filright}

\titleformat{\subsection}[hang]
  {\bfseries}
  {\hspace{-2.45em}\large\bfseries\color{structure}\thesubsection\enspace}
  {1pt}
  {\color{structure}\large\bfseries\filright}

\titleformat{\subsubsection}[hang]
  {\bfseries}
  {\hspace{-2.45em}\large\bfseries\color{structure}\thesubsubsection\enspace}
  {1pt}
  {\color{structure}\large\bfseries\filright}


\titlespacing{\chapter}{0pt}{-20pt}{1.3\baselineskip}
%\titlespacing{\subsection}{0pt}{0.5\baselineskip}{-\baselineskip}



%%define the note and proof environment
\RequirePackage{pifont,manfnt,bbding}
% list/itemize/enumerate setting
\RequirePackage[shortlabels]{enumitem}
\setlist{nolistsep}


\RequirePackage[many]{tcolorbox}
\ifdefstring{\ELEGANT@mode}{fancy}{
  \tcbset{
    common/.style={
      fontupper=\ifdefstring{\ELEGANT@lang}{en}{\itshape}{\upshape\kaishu},
      lower separated=false,
      coltitle=white,
      colback=gray!5,
      boxrule=0.5pt,
      fonttitle=\bfseries,
      enhanced,
      breakable,
      top=8pt,
      before skip=8pt,
      attach boxed title to top left={yshift=-0.11in,xshift=0.15in},
      boxed title style={boxrule=0pt,colframe=white,arc=0pt,outer arc=0pt},
      separator sign={.},
    },
    defstyle/.style={
      common,
      colframe=main,  
      colback=main!5,
      colbacktitle=main, 
      overlay unbroken and last={\node[anchor=south east, outer sep=6pt] at (\textwidth-width,0) {\textcolor{main}{$\clubsuit$}}; }
    },
    thmstyle/.style={
      common,
      colframe=second,  
      colback=second!5,
      colbacktitle=second, 
      overlay unbroken and last={\node[anchor=south east, outer sep=6pt] at (\textwidth-width,0) {\textcolor{second}{$\heartsuit$}}; }
    },
    propstyle/.style={
      common,
      colframe=third,  
      colback=third!5,
      colbacktitle=third, 
      overlay unbroken and last={\node[anchor=south east, outer sep=6pt] at (\textwidth-width,0) {\textcolor{third}{$\spadesuit$}}; }
    },
  }
  
  \newtcbtheorem[auto counter,number within=chapter]{definition}{
  	\ifdefstring{\ELEGANT@lang}{en}{Definition}{定义}
  }{defstyle}{def}
  
  \newtcbtheorem[auto counter,number within=chapter]{theorem}{
  	\ifdefstring{\ELEGANT@lang}{en}{Theorem}{定理}
  }{thmstyle}{thm}
  
  \newtcbtheorem[auto counter,number within=chapter]{proposition}{
  	\ifdefstring{\ELEGANT@lang}{en}{Proposition}{命题}
  }{propstyle}{pro}
  
  \newtcbtheorem[auto counter,number within=chapter]{corollary}{
  	\ifdefstring{\ELEGANT@lang}{en}{Corollary}{推论}
  }{thmstyle}{cor}
  
  \newtcbtheorem[auto counter,number within=chapter]{lemma}{
  	\ifdefstring{\ELEGANT@lang}{en}{Lemma}{引理}
  }{thmstyle}{lem}

}{\relax}

\ifdefstring{\ELEGANT@mode}{simple}{
\let\openbox\relax
\RequirePackage{amsthm}
\let\proof\relax
\let\endproof\relax
% declare a new theorem style
\newtheoremstyle{edefstyle}%
  {3pt}% Space above
  {3pt}% Space below 
  {\ifdefstring{\ELEGANT@lang}{en}{\itshape}{\upshape\kaishu}}% Body font
  {}% Indent amount
  {\bfseries\color{main}}% Theorem head font
  {}% Punctuation after theorem head
  {0.5em}% Space after theorem head 
  {\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}% Theorem head spec (can be left empty, meaning ‘normal’)
% -------------------------------------------------%
\newtheoremstyle{ethmstyle}%
  {3pt}% Space above
  {3pt}% Space below 
  {\ifdefstring{\ELEGANT@lang}{en}{\itshape}{\upshape\kaishu}}% Body font
  {}% Indent amount
  {\bfseries\color{second}}% Theorem head font
  {}% Punctuation after theorem head
  {.5em}% Space after theorem head 
  {\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}% Theorem head spec (can be left empty, meaning ‘normal’)
% -------------------------------------------------%
\newtheoremstyle{eprostyle}%
  {3pt}% Space above
  {3pt}% Space below 
  {\ifdefstring{\ELEGANT@lang}{en}{\itshape}{\upshape\kaishu}}% Body font
  {}% Indent amount
  {\bfseries\color{third}}% Theorem head font
  {}% Punctuation after theorem head
  {.5em}% Space after theorem head 
  {\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}% Theorem head spec (can be left empty, meaning ‘normal’)

\theoremstyle{edefstyle}
\newtheorem{edefinition}{\ifdefstring{\ELEGANT@lang}{en}{Definition}{定义}}[chapter]

\theoremstyle{ethmstyle}
\newtheorem{etheorem}{\ifdefstring{\ELEGANT@lang}{en}{Theorem}{定理}}[chapter]
\newtheorem{elemma}{\ifdefstring{\ELEGANT@lang}{en}{Lemma}{引理}}[chapter]
\newtheorem{ecorollary}{\ifdefstring{\ELEGANT@lang}{en}{Corollary}{推论}}[chapter]

\theoremstyle{eprostyle}
\newtheorem{eproposition}{\ifdefstring{\ELEGANT@lang}{en}{Proposition}{命题}}[chapter]

\newenvironment{theorem}[2]
  {\ifstrempty{#1}{\etheorem}{\etheorem[#1]}\ifstrempty{#2}{}{\label{thm:#2}}}
  {\endetheorem}

\newenvironment{definition}[2]
  {\ifstrempty{#1}{\edefinition}{\edefinition[#1]}\ifstrempty{#2}{}{\label{def:#2}}}
  {\endedefinition}

\newenvironment{lemma}[2]
  {\ifstrempty{#1}{\elemma}{\elemma[#1]}\ifstrempty{#2}{}{\label{lem:#2}}}
  {\endelemma}

\newenvironment{corollary}[2]
  {\ifstrempty{#1}{\ecorollary}{\ecorollary[#1]}\ifstrempty{#2}{}{\label{cor:#2}}}
  {\endecorollary}

\newenvironment{proposition}[2]
  {\ifstrempty{#1}{\eproposition}{\eproposition[#1]}\ifstrempty{#2}{}{\label{pro:#2}}}
  {\endeproposition}
}{\relax}

% main（green-def): example exercise problem solution
% second（orange-thm）: proof note remark  
% third（blue-prop):  assumptions property conclusion custom

%% Example with counter
\newcounter{exam}[chapter]
\setcounter{exam}{0}
\renewcommand{\theexam}{\thechapter.\arabic{exam}}
\newenvironment{example}[1][]{
 		\refstepcounter{exam}\par\noindent\textbf{\color{main}{
 			\ifdefstring{\ELEGANT@lang}{en}{Example}{例}
 		}\theexam #1 }\rmfamily %
 	}{
 		\par\medskip\ignorespacesafterend %
 	}

%% Exercise with counter
\newcounter{exer}[chapter]
\setcounter{exer}{0}
\renewcommand{\theexer}{\thechapter.\arabic{exer}}
\newenvironment{exercise}[1][]{
 		\refstepcounter{exer}\par\noindent\makebox[-3pt][r]{\scriptsize\color{red!90}\HandPencilLeft\quad}\textbf{\color{main}{
 			\ifdefstring{\ELEGANT@lang}{en}{Exercise}{练习}
 		}\theexer #1 }\rmfamily %
 	}{
 		\par\medskip\ignorespacesafterend %
 	}

%% Exercise with counter
\newcounter{prob}[chapter]
\setcounter{prob}{0}
\renewcommand{\theprob}{\thechapter.\arabic{prob}}
\newenvironment{problem}[1][]{
 		\refstepcounter{prob}\par\noindent\textbf{\color{main}{%
 			\ifdefstring{\ELEGANT@lang}{en}{Problem}{例题}
 		}\theprob #1 }\rmfamily %
 	}{
 		\par\medskip\ignorespacesafterend %
 	}



\newenvironment{note}{\par\noindent{\makebox[0pt][r]{\scriptsize\color{red!90}\textdbend\quad}\textbf{\color{second}
	\ifdefstring{\ELEGANT@lang}{en}{Note}{注意}
}}\ifdefstring{\ELEGANT@lang}{en}{\itshape}{\kaishu}}{\par}

\newenvironment{proof}{\par\noindent\textbf{\color{second}
	\ifdefstring{\ELEGANT@lang}{en}{Proof}{证明}
}\color{black!90}\small}{
%\hfill$\Box$\quad
\par}
\newenvironment{remark}{\noindent\textbf{\color{second}
	\ifdefstring{\ELEGANT@lang}{en}{Remark}{注}
}}{\par}
\newenvironment{assumption}{\par\noindent\textbf{\color{third}
	\ifdefstring{\ELEGANT@lang}{en}{Assumption}{假设}
}}{\par}
\newenvironment{conclusion}{\par\noindent\textbf{\color{third}
	\ifdefstring{\ELEGANT@lang}{en}{Conclusion}{结论}
}}{\par}
\newenvironment{solution}{\par\noindent\textbf{\color{main}
	\ifdefstring{\ELEGANT@lang}{en}{Solution}{解}
}}{\par}
\newenvironment{property}{\par\noindent\textbf{\color{third}
	\ifdefstring{\ELEGANT@lang}{en}{Property}{性质}
}}{\par}
\newenvironment{custom}[1]{\par\noindent\textbf{\color{third}
	\ifdefstring{\ELEGANT@lang}{en}{#1}{#1}
}}{\par}

\RequirePackage{multicol}
\tcbset{
    introduction/.style={
        enhanced,
		breakable,
		colback=structure!10,
		colframe=structure,
  		fonttitle=\bfseries,
  		colbacktitle=structure,
  		fontupper=\ifdefstring{\ELEGANT@lang}{en}{\sffamily}{\kaishu},
  		attach boxed title to top center={yshift=-3mm,yshifttext=-1mm},
  		boxrule=0pt,
  		toprule=0.5pt,
  		bottomrule=0.5pt,
  		top=8pt,
  		before skip=8pt,
  		sharp corners
    },
}

\newenvironment{introduction}[1][\ifdefstring{\ELEGANT@lang}{en}{Introduction}{内容提要}]{
	\begin{tcolorbox}[introduction,title={#1}]
	\begin{multicols}{2}
	\begin{itemize}[label=\textcolor{structure}{\scriptsize\SquareShadowBottomRight}]
	}{%
	\end{itemize}
	\end{multicols}
	\end{tcolorbox}
}


\ifdefstring{\ELEGANT@result}{noanswer}{
	\AtBeginDocument{
	\excludecomment{solution}
	\excludecomment{proof}
	\excludecomment{inline}
	}
}{\relax}


%页眉页脚
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\fancyhf{}

\if@twoside
\fancyhead[EL,OR]{%
  \color{structure}%
  \ifdefstring{\ELEGANT@lang}{en}{\itshape}{\kaishu}%
  --\thepage/\pageref*{LastPage}--%
}
\fancyhead[ER]{%
  \color{structure}%
  \ifdefstring{\ELEGANT@lang}{en}{\itshape}{\kaishu}%
  \leftmark
}
\fancyhead[OL]{%
  \color{structure}%
  \ifdefstring{\ELEGANT@lang}{en}{\itshape}{\kaishu}%
  \rightmark
}
\else
\fancyhead[R]{%
  \color{structure}%
  \ifdefstring{\ELEGANT@lang}{en}{\itshape}{\kaishu}%
  --\thepage/\pageref*{LastPage}--%
}
\fancyhead[L]{%
  \color{structure}%
  \ifdefstring{\ELEGANT@lang}{en}{\itshape}{\kaishu}%
  \rightmark
}
\fi

\fancyfoot[c]{\base{structure}{88}}
\renewcommand{\headrule}{\color{structure}\hrule width\textwidth}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{1pt}

\fancypagestyle{plain}{%
  \renewcommand{\headrulewidth}{0pt}
  \fancyhf{}
  \renewcommand{\headrule}{}
}
\renewcommand{\sectionmark}[1]{\markright{\thesection\; #1}{}}
\renewcommand{\chaptermark}[1]{\markboth{\chaptername \; #1\;}{}}

\newcommand*{\logo}[1]{%
 \def\@logo{\includegraphics[width=4.2cm]{#1}}%
}

\newcommand*{\cover}[1]{%
 \def\@cover{\includegraphics[width=\linewidth]{#1}}%
}

\linespread{1.3}\selectfont

\newcommand\@printMetaInfoItem[1]{%
  \ifcsvoid{@#1}
    {}
    {
      \@format@metaInfo
      \csname @pre@#1\endcsname
      \csname @#1\endcsname \\
    }
}

\renewcommand*{\maketitle}{%
  \hypersetup{pageanchor=false}%
  \begin{titlepage}
  	\newgeometry{margin = 0in}%
  	\setlength\parindent{0pt}%
    % cover image
  	\@cover
    \par
    % rule in color "second"
  	\begingroup
      \setlength{\fboxsep}{0pt}%
      \color{second}%
      \rule{\linewidth}{0.5in}%
    \endgroup
    \par
    % main title
    \vspace{1.5cm}\hspace*{2em}%
  	\parbox{0.8\textwidth}{\bfseries\Huge \@title}
    \par
    % subtitle
    \vspace{.8cm}\hspace{2.5em}%
    \linespread{2.0}\selectfont
    {\color{darkgray}\bfseries\Large \the\subtitle}%
    \par
    % meta info
    \vspace{.8cm}\hspace{3.5em}%
   	\begin{minipage}{0.67\linewidth}
      \linespread{1.5}\selectfont
   		\color{gray}\normalsize
   		\renewcommand{\arraystretch}{0.618}
      \@printMetaInfoItem{author}
      \@printMetaInfoItem{institute}
      \@printMetaInfoItem{date}
      \@printMetaInfoItem{version}
   	\end{minipage}
    \par
    % logo, put on absolute coordinates
   	\begin{tikzpicture}[remember picture,overlay]
		  \node[opacity=0.8,anchor=south east, inner sep=0pt] 
        at ($(current page.south east) + (-0.8in, 1.5in)$) {\@logo};
   	\end{tikzpicture}
    % equote
  	\vfill
  	\centerline{\itshape \@equote}
  	\vspace{1.5cm}
  \end{titlepage}
  \restoregeometry
  \thispagestyle{empty}
}




\RequirePackage{listings} 
\renewcommand{\ttdefault}{cmtt}
\lstdefinestyle{mystyle}{
  basicstyle=%
    \ttfamily
    \lst@ifdisplaystyle\small\fi
}

\lstset{basicstyle=\ttfamily,style=mystyle}

\definecolor{lightgrey}{rgb}{0.9,0.9,0.9}
\definecolor{frenchplum}{RGB}{190,20,83}
\lstset{language=[LaTeX]TeX,
	texcsstyle=*\color{winered},
	numbers=none,
	breaklines=true,
	keywordstyle=\color{winered},
	commentstyle=\color{gray},
	emph={elegantpaper,fontenc,fontspec,xeCJK,FiraMono,xunicode,newtxmath,figure,fig,image,img,table,itemize,enumerate,newtxtext,newtxtt,ctex,microtype,description,times,newtx,booktabs,tabular,PDFLaTeX,XeLaTeX,type1cm,BibTeX,device,color,mode,lang,amsthm,tcolorbox,titlestyle},
	emphstyle={\color{frenchplum}},
	morekeywords={DeclareSymbolFont,SetSymbolFont,toprule,midrule,bottomrule,institute,version,includegraphics,setmainfont,setsansfont,setmonofont ,setCJKmainfont,setCJKsansfont,setCJKmonofont,RequirePackage,figref,tabref,email,maketitle,keywords,definecolor,equote,logo,cover,subtitle,appendix,chapter,hypersetup,mainmatter,tableofcontents},
	frame=single,
	tabsize=2,
	rulecolor=\color{structure},
	framerule=0.2pt,
	columns=flexible,
	% backgroundcolor=\color{lightgrey}
}

%% helper commands used in manual

% change to colorset #1, global
\newcommand*\@color@updateColorset[1]{%
  \ekv{color=#1}%
  \@color@define
}
\let\colorset\@color@updateColorset

% typeset text #1 in color "structure" and colorset #1, local
\newcommand*\colorsetDemo[1]{%
  \begingroup
  \@color@updateColorset{#1}%
  \textcolor{structure}{\lstinline{#1}}%
  \endgroup
}

% draw a 1cm square (with .05cm margin) in color #1
\newcommand*\colorDemo[1]{%
  \begin{tikzpicture}[baseline=0.3cm]
    \clip (-.05, -.05) rectangle +(1.1, 1.1);
    \fill[#1] (0, 0) rectangle (1, 1);
  \end{tikzpicture}
}