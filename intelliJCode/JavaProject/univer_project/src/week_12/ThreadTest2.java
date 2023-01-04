package week_12;

// Runnable�� ��ӹ��� ������ Ŭ����
	class MyThread2 implements Runnable {
	
	 public void run() {
 		 for(int i = 0; i < 5; i++) {
			 // ���� ����ǰ� �ִ� �������� �̸��� ���
			 System.out.println("Thread Name is " + 
				 Thread.currentThread().getName());
		
			 try {
				 // �������� ������ �ð���ŭ sleep()��Ŵ
			 	 Thread.sleep(100);	
			 } catch(InterruptedException e) {}
		 }
	 }	
	}

	public class ThreadTest2 {
	 // Runnable ��ü ����
	 Runnable r1, r2, r3;
	 // ������ ��ü ����
 	 Thread t1, t2, t3;

	 public void doRun() {
		
		 // Runnable ��ü ����
		 r1 = new MyThread2();
		 r2 = new MyThread2();
		 r3 = new MyThread2();
		
		 // Runnable ��ü�� �̸��� �̿��Ͽ� ������ ��ü ����
		 t1 = new Thread(r1, "T1");
		 t2 = new Thread(r2, "T2");
		 t3 = new Thread(r3, "T3");
	
		 // ������ ���� ����
		 t1.start();
		 t2.start();
		 t3.start();
		 
		 try {
			 // t1 �����尡 ����Ǳ���� ����Ѵ�.
			 t1.join();
			 // t2 �����尡 100ms �ȿ� ����Ǳ���� ����Ѵ�.
			 t2.join(100);
			 // t3 �����尡 ����Ǳ���� ����Ѵ�.
			 t3.join();
		 }catch(InterruptedException e) {
			 e.printStackTrace();
		 }
		
		 System.out.println("All Threads are dead!!");		
	 }
	
	 public static void main(String args[]) {
		 ThreadTest2 tt2 = new ThreadTest2();
		 tt2.doRun();
	 }
	}