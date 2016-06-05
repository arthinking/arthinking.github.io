有时候Tomcat运行好好的，停掉之后再次运行就报错了：

> Name jdbc is not bound in this Context in Tomcat

这个时候你可以尝试在`context.xml`文件里面配置[ResourceLink](http://tomcat.apache.org/tomcat-6.0-doc/config/context.html#Resource%20Links):

```xml
<Context>
  ...
  <ResourceLink global="jdbc/MyDS" name="jdbc/MyDS" type="javax.sql.DataSource" />
  ...
</Context>
```

以上纯粹是一个巧合，IntelliJ IDEA项目通过maven编译之后，一般会在target目录下面生成一个编译的目录，我们通过 war wxploded进行部署的时候就会读取这里的文件进行部署，所以，查看一下META-INF目录下的context.xml文件数据源配置是否存在。

#References

[Name jdbc is not bound in this Context in Tomcat](http://stackoverflow.com/questions/8849461/name-jdbc-is-not-bound-in-this-context-in-tomcat)

