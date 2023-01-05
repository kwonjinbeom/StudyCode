package exam_collection_list;

import java.util.Iterator;
import java.util.Vector;

public class VectorTest {
    static Vector<Movie> list = new Vector<Movie>();

    public static void main(String[] args) {
//        Vector<Movie> list = new Vector<Movie>();
        list.addElement(new Movie("더 배트맨", "☆☆☆☆☆ 0", "맷 리브스", "2022.03.01"));
        list.addElement(new Movie("나쁜 녀석들: 더 무비", "★★★★☆ 8.44", "손용호", "2019.09.11"));
        list.addElement(new Movie("아쿠아맨", "☆☆☆☆☆ 0", "론 하워드", "2018.12.19"));

//        printData(list);
        printData();
    }
    private static void printData(){
        Iterator<Movie> e = list.iterator();
        while(e.hasNext()){
            System.out.println(e.next());
        }
    }
}
