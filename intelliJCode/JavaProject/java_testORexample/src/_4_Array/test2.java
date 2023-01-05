package _4_Array;

import java.util.Scanner;

public class test2 {
    public static void main(String[] args) {
        String[] Object = new String[]{"Java", "C++", "HTML5"
                                        , "컴퓨터구조", "안드로이드"};
        int[] score = new int[]{95, 88, 76, 62, 55};
        String jb;
        do {
            Scanner input = new Scanner(System.in);
            System.out.println("과목 이름을 입력하세요: ");
            jb = input.next();
            if (jb.equals("Java")) {
                System.out.println("과목 이름>> " + Object[0]);
                System.out.println("Java의 점수는 " + score[0]);
            } else if (jb.equals("C++")) {
                System.out.println("과목 이름>> " + Object[1]);
                System.out.println("C++의 점수는 " + score[1]);
            } else if (jb.equals("HTML5")) {
                System.out.println("과목 이름>> " + Object[2]);
                System.out.println("HTML5의 점수는 " + score[2]);
            } else if (jb.equals("컴퓨터구조")) {
                System.out.println("과목 이름>> " + Object[3]);
                System.out.println("컴퓨터구조의 점수는 " + score[3]);
            } else if (jb.equals("안드로이드")) {
                System.out.println("과목 이름>> " + Object[4]);
                System.out.println("안드로이드의 점수는 " + score[4]);
            }else if (jb.equals("종료")) {
                System.out.println("프로그램을 종료합니다.");

            } else {
                System.out.println("없는 과목입니다.");
            }
        }while (!jb.equals("종료"));

    }
}
