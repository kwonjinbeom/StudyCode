package exam_network;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.net.InetAddress;
import java.net.Socket;
import java.nio.Buffer;
import java.util.Scanner;

public class EchoClient {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        BufferedWriter out = null;
        Socket socket = null;
//        String ServerIP = "localhost"; OR String ServerIP = "127,0,0,1";
        String ServerIP;
        try{
            ServerIP = InetAddress.getLocalHost().getHostAddress(); //서버의 ip
//            ServerIP = "192.168.130.31";
            socket = new Socket(ServerIP, 9999); //클라이언트 소켓 생성, 서버에 바로 접속
            System.out.println(ServerIP +"서버에 접속하였습니다...");

            out = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));//서버로의 출력 스트림
            String outputMessage;

            while (true){
                System.out.print("텍스트 입력 >> ");
                outputMessage = scanner.nextLine(); // 키보드에서 한 행의 문자열 읽음
                out.write(outputMessage + "\n"); //서버로 보냄
                out.flush();
                if(outputMessage.equalsIgnoreCase("끝")){//"끝"이 입력되면 서버와 연결 종료
                    System.out.println("연결을 종료합니다.");
                    break;
                }
            }
            socket.close(); // 연결 종료. 클라이언트 소켓 닫기
            scanner.close();
        }catch (IOException e){
            System.out.println("입출력 오류가 발생했습니다.");
        }
    }
}
