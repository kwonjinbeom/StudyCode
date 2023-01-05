package exam_class_basic;

public class Movie_Class {
    public String movieTitle;
    public String movieType;
    public String movieDate;
    public String movieOnOff;
    public String movieDirector;

    public void movieShow(String show){
        movieOnOff = show;
    }
    public void movieDateControl(String a){
        movieDate= a;
    }
    public void movieInfo(){
        System.out.println("이 영화의 제목은: " + movieTitle);
        System.out.println("이 영화의 감독은: " + movieDirector);
        System.out.println("장르는: " + movieType);
        System.out.println("버전은: " + movieDate);
        System.out.println("상영 여부는: " + movieOnOff);
    }
}
