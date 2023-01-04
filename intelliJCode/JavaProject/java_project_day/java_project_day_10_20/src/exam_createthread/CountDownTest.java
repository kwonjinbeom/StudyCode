package exam_createthread;

import javax.swing.*;
import java.awt.*;

class CountDownTest extends JFrame{
    private static final long serialVersionUID = 1L;

    private JLabel label;

    class MyThread extends Thread {
        @Override
        public void run() {
            for (int i = 10; i >= 0; i--) {
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                label.setText(i + "");
            }
        }
    }
    public CountDownTest() {
        setTitle("카운트다운");
        setSize(300,200);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        //닫기 버튼을 눌렀을 때 종료하게 만들 것 이다.

        label = new JLabel("Start", JLabel.CENTER);
        //JLabel에 마우스를 올리면 생성자 설명이 나오는데 출력할 텍스트랑 위치 쓰게되어있음.
        label.setFont(new Font("Serif", Font.BOLD, 100));
        add(label);
        (new MyThread()).start();

        setVisible(true);
    }

    public static void main(String[] args) {
        new CountDownTest();
    }
}
