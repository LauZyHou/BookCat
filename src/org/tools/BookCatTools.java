package org.tools;

import java.io.File;

//BookCat开发者工具
public class BookCatTools {
    //将文件fileName从pathName路径移动到ansPath路径
    public static void moveTotherFolders(String pathName,String fileName,String ansPath){
        String startPath = pathName+"/"+ fileName;
        String endPath = ansPath;
        try {
            File startFile = new File(startPath);
            File tmpFile = new File(endPath);//获取文件夹路径
            if(!tmpFile.exists()){//判断文件夹是否创建，没有创建则创建新文件夹
                tmpFile.mkdirs();
            }
            if (startFile.renameTo(new File(endPath+ "/"+ fileName))) {
                System.out.println("移动成功");
            } else {
                System.out.println("移动失败");
            }
        } catch (Exception e) {
            System.out.println("文件移动异常");
        }
    }
}
