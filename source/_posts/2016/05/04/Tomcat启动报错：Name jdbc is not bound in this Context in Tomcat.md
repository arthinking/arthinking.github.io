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


#References

[Name jdbc is not bound in this Context in Tomcat](http://stackoverflow.com/questions/8849461/name-jdbc-is-not-bound-in-this-context-in-tomcat)

