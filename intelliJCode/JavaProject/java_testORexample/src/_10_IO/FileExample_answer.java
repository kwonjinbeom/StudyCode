package _10_IO;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Random;

public class FileExample_answer {
    public static void main(String[] args) {
        Writer fw = null;
        BufferedReader br = null;
        Writer ofw = null;

        Random r = new Random();
        try{
            //문자 기반 출력 스트림 생성
            fw = new FileWriter("input.txt");
            for (int i = 0; i < 10; i++) {
//                fw.write(r.nextInt(300)*""); 80+"" => "80"
                fw.write(String.valueOf(r.nextInt(300)));
                fw.write("\r\n");
            }
            fw.flush();

            ArrayList<Integer> list = new ArrayList<>();
            br = new BufferedReader(new FileReader("input.txt"));
            while(true){
                String line = br.readLine();
                if(line == null)
                    break;
                int value = Integer.parseInt(line);
                list.add(value);
            }
            Collections.sort(list);

            ofw = new FileWriter("output.txt");
            for (int i = 0; i < list.size(); i++) {
                //ofw.write(list.get(i) + "");
                ofw.write(String.valueOf(list.get(i)));
                ofw.write("\r\n");
            }
            ofw.flush();
            System.out.println("파일에 정상적으로 복사 되었습니다.");
        }catch (IOException e){
            e.printStackTrace();
        }finally {
            try{
                if(fw != null){fw.close();}
                if(br != null){br.close();}
                if(ofw != null){ofw.close();}
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    }
}
