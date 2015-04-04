---
layout: post
title:  "CSS Specificity"
date:   2015-02-13 19:31:20
categories: jekyll update

---


CSS Specificity 就是我们通常理解的CSS选择器优先级/权重。通常我们大概知道CSS选择器之间的优先级关系，比如id选择器优先级高于class选择器，但是具体是什么计算规则呢？就需要CSS Specificity来回答了。

<!-- more -->

CSS Specificity由四个部分组成，如0，0，0，0.计算规则如下：

1. 每多一个html内部的内联样式，加1，0，0，0
2. 每多一个id选择器，加0，1，0，0  
3. 每多一个类选择器，属性选择器或伪类选择器，加0，0，1，0
4. 每多一个元素选择器，伪元素选择器，加0，0，0，1
5. 每多一个通配选择符（*），加0，0，0，0 
6. !important是最优先应用的

关于5，想到*.class与.class等价就不难理解了。
关于6，实际上是将有!important样式声明的之间互相按照前五条互相比较，优先应用，然后再考虑其他样式的优先级。

来个图帮助记忆：
![](/assets/article_images/2015/cssSpecificity.png)

( 图片来自<http://specificity.keegan.st> )

例子：
{% highlight css %}
*.bright {color:yellow;} /* 0,0,1,0*/
div#sidebar *[href] {color:silver;} /*0,1,1,0*/
html > body table tr[id="totals"] td ul > li {color: maroon;} /*0,0,1,7*/

{% endhighlight %}

有些网站这样描述CSS优先级：

Elements - 1 points

Classes - 10 points

Identifiers - 100 points

Inline Styling - 1000 points

我认为这样很容易造成误解，好像这四个值之间有进位关系一样。某些程序员看到0，0，1，0可能第一反应还是二进制的。实际上他们之间是没有进位关系的。这也很好理解，毕竟不可能10个类选择器优先级加起来就比1个id选择器优先级高了。

以上大部分信息来自于《CSS The Definitive Guide》，讲得十分透彻清楚。之前看的《CSS那些事儿》的作者在博客上说他之前把CSS优先级也理解错了。。果然还是不要看中文教程比较好。