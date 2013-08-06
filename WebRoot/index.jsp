<%@ page language="java" pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>WebIM Chat</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="author" content="hoojo">
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/chat-2.0.css" />
    <script type="text/javascript">
        window.contextPath = "<%=path%>";
        window["serverDomin"] = "192.168.9.23";
    </script>
    <script type="text/javascript" src="<%=path%>/jslib/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="<%=path%>/jslib/jsjac.js"></script>
    <!-- script type="text/javascript" src="debugger/Debugger.js"></script-->
    <script type="text/javascript" src="<%=path%>/jslib/send.message.editor-1.0.js"></script>
    <script type="text/javascript" src="<%=path%>/jslib/jquery.easydrag.js"></script>
    <script type="text/javascript" src="<%=path%>/jslib/remote.jsjac.chat-2.0.js"></script>
    <script type="text/javascript" src="<%=path%>/jslib/local.chat-2.0.js"></script>
    <script type="text/javascript">
        $(function () {
            
            $("#login").click(function () {
                var userName = $(":text[name='userName']").val();
                var receiver = $("*[name='to']").val();
                // 建立一个聊天窗口应用，并设置发送者和消息接收者
                $.WebIM({
                    sender: userName,
                    receiver: receiver
                });
                // 登陆到openfire服务器
                 remote.jsjac.chat.login(document.userForm);
                 $("label").text(userName);
                 $("form").hide();
                 $("#newConn").show();
            });
            
            $("#logout").click(function () {
                 // 退出openfire登陆，断开链接
                 remote.jsjac.chat.logout();
                 $("form").show();
                 $("#newConn").hide();
                 $("#chat").hide(800);
            });
            
            $("#newSession").click(function () {
                var receiver = $("#sendTo").val();
                // 建立一个新聊天窗口，并设置消息接收者（发送给谁？）
                $.WebIM.newWebIM({
                    receiver: receiver
                });
            });
        });
    </script>
  </head>
  
  <body>
    <!-- 登陆表单 -->
    <form name="userForm" style="background-color: #fcfcfc; width: 100%;">
        userName：<input type="text" name="userName" value="boy"/>
        password：<input type="password" name="password" value="boy"/>
        
        register: <input type="checkbox" name="register"/>
        sendTo： <input type="text" id="to" name="to" value="hoojo" width="10"/>
        <input type="button" value="Login" id="login"/> 
    </form>
    <!-- 新窗口聊天 -->
    <div id="newConn" style="display: none; background-color: #fcfcfc; width: 100%;">
           User：<label></label>
           sendTo： <input type="text" id="sendTo" value="hoojo" width="10"/>
           <input type="button" value="new Chat" id="newSession"/> 
           <input type="button" value="Logout" id="logout"/>
    </div>
    <!-- 日志信息 -->
    <div id="error" style="display: ; background-color: red;"></div>
    <div id="info" style="display: ; background-color: #999999;"></div>
    <!-- 聊天来消息提示 -->
    <div class="chat-message">
        <img src="images/write_icon.png" class="no-msg"/>
        <img src="images/write_icon.gif" class="have-msg" style="display: none;"/>
    </div>
  </body>
</html>