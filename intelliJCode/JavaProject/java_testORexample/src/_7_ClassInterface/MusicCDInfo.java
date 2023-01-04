package _7_ClassInterface;

public class MusicCDInfo extends CDInfo{
    private int registerNo;
    private String title;
    private String artist;
    private String[] songTitle = new String[3];

    MusicCDInfo(String artist, String title,String[] songTitle){
        this.artist = artist;
        this.title = title;
        this.songTitle = songTitle;
    }
    public String toString(){
        return artist + " " + title + "[ " + songTitle[0]+ " " +
                songTitle[1]+ " " + songTitle[2] + " ]음반.";
    }
}
