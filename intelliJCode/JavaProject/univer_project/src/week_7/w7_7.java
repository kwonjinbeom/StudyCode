package week_7;

public class w7_7 {
    public static void main(String[] args) {
        int[][] array = {{7,39,4,17,2},{3,39,6,132,2},{3,132,6,9,8}};
        int[] inputCountValue = new int[999];
        int count = 0;
        boolean countKey;
        for (int i = 0; i < array.length; i++) {
            for (int j = 0; j < array[i].length; j++) {
                for (int k = 0; k < array.length; k++) {
                    for (int l = 0; l < array[i].length; l++) {
                        if(array[i][j] == array[k][l]) {
                            //2차원 배열을 한 요소씩 순회해서 중복의 요소를 찾는다.
                            countKey = true;
                            for (int m = 0; m < inputCountValue.length; m++) {
                                if (inputCountValue[m] == array[k][l]) {
                                    countKey = false;
                                    //중복된 값이 있다면 넣지 않는다.
                                }
                            }
                            if(countKey == true){
                                inputCountValue[count] = array[i][j];
                                count++;
                                //중복된 값이 없을 때 배열에 추가
                            }
                        }
                    }
                }
            }
        }
        int numCount = 0; //배열을 채운 0의 갯수
        for (int i = 0; i < inputCountValue.length-1; i++) { //정제되지 않은 중복 값
            if(inputCountValue[i] == inputCountValue[i+1]){
                //중복 값은 같은 값이 없으므로 있다면 배열을 채운 0의 갯수
                numCount++;
            }
        }
        numCount++;//맨 마지막 배열의 값 세기
        System.out.println();
        int[] countArray = new int[inputCountValue.length-numCount];// 정제된 중복 값 배열 생성
        for (int i = 0; i < countArray.length; i++) {
            countArray[i] = inputCountValue[i];
        }

        for (int s = 0; s < countArray.length; s++) {
            int key = countArray[s];
            int keyCount = 0;
            int d = 0;
            for (int i = 0; i < array.length; i++) {
                for (int j = 0; j < array[i].length; j++) {
                    if(array[i][j] == key){
                        d ++;
                        //52, 53번줄은 일단 한번 중복된 값을 세었으면 다시 보지 않기위함.
                        if(d < 2) {
                            for (int k = 0; k < array.length; k++) {
                                for (int l = 0; l < array[i].length; l++) {
                                    if (array[i][j] == array[k][l]) {
                                        if (array[i][j] == key) {
                                            keyCount++;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            System.out.println(key+"의 개수: "+ keyCount);
        }

    }
}
