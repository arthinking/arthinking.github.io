---
title: HighPay Zoom博客系统搭建说明
categories: [杂谈]
date: 2016-05-03
tags: [Hexo]
---

> Author: ChinSyun Pang
> Weibo: [arthinking_plus](http://weibo.com/arthinkingplus)
> Posted in: [HighPay Zoom博客系统搭建说明](http://www.itzhai.com/highpay-zoom-blog-build-intro.html)

<!-- ttoc -->

HighPay Zoom博客托管于Github,基于Hexo制作成静态博客;

## Hexo

[Hexo](https://hexo.io/)是一款基于Node.js的静态博客框架,简单的说,就是可以通过Hexo,把markdown文件直接转换成一个静态的网站输出到一个文件夹,然这个文件夹可以直接上传到服务器或者github,就可以访问啦~

### 接下来是使用Hexo的使用方法:

Hexo基于Node.js,所以需要先安装NodeJS的环境,怎么安装就不说啦,搜索一下可以找到相应的教程;主要通过NodeJS生成静态站点;

同时你需要安装Git,用于把代码提交到github上面去;

安装Hexo:

> sudo npm install-g hexo

初始化项目:

> hexo init

生成静态页面:

> hexo generate

本地启动访问静态网站:

> hexo server

启动之后会提示本地访问的地址,直接输入地址访问就可以啦;

接下来是把静态网站发布到github上面去,怎么使用github创建主页就不多说了,搜一下`github搭建博客`即可找到答案.

执行完`hexo init`之后,会在目录下面生成hexo相关的文件,其中`_config.yml`是hexo的配置文件,用于配置站点信息和发布信息的,我们编辑这个文件,在最后加上:

```bash
deploy:

     type: git

     repo:https://github.com/您的github项目仓库地址

     branch:master
```

注意,我们这里的`branch`需要设置为master,否则,css,js,图片等资源文件加载不到.

好的,为了通过hexo直接把项目直接发布到github仓库的master分支,需要再安装一个模块:

> npm install hexo-deployer-git--save

执行如下命令,静态站点就push到github上面去啦:

> hexo deploy

这个命令实际上是把我们刚才执行`hexo generate`所生成的`public`文件夹里面的所有内容,既是静态站点,push到了github的master分支上面;

每次部署的步骤,可以按照这样来:

```bash
hexo clean

hexo generate

hexo deploy
```

如果需要给博文添加标签或者分类,可以直接在markdown文件顶部这样设置:

```md
---
title: HighPay Zoom博客系统搭建说明
categories: [杂谈]
tags: [Hexo]
---
```

其中title是博文的标题,categories是分类,tags是标签,如果有多个标签或者分类,按照这个格式进行添加:[a,b,c]

## Hexo相关的问题

文档中的分隔项不可以使用`---`，与hexo的文件顶部定义的字符冲突了，报如下错：

```
YAMLException: end of the stream or a document separator is expected at
```

您应该尝试使用`***`替代。

以上就是我们搭建过程啦, Bon Voyage!

## References

* [Hexo官网](https://hexo.io/)
* [HEXO+Github,搭建属于自己的博客](http://www.jianshu.com/p/465830080ea9)
* [Hexo@简书](http://www.jianshu.com/collection/7fafdc0abb5b)
* [Hexo使用攻略](http://ijiaober.github.io/categories/hexo/)
* [Hexo添加Toc支持，生成文章目录](http://www.imys.net/20150514/hexo-toc.html)
* [hexo next主题配置](https://github.com/iissnan/hexo-theme-next/wiki)





