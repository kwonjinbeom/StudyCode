package PhoneBook7;

public class PhoneChoiceError extends Exception{
    private int choice;
    PhoneChoiceError(int choice){
        super("유효하지 않은 값입니다.");
        this.choice = choice;
    }
    public void showWrongMenu(){
        System.out.println(choice + "에 해당하는 선택은 존재하지 않습니다.");
        System.out.println("메뉴 선택을 처음부터 다시 진행합니다.");
    }
}
