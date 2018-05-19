(2018年5月19日)------------------------------------------------------------------------
【1】请大家尽量规范编程，特别是类、接口、变量、函数、形参的命名，多写注释；尽量让自己的模块不与其它部分耦合。
【2】数据库已经转储至"./资源备份/"目录下的bookcatdb.sql文件中，可以使用Navicat直接导入至MySQL。
【3】为了实现功能，缺少的数据请大家自己填补，并在最后转储且替换掉之前的"bookcatdb.sql"。
【4】进入IDEA配置Tomcat服务器时，在Run/Debug Configuration栏目配置好后，在右侧Deployment选项卡下的Application context处设定项目的根目录为"/"。
【5】启动时提示的log4j:WARN请先忽略。
【6】IDEA环境下Tomcat的默认报错信息保存在".IntelliJIdea\system\tomcat\Unnamed_CSCat\logs"下，也可以在网上找教程配置到显示在控制台中。
【7】DAO层(如果用到)、Service层必须提供接口，其实现类去实现接口中的方法(默认为public abstract)。
【8】Action的创建已经转交给Spring框架，应在web/WEB-INF/applicationContext.xml中配置其实现类bean，并注入相应的(注入了DAO的bean的)Service的bean。
【9】公用的错误页面为web/other/failed.jsp
(2018年5月2_日)------------------------------------------------------------------------