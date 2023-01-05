package exam_collection_list;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

class Movie{
    private String mTitle;
    private String mGrade;
    private String mDirector;
    private int anYear;

    public Movie() {
    }

    public Movie(String mTitle, String mGrade, String mDirector, int anYear) {
        this.mTitle = mTitle;
        this.mGrade = mGrade;
        this.mDirector = mDirector;
        this.anYear = anYear;
    }

    public String getmTitle() {
        return mTitle;
    }

    public void setmTitle(String mTitle) {
        this.mTitle = mTitle;
    }

    public String getmGrade() {
        return mGrade;
    }

    public void setmGrade(String mGrade) {
        this.mGrade = mGrade;
    }

    public String getmDirector() {
        return mDirector;
    }

    public void setmDirector(String mDirector) {
        this.mDirector = mDirector;
    }

    public int getAnYear() {
        return anYear;
    }

    public void setAnYear(int anYear) {
        this.anYear = anYear;
    }
}

public class ArrayListMovieTest {
    public static void main(String[] args) {
        List<Movie> list3 = new ArrayList<>();
        list3.add(new Movie("더 배트맨","★★★★☆ 8.78", "맷 리브스",2022));

        Movie m = new Movie();
        m.setmTitle("어메이징 그레이스");
        list3.add(m);

        for (int i = 0; i < list3.size(); i++) {
            Movie movie = list3.get(i);
            System.out.println(list3.get(i).toString());
            System.out.println(movie.getmTitle());
            System.out.println(movie.getmGrade());
            System.out.println(movie.getmDirector());
            System.out.println(movie.getAnYear());
        }
        System.out.println();

        Iterator<Movie> it = list3.iterator();
        while (it.hasNext()){
            System.out.println(it.next().toString());
        }
    }
}
