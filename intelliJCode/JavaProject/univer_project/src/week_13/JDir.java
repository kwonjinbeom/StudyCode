package week_13;

import java.io.File;
import java.util.Date;

public class JDir {
    String dir; //지정된 디렉터리 저장

    public JDir(String dir){
        this.dir = dir;
    }

    public static void main(String[] args) {
        if(args.length < 1){
            JDir jdir = new JDir(".");//.은 현재 디렉을 의미
            jdir.list();
        }else{
            JDir jdir = new JDir(args[0]);
            jdir.list();
        }
    }

    private void list() {
        File f = new File(dir);

        if(f.exists()){
            File[] files = f.listFiles();
            for (int i = 0; i < files.length; i++) {
                Date date = new Date(files[i].lastModified());

                System.out.println(files[i].getName() + "\t\t" +
                files[i].length() + "\t" + date.toString());
            }
        }else{
            System.out.println("디렉터리가 존재하지 않습니다.");
        }
    }
}
