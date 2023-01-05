package _10_IO;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class LineTest {
    public static void main(String[] args)throws Exception{
        final String writerFile = "writer.txt";
        final String lineFile = "line.txt";
        BufferedReader br = null;
        PrintWriter writer = null;
        try {
            List<Integer> arrayList = new ArrayList<>();
            br = new BufferedReader(new FileReader(writerFile));
            writer = new PrintWriter(new FileWriter(lineFile));

            for (int i = 0; i < 999; i++) {
                String line = br.readLine();
                if (line == null) break;
                writer.printf("%5d: %s\n", i, line);
            }
            writer.flush();
        }catch (IOException io){
            io.printStackTrace();
        }finally {
            try{
                br.close();
                writer.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }

    }
}
