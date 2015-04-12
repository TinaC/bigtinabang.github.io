---
layout: post
title:  "Mobile Web Content Adaptation —— Add Breakpoint For Bootstrap"
date:   2015-04-06 15:30:00
categories: jekyll update

---

接上一篇，因为大部分手机的分辨率经过dpr的转换都是横向300~400px，纵向500~700px（iphone 6: 375×667px, iphone 6+: 414×736px，三星Galaxy Note 3: 360×640px...），所以在480px设置一个响应式断点（不是调试那个断点啦!）是比较合适的，可以达到手机横竖屏显示不同效果。

<!-- more -->

![](/assets/article_images/2015/breakpoint.png)
可以看到bootstrap也是以480为一个断点，移动设备就一个760实在是太少啦。

其实已经有很多人在[github](https://github.com/twbs/bootstrap/issues/10203)上提出了这个问题

我采用的[这个方案](https://gist.github.com/andyl/6360906)。

简而言之就是在加入一个col-ms-*，以应用在大于480px的情况下。
使用:
采用less编译，用'@screen'替换 '$screen', 用'@grid'替换'$grid'，然后@import 'bootstrap.less';
    
{% highlight html %}
<head>
    <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="bower_components/bootstrap/css/bootstrap_ms.css">
</head>

	<div class="col-xs-6 col-ms-4">
	
{% endhighlight %}

应用效果：

![](/assets/article_images/2015/bp-2.png)


注意事项:

1. bootstrap 3是默认移动设备优先的
2. 如果不设置col-*, 就是display:block默认占据一整行。
3. media query如果几条表达式同时成立，按CSS默认优先级规则后者覆盖前者。
4. .col-sm-* 并不是应用在992px＞resolution≥768px的情况下，而只是≥768px，也就是说大于768px的所有都会应用上，除非其他media query被覆盖。而.col-xs-* 是应用在resolution<768px。

之前一直在找有没有对bootstrap更深入讲解的教程，现在发现通过这种拓展库方式才是更深入的了解，要更细致应该直接去读源码。这下总算是理解了bootstrap的栅格系统了。
