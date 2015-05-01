---
layout: post
title:  "Mobile Web Content Adaptation —— Understanding DPI"
date:   2015-04-01 17:07:00
categories: jekyll update

---


最近甲方提出了一个需求(怎么又是这个开头)，要首页在手机竖屏的时候显示两个图标一排，横屏的时候和电脑显示方式一致。他一致强调他的手机lumia 920是分辨率1280x768px,所以横过来应该理所应当和电脑（1440x900px）一致。但是事情没有他想象的那么简单。

<!-- more -->

因为CSS像素（CSS DPI）和设备像素（Physic DPI）不是对等的，它们之间需要通过设备像素比(device pixel ratio) 进行换算。
![](/assets/article_images/2015/dpi-1.png)

这是[dpilove](http://dpi.lv/)上查询出的iphone6的参数，先解释术语：

* Diagonal: 就是常说的屏幕尺寸，比如iphone6是4.7寸，也就是屏幕对角线长度为11.9cm左右(1 inch = 2.54cm)
* Resolution: 分辨率，各类输出设备纵、横方向像素个数，即每英寸可产出的点数。
* DPI（Dots per Inch）是密度单位，分两种: 
	* Dots per physical inch，打印分辨率，屏幕每英寸中的dots，可以理解为像素密度。是打印机、鼠标等设备分辨率的单位。这是衡量打印机打印精度的主要参数之一，通常讲的打印机分辨率是多少DPI，指的是"在该打印机最高分辨率模式下,每英寸所能打印的最多"理论"墨点数"。做PS设计稿的时候300PPI就可以用于打印了（下图中的PS分辨率就是DPI）。
![](/assets/article_images/2015/dpi-2.png)
	* Dots per CSS inch, 和屏幕DPI不同，譬如iPhone3GS的物理DPI是320x480px，iPhone 4的物理DPI是640x960px，但是他们同样的屏幕宽度，iPhone 4就需要模拟显示同样的布局，也就是假装自己是320x480px，3GS中显示一个像素的内容4需要用2x2个像素显示。也就是retina屏幕（不过最早设计dppx > 1的屏幕好像是Samsung）。

* PPI: Pixels per inch，又叫采样率，也是密度单位，经常和DPI混用。从技术角度说，“像素”（pixel）只存在于计算机显示领域，而“点”（dot）只出现于打印或印刷领域。所以准确来说应该用PPI(Pixel Per Inch)表示数字影像的解析度，以区分二者。

DPI用来表示输出设备的输出精度，如打印机，显示器

DPI表示的是 像点/英寸（每英寸长度上有多少个打印点或像点）

PPI用来表示输入设备的输入精度，如扫描仪，数码相机

PPI表示的是　像素/英寸（每英寸长度上有多少个像素）

像点和像素关系是这样的，一个像点可以是一个或几个像素，一个像素也可以是一个或几个像点， 比如我们打印一张分辨率为100PPI的照片，打印机的打印分辨率设为300DPI，这时三个打印点表现一个像素，如果我们打印一张600PPI的照片， 同样以300DPI来打印这时一个打印点表现两个像素。

DPI和PPI其实是和前端没太大关系，只是知道了这个以后就被绕晕了，感觉不搞清楚不行了。在很早很早以前，PPI根据定义是屏幕逻辑像素px/物理像素inch, 大概是72ppi左右，但是实际上window都设置默认值为96ppi，也就是说ppi不再是一个计算得到的值，而是一个可设置的coefficient，代表着一个inch中包含多少个像素点。想想在windows中我们设置分辨率这个场景就可以理解了（mac不能用户设置，大概是因为它不需要去考虑各种厂商的不同显示器吧）。

* dppx: Number of dots per px unit. [一篇博客](http://madewithdrew.com/blog/working-with-dppx/)说1dppx = 96dpi,应该不是说他们的转化关系，而是[大部分电脑显示器的dpi值](http://blogs.msdn.com/b/fontblog/archive/2005/11/08/where-does-96-dpi-come-from-in-windows.aspx)。

	之前说到CSS DPI和物理DPI不同，所以需要利用转化。比如CSS中width:100px的元素在普通屏幕上是100物理像素点，但是在retina等屏幕上是200物理像素点，所以retina屏幕的dppx=2（Dots per physical inch/Dots per CSS inch）
	
 
* dpr: device pixel ratio设备像素比, Number of device pixels per CSS Pixel,dpilove中dppx就是dpr.

* dip/dp:Density independent pixels，设备独立像素,[Google的官方说明](http://developer.android.com/guide/practices/screens_support.html) 指出 px = dp * (dpi / 160)，在240dpi的屏幕中，1dp等于1.5物理像素，以dp替代px为单位，可以避免同样物理宽度不同像素的设备显示宽度不同。至于为什么以160ppi屏幕为标准，[知乎上有讨论](http://www.zhihu.com/question/20697111)(因为第一款Android设备是属于160ppi的)。
* sp:[折折熊](http://zhuanlan.zhihu.com/zhezhexiong/19565895)博客中还提到了sp单位，主要是用在移动设计上的单位。但是根据我们前端的解决方案可能更多采用em/rem去作为字体单位。
>在Android设计原则中，有提到这两个单位(sp,dp)，他建议文字的尺寸一律用sp单位，非文字的尺寸一律使用dp单位。例如textSize="16sp"、layout_width="60dp"。


Diagonal,Resolution和DPI的关系如下图（以iphone6为例，resolution为750*1334px）：

![](/assets/article_images/2015/dpi-3.png)

也就是说知道屏幕分辨率（Resolution）和屏幕尺寸（Diagonal）根据勾股定理就可以计算出该屏幕的DPI。

而DPI和dppx(dpr)看似正相关，实际上是没有换算关系的。

这个问题实在是太晕了，因为涉及到多个领域，譬如其实android里面没有ppi这个概念，对应的是Device pixel ratio（屏幕密度），两者是相等的。ppi是设计们常见的单位，程序员们又很少用到。


扯远了。回到正题。

我们可以用chrome的device mode来模拟不同分辨率与dpr的手机

![](/assets/article_images/2015/dpi-4.png)


注意这里的分辨率是经过dpr转换的。由于iphone6等手机dpr为2（Lumia 920为1.6）,所以换算下来是1334/2= 667, 小于bootstrap .col-xs和.col-sx之间的断点768px。

那么要怎么解决呢，其实我是想把断点设置为480px,两个办法：

1. 订制bootstrap: http://v3.bootcss.com/customize/
	换掉bootstrap的sm断点,这样有两个问题，一个是需要修改container的宽度，第二个是屏幕小于992px~480px这个范围太大，如果显示sm的样式会显得非常奇怪，页面内容太小。
	
2. @media query
	通过media query设置断点，而不依赖bootstrap，这个方法值得再开一题了。正在尝试中。 
	media query除了根据px设置断点，还可以根据dppx设置：
	<pre><code>
	 @media only screen and (min-resolution: 2dppx) {
     .comp {
         background-image: url(image@2x.png);
     }
 }
</code></pre>

经此一役，觉得移动设备适配和响应式设计果然是个大课题(突然有点想直接用width:100%来解决这一切了..)，但是在移动设备普及的今天，我听到很多中年人都说自己很少开电脑了，所以网站支持移动设备的设计肯定还是一个大趋势，值得深究。希望这个思考可以形成一个系列的博客^ ^