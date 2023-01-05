package 열거타입220928;

enum Gender{
    MALE, FEMALE
}

enum Direction{
    EAST, WEST, SOUTH, NORTH
}
public class DeveloperTest {
    public static void main(String[] args) {
        Gender gender = Gender.FEMALE;
        if(gender == Gender.MALE)
            System.out.println(Gender.MALE + "은 병역 의무가 있다.");
        else
            System.out.println(Gender.FEMALE + "은 병역 의무가 있다.");
//        if(gender == Direction.SOUTH)
//            System.out.println(Direction.SOUTH + "는 누구?");
        //gender = "남자";
    }
}
