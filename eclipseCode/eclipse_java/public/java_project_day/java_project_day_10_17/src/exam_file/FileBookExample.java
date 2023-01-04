package exam_file;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class FileBookExample {
    public static void main(String[] args) {
        try{
            Path input = Paths.get("alphabet.txt");
            //파일 읽기
            byte[] bytes = Files.readAllBytes(input);
            System.out.println("== readAllBytes ==");
            System.out.println(new String(bytes));

            //파일 쓰기
            Path out1 = Paths.get("c.txt");
            Files.write(out1, bytes);

        }catch (IOException e){
            e.printStackTrace();
        }
    }
}
