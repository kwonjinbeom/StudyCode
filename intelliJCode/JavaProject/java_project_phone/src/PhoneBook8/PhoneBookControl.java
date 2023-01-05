package PhoneBook8;

import javax.xml.crypto.Data;
import java.io.*;
import java.util.*;

public class PhoneBookControl {
    Scanner input = new Scanner(System.in);
    Set<PhoneInfo8> pSet = new HashSet<>();
    //중복방지를 위해 Set
    Iterator<PhoneInfo8> iter = pSet.iterator();
    //Set은 순서가 없으므로 인덱스 접근 불가, 반복자 사용

    public boolean phoneSave(PhoneInfo8 p){
            return pSet.add(p);
        } //데이터 저장(Pset에 객체 저장)

    public void phoneSearch(String searchName){ //데이터 검색(이름기준, 반복자)
        iter = pSet.iterator();
        boolean result = false;
        while(iter.hasNext()){
            PhoneInfo8 iterNext = iter.next();
            if(searchName.equals(iterNext.getName())){
                iterNext.showPhoneInfo();
               result = true;
            }
        }
        if(result == false){
            System.out.println("이름을 잘못 입력하셨습니다.");
        }
    }
    public void phoneDelete(String deleteName) throws PhoneChoiceError { //데이터 삭제(이름기준, 반복자)
        boolean deleteKey = true;
        iter = pSet.iterator();
        while(iter.hasNext()) {
            PhoneInfo8 iterNext = iter.next();
            if (deleteName.equals(iterNext.getName())) {
                System.out.println("삭제할 데이터가 존재합니다. 삭제하시겠습니까?");
                System.out.println("1. Yes \t 2.No");
                System.out.print("선택 : ");
                int deleteChoice = input.nextInt();
                if (deleteChoice < 1 || deleteChoice > 2)
                    throw new PhoneChoiceError(deleteChoice); //PhoneChoiceError 클래스에서 error throw
                switch (deleteChoice) {
                    case 1:
                        iter.remove();
                        System.out.println("삭제가 완료되었습니다.");
                        deleteKey = false;
                        break;
                    case 2:
                        System.out.println("삭제를 취소합니다.");
                        break;
                    default:
                        System.out.println("잘못 입력하셨습니다.");
                }

            }
        }
        if(deleteKey == true){
            System.out.println("삭제할 데이터가 없습니다.");
        }
    }

    public void phonePrint(){ //모든 데이터 보기(반복자)
        iter = pSet.iterator();
        while(iter.hasNext()){
            iter.next().showPhoneInfo();
        }
    }
    // IO(입출력 시)throw IOException을 하는 이유
    // 컴퓨터 프로그램이 실행될 때 언제 어떤 문제가 발생할지 모르는 일이기 때문에 프로그램을 만들때는 예외로 발생하는 상황에 대처해야 하는데 자바는
    // 입력과 출력을 할 때 발생할 수 있는 예외에 대해서 까다롭게 규정함. 그래서 입력과 출력을 다루는 메서드에 예외처리가 없다면 컴파일 에러가 발생.
    // 예외를 날리는 이유는 호출 메소드에게 해당 메소드의 예외 처리를 인가하기 위함이다. 예외를 선언하여 해당 메소드를 실행 시
    // 발생할 수 있는 예외를 명시해줌으로써 사용자가 알아서 처리하도록 하는 것이다.
    public void phoneWrite(){ //데이터(메모장) 저장(백업)(pSet 내부를 객체 단위(writeObject)로써
        // 반복자, ObjectOutputStream을 이용해 메모장에 저장)
        ObjectOutputStream oos = null;
        try{
            oos = new ObjectOutputStream(new FileOutputStream("PhoneBook.dat"));
            iter = pSet.iterator();
            while(iter.hasNext()){
                oos.writeObject(iter.next());
            }
        }catch (IOException e){
            e.printStackTrace();
        }finally {
            try {
                if(oos != null){oos.close();}
            }catch (IOException e){
                e.printStackTrace();
            }
        }
    }
    public void phoneRead(){ //데이터(메모장) 읽기(가져오기)(메모장의 내용을
        // 반복자, ObjectIuputStream을 이용해 객체 단위(readObject)로 가져와 다시 pSet에 기입(phoneSave)
        // E0FException 즉 null값 발생을 trigger로 read 마무리)
        boolean readKey = true;
        ObjectInputStream ois = null;
        try {
            ois = new ObjectInputStream(new FileInputStream("PhoneBook.dat"));
            //방법1
            while(readKey){
                PhoneInfo8 pRead = (PhoneInfo8) ois.readObject();//(readObject(read)는 반복자의 next와 같이 실행마다 넘어감.
                //ois.readObject 는 메모장에서 읽어온 한 줄의 Object(객체)이다. phoneSave의 받는 매개변수 값은
                //똑같은 객체이지만 다른 점이 있다면 PhoneInfo8의 Object 그러므로
                //일반 Object를 PhoneInfo8의 Object 로 DownCasting 함.
                phoneSave(pRead);
            }
            //방법2
//            while(true){
//                PhoneInfo8 pRead = (PhoneInfo8) ois.readObject();
//                if(pRead == null)
//                    break;
//                phoneSave(pRead);
//            }
        }catch (EOFException e){ //readObject가 읽을 때 null 발생 시 에러발생
            readKey = false;
        }catch (ClassNotFoundException c){ //객체의 클래스를 찾을 수 없는 예외상황
            c.printStackTrace();
        }catch (FileNotFoundException f) {
            System.out.println("불러올 파일이 없습니다.");
        }catch (IOException io){
            io.printStackTrace();
        }finally {
            try{
                if(ois != null){ois.close();}
            }catch (IOException e){
                e.printStackTrace();
            }
        }

    }
}
