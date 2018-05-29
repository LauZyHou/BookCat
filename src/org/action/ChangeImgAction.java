package org.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.model.User;
import org.tools.ConstObj;

import java.io.*;
import java.util.Map;

//更换
public class ChangeImgAction extends ActionSupport {
    private File upload;
    //上传的文件名
    private String uploadFileName;
    //返回的请求(用于动态结果,带参数跳转)
    private String respVal;
    @Override
    public String execute() throws Exception {

        //上传图片
        InputStream is = new FileInputStream(getUpload());
        Map sssn=ActionContext.getContext().getSession();
        //从session中获取userid
        User user=(User)sssn.get("usr");
        int userid=user.getId();
        uploadFileName = userid + ".jpg";
        //上传图片文件的路径从工具类中获取
        String s1 = ConstObj.userfileUri + uploadFileName;
        OutputStream os = new FileOutputStream(s1);
        byte buffer[] = new byte[1024];
        int count = 0;
        while ((count = is.read(buffer)) > 0) {
            os.write(buffer, 0, count);
        }
        os.close();
        is.close();
        //设定返回的请求
        this.setRespVal("/setting/selfmsg.jsp");
        return SUCCESS;
    }

    public File getUpload() {
        return upload;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public String getRespVal() {
        return respVal;
    }

    public void setRespVal(String respVal) {
        this.respVal = respVal;
    }
}
