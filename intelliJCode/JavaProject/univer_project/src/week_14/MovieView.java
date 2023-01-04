package week_14;

public class MovieView {
    private String mGrade;

    MovieView(String mGrade){
        this.mGrade = mGrade;
    }

    public String getmGrade() {
        return mGrade;
    }

    public void setmGrade(String mGrade) {
        this.mGrade = mGrade;
    }

    @Override
    public String toString() {
        return " 평점은!!" + mGrade ;
    }
}
