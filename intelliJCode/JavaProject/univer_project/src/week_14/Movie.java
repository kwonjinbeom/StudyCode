package week_14;
class Movie {
    private String mTitle;
    private String mDirector;
    private String anYear;

    public Movie() {
    }

    public Movie(String mTitle, String mDirector, String anYear) {
        this.mTitle = mTitle;
        this.mDirector = mDirector;
        this.anYear = anYear;
    }

    public String getmTitle() {
        return mTitle;
    }

    public void setmTitle(String mTitle) {
        this.mTitle = mTitle;
    }


    public String getmDirector() {
        return mDirector;
    }

    public void setmDirector(String mDirector) {
        this.mDirector = mDirector;
    }

    public String getAnYear() {
        return anYear;
    }

    public void setAnYear(String anYear) {
        this.anYear = anYear;
    }

    @Override
    public String toString() {
        return "제목이 " + mTitle + "인 이 영화의 감독은 " + mDirector +" 이고, 개봉날짜는 " + anYear;
    }
}

