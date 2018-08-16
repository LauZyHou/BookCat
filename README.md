# BookCat书籍社区
BookCat书籍社区，S2SH框架，J2EE课程项目。
## 小组成员
刘知昊，蔡坤，辛翌菲，李喆雯，马家俊，吴瑟晞。
## 主要界面展示
![](https://i.imgur.com/F76sCcR.jpg)

![](https://i.imgur.com/WdlFQCV.jpg)

![](https://i.imgur.com/E3V3wTh.jpg)

![](https://i.imgur.com/cActK4X.jpg)

![](https://i.imgur.com/ZQ5Ygte.jpg)

![](https://i.imgur.com/zNhUVvm.jpg)

![](https://i.imgur.com/1r7mcdt.jpg)

![](https://i.imgur.com/SUZq6Sg.jpg)

![](https://i.imgur.com/7NRRagH.jpg)

![](https://i.imgur.com/oUU9uoY.jpg)

![](https://i.imgur.com/4xgofnc.jpg)

![](https://i.imgur.com/9JPdftU.jpg)

![](https://i.imgur.com/Uqv1etd.jpg)

![](https://i.imgur.com/hzUAU1h.jpg)
## 开发与合作日志
### 2018年5月19日
【1】请大家尽量规范编程，特别是类、接口、变量、函数、形参的命名，多写注释；尽量让自己的模块不与其它部分耦合。
<br>
【2】数据库已经转储至"./资源备份/"目录下的bookcatdb.sql文件中，可以使用Navicat直接导入至MySQL。
<br>
【3】为了实现功能，缺少的数据请大家自己填补，并在最后转储且替换掉之前的"bookcatdb.sql"。
<br>
【4】进入IDEA配置Tomcat服务器时，在Run/Debug Configuration栏目配置好后，在右侧Deployment选项卡下的Application context处设定项目的根目录为"/"。
<br>
【5】启动时提示的log4j:WARN请先忽略。
<br>
【6】IDEA环境下Tomcat的默认报错信息保存在".IntelliJIdea\system\tomcat\Unnamed_CSCat\logs"下，也可以在网上找教程配置到显示在控制台中。
<br>
【7】DAO层(如果用到)、Service层必须提供接口，其实现类去实现接口中的方法(默认为public abstract)。
<br>
【8】Action的创建已经转交给Spring框架，应在web/WEB-INF/applicationContext.xml中配置其实现类bean，并注入相应的(注入了DAO的bean的)Service的bean。
<br>
【9】公用的错误页面为web/other/failed.jsp
### 2018年5月26日
【1】导航栏、footer元素、购物车已经完全解耦。
<br>
【2】付款页面的样式和动作已经完成。
<br>
【3】现在可以从[主页]和[热门]页面直接点击书的图片进入书籍详细信息页。
<br>
【4】数据库中，留言表请增加一个主属性time，相关xml映射和PK实体类已经上传。
### 2018年6月3日
版本留存。
注意配置Tomcat虚拟路径，这在IDEA下可以直接配置。
### 2018年7月3日
近期从Gitee迁移到GitHub，提供本README文件中的界面展示。
### 2018年8月14日
【1】今天有朋友问我匿名内部类使用非final外部变量的问题，请在IDEA中将Language Level设置成8。
<br>
【2】关于Tomcat虚拟路径，是在这个地方改的：
![](https://i.imgur.com/Hno3w6f.jpg)
