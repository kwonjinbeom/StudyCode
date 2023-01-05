package exam_class_basic;

import java.util.Scanner;

public class Movie {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        Movie_Class movie = new Movie_Class();

        movie.movieTitle = "7번방의 선물";
        movie.movieType = "슬픈 영화";
        movie.movieDirector = "Lee Hwan-kyung";

        System.out.println("영화 상영 날짜를 입력하세요.: ");
        String date = input.nextLine();
        movie.movieDateControl(date);

        System.out.println("영화 상영 여부를 입력하세요.: ");
        String onoff = input.nextLine();
        movie.movieShow(onoff);


        movie.movieInfo();
    }
}
