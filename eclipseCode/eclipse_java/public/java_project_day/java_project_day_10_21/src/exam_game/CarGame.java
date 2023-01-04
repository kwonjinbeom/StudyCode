package exam_game;

import javax.swing.*;

class CarGame extends JFrame {
    private static final long serialVersionUID = 1L;

    class MyThread extends Thread{
        private JLabel label;
        private int x,y;

        public MyThread(String fname, int x, int y){
            this.x = x;
            this.y = y;
            label = new JLabel();
            label.setIcon(new ImageIcon(fname)); //JLabel의 이미지 설정
            label.setBounds(x,y,100,100); // JLabel의 위치 설정. setBounds(x,y,width,height)
            add(label);
        }
        public void run(){
            for (int i = 0; i < 100; i++) {
                x += 10 * Math.random();
                label.setBounds(x,y,100,100);
                repaint();
                try{
                    Thread.sleep(10);
                }catch (InterruptedException e){
                    e.printStackTrace();
                }
            }
        }
    }
    public CarGame() {
        setTitle("CarRace");
        setSize(680, 200);

        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(null);

        (new MyThread("car1.gif", 100, 0)).start();
        (new MyThread("car2.gif", 100, 50)).start();
        (new MyThread("car3.gif", 100, 100)).start();
        setVisible(true);
    }

    public static void main(String[] args) {
        new CarGame();
    }
}



