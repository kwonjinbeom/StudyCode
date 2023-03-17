package com.spring.openapi.data.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Service;

import com.spring.common.openapi.URLConnectUtil;
import com.spring.openapi.data.vo.OpenApiDTO;


@Service
public class DataServiceImpl implements DataService {
	
	@Override
	public StringBuffer chungnamList() throws Exception {
        // 리스트요청 open api url: "https://tour.chungnam.go.kr/_prog/openapi/?func=tour&start=1&end=10";

		// 요청 url 및 전달해 주어야 하는 파라미터
		StringBuffer site = new StringBuffer("https://tour.chungnam.go.kr/_prog/openapi/"); 
		site.append("?" + URLEncoder.encode("func","UTF-8") + "=" + URLEncoder.encode("tour", "UTF-8"));
		site.append("&" + URLEncoder.encode("start","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
		site.append("&" + URLEncoder.encode("end","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8"));
		
		OpenApiDTO openApi = new OpenApiDTO(site.toString(), "GET", "application/xml", null);
		StringBuffer result = URLConnectUtil.openAPIData(openApi);
		return result;
	}
	
	@Override
	public StringBuffer chungnamDetail(String mng_no) throws Exception {
			//오픈api주소: https://tour.chungnam.go.kr/_prog/openapi/?func=tour&mode=V&mng_no=아이템고유번호
			StringBuffer site = new StringBuffer("https://tour.chungnam.go.kr/_prog/openapi/"); 
			site.append("?" + URLEncoder.encode("func","UTF-8") + "=" + URLEncoder.encode("tour", "UTF-8"));
			site.append("&" + URLEncoder.encode("mode","UTF-8") + "=" + URLEncoder.encode("V", "UTF-8"));
			site.append("&" + URLEncoder.encode("mng_no","UTF-8") + "=" + URLEncoder.encode(mng_no, "UTF-8"));
			
			OpenApiDTO openApi = new OpenApiDTO(site.toString(), "GET", "application/xml", null);
			StringBuffer result = URLConnectUtil.openAPIData(openApi);
			return result;
	}
	
	@Override
	public StringBuffer animalDaejeonList() throws Exception {
		StringBuffer site = new StringBuffer("http://apis.data.go.kr/6300000/animalDaejeonService/animalDaejeonList"); 
		site.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + "UFPi%2F1fVMUs2SZTDnGA03sFxeRHHBV3BpZNWzU92Lr4JC5P0D2CqBs3GtV8Mfn1w%2BQRCs618PVYQSWNbhPp%2Fpw%3D%3D");
		site.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지 번호 - 필수 */
		site.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /* 페이지당 레코드수 - 필수 */
		site.append("&" + URLEncoder.encode("searchCondition","UTF-8") + "=" + URLEncoder.encode("2", "UTF-8")); /* 유기동물구분 - 옵션(1:개, 2:고양이, 3:기타동물)*/
		site.append("&" + URLEncoder.encode("searchCondition3","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 입양상태 - 옵션(1:공고중,2:입양가능,3:입양예정,4:입양완료,7:주인반환)*/
		
		//site.append("&" + URLEncoder.encode("species","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 동물종구분 - 옵션(개, 고양이)*/
		//site.append("&" + URLEncoder.encode("gubun","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 성별구분 - 옵션(1:암, 2:수)*/
		//site.append("&" + URLEncoder.encode("searchKeyword","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 검색키워드 - 옵션(동물종구분,기타사항,등록번호등 검색키워드로 검색)*/
		
		OpenApiDTO openApi = new OpenApiDTO(site.toString(), "GET", "application/xml", null);
		StringBuffer result = URLConnectUtil.openAPIData(openApi);
		return result;

	}
	
}