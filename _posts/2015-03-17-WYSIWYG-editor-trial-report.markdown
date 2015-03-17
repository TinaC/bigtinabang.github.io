---
layout: post
title:  "WYSIWYG Editor Trial Report"
date:   2015-03-17 10:48:00
categories: jekyll update

---


最近甲方提新需求要先做广告页的上传，涉及到对富文本的处理，找了几个WYSIWYG编辑器（What You See Is What You Get，所见即所得），真是既简单又方便。

This is an [example link](http://example.com/)

<!-- more -->

## Bootstrap-wysiwyg
[Bootstrap-wysiwyg](https://github.com/mindmup/bootstrap-wysiwyg/)
是bootstrap官网上推荐的项目，依赖jQuery, jQuery HotKeys,Bootstrap,都可以用bower安装。

但是试了几个例子都不行，后来stackoverflow一搜发现Bootstrap-wysiwyg用的bootstrap 2.3, 居然没在dependencies里面写明...

而且Bootstrap-wysiwyg好像已经没人维护了...

这是针对bootstrap3的[bootstrap3-wysiwyg](https://github.com/bootstrap-wysiwyg/bootstrap3-wysiwyg)

## Summernote

[Summernote](https://github.com/summernote/summernote)适用于Bootstrap 3.0和2.x，应该是更好的选择。
 
[Demo](http://jsfiddle.net/vfvozj8k/)

依赖jQuery, Bootstrap, font-awesome.

