package exam_network;

import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

public class DownloadImage {
    public static void main(String[] args) {
        InputStream in = null;
        OutputStream out = null;
        int readByteNo;
        String website = "https://s3.ap-northeast-2.amazonaws.com/grepp-cloudfront/programmers_imgs/learn/thumb-course-java-intermediate.jpg";
        try {
            URL url = new URL(website);
            URLConnection con = url.openConnection();
            in = new BufferedInputStream(con.getInputStream());
            out = new BufferedOutputStream(new FileOutputStream("thumb-course-java-intermediate.jpg"));

            byte[] data = new byte[2048];
            while((readByteNo = in.read(data)) != -1){
                out.write(data,0,readByteNo);
            }
            System.out.println(website + "에서 이미지를 다운로드 완료되었습니다.");
        }catch (MalformedURLException e){
            System.out.println("URL ERROR");
        }catch (IOException i){
            System.out.println("IO ERROR");
        }finally {
            try {
                if(out != null)
                    out.close();
                if(in != null)
                    in.close();
            }catch (Exception e){
                System.out.println("CLOSE ERROR");
            }
        }
    }
}
