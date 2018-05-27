package org.action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;
import org.model.Book;
import org.service.BookService;
import org.tools.ConstObj;

import java.io.*;
import java.util.Map;

@SuppressWarnings("all")
public class AddBookAction extends ActionSupport implements ModelDriven<Book> {
    //表单注入书名、价格、信息、分类、数量
    private Book nbook = null;
    //组合一个处理用户登录的业务逻辑类的对象,该对象将由Spring单例模式注入
    private BookService bs;
    private File upload;
    private String uploadFileName;
    //返回的请求(用于动态结果,带参数跳转)
    private String respVal;

    @Override
    public String execute() throws Exception {
        //持久化后拿出带有id的脱管对象
        nbook = bs.add(nbook);
        int id = nbook.getId();
        //上传图片
        InputStream is = new FileInputStream(getUpload());
        uploadFileName = id + ".jpg";
        //上传图片文件的路径从工具类中获取
        String s1 = ConstObj.fileUri + uploadFileName;
        OutputStream os = new FileOutputStream(s1);
        byte buffer[] = new byte[1024];
        int count = 0;
        while ((count = is.read(buffer)) > 0) {
            os.write(buffer, 0, count);
        }
        os.close();
        is.close();
        //设定返回的请求
        this.setRespVal("/admin/main.jsp?id="+id);
        return SUCCESS;
    }

    @Override
    public Book getModel() {
        return null == nbook ? nbook = new Book() : nbook;
    }

    public File getUpload() {
        return (this.upload);
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public String getUploadFileName() {
        return (this.uploadFileName);
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public BookService getBs() {
        return bs;
    }

    public void setBs(BookService bs) {
        this.bs = bs;
    }

    public String getRespVal() {
        return respVal;
    }

    public void setRespVal(String respVal) {
        this.respVal = respVal;
    }
}
