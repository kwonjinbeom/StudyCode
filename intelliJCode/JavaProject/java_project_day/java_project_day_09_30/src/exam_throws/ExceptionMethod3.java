package exam_throws;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class ExceptionMethod3 {
    public static void main(String[] args) {
        FileInputStream fi = null;

        byte[] readBytes = new byte[6];
        int readByteNo;
        String data = "";

        try {
            fi = new FileInputStream("test.txt");
            while (true){
                readByteNo = fi.read(readBytes);
                if(readByteNo == -1)
                    break;
                data += new String(readBytes, 0 , readByteNo);
            }
            System.out.println(data);
        }catch (FileNotFoundException fne){
            System.out.println("파일이 존재하지 않습니다.");
        }catch (IOException io){
            System.out.println("파일을 읽는 도중에 문제가 발생하였습니다.");
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            try {
                if(fi != null)
                    fi.close();
            }catch (IOException e){
                e.printStackTrace();
            }
        }
    }
}
