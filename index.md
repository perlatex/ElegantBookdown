--- 
title: "Elegant Bookdown Template"
subtitle: "优雅的 Bookdown 书籍模版"
author: 
  - 黄湘云
date: "2019-06-05"
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

<div class="figure" style="text-align: center">
<img src="figure/logo.png" alt="Elegant Book 标志" width="45%" />
<p class="caption">(\#fig:elegantbook-logo)Elegant Book 标志</p>
</div>
