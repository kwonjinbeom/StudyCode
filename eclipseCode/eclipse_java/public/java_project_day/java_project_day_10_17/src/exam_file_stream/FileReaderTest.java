package exam_file_stream;

import java.io.*;

public class FileReaderTest {
    public static void main(String[] args) {
        FileReader in = null;
        BufferedReader reader = null;

        FileWriter out = null;
        String s = "가장 위대한 영광은 한 번도 실패하지 않음이 아니라 실패할 때 마다 다시 일어서는 데에 있다.";
        try{
            out = new FileWriter("test.txt"); //문자 출력 스트림(프로그램으로부터 데이터를 내보내는 스트림)
            out.write(s);
            out.append('.');
            out.flush();

            in = new FileReader("test.txt");
            reader = new BufferedReader(in);
            String str = null;
            while((str = reader.readLine()) != null){
                System.out.println(str);
            }
        }catch (FileNotFoundException fnf){
            System.out.println("경로명을 다시 확인해 주세요.");
            fnf.printStackTrace();
        }catch (IOException io){
            System.out.println("오류로 인하여 test.txt 파일을 읽지 못하였습니다.");
            io.printStackTrace();
        }catch (Exception e){
            System.out.println("다시 확인해 주세요.");
            e.printStackTrace();
        }finally {
            try{
                if(out != null)
                    out.close();
                if(reader != null)
                    reader.close();
                if(in != null)
                    in.close();
            }catch (Exception ex){
                System.out.println("연결 해제 오류");
            }
        }
    }
}
