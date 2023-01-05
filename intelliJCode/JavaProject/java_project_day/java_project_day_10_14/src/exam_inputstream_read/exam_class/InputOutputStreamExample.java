package exam_inputstream_read.exam_class;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class InputOutputStreamExample {
    public static void main(String[] args) {
        FileInputStream fis = null;
        FileOutputStream fos = null;
        try{
            fis = new FileInputStream("C:/Temp/intest.txt");
            fos = new FileOutputStream("C:/Temp/outtest.txt");
            int data = -1;

            while((data = fis.read()) != -1){
                fos.write(data);
            }
            System.out.println("파일 복사가 완료되었습니다.");
        }catch (FileNotFoundException fnf){
            System.out.println("파일이 존재하지 않거나 경로가 맞지 않아 더 이상 작업을 진행할 수 없습니다.");
//            fnf.printStackTrace();
        }catch (IOException io){
            System.out.println("파일 입출력에 문제가 발생하여 더 이상의 작업을 진행할 수 없습니다.");
//            io.printStackTrace();
        }catch (Exception e){
            System.out.println("오류 발생으로 더 이상의 작업을 진행할 수 없습니다.");
        }finally {
            try {
                if(fis != null)
                    fis.close();
                if(fos != null)
                    fos.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        //try with resources문 이용
//        try{
//            FileInputStream fis = new FileInputStream("C:/Temp/intest.txt");
//            FileOutputStream fos = new FileOutputStream("C:/Temp/outtest.txt");
//            int data = -1;
//
//            while((data = fis.read()) != -1){
//                fos.write(data);
//            }
//            System.out.println("파일 복사가 완료되었습니다.");
//        }catch (FileNotFoundException fnf){
//            System.out.println("파일이 존재하지 않거나 경로가 맞지 않아 더 이상 작업을 진행할 수 없습니다.");
////            fnf.printStackTrace();
//        }catch (IOException io){
//            System.out.println("파일 입출력에 문제가 발생하여 더 이상의 작업을 진행할 수 없습니다.");
////            io.printStackTrace();
//        }catch (Exception e){
//            System.out.println("오류 발생으로 더 이상의 작업을 진행할 수 없습니다.");
//        }
    }
}
