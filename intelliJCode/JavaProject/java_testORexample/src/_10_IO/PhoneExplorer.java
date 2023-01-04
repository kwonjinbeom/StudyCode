package _10_IO;

import java.io.*;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Scanner;

public class PhoneExplorer {
    static Scanner scan = new Scanner(System.in);
    public static void main(String[] args) throws Exception{
        writePhoneFile();
        processQuery(readPhoneFile());
    }
    private static void writePhoneFile() throws Exception{
        Writer writer = new PrintWriter(new FileWriter("phone.txt"));
        try {
            while(true) {
                System.out.print("이름을 입력하세요: ");
                String name = scan.next();
                if(name.equals("그만"))
                    break;
                System.out.println("전화번호를 입력하세요: ");
                String phoneNumber = scan.next();
                if(phoneNumber.equals("그만"))
                    break;
                writer.write(name + "," + phoneNumber);
                writer.write("\n");
            }
            writer.flush();
        }catch (IOException io){
            io.printStackTrace();
        }finally{
            try {
                writer.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    }
    private static Map readPhoneFile() throws Exception{
        FileInputStream inputStream = new FileInputStream("phone.txt");
        Scanner reader = new Scanner(inputStream);
        Map<String, String> hashmap = new HashMap<>();
        while(reader.hasNextLine()){
            String[] splitValue = reader.nextLine().split(",");
            hashmap.put(splitValue[0],splitValue[1]);
        }
        Iterator<String> iter = hashmap.keySet().iterator();
        while(iter.hasNext()){
            System.out.println(iter.next());
        }
        return hashmap;
    }
    private static void processQuery(Map hashmap){
        while (true) {
            boolean findName = true;
            System.out.print("찾으시는 번호의 이름을 입력하세요: ");
            String name = scan.next();
            if(name.equals("종료")) break;
            for (Object key : hashmap.keySet()) {
                if(name.equals(key)){
                    System.out.println(name+"의 전화번호: "+hashmap.get(key));
                    findName = false;
                }
            }
            if(findName==true){
                System.out.println("이름을 잘못 입력하였습니다.");
            }

        }
    }
}
