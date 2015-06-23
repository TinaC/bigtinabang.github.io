---
layout: post
title:  "CSS Sliding Doors"
date:   2015-06-08 14:36:00
categories: jekyll update

---


终于写完论文写完实验室的项目继续来学前端啦~开森~O(∩_∩)O~~
今天在看《响应式Web设计》的时候看到关于滑动门的讲解，正好之前百度面试被问到关于圆角的兼容性方法，尽管现在有了CSS3的border-radius方法，为了兼（mian）容(shi)还是要学习老方法的啊！

<!-- more -->

滑动门主要用于解决给界面元素创建圆角效果，并且当元素宽度增大时仍然适用。它主要利用了CSS可以层叠background images的特性。
[示例](https://css-tricks.com/examples/Sprites+SlidingDoors-Button/)

HTML Code:
{% highlight html %}
<div class="clearbutton">
 <a class="GlobalOrangeButton" href="#">
 	<span>So Neat!</span>
 </a> 
</div>
{% endhighlight %}

a的背景图片是右边的圆角：


![](/assets/article_images/2015/slidingdoor2.png)


span的背景图片为左边的圆角加上中间部分，宽度要超过元素可能设定的最大宽度


![](/assets/article_images/2015/slidingdoor1.png)


注意将a的背景图片样式设置为right:
{% highlight html %}
background: transparent url('images/button_right_orange.png') no-repeat top right;
{% endhighlight %}


两张图片合起来组成滑动门。

当宽度增加时（span中的文字增加），背景图片会填满背景空间。
![](/assets/article_images/2015/slidingdoor3.png)


文字增加后，背景依然保持：


![](/assets/article_images/2015/slidingdoor4.png)



