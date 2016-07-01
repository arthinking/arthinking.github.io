---
title: user mysql client
permalink: user mysql client
categories: [Database]
date: 2016-06-09
tags: [MySQL]
---

一般地MySQL安装在
> /usr/local/mysql/

通过以下命令链接到mysql客户端：
> mysql [-u username] [-h host] [-p[password]] [dbname]

./mysql -uroot -h172.22.23.1 -p123456 -P3306

show databases

show tables

use table

### 查看表信息

查看某一个库所有表的详细信息：

```sql
use information_schema;
select * from TABLES where TABLE_SCHEMA='my_db';
```

```sql
use information_schema;
select COLUMN_NAME, DATA_TYPE, COLUMN_COMMENT from information_schema.columns where table_schema ='database'  and table_name = 't_user';

# or

select * from TABLES where TABLE_SCHEMA='my_db' and TABLE_NAME= 't_user';

# or

use database;
show full columns from t_user;
```

```sql
desc table;
```

### 修改表字段，注释

```sql
alter table t comment = '表注释';
alter table t modify column id int comment '主键ID';
```

### 查看MySQL DDL

```sql
show create table table_name\G;
```

