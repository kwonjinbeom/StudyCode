package exam_collection_list;

class Movie {
    private String mTitle;
    private String mGrade;
    private String mDirector;
    private String anYear;

    public Movie() {
    }

    public Movie(String mTitle, String mGrade, String mDirector, String anYear) {
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

    public String getAnYear() {
        return anYear;
    }

    public void setAnYear(String anYear) {
        this.anYear = anYear;
    }
}

