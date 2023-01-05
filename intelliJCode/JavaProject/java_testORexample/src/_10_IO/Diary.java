package _10_IO;

import java.io.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Diary {
    static Scanner scan = new Scanner(System.in);
    static String year, month, day, fileName, title, weather;
    static String[] fileList = new String[999];//파일 중복 허용.(귀찮아서)
    static int fileListNum = 0;
    public static void main(String[] args) throws Exception {
        while(true){
            System.out.println("1.일기쓰기 2.일기 파일목록 3.일기 보기 4.종료");
            int choiceNum = scan.nextInt();
            switch (choiceNum){
                case 1:
                    makeDiary(writeDiary());
                    break;
                case 2:
                    diaryList();
                    break;
                case 3:
                    diaryShow();
                    break;
                case 4:
                    return;

            }
        }
    }

    private static List writeDiary() {
        System.out.println("일기장의 파일명을 입력합니다.");
        System.out.println("1.현재 날짜 자동 입력 / 2.수기로 입력(2 또는 아무거나 입력 시)");
        int c = scan.nextInt();
        if(c==1){
            LocalDate now = LocalDate.now();
            year = String.valueOf(now.getYear());
            month = String.valueOf(now.getMonthValue());
            day = String.valueOf(now.getDayOfMonth());
        }else {
            System.out.print("year: ");
            year = scan.next();
            System.out.print("month: ");
            month = scan.next();
            System.out.print("day: ");
            day = scan.next();
        }
        fileName = year + month + day + ".txt";
        System.out.println("파일을 생성합니다..");
        System.out.println(fileName + "\n");
        fileList[fileListNum] = fileName;
        fileListNum++;

        System.out.println("일기의 제목과 날씨를 입력받습니다.");
        System.out.print("제목: ");
        scan.nextLine();
        title = scan.nextLine();

        System.out.print("날씨: ");
        weather = scan.next();

        System.out.println("\n일기를 작성합니다.(enter: 줄바꿈, 종료: \"그만\"이라고 입력");

        List<String> arrayList = new ArrayList<>();
        while (true) {
            String writing = scan.nextLine();
            if (writing.equals("그만")) break;
            arrayList.add(writing);
        }
        return arrayList;
    }
    private static void makeDiary(List arrayList) throws Exception{
        PrintWriter writer = new PrintWriter(new FileWriter(fileName));
        try {
            writer.printf("날짜: %s.%s.%s\t날씨: %-5s제목: %s\n", year, month, day, weather, title);
            for (int i = 0; i < arrayList.size(); i++) {
                writer.print(arrayList.get(i));
                writer.println("");
            }
            writer.flush();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                writer.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    private static void diaryList(){
        for (int i = 0; i < fileListNum; i++) {
            System.out.println(fileList[i]);
        }
    }
    private static void diaryShow() throws Exception{
        System.out.println("일기를 볼 파일명을 입력하세요.");
        String diaryName = scan.next();
        try {
            int readData;
            Reader reader = new FileReader(diaryName);
            while (true) {
                readData = reader.read();
                if (readData == -1) break;
                System.out.print((char) readData);
            }

        }catch (IOException e){
            System.out.println("파일명을 잘못 입력하셨습니다.");
        }
    }

}

