--- 
title: "Elegant Bookdown Template"
subtitle: "优雅的 Bookdown 书籍模版"
author: 
  - 黄湘云
date: "2019-05-29"
site: bookdown::bookdown_site
documentclass: elegantbook
bibliography: [book.bib]
biblio-style: apalike
logo: "figure/logo.png"
cover: "figure/cover.jpg"
institute: "Elegant LaTeX Program"
extrainfo: "Victory won't come to us unless we go to it. --- M. Moore"
version: "3.08"
github-repo: XiangyunHuang/ElegantBookdown
classoption: "cn,11pt,fancy,hide"
#indent: 40pt
#subparagraph: yes
description: "This is a bookdown template based on ElegantBook. The output format for this template is bookdown::gitbook and bookdown::pdf_book."
---

\mainmatter

\hypersetup{pageanchor=true}

# Elegant LaTeX 系列模板介绍

Elegant LaTeX 项目组致力于打造一系列美观、优雅、简便的模板方便用户使用。目前由 [ElegantNote](https://github.com/ElegantLaTeX/ElegantNote)， [ElegantBook](https://github.com/ElegantLaTeX/ElegantBook)， [ElegantPaper](https://github.com/ElegantLaTeX/ElegantPaper) 组成，分别用于排版笔记，书籍和工作论文。如果你在使用本模板，推荐最新版本！最新正式版下载地址： [Github](https://github.com/ElegantLaTeX/ElegantBook/releases)。本文将介绍本模板的一些设置内容以及基本使用方法。如果您有其他问题，建议或者意见，欢迎在 Github 上给我们提交 [issues](https://github.com/ElegantLaTeX/ElegantBook/issues) 或者邮件^[<elegantlatex2e@gmail.com>.]联系我们。最近我们新建了一个 QQ 用户交流群（Q 群：692108391），欢迎加入。

## ElegantBook 更新说明

在这几年间，我们收到了很多用户的反馈，主要的问题涉及到字体安装，编码支持，定理浮动，定理跨页，交叉引用等等。我们思前想后，原先让用户安装字体以追求视觉上的美观并不完美，用户陷入了巨大的麻烦，这违背了我们的模板初衷。因此我们在新版中删除了这部分，用户无需安装任何字体。ElegantBook 3.x 版本更新的主要内容有：

1. 删除了自定义字体设置，改用 `ctex` 宏包支持中文；
1. 模板拆分为中英文模式（`lang=cn/en`）；
1. 支持 `PDFLaTeX` 与 `XeLaTeX`；
1. 使用 `tcolorbox` 宏包改写定理类环境，可跨页；
1. 定理类环境名字更新，修复定理环境交叉引用；
1. 更新颜色主题，增加灰色和黑色主题；
1. 颜色名字更新，统一链接颜色；
1. 重新绘制 Elegant LaTeX 的 Logo；
1. 更新封面与装饰物，删除水印；
1. 修正附录相关内容；
1. 增加代码高亮；
1. 美化列表环境；
1. 增加简化模式；
1. 增加 base 隐藏选项。

::: note
由于新版本进行了重构，3.x 版本并不兼容 2.x 版本，如果你想把 2.x 版本的文件转为 3.x 版本，请查看 [跨版本转换](https://github.com/ElegantLaTeX/ElegantBook/wiki/convert)。今后不再回答关于 2.x 版本的问题。
:::

插入图 \@ref(fig:elegantbook-logo) 所示

\begin{figure}

{\centering \includegraphics[width=0.45\linewidth]{figure/logo} 

}

\caption{Elegant Book 标志}(\#fig:elegantbook-logo)
\end{figure}

<!--chapter:end:index.Rmd-->

# ElegantBook 设置说明


## 编译方式

本模板基于基础的 book 文类，所以 book 的选项对于本模板也是有效的。默认编码为 UTF-8，推荐使用 TeX Live 编译。本文编写环境为 Win10 (64bit) + TeX Live 2018，支持 `PDFLaTeX` 以及 `XeLaTeX` 编译。


## 语言模式

本模板内含两套语言环境，改变语言环境会改变图表标题的引导词（图，表），文章结构词（比如目录，参考文献等），以及定理环境中的引导词（比如定理，引理等）。不同语言模式的启用如下：

::: lstlisting
\documentclass[cn]{elegantbook} 
\documentclass[lang=cn]{elegantbook}
::: 

::: remark
不管选用中文环境（`lang=cn`）还是英文环境（`lang=en`）均可输入中文。另外如果在笔记中使用了抄录环境（`lstlisting`），并抄录代码中有中文，请务必使用 `XeLaTeX` 编译。
:::

## 颜色主题

本模板内置 5 组颜色主题，分别为 `green`^[为原先默认主题]、`cyan`、`blue`（默认）、`gray`、`black`。另外还有一个自定义的选项  `nocolor`。调用颜色主题 `green` 的方法为

::: lstlisting
\documentclass[green]{elegantbook} %or
\documentclass[color=green]{elegantbook}
:::

<!-- Table: (\#tab:color-thm) ElegantBook 模板中的颜色主题 -->

<!-- \begin{table}[htbp] -->
<!-- \caption{ElegantBook 模板中的颜色主题\label{tab:color thm}} -->
<!-- \centering -->
<!-- \begin{tabular}{c >{\colorset{green}}c -->
<!--                   >{\colorset{cyan}}c -->
<!--                   >{\colorset{blue}}c -->
<!--                   >{\colorset{gray}}c -->
<!--                   >{\colorset{black}}cc} -->
<!-- \toprule -->
<!-- 	        & \textcolor{structure}{green} -->
<!-- 	        & \textcolor{structure}{cyan} -->
<!-- 	        & \textcolor{structure}{blue} -->
<!-- 	        & \textcolor{structure}{gray} -->
<!-- 	        & \textcolor{structure}{black} -->
<!-- 	        & 主要使用的环境 \\ -->
<!-- \midrule -->
<!-- structure & \colorDemo{structure} -->
<!--   				& \colorDemo{structure} -->
<!--   				& \colorDemo{structure} -->
<!--   				& \colorDemo{structure} -->
<!--   				& \colorDemo{structure} -->
<!--   				& chapter \ section \ subsection \\ -->

<!-- main      & \colorDemo{main} -->
<!--   				& \colorDemo{main} -->
<!--   				& \colorDemo{main} -->
<!--   				& \colorDemo{main} -->
<!--   				& \colorDemo{main} -->
<!--   				& definition \ exercise \ problem \\ -->

<!-- second    & \colorDemo{second} -->
<!--   				& \colorDemo{second} -->
<!--   				& \colorDemo{second} -->
<!--   				& \colorDemo{second} -->
<!--   				& \colorDemo{second} -->
<!--   				& theorem \ lemma \ corollary\\ -->

<!-- third     & \colorDemo{third} -->
<!--   				& \colorDemo{third} -->
<!--   				& \colorDemo{third} -->
<!--   				& \colorDemo{third} -->
<!--   				& \colorDemo{third} -->
<!--   				& proposition \\ -->
<!-- \bottomrule -->
<!-- \end{tabular} -->
<!-- \end{table} -->

如需自定义颜色集，请使用文档类选项 `nocolor` 或 `color=none`，然后在导言区定义 structure、main、second、third 四个颜色，例如：

::: lstlisting
\definecolor{structure}{RGB}{0,0,0}
\definecolor{main}{RGB}{70,70,70}
\definecolor{second}{RGB}{115,45,2}
\definecolor{third}{RGB}{0,80,80}
:::


## 章标题显示风格

本模板内置 2 套*章标题显示风格*，包含 `hang`（默认）与 `display` 两种风格，区别在于章标题单行显示（`hang`）与双行显示（`display`），本说明使用了 `hang`。调用方式为

::: lstlisting
\documentclass[hang]{elegantbook} %or
\documentclass[titlestyle=hang]{elegantbook}
:::

## 数学环境简介

在我们这个模板中，我们定义了两种不同的定理模式 `mode`，包括简单模式（`simple`）和炫彩模式（`fancy`），默认为 `fancy` 模式，不同模式的选择为

::: lstlisting
\documentclass[simple]{elegantbook} %or
\documentclass[mode=simple]{elegantbook}
:::

本模板定义了四大类环境


- *定理类环境*，包含标题和内容两部分，全部定理类环境的编号均以章节编号。根据格式的不同分为 3 种
   
  - **definition** 环境，颜色为 main；
  - **theorem、lemma、corollary**环境，颜色为 second；
  - **proposition** 环境，颜色为 third。

- *示例类环境*，有 **example、exercise、problem** 环境（对应于例，练习，例题），自动编号，编号以章节为单位。
- *证明类环境*，有 **proof、note** 环境，特点是，有引导符或者结尾符，**note** 环境有引导符号，**proof** 环境有证明完毕符号。
- *结论类环境*，有 **conclusion、assumption、property，remark、solution** 环境[^envir]，三者均以粗体的引导词为开头，和普通段落格式一致。

[^envir]: 本模板还添加了一个 result 选项，用于隐藏 `solution` 和 `proof` 环境，默认为显示（`result=answer`），隐藏使用 `result=noanswer`。

### 定理类环境的使用

由于本模板使用了 `tcolorbox` 宏包来定制定理类环境，所以和普通的定理环境的使用有些许区别，定理的使用方法如下：

::: lstlisting
\begin{theorem}{<theorem name>}{<label>}
The content of theorem.
\end{theorem}
:::

第一个必选项 `<theorem name>` 是定理的名字，第二个必选项 `<label>` 是交叉引用时所用到的标签，交叉引用的方法为 `\ref{thm:label}`。请注意，交叉引用时必须加上前缀 `thm:`。

其他相同用法的定理类环境有：

Table: (\#tab:thm-env) 定理类环境

| 环境名      | 标签名 | 前缀 | 交叉引用        |
| :---------- | :---- | :-- | :---------------- |
| definition  | label | def | `\ref{def:label}` |
| theorem     | label | thm | `\ref{thm:label}` |
| lemma       | label | lem | `\ref{lem:label}` |
| corrlary    | label | cor | `\ref{cor:label}` |
| proposition | label | pro | `\ref{pro:label}` |
     
 

### 其他环境的使用

其他三种环境没有选项，可以直接使用，比如 `example` 环境的使用方法与效果：

::: lstlisting
\begin{example}
   This is the content of example environment.
\end{example}
::: 

::: sidebar
This is the content of example environment.
:::

这几个都是同一类环境，区别在于

- 示例环境（example）、练习（exercise）与例题（problem）章节自动编号；
- 注意（note）环境有提醒引导符，证明（proof）环境有证明结束符；
- 结论（conclusion）等环境都是普通段落环境，引导词加粗。


## 装饰物

本模板为章节后的装饰物（base）添加了隐藏选项，有 `show` 和 `hide` 两个选项。

::: lstlisting
\documentclass[hide]{elegantbook} %or
\documentclass[base=hide]{elegantbook}
:::

## 封面和徽标

本模板使用的封面图片来源于 [pixabay.com](https://pixabay.com/en/tea-time-poetry-coffee-reading-3240766/)[^longfontnote]，图片完全免费，可用于任何场景。封面图片的尺寸为 $1280 \times 1024$, 更换图片的时候请**严格**按照封面图片尺寸进行裁剪。推荐一个免费的在线图片裁剪网站 [befunky.com](https://www.befunky.com/create/crop-photo/)。

本文用到的 Logo 比例为 1:1，也即正方形图片，在更换图片的时候请选择合适的图片进行替换。

[^longfontnote]: 感谢 ChinaTeX 提供免费图源网站，另外还推荐 [pexels.com](https://www.pexels.com/)。

## 列表环境

本模板借助于 `tikz` 定制了 `itemize` 和 `enumerate` 环境，其中 `itemize` 环境修改了 3 层嵌套，而 `enumerate` 环境修改了 4 层嵌套（仅改变颜色）。示例如下

<!-- :::: {.columns} -->
<!-- ::: {.column width="50%"} -->
<!-- - first item of nesti; -->
<!-- - second item of nesti; -->
<!--   - first item of nestii; -->
<!--   - second item of nestii; -->
<!--      - first item of nestiii; -->
<!--      - second item of nestiii. -->
<!-- ::: -->
<!-- ::: {.column width="50%"} -->
<!-- 1. first item of nesti; -->
<!-- 1. second item of nesti; -->
<!--    1. first item of nestii; -->
<!--    1. second item of nestii; -->
<!--       1. first item of nestiii; -->
<!--       1. second item of nestiii. -->
<!-- ::: -->
<!-- :::: -->


## 参考文献 {#ref}

此模板使用了 BibTeX 来生成参考文献，在中文示例中，使用了 `gbt7714` 宏包。参考文献示例： 使用了中国一个大型的 P2P 平台（人人贷）的数据来检验男性投资者和女性投资者在投资表现上是否有显著差异。

你可以在谷歌学术，Mendeley，Endnote 中获得文献条目（bib item），然后把它们添加到 `reference.bib` 中。在文中引用的时候，引用它们的键值（bib key）即可。注意需要在编译的过程中添加 BibTeX 编译。如果你想添加未引用的文献，可以使用

::: lstlisting
\nocite{EINAV2010,Havrylchyk2018} %or include some bibitems
\nocite{*} %include all the bibitems
:::

## 添加序章

如果你想在第一章前面添序章，不改变原本章节序号，可以在第一章内容前面使用

::: lstlisting
\chapter*{Introduction}
\addcontentsline{toc}{chapter}{Introduction} 
\markboth{Introduction}{} 
The content of introduction.
:::

<!--chapter:end:01-introduction.Rmd-->

# ElegantBook 写作示例

<!-- ::: introduction -->
- 积分定义
- Fubini 定理
- 最优性原理
- 柯西列性质
- 韦达定理
<!-- ::: -->

## Lebesgue 积分

在前面各章做了必要的准备后，本章开始介绍新的积分。在 Lebesgue 测度理论的基础上建立了 Lebesgue 积分，其被积函数和积分域更一般，可以对有界函数和无界函数统一处理。正是由于 Lebesgue 积分的这些特点，使得 Lebesgue 积分比 Riemann 积分具有在更一般条件下的极限定理和累次积分交换积分顺序的定理，这使得 Lebesgue 积分不仅在理论上更完善，而且在计算上更灵活有效。

Lebesgue 积分有几种不同的定义方式。我们将采用逐步定义非负简单函数，非负可测函数和一般可测函数积分的方式。

由于现代数学的许多分支如概率论、泛函分析、调和分析等常常用到一般空间上的测度与积分理论，在本章最后一节将介绍一般的测度空间上的积分。

### 积分的定义

我们将通过三个步骤定义可测函数的积分。首先定义非负简单函数的积分。以下设 $E$ 是 $\mathcal{R}^n$ 中的可测集。

::: sidebar
设 $f(x)=\sum\limits_{i=1}^{k} a_i \chi_{A_i}(x)$ 是 $E$ 上的非负简单函数，其中 $\{A_1,A_2,\ldots,A_k\}$ 是 $E$ 上的一个可测分割，$a_1,a_2,\ldots,a_k$ 是非负实数。定义 $f$ 在 $E$ 上的积分为 $\int_{a}^b f(x)$

\begin{equation}
   \int_{E} f dx = \sum_{i=1}^k a_i m(A_i) \pi \alpha\beta\sigma\gamma\nu\xi\epsilon\varepsilon. 
   (\#eq:inter)
\end{equation}

一般情况下 $0 \leq \int_{E} f dx \leq \infty$。若 $\int_{E} f dx < \infty$，则称 $f$ 在 $E$ 上可积。
:::

一个自然的问题是，Lebesgue 积分与我们所熟悉的 Riemann 积分有什么联系和区别？在 4.4 在我们将详细讨论 Riemann 积分与 Lebesgue 积分的关系。这里只看一个简单的例子。设 $D(x)$ 是区间 $[0,1]$ 上的 Dirichlet 函数。即 $D(x)=\chi_{Q_0}(x)$，其中 $Q_0$ 表示 $[0,1]$ 中的有理数的全体。根据非负简单函数积分的定义，$D(x)$ 在 $[0,1]$ 上的 Lebesgue 积分为

\begin{equation}
   \label{inter2}
   \int_0^1 D(x)dx = \int_0^1 \chi_{Q_0} (x) dx = m(Q_0) = 0
\end{equation}

即 $D(x)$ 在 $[0,1]$ 上是 Lebesgue 可积的并且积分值为零。但 $D(x)$ 在 $[0,1]$ 上不是 Riemann 可积的。

有界变差函数是与单调函数有密切联系的一类函数。有界变差函数可以表示为两个单调递增函数之差。与单调函数一样，有界变差函数几乎处处可导。与单调函数不同，有界变差函数类对线性运算是封闭的，它们构成一线空间。下面的练习题是一个性质的证明。

::: sidebar
设 $f \notin\in L(\mathcal{R}^1)$，$g$ 是 $\mathcal{R}^1$ 上的有界可测函数。证明函数

\begin{equation}
   \label{ex:1}
   I(t) = \int_{\mathcal{R}^1} f(x+t)g(x)dx \quad t \in \mathcal{R}^1
\end{equation}

是 $\mathcal{R}^1$ 上的连续函数。
:::

::: sidebar
即 $D(x)$ 在 $[0,1]$ 上是 Lebesgue 可积的并且积分值为零。但 $D(x)$ 在 $[0,1]$ 上不是 Riemann 可积的。
:::

::: sidebar
即 $D(x)$ 在 $[0,1]$ 上是 Lebesgue 可积的并且积分值为零。但 $D(x)$ 在 $[0,1]$ 上不是 Riemann 可积的。
:::

::: sidebar
Fubini 定理

1. 若 $f(x,y)$ 是 $\mathcal{R}^p\times\mathcal{R}^q$ 上的非负可测函数，则对几乎处处的 $x\in \mathcal{R}^p$，$f(x,y)$ 作为 $y$ 的函数是 $\mathcal{R}^q$ 上的非负可测函数，$g(x)=\int_{\mathcal{R}^q}f(x,y) dy$ 是 $\mathcal{R}^p$ 上的非负可测函数。并且

  \begin{equation}
     \int_{\mathcal{R}^p\times\mathcal{R}^q} f(x,y) dxdy=\int_{\mathcal{R}^p}\left(\int_{\mathcal{R}^q}f(x,y)dy\right)dx.
  \end{equation}

1. 若 $f(x,y)$ 是 $\mathcal{R}^p\times\mathcal{R}^q$ 上的可积函数，则对几乎处处的 $x\in\mathcal{R}^p$，$f(x,y)$ 作为 $y$ 的函数是 $\mathcal{R}^q$ 上的可积函数，并且 $g(x)=\int_{\mathcal{R}^q}f(x,y) dy$ 是 $\mathcal{R}^p$ 上的可积函数。而且成立。
:::

::: note
在本模板中，引理（lemma），推论（corollary）的样式和定理 的样式一致，包括颜色，仅仅只有计数器的设置不一样。
:::

我们说一个实变或者复变量的实值或者复值函数是在区间上平方可积的，如果其绝对值的平方在该区间上的积分是有限的。所有在勒贝格积分意义下平方可积的可测函数构成一个希尔伯特空间，也就是所谓的 $L^2$ 空间，几乎处处相等的函数归为同一等价类。形式上，$L^2$ 是平方可积函数的空间和几乎处处为 0 的函数空间的商空间。

最优性原理
:  如果 $u^*$ 在 $[s,T]$ 上为最优解，则 $u^*$ 在 $[s, T]$ 任意子区间都是最优解，假设区间为 $[t_0, t_1]$ 的最优解为 $u^*$ ，则 $u(t_0)=u^{*}(t_0)$，即初始条件必须还是在 $u^*$ 上。

我们知道最小二乘法可以用来处理一组数据，可以从一组测定的数据中寻求变量之间的依赖关系，这种函数关系称为经验公式。本课题将介绍最小二乘法的精确定义及如何寻求点与点之间近似成线性关系时的经验公式。假定实验测得变量之间的 $n$ 个数据，则在平面上，可以得到 $n$ 个点，这种图形称为 “散点图”，从图中可以粗略看出这些点大致散落在某直线近旁, 我们认为其近似为一线性函数，下面介绍求解步骤。

\begin{figure}

{\centering \includegraphics[width=0.45\linewidth]{image/scatter} 

}

\caption{散点图示例 $\hat{y}=a+bx$}(\#fig:scatter)
\end{figure}

以最简单的一元线性模型来解释最小二乘法。什么是一元线性模型呢？监督学习中，如果预测的变量是离散的，我们称其为分类（如决策树，支持向量机等），如果预测的变量是连续的，我们称其为回归。回归分析中，如果只包括一个自变量和一个因变量，且二者的关系可用一条直线近似表示，这种回归分析称为一元线性回归分析。如果回归分析中包括两个或两个以上的自变量，且因变量和自变量之间是线性关系，则称为多元线性回归分析。对于二维空间线性是一条直线；对于三维空间线性是一个平面，对于多维空间线性是一个超平面。

::: sidebar
柯西列的性质

1. $\{x_k\}$ 是柯西列，则其子列 $\{x_k^i\}$ 也是柯西列。
1. $x_k\in \mathcal{R}^n$，$\rho(x,y)$ 是欧几里得空间，则柯西列收敛，$(\mathcal{R}^n,\rho)$ 空间是完备的。
:::

::: sidebar
回归分析（regression analysis）是确定两种或两种以上变量间相互依赖的定量关系的一种统计分析方法。运用十分广泛，回归分析按照涉及的变量的多少，分为一元回归和多元回归分析；按照因变量的多少，可分为简单回归分析和多重回归分析；按照自变量和因变量之间的关系类型，可分为线性回归分析和非线性回归分析。
::: 

<!--chapter:end:02-example.Rmd-->

\cleardoublepage 

# (APPENDIX) 附录 {-}

# 基本数学工具

本附录包括了计量经济学中用到的一些基本数学，我们扼要论述了求和算子的各种性质，研究了线性和某些非线性方程的性质，并复习了比例和百分数。我们还介绍了一些在应用计量经济学中常见的特殊函数，包括二次函数和自然对数，前 4 节只要求基本的代数技巧，第 5 节则对微分学进行了简要回顾；虽然要理解本书的大部分内容，微积分并非必需，但在一些章末附录和第 3 篇某些高深专题中，我们还是用到了微积分。

## 求和算子与描述统计量

**求和算子**是用以表达多个数求和运算的一个缩略符号，它在统计学和计量经济学分析中扮演着重要作用。如果 $\{x_i: i=1, 2, \ldots, n\}$ 表示 $n$ 个数的一个序列，那么我们就把这 $n$ 个数的和写为：

$$\sum_{i=1}^n x_i \equiv x_1 + x_2 +\cdots + x_n$$


# 最小示例

::: lstlisting
\documentclass[lang=cn,11pt]{elegantbook}
% title info
\title{Title}
\subtitle{Subtitle is here}
% bio info
\author{Your Name}
\institute{XXX University}
\date{\today}
% extra info
\version{1.00}
\equote{Victory won\rq t come to us unless we go to it. --- M. Moore}
\logo{logo.png}
\cover{cover.jpg}

\begin{document}

\maketitle
\tableofcontents
\mainmatter
\hypersetup{pageanchor=true}
% add preface chapter here if needed
\chapter{Example Chapter Title}
The content of chapter one.

\bibliography{reference}

\end{document}
:::

We have finished a nice book.

<!--chapter:end:05-appendix.Rmd-->



<!--chapter:end:06-references.Rmd-->

