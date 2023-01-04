package week_12;

// ������ Ŭ���� ����
	class MyThread extends Thread {
	 String name;

	 public MyThread(ThreadGroup tg, String name) {
		 // �����带 �׷쿡 �����Ű�� �ڽ��� �̸��� �����Ѵ�. 
		 super(tg, name);
	
 	 	 this.name = name;
	 }
	
	 // ���� ������ ���� �������� ����
	 public void run() {
	
		 while(true) {
			 try {
				 sleep(100);
			 } catch(InterruptedException e) {
			   System.out.println("InterruptedException");
			 }
		 }
 	 }
	}

	public class ThreadGroupTest {
	 // ������ ��ü ����
	 MyThread mt1, mt2, mt3;
	 // ������ �׷� ��ü ����
 	 ThreadGroup tg;
	 // �������� �迭
 	 MyThread list[];
	
	 public ThreadGroupTest() {
		 // ������ �׷� ��ü ����
		 tg = new ThreadGroup("TG");
		
		 // ������ ��ü�� "tg" ������ �׷��Ͽ� ������ �̸����� �����Ѵ�.
		 mt1 = new MyThread(tg, "one");
		 mt2 = new MyThread(tg, "two");
		 mt3 = new MyThread(tg, "three");
		
		 // �� �����带 Ȱ��ȭ��Ų��.
		 mt1.start();
		 mt2.start();
		 mt3.start();
	 }
	
	 public static void main(String args[]) {
		 ThreadGroupTest tgt = new ThreadGroupTest();
		
		 tgt.go();
	 }
	
	 public void go() {
		 // ������ �׷��� �̸��� ����Ѵ�.
		 System.out.println("getName() = " + tg.getName());
		 // ������ �׷��� �ִ� �켱������ ����Ѵ�.
		 System.out.println("getMaxPriority() = " + tg.getMaxPriority());
		 // ������ �׷쿡 �ִ� �������� ���� ���Ѵ�.
		 System.out.println("activeCount() = " + tg.activeCount());
		 // ������ �׷��� ������ ��Ʈ������ ����Ѵ�.
		 System.out.println("toString() = " + tg.toString());
		
		 int ac = tg.activeCount();
		 list = new MyThread[ac];
		
		 // ������ �׷��� ��������� ������ �迭�� �����.
		 tg.enumerate(list, false);
		
		 // ������ �迭�� ������ �̸��� ����Ѵ�.
		 for(int i = 0; i < list.length; i++) {
			 System.out.println("list[" + i + "].getName() = " +
				  list[i].getName());
		 }
	 }
	}