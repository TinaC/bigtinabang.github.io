---
layout: post
title:  "Webpack materials"
date:   2016-06-28 11:51:10
categories: jekyll update

---

之前一直用jekyll来引入头文件，然而这种方式并不推荐，而且jekyll在公司windows上配置艰难。于是想着是时候学习webpack了，毕竟大V门对webpack一片看好，应该不那么容易被淘汰吧，而且如果改天要学react，门槛也低一点。本篇博客并不是webpack的教程，而是一个学习资料集合。旨在整理这一周的学习内容，并回顾我的学习方法，以期改进。

<!-- more -->

第一步，肯定是看官方文档，我跟着他们的[getting-started](http://webpack.github.io/docs/tutorials/getting-started/)跑了一遍，有的结果没成功也就算了，关键是每一步的解释都没有，做完了我也不知道自己在干什么，编译结果贴出来了也没有做解释。每篇文档之间结构不清晰，对小白很不友好。关键是官方文档还加了Disqus， 感受一下来自评论区的愤怒：

![](/assets/article_images/2016/original.jpg)

Google选了一些文章，其中![Why Can’t Anyone Write a Simple Webpack Tutorial?](https://medium.com/@dtothefp/why-can-t-anyone-write-a-simple-webpack-tutorial-d0b075db35ed#.oxc8f5t1r) 因为其标题说出了我的心声所以仔细看了一下，其中介绍了![script-loader](https://github.com/webpack/script-loader),初步对loader有了一个概念，为了看懂loaders.test，复习了一下![正则](https://developer.mozilla.org/en/docs/Web/JavaScript/Guide/Regular_Expressions)

看完以后发现我对模块化的理解还不够深入，之前偷懒没有学习require.js/![sea.js](https://github.com/seajs/seajs/issues/269)，还庆幸这些框架我还没学就已经死掉了...现在才发现这些框架虽然过时了，但是其中的思想被后人借鉴，如果深入学习就能变成学习后来框架的垫脚石，从而减少门槛。

>世界上，有两种比较流行的 JavaScript 模块化体系，一个是 Node 实现的 CommonJS，另外一个是 AMD。很多类库都同时支持 AMD 和 CommonJS，但是不支持 CMD。或许国内有很多 CMD 模块，但并没有在世界上流行起来。（CMD也是一种CommonJS, 玉伯提出的） --寸志

寸志在！[Hello Sea.js]（http://island205.github.io/HelloSea.js/getting-started.html）中介绍了前端模块化和sea.js的使用，并且写了如何编写自己的模块加载器。对理解js模块化思想很有帮助（这是人家15年写的博客啊...）

![webpack-for-fools傻瓜式指南](https://github.com/vikingmute/webpack-for-fools)是迄今为止对我帮助最大的webpack指南，提供了可运行代码，并且使用了webpack-dev-server，sass-loader, babel-loader，source-map等loader、插件，不用再使用require,而是可以直接使用es6 import,模块化技术更进一步！对该文章的config.js，我每一句都看了并补充了注释。

在实践这篇博客的过程中，对于![html-webpack-plugin](https://www.npmjs.com/package/html-webpack-plugin)的使用博主并没有讲的太细致，所以看了官方文档。
这个插件可以帮你生成HTML。本来可以自己在build文件夹里面手动建一个index.html文件夹，然后再把合并以后的js引用在里面，但是这样有些麻烦，所以html-webpack plugin可以自动快速的帮我们生成HTML。

如果要生成多个HTML文件，则在plugins中声明多次HtmlWebpackPlugin()；

如果生成的HTML不满足需求，可以自己编写HTML模板，采用inject方式引入资源。

此外，webpack.config.js采用Node.js编写，![path.resolve()](https://nodejs.org/docs/latest/api/path.html#path_path_resolve_path)和![_dirname](https://nodejs.org/docs/latest/api/globals.html#globals_dirname)等方法和全局变量可以在node文档中查到。

腾讯的一个哥们提供了一个更复杂的![webpack bootstrap](https://github.com/chemdemo/chemdemo.github.io/issues/10),看完后对chunks等概念有了更清晰的理解，并且教了如何搭建一个local webserver。

这个哥们分析了webpack的![部分源码](https://aztack.wang/post/about-webpack.html),这种学习方式值得学习。

待看的![进阶文章](http://www.alloyteam.com/2016/01/webpack-use-optimization/)








我们知道Mac OS X和unix的文件系统结构和命令有很多相似的地方，从根目录下了解起：

![](/assets/article_images/2015/filesystem1.png)

简单介绍一下其中几个文件夹
<table>
	<tr>
		<td>/cores</td>
		<td>(实际位置在/private/cores，/cores是软链接)在一些情况下当程序崩溃时，它会将它的core（崩溃时程序状态的拷贝）存到这个目录下。这只有在程序员尝试debug时才有用。</td>
	</tr>
	<tr>
		<td>/dev</td>
		<td>这个文件夹包含device special file,里面有我们熟悉的stderr,stdin,stdout。这些文件不是传统意义上的文件，更像是系统用来跟踪与该文件相关设备（磁盘，键盘，网络连接等）的占位符。</td>
	</tr>
	<tr>
		<td>/etc</td>
		<td>(实际位置在/private/etc，/etc是软链接)和unix系统一样，包含系统配置文件</td>
	</tr>
<table>

今天了解的重点的bin & sbin文件夹,mac中有三对bin & sbin文件夹，分别在/,  /usr/, /usr/local/ 路径下，他们都用于保存二进制可执行文件，bin和sbin的区别以/目录下为例：

bin是用于保存date, echo,mkdir,mv,ls这些所有用户通用常见命令的二进制文件


![](/assets/article_images/2015/filesystem2.png)

而sbin是用于保存mount等超级用户才能使用的“危险”命令的二进制文件

![](/assets/article_images/2015/filesystem3.png)

sbin文件夹所有用户都可以访问，但是运行需要管理员权限。

大部分程序都保存在/usr/ 下，比如man, make，zip。

一些比较重要的核心程序，比如在启动阶段需要的，是保存在 / 目录下，

本地安装的一些程序是在  /usr/local 下。在新的OS X系统中，/usr/local是空的。

***

顺便谈一下在运行可执行程序时为什么要加./

![](/assets/article_images/2015/filesystem4.jpg)

问题在于我没有区分可执行文件，和普通数据文件。对于普通数据文件./xxx  xxx都表示默认当前目录下的xxx，但是为什么可执行程序没有默认在当前目录下寻找呢？原因在于可执行程序会在PATH里找，比如当我们输入jekyll时系统不会问它在哪儿，因为它在某一个PATH指明的位置。简单说来，如果没有路径，数据文件默认在当前路径找。可执行文件在PATH里找。

那么如何让可执行文件也在当前路径找呢？简单，将当前路径加入到PATH就OK。

输入：PATH=$PATH:.  $PATH代表原值，:用于分割

![](/assets/article_images/2015/filesystem5.jpg)

加好啦！这样直接运行start.sh就OK啦
