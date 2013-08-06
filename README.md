JavaScript/jQuery、HTML、CSS 构建 Web IM 远程及时聊天通信程序
===============================================================

1 安装openfire_3_7_1.exe

2 修改服务器名称:192.168.9.23(openfire所在机器的ip地址)

![修改服务器名称](images/step_one.jpg)

3 修改index.jsp中的window["serverDomin"] = "192.168.9.23";

![修改index.jsp](images/step_two.jpg)

4 在openfire的管理控制台中注册用户

![注册用户](images/step_person.jpg)

5 部署工程,启动Tomcat,登录实现互聊。

![实现互聊](images/step_three.jpg)
![实现互聊](images/step_four.jpg)

参考:

[http://www.cnblogs.com/hoojo/archive/2012/08/13/2635779.html](http://www.cnblogs.com/hoojo/archive/2012/08/13/2635779.html)