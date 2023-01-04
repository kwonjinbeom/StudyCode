package exam_network;

import java.net.MalformedURLException;
import java.net.URL;

public class URLClassTest {
    public static void main(String[] args) {
        try{
            URL myURL = new URL("http://java.sun.com:80/docs/books/index.html?name=database*TOP");

            System.out.println("프로토콜 = " + myURL.getProtocol()); //프로토콜 = http
            System.out.println("호스트명과 포트 = " + myURL.getAuthority());// 호스트명과 포트 = java.sun.com:80
            System.out.println("호스트명 = " + myURL.getHost()); // 호스트명 = java.sun.com
            System.out.println("포트 = " + myURL.getPort()); // 포트 = 80
            System.out.println("경로 = " + myURL.getPath()); //경로 = /docs/books/index.html
            System.out.println("query = " + myURL.getQuery()); // query = name=database
            System.out.println("경로와 query = " + myURL.getFile()); // 경로와 query = /docs/books/index.html?name=database
            System.out.println("ref = " + myURL.getRef()); // ref = TOP
        }catch (MalformedURLException e){
            System.out.println("URL ERROR");
        }
    }
}
