package week_12;

import java.awt.*;
	import java.applet.*;

	// ���ø��̸鼭 �����带 �̿��ϴ� Ŭ����
	public class ThreadTest3 extends Applet implements Runnable {
	 int X = 1, Y = 1, width = 1, height = 1;
	 // ������ ���� ����
 	 Thread t1;

	 public void init() {
		 // this�� Runnable�� ����Ͽ� ������ ����
		 t1 = new Thread(this);
 	 }
	 public void start() {
		 // �������� ������ ���� �����̸� ��, �����尡 ����(dead) �����̸�
		 // �����带 �����ϰ� ������ ���۽�Ų��.
		 if(!t1.isAlive()) {
		
			 // �����带 �����Ѵ�.
			 t1 = new Thread(this);
	 	 }
		 // ������ ������ ���۽�Ų��.
		 t1.start();
	 }

	 public void stop() {
		 // �������� ������ �ִ� �����̸� �������� ������ ������.
		 if(t1.isAlive()) {
		
			 // �����带 �����Ѵ�.
			 t1.stop();
		 }
	 }

	 public void paint(Graphics g) {
		 int c1, c2, c3;

		 // ���ø��� ũ�⸦ ���Ѵ�.
	 	 Dimension d = getSize();
		 width = d.width;
		 height = d.height;

		 c1 = (int)(Math.random() * 1000) % 256;
		 c2 = (int)(Math.random() * 1000) % 256;
		 c3 = (int)(Math.random() * 1000) % 256;

		 g.setColor(new Color(c1, c2, c3));
		 g.fill3DRect(X, Y, 20, 20, true);
	 }
	 public void update(Graphics g) {
		 paint(g);
	 }

	 public void run() {
		 while(true) {
			 try {
		 	 X = (int)(Math.random() * 1000) % width;
		 	 Y = (int)(Math.random() * 1000) % height;

			 repaint();

			 // ���ø� �������� ������ ������Ų��.
			 Thread.sleep(100);
			 } catch(InterruptedException e) {
				 e.printStackTrace();
			 }
		 }                     
	 }
	}