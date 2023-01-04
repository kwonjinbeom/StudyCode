package week_12;

import java.util.*;
import java.awt.*;
import java.awt.event.*;
import java.text.DecimalFormat;

class Prize5Exception extends Exception {}
class Prize4Exception extends Exception {}
class Prize3Exception extends Exception {}
class Prize2Exception extends Exception {}
class Prize1Exception extends Exception {}

public class Lotto9_1 extends Frame implements ActionListener, Runnable {
	Label la1, la2;
	Label la3; // Bonus
	Label la4; // cnt
	Label la5; // Prize Message!
	Button b1;
	Panel p1;
	int lot[], lot2[], prize[], pos[], bonus, years;
	String expense;
	Thread t;
	boolean isbonus;
	boolean isstart;

	public Lotto9_1() {
		super("My Lotto Program 1");

		lot = new int[6];
		lot2 = new int[6];
		prize = new int[6];

		setLayout(new GridLayout(4, 1));
		Font f = new Font("TimesRoman", Font.BOLD, 40);
		la1 = new Label("0   0   0   0   0", Label.CENTER);
		la2 = new Label("0   0   0   0   0", Label.CENTER);
		la3 = new Label("0", Label.CENTER);
		la4 = new Label("0", Label.CENTER);
		la5 = new Label("0", Label.CENTER);
		la1.setFont(f);
		la2.setFont(f);
		la3.setFont(f);
		la4.setFont(f);
		la5.setFont(f);
		la1.setBackground(Color.lightGray);
		la2.setBackground(Color.cyan);
		la3.setBackground(Color.green);
		la4.setBackground(Color.magenta);
		la5.setBackground(Color.orange);
		b1 = new Button("Start");
		b1.addActionListener(this);
		b1.setFont(f);
		p1 = new Panel(new GridLayout(1, 3));
		p1.add(la3);
		p1.add(la4);
		p1.add(la5);
		add(la1);
		add(la2);
		add(p1);
		add(b1);

		this.addWindowListener(new WindowAdapter() {
			public void windowClosing(WindowEvent e) {
				setVisible(false);
				System.exit(0);
			}
		});

		// initLottoNo(lot);
		// javaSort(lot);
		//
		// running();
		//
		// // System.out.println(toString());

	}

	public void run() {
		int cnt = 0;

		dispLottoNo(lot, la1);

		// for (int i = 0; i < 1000; i++) {
		while (isstart) {
			dispLottoNo(lot2, la2);
			dispBonusNo();

			try {
				checkPrize();
			} catch (Prize5Exception e1) {
				// la5.setText("Prize 5 ");
				// System.out.println("Prize 5 Exception called. " +
				// toString());
			} catch (Prize4Exception e1) {
				la5.setText("Prize 4");
				System.out.println("Prize 4 Exception called. " + toString());
			} catch (Prize3Exception e1) {
				la5.setText("Prize 3");
				System.out.println("Prize 3 Exception called. " + toString());
			} catch (Prize2Exception e1) {
				la5.setText("Prize 2");
				System.out.println("Prize 2 Exception called. " + toString());
			} catch (Prize1Exception e1) {
				la5.setText("Prize 1");
				System.out.println("Prize 1 Exception called. " + toString());
				System.exit(0);
			} catch (Exception e) {
				// e.printStackTrace();
				la5.setText("Other Exception called.");
				System.out.println("Other Exception called.");
			}
			cnt++;

			la4.setText("" + cnt);

			years = cnt / 5 / 48;
			expense = cnt + "x1000";
			b1.setLabel("Start" + " : " + (cnt++) + ", " + (cnt / 5 / 48) + " years" + ", " + expense);

			try {
				Thread.sleep(1);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		} // while
			// System.out.println("Finished...");
	}

	public void actionPerformed(ActionEvent e) {
		if (isstart) {
			isstart = false;
			t = null;
		} else {
			isstart = true;
			t = new Thread(this);
			t.start();
		}

		System.out.println("isstart=" + isstart);

		// if (isstart == true && t == null) {
		// t = new Thread(this);
		// t.start();
		// }

		// if (t != null && isstart) {
		// t.interrupt();
		// }
	}

	public void checkPrize() throws Exception {
		int cnt = 0;

		for (int i = 0; i < lot.length; i++) {
			for (int j = 0; j < lot2.length; j++) {
				if (lot[i] == lot2[j]) {
					cnt++;
				}
			}
		}

		isbonus = false;
		if (cnt == 5) {
			for (int j = 0; j < lot2.length; j++) {
				if (lot[j] == bonus) {
					isbonus = true;
				}
			}
		}
		switch (cnt) {
		case 0:
		case 1:
		case 2:
			prize[5]++;
			break;
		case 3: // 5��
			prize[4]++;
			throw new Prize5Exception();
		case 4: // 4��
			prize[3]++;
			throw new Prize4Exception();
		case 5:
			if (isbonus) { // 2��
				prize[1]++;
				throw new Prize2Exception();
			} else { // 3��
				prize[2]++;
				throw new Prize3Exception();
			}
		case 6: // 1��
			prize[0]++;
			throw new Prize1Exception();
		}
	}

	public String toString() {
		return "Lotto5_3 [lot=" + Arrays.toString(lot) + ", lot2=" + Arrays.toString(lot2) + ", prize="
				+ Arrays.toString(prize) + ", bonus=" + bonus + ", years=" + years + ", expense=" + expense + "]";
	}

	// public void initLottoNo(int lottery[]) {
	public void dispLottoNo(int lottery[], Label lab) {
		boolean hasValue = false;
		int cnt = 0;
		Random rd = new Random();

		while (cnt < lottery.length) {
			int num = rd.nextInt(45) + 1;
			hasValue = false;

			for (int j = 0; j < lottery.length; j++) {
				if (lottery[j] == num)
					hasValue = true;
			}
			if (hasValue == false) {
				lottery[cnt] = num;
				cnt++;
			}
		}

		javaSort(lottery);

		java.util.Arrays.sort(lottery);
		lab.setText(String.format("%02d ", lottery[0]) + String.format("%02d ", lottery[1])
				+ String.format("%02d ", lottery[2]) + String.format("%02d ", lottery[3])
				+ String.format("%02d ", lottery[4]) + String.format("%02d ", lottery[5]));
	}

	// public void initBonusNo() {
	public void dispBonusNo() {
		boolean hasValue = false;
		Random rd = new Random();

		while (true) {
			int num = rd.nextInt(45) + 1;
			hasValue = false;

			for (int j = 0; j < lot.length; j++) {
				if (lot2[j] == num)
					hasValue = true;
			}
			if (hasValue == false) {
				bonus = num;
				break;
			}
		}

		la3.setText(String.format("%02d ", bonus));
	}

	public void javaSort(int lottery[]) {
		java.util.Arrays.sort(lottery);
	}

	public static void main(String[] args) {
		Lotto9_1 lot = new Lotto9_1();
		lot.setSize(900, 500);
		lot.setVisible(true);
	}
}
