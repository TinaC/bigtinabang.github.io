---
layout: post
title:  "MacOSX binary directories"
date:   2015-06-23 16:01:10
categories: jekyll update

---

经常接受王老师的科普但是路上被考到的时候又忘了，太不好意思了。记下来记下来。

<!-- more -->

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

