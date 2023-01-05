package subject_management;

import academic_management.MenuViewer;

import javax.security.auth.Subject;
import java.util.ArrayList;
import java.util.Scanner;

// 학과 입력, 수정, 삭제, 검색, 전체 조회 등의 실질적인 기능을 구현해 놓은 클래스
public class SubjectManagement {
    private SubjectDAO dao = SubjectDAO.getInstance();
    public static Scanner scan = new Scanner(System.in);

    public void read(String mode){
        SubjectVO vo = null;
        if(mode.equals("search")){
            vo = inputData("search");
            System.out.println("검색 단어 :" + vo.getS_name());
        }
        ArrayList<SubjectVO> svo = dao.getSubjectTotal(vo);
        System.out.println("\n**** subject 테이블 데이터 출력 ****");
        System.out.println("번호\t학과번호\t학과명");
        if(svo.size() > 0){
//            for (int i = 0; i < svo.size(); i++) {
//                SubjectVO sub = svo.get(i)
//            }
            for (SubjectVO sub : svo){
                System.out.print(sub.getNo() + "\t");
                System.out.print(sub.getS_num()+"\t");
                System.out.println(sub.getS_name()+"\t");
            }
        }else{
            System.out.println("학과 정보가 존재하지 않습니다.");
        }
    }
    private SubjectVO inputData(String mode){
        String s_num = null, s_name = null;

//        추후 입력 시 학과 번호를 자동으로 부여하도록 설정
//          SubjectDAO 클래스에서 getSubjectNum()메서드가 정의 되면 아래의 입력 부분을 주석 해제한다.
        if(mode.equals("input")){
            System.out.println("학과코드 입력 : ");
            s_num = dao.getSubjectNum();
            System.out.println(s_num);
        }
        if(mode.equals("update")){
            System.out.println("학과코드 입력 : ");
            s_num = MenuViewer.keyboard.nextLine();
            System.out.println(s_num);
        }
        if(mode.equals("delete")){
            System.out.println("학과코드 입력 : ");
            s_num = MenuViewer.keyboard.nextLine();
            System.out.println(s_num);
            s_name = "";
            SubjectVO sub = new SubjectVO(0, s_num, s_name);
            return sub;
        }
//        if(mode.equals("search")){
//            s_num = "";
//        }

//        SubjectDAO 클래스에서 getSubjectNum() 메서드가 정의되면 아래의 입력부분을 주석처리한다.
//        System.out.println("학과 코드 입력 : ");
//        s_num = MenuViewer.keyboard.nextLine();
        System.out.println("학과명 입력 : ");
        s_name = MenuViewer.keyboard.nextLine();

        SubjectVO sub = new SubjectVO(0, s_num, s_name);
        return sub;
    }
    public void create(){
        SubjectVO svo = inputData("input");
        boolean result = dao.subjectInsert(svo);
        if(result){
            System.out.println("학과 데이터 입력 성공.");
        }else{
            System.out.println("학과 데이터 입력 실패.");
        }
    }
//    private  int inputDataNo(){
//        int no;
//        System.out.println("번호 입력 : ");
//        no = MenuViewer.keyboard.nextInt();
//        return no;
//    }

    public void update(){
        SubjectVO svo = inputData("update");

//        int no = inputDataNo();
//        svo.setNo(no);

        boolean result = dao.subjectUpdate(svo);
        if(result){
            System.out.println("학과 데이터 수정 성공.");
        }else{
            System.out.println("학과 데이터 수정 실패.");
        }
    }

    public void delete(){
        SubjectVO svo = inputData("delete");
        int nullCheck = dao.studentDataCheck(svo);
        System.out.println(nullCheck+"@@@");
        if(nullCheck != 0){
            System.out.println("학과에 소속된 학생이" +nullCheck +"명 있습니다.");
        }else{
            System.out.println("학과에 소속된 학생이 없습니다.");
            boolean result = dao.subjectDelete(svo);
//        boolean resu = dao.sequenceRemake();
            if(result){
                System.out.println("학과 데이터 삭제 성공.");
            }else{
                System.out.println("학과 데이터 삭제 실패.");
            }
        }

//        if(resu){
//            System.out.println("시퀀스 동기화 성공.");
//        }else{
//            System.out.println("시퀀스 동기화 실패.");
//        }

    }

//    public void search(){
//            SubjectVO vo = inputData("search");
//            ArrayList<SubjectVO> svo = dao.getSubject(vo);
//            System.out.println("\n**** subject 테이블 데이터 출력 ****");
//            System.out.println("번호\t학과번호\t학과명");
//            if(svo.size() > 0){
////            for (int i = 0; i < svo.size(); i++) {
////                SubjectVO sub = svo.get(i)
////            }
//                for (SubjectVO sub : svo){
//                    System.out.print(sub.getNo() + "\t");
//                    System.out.print(sub.getS_num()+"\t");
//                    System.out.println(sub.getS_name()+"\t");
//                }
//            }else{
//                System.out.println("학과 정보가 존재하지 않습니다.");
//            }
//    }
}
