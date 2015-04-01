---
layout: post
title:  " Mobile web content adaptation-Understanding DPI"
date:   2015-03-01 17:07:00
categories: jekyll update

---


最近甲方提出了一个需求(怎么又是这个开头)，要首页在手机竖屏的时候显示两个图标一排，横屏的时候和电脑显示方式一致。他一致强调他的手机lumia 920是分辨率1280x768px,所以横过来应该理所应当和电脑（1440x900px）一致。但是事情没有他想象的那么简单，因为CSS 像素和设备像素不是对等的，它们之间需要通过设备像素比(device pixel ratio) 进行换算。

<!-- more -->

![](../assets/article_images/2015/dpi-1.png)

这是[dpilove](http://dpi.lv/)上查询出的iphone6的参数，先解释术语：

* Diagonal: 就是常说的屏幕尺寸，比如iphone6是4.7寸，也就是屏幕对角线长度为11.9cm左右(1 inch = 2.54cm)
* Resolution: 分辨率，各类输出设备纵、横方向像素个数，即每英寸可产出的点数。
* DPI: Dots per inch，打印分辨率，屏幕每英寸中的dots，可以理解为像素密度。是打印机、鼠标等设备分辨率的单位。这是衡量打印机打印精度的主要参数之一，通常讲的打印机分辨率是多少DPI，指的是"在该打印机最高分辨率模式下,每英寸所能打印的最多"理论"墨点数"。做PS设计稿的时候300PPI就可以用于打印了（下图中的PS分辨率就是DPI）。
* PPI: Pixels per inch，又叫采样率，经常和DPI混用。印刷时计算的网点（Dot）和电脑显示器的显示像素（Pixel）并非相同，所以准确来说应该用PPI(Pixel Per Inch)表示数字影像的解析度，以区分二者。
* dppx: Number of dots per px unit. [一篇博客](http://madewithdrew.com/blog/working-with-dppx/)说1dppx = 96dpi,这我就不明白了，根据dpilove明显不是这样的。已经在博客上留言了坐等回复。
* dip(dp):Density independent pixels 
* dpr: device pixel ratio设备像素比, Number of device pixels per CSS Pixel,其实我觉得dpilove中dppx应该指的是dpr.

![](../assets/article_images/2015/dpi-2.png)


Diagonal,Resolution和DPI的关系如下图（以iphone6为例，resolution为750*1334px）：

![](../assets/article_images/2015/dpi-3.png)

也就是说Diagonal * DPI（长度 * 密度）即可计算得到对角线的像素值。

而DPI和dppx(dpr?)看似正相关，实际上是没有换算关系的。

扯远了。回到正题。

设备像素(device pixel)是物理概念，一般指的是设备中使用的物理像素。

CSS 像素(css pixel) 是Web 编程的概念，一般指的是 CSS 样式代码中使用的逻辑像素。在 CSS 规范中，长度单位可以分为两类，绝对(absolute)单位以及相对(relative)单位。px 是一个相对单位，相对的是设备像素(device pixel)。

由于iphone6等手机dpr为2（Lumia 920为1.6）,所以换算下来是1334/2= 667, 小于bootstrap .col-xs和.col-sx之间的断点768px。

那么要怎么解决呢，其实我是想把断点设置为480px,两个办法：

1. 订制bootstrap: http://v3.bootcss.com/customize/
	换掉bootstrap的sm断点,这样有两个问题，一个是需要修改container的宽度，第二个是屏幕小于992px~480px这个范围太大，如果显示sm的样式会显得非常奇怪，页面内容太小。
	
2. @media query
	通过media query设置断点，而不依赖bootstrap，这个方法值得再开一题了。正在尝试中。 


经此一役，觉得移动设备适配和响应式设计果然是个大课题(突然有点想直接用width:100%来解决这一切了..)，但是在移动设备普及的今天，我听到很多中年人都说自己很少开电脑了，所以网站支持移动设备的设计肯定还是一个大趋势，值得深究。希望这个思考可以形成一个系列的博客^ ^