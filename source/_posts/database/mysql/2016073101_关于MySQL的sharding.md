---
title: 关于MySQL的sharding
date: 2016-07-31
categories: [NoSQL]
tags: [Redis]
---

垂直切分：按照业务进行切分

水平切分：对于大表，进行分表分库，把数据散落在不同的数据库里面，对于数据增长相近，在业务上也比较紧密的表，两个Shard可以放到同一个数据库节点上，散列取一样的模。

垂直或水平切分之后，原来的关联关系需要打断，重新逐个查询组装数据。如何路由到Shard节点去查询或者更新数据也是关键。

[数据库Sharding的基本思想和切分策略](http://blog.csdn.net/bluishglc/article/details/6161475/)

[数据库分库分表(sharding)系列(一) 拆分实施策略和示例演示](http://blog.csdn.net/bluishglc/article/details/7696085)


