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
