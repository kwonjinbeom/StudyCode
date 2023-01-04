package lottoGenerator220924;

import java.util.Random;
import java.util.Scanner;

class Lotto{
    private final int lottoNum = 6;
    Lotto(){}
    Random random = new Random();
    public int[] lottoNumMake(){
        int[] lottoBox = new int[lottoNum];
        for (int i = 0; i < lottoBox.length; i++) {
            lottoBox[i] = random.nextInt(45)+1;
            for (int j = 0; j < i; j++) {
                if(lottoBox[i] == lottoBox[j]){
                    i--;
                }
            }
        }
        return lottoBox;
    }

    public void Buy(int buyNum, int[] lottoWinNum,int lottoWinBonus){
        System.out.print("이번 회차 로또 당첨번호는 >> ");
        lottoShow(lottoWinNum);
        System.out.print(" 보너스 번호 >> " + lottoWinBonus + "\n");
        lottoChoice(lottoWinNum, lottoWinBonus, lottoBuy(buyNum),lottoBonusBuy(buyNum));
    }
    public int[][] lottoBuy(int buyNum){
        int[][] buyBox = new int[buyNum][];
        for (int k = 0; k < buyNum; k++) {
            buyBox[k] = lottoNumMake();
        }
        System.out.println(buyNum+"개 구매완료!!");
        return buyBox;
    }
    public int[] lottoBonusBuy(int buyNum){
        int[] buyBonusBox = new int[buyNum];
        for (int k = 0; k < buyNum; k++) {
            buyBonusBox[k] = random.nextInt(45)+1;

        }
        return  buyBonusBox;
    }
    public void lottoChoice(int[] lottoWinNum,int lottoWinBonus, int[][] buyBox, int[] buyBonusBox){
        int count = 0;
        int countBonus = 0;
        for (int i = 0; i < buyBox.length; i++) {
            for (int j = 0; j < buyBox[i].length; j++) {
                for (int k = 0; k < lottoWinNum.length; k++) {
                    if(buyBox[i][j] == lottoWinNum[k]){
                        count++;
                    }
                }
            }
            if(buyBonusBox[i] == lottoWinBonus)
                countBonus++;
            System.out.print((i+1)+"번 로또 번호: ");
            lottoShow(buyBox[i]);
            System.out.print(" 보너스 번호: " + buyBonusBox[i]);
            System.out.println();
            lottoPlace(count, countBonus);
            count = 0;
            countBonus = 0;
        }
    }
    public void lottoPlace(int count, int countBonus) {
        System.out.println("맞은 갯수: " + count);
        System.out.println("보너스 맞은 갯수: " + countBonus);
        if (count == 3) {
            System.out.println("5등");
        } else if (count == 4) {
            System.out.println("4등");
        } else if (count == 5) {
            System.out.println("3등");
        } else if (((count == 5) && (countBonus == 1))) {
            System.out.println("2등");
        } else if (count == 6) {
            System.out.println("1등");
        } else{
            System.out.println("꽝");
        }
    }
    public void lottoShow(int[] array){
        for(int l : array) {
            System.out.print(l + " ");
        }
    }
}


public class lottoGenerator {
    public static void main(String[] args) {
        Random random = new Random();
        Scanner scanner = new Scanner(System.in);
        Lotto lotto = new Lotto();
        int num = 1;


        while(num != 0) {
            int[] lottoWinNum = lotto.lottoNumMake();
            int lottoWinBonus = random.nextInt(45)+1;

            System.out.println("로또를 구매하시겠습니까?(네 > 1 아니요 > 0)");
            num = scanner.nextInt();
            if (num == 1) {
                System.out.println("구매하고 싶은 복권의 갯수: ");
                int buyNum = scanner.nextInt();
                lotto.Buy(buyNum,lottoWinNum,lottoWinBonus);
            } else if(num==0){
                //pass
            } else{
                System.out.println("잘못 입력하셨습니다.");
            }
        }
        System.out.println("종료합니다.");
    }
}
