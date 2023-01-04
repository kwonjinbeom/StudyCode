package _7_ClassInterface;

public class BookCDMS {
    public static void main(String[] args) {
        SeparateVolume separateVolume = new SeparateVolume("동행","김동률");
        separateVolume.setBookTitle("엄마를 부탁해");
        separateVolume.setWriter("신경숙");
        separateVolume.checkOut("홍길동", "20210801");
        separateVolume.checkIn();

        AppCDInfo cd = new AppCDInfo();
        cd.setTitle("Redhat Fedora");
        cd.checkOut("박희진", "20210810");
        cd.checkIn();

        String[] songTitle = {"고백", "청춘", "내 사람"};
        MusicCDInfo musicCDInfo = new MusicCDInfo("김동률", "동행", songTitle);

        System.out.println(musicCDInfo.toString());
    }
}
