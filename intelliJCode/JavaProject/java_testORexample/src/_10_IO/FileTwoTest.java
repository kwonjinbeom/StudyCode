package _10_IO;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.Reader;
import java.io.Writer;

public class FileTwoTest {
    static boolean clear = true;
    public static void main(String[] args) throws Exception{
        String text;
        final String testFile = "test.txt";
        final String resultFile = "result.txt";
        final String writerFile = "writer.txt";


        text = "가장 위대한 영광은 한 번도 실패하지 않음이 아니라 실패할 때마다 다시 일어서는 데에 있다..\n";
        write(testFile,text);

        text = "행복은 성취의 기쁨과 창조적 노력이 주는 쾌감 속에 있다. (프랭클린 D. 루스벨트) \n" +
                "우리가 할 수 있기 전에 배워야 하는 일들을, 우리는 하면서 배운다. (아리스토텔레스)\n" +
                "저는 미래가 어떻게 전개될지는 모르지만, 누가 그 미래를 결정하는지는 압니다. (오프라 윈프리)";
        write(resultFile,text);

        Reader reader1 = new FileReader(testFile);
        text = read(reader1);
        write(writerFile,text);
        Reader reader2 = new FileReader(resultFile);
        text = read(reader2);
        write(writerFile,text);

        Reader reader3 = new FileReader(writerFile);
        System.out.println(read(reader3));
    }
    private static void write(String file, String text) throws Exception{
        Writer writer = new FileWriter(file,true);
        writer.write(text);
        writer.flush();
        writer.close();
    }
    private static String read(Reader reader) throws Exception{
        int readCharNo;
        char[] cbuf = new char[2];
        String data = "";
        while (true) {
            readCharNo = reader.read(cbuf);
            if (readCharNo == -1) break;
            data += new String(cbuf, 0, readCharNo);
        }
        reader.close();
        return data;
        }


}
