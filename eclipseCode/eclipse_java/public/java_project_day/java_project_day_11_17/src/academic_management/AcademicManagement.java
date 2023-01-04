package academic_management;

import subject_management.SubjectManagement;

public class AcademicManagement {
    public static void main(String[] args) {
        SubjectManagement subject = new SubjectManagement();
        int topMenuchoice, subMenuchoice;

        System.out.println("학사 관리 프로그램을 시작합니다..");
        while(true){
            MenuViewer.showTopMenu();
            topMenuchoice = MenuViewer.keyboard.nextInt();
            MenuViewer.keyboard.nextLine();

            if(topMenuchoice < 1 || topMenuchoice > 3){
                System.out.println("메뉴 선택을 처음부터 다시 진행합니다.\n");
                continue;
            }

            if(topMenuchoice == 3){
                System.out.println("프로그램을 종료합니다.");
                System.exit(0);
            }

            MenuViewer.showSubMenu();
            subMenuchoice = MenuViewer.keyboard.nextInt();
            MenuViewer.keyboard.nextLine();

            if(topMenuchoice == 1){
                switch(subMenuchoice){
                    case 1:
                        System.out.println("조회\n");
                        subject.read("select");
                        break;
                    case 2:
                        System.out.println("입력\n");
                        subject.create();
                        break;
                    case 3:
                        System.out.println("수정\n");
                        subject.update();
                        break;
                    case 4:
                        System.out.println("삭제\n");
                        subject.delete();
                        break;
                    case 5:
                        System.out.println("검색(학과명\n");
                        subject.read("search");
                        break;
                    default:
                        System.out.println("검색, 입력, 수정, 삭제, 검색 중에 하나를 선택해주시면 됩니다\n");
                }
            }else if(topMenuchoice == 2){
                switch(subMenuchoice){
                    case 1:
                        System.out.println("조회\n");
                        subject.read("select");
                        break;
                    case 2:
                        System.out.println("입력\n");
                        subject.create();
                        break;
                    case 3:
                        System.out.println("수정\n");
                        subject.update();
                        break;
                    case 4:
                        System.out.println("삭제\n");
                        subject.delete();
                        break;
                    case 5:
                        System.out.println("검색(학과명\n");
                        subject.read("search");
                        break;
                    default:
                        System.out.println("검색, 입력, 수정, 삭제, 검색 중에 하나를 선택해주시면 됩니다\n");
                }
            }
        }
    }
}
