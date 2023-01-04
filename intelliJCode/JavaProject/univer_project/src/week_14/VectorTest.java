package week_14;

import java.util.Iterator;
import java.util.Vector;

public class VectorTest {
    static Vector<Movie> vector1 = new Vector<Movie>();
    static Vector<MovieView> vector2 = new Vector<MovieView>();

    public static void main(String[] args) {
        vector1.addElement(new Movie("더 배트맨", "맷 리브스", "2022.03.01"));
        vector1.addElement(new Movie("나쁜 녀석들: 더 무비", "손용호", "2019.09.11"));
        vector1.addElement(new Movie("아쿠아맨", "론 하워드", "2018.12.19"));
        vector2.addElement(new MovieView("☆☆☆☆☆ 0"));
        vector2.addElement(new MovieView("★★★★☆ 8.44"));
        vector2.addElement(new MovieView( "★★★★★ 10"));
        printData();
    }
    private static void printData(){
        Iterator<Movie> v1 = vector1.iterator();
        Iterator<MovieView> v2 = vector2.iterator();
        while(v1.hasNext()&v2.hasNext()){
            System.out.println(v1.next().toString()+v2.next().toString());
        }
    }
}
