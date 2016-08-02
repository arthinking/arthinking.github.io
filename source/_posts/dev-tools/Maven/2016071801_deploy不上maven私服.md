---
title: deploy不上maven私服
date: 2016-07-18
categories: [dev-tools]
tags: [Maven]
---

> nexus Return code is: 401, ReasonPhrase: Unauthorized.

查看是否配置了认证

```xml
<servers>
    <server>  
        <id>releases</id>  
        <username>admin</username>  
        <password>123456</password>  
    </server>    
</servers>  
```




