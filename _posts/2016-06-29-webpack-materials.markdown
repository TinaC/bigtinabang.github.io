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

Google选了一些文章，其中[Why Can’t Anyone Write a Simple Webpack Tutorial?](https://medium.com/@dtothefp/why-can-t-anyone-write-a-simple-webpack-tutorial-d0b075db35ed#.oxc8f5t1r) 因为其标题说出了我的心声所以仔细看了一下，其中介绍了[script-loader](https://github.com/webpack/script-loader),初步对loader有了一个概念，为了看懂loaders.test，复习了一下[正则](https://developer.mozilla.org/en/docs/Web/JavaScript/Guide/Regular_Expressions)

看完以后发现我对模块化的理解还不够深入，之前偷懒没有学习require.js/[sea.js](https://github.com/seajs/seajs/issues/269)，还庆幸这些框架我还没学就已经死掉了...现在才发现这些框架虽然过时了，但是其中的思想被后人借鉴，如果深入学习就能变成学习后来框架的垫脚石，从而减少门槛。

>世界上，有两种比较流行的 JavaScript 模块化体系，一个是 Node 实现的 CommonJS，另外一个是 AMD。很多类库都同时支持 AMD 和 CommonJS，但是不支持 CMD。或许国内有很多 CMD 模块，但并没有在世界上流行起来。（CMD也是一种CommonJS, 玉伯提出的） --寸志

寸志在[Hello Sea.js](http://island205.github.io/HelloSea.js/getting-started.html)中介绍了前端模块化和sea.js的使用，并且写了如何编写自己的模块加载器。对理解js模块化思想很有帮助（这是人家15年写的博客啊...）

[webpack-for-fools傻瓜式指南](https://github.com/vikingmute/webpack-for-fools)是迄今为止对我帮助最大的webpack指南，提供了可运行代码，并且使用了webpack-dev-server，sass-loader, babel-loader，source-map等loader、插件，不用再使用require,而是可以直接使用es6 import,模块化技术更进一步！对该文章的config.js，我每一句都看了并补充了注释。

在实践这篇博客的过程中，对于[html-webpack-plugin](https://www.npmjs.com/package/html-webpack-plugin)的使用博主并没有讲的太细致，所以看了官方文档。
这个插件可以帮你生成HTML。本来可以自己在build文件夹里面手动建一个index.html文件夹，然后再把合并以后的js引用在里面，但是这样有些麻烦，所以html-webpack plugin可以自动快速的帮我们生成HTML。

如果要生成多个HTML文件，则在plugins中声明多次HtmlWebpackPlugin()；

如果生成的HTML不满足需求，可以自己编写HTML模板，采用inject方式引入资源。

此外，webpack.config.js采用Node.js编写，[path.resolve()](https://nodejs.org/docs/latest/api/path.html#path_path_resolve_path)和[_dirname](https://nodejs.org/docs/latest/api/globals.html#globals_dirname)等方法和全局变量可以在node文档中查到。

腾讯的一个哥们提供了一个更复杂的[webpack bootstrap](https://github.com/chemdemo/chemdemo.github.io/issues/10),看完后对chunks等概念有了更清晰的理解，并且教了如何搭建一个local webserver。

这个哥们分析了webpack的[部分源码](https://aztack.wang/post/about-webpack.html),这种学习方式值得学习。

待看的[进阶文章](http://www.alloyteam.com/2016/01/webpack-use-optimization/)
