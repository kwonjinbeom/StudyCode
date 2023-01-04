package week_12;

// Thread Ŭ������ ��ӹ޾� �ۼ��� ������ Ŭ����
	class MyThread1 extends Thread {
	
	 public MyThread1(String name) {
	 	 // Thread(String)�� ȣ���Ͽ� �������� �̸��� ������
		 super(name);
	 }
	
	 // �������� ���� �κ� ���� �Լ�
	 public void run() {
		 for(int i = 0; i < 5; i++) {
			 // �������� �̸��� ���
		 	 System.out.println("Thread Name is " + 
				 getName());
			
			 try {
				 // �������� ������ �ð���ŭ sleep()��Ŵ
				 sleep(100);	
			 } catch(InterruptedException e) {}
		 }
	 }	
	}

	public class ThreadTest1 {
	 // ����ڰ� ������ ������ ��ü ����	
 	 MyThread1 t1, t2, t3;
	 public void doRun() {
		 // ����ڰ� ������ ������ ��ü ����
		 t1 = new MyThread1("T1");
		 t2 = new MyThread1("T2");
		 t3 = new MyThread1("T3");
		
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
		 ThreadTest1 tt1 = new ThreadTest1();
		
		 tt1.doRun();
	 }
	}