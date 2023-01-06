package example;
import java.util.Date; 
import java.text.SimpleDateFormat;
public class Clock {

	public String printDate(){
		Date nowDate = new Date();
		SimpleDateFormat Clock = new SimpleDateFormat("yyyy년 MM월 dd일 a hh시 mm분 ss초");
		String datePlusTime = Clock.format(nowDate);
		/* System.out.println(datePlusTime); */
		return datePlusTime;
	}
	

}
