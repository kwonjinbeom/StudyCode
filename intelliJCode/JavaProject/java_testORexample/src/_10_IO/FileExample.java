package _10_IO;

import java.io.*;
import java.util.*;

public class FileExample {
    static Random random = new Random();
    public static void main(String[] args) throws Exception {
        final String inputFile = "input.txt";
        final String outputFile = "output.txt";
        Writer writer = null;
        BufferedReader br = null;
        Writer writer2 = null;

        try {
            //문자 기반 출력 스트림 생성
            writer = new FileWriter("input.txt");
            for (int i = 0; i < 10; i++) {
                int RandomNum = random.nextInt(1000) + 1;
                writer.write(String.valueOf(RandomNum));
                writer.write("\n");
            }
            writer.flush();

            List<Integer> arrayList = new ArrayList<>();
            br = new BufferedReader(new FileReader(inputFile));
            while (true){
                String line = br.readLine();
                if(line == null) break;
                int value = Integer.parseInt(line);
                arrayList.add(value);
            }
            Collections.sort(arrayList);

            writer2 = new FileWriter(outputFile);
            for (int i = 0; i < arrayList.size(); i++) {
                int num = arrayList.get(i);
                writer2.write(num+"\n");
            }
            writer2.flush();
        }catch (IOException io){
            io.printStackTrace();
        }finally {
            try{
                if(writer != null) {writer.close();}
                if(br != null) {br.close();}
                if(writer2 != null) {writer2.close();}
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    }

}
