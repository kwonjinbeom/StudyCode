package exam_file_stream;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileStreamExample {
    public static void main(String[] args) {
        FileInputStream fis = null;
        FileOutputStream fos = null;

        int readByteNo;
        String originalFileName = "C:/Temp/FileStreamExampleImage.jpg";
        String targetFileName = "C:/ImageTest/FileStreamExampleImage.jpg";
        try{
            fis = new FileInputStream(originalFileName);
            fos = new FileOutputStream(targetFileName);

            byte[] readBytes = new byte[100];
            while((readByteNo = fis.read(readBytes)) != -1){
                fos.write(readBytes,0,readByteNo);
            }
        }catch (IOException io){
            io.printStackTrace();
            System.out.println("입출력에 문제가 있어 더 이상 복사 작업을 진행할 수 없습니다.");
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("입출력 시 오류 발생으로 복사 작업을 진행할 수 없습니다.");
        }finally{
            try{
                if(fos != null) fos.close();
                if(fis != null) fis.close();
            }catch (IOException e){
                e.printStackTrace();
            }
        }
        System.out.println("복사가 잘 되었습니다.");
    }
}
