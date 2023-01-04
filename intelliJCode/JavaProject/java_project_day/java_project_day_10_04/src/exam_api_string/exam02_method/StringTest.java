package exam_api_string.exam02_method;

public class StringTest {

    static String getGender(String ssn){
        String a = new String(ssn);
        String gender;
        int genderNum = a.charAt(7);
        if (genderNum == '1' || genderNum =='3'){
            gender = "남자";
        }else if(genderNum == '2' || genderNum =='4'){
            gender = "여자";
        }else{
            gender = "주민 번호가 잘못 입력되었습니다.";
        }
        return gender;
    }
    static void fileExtCheck(String fileName){
        String b = "";
        String a = new String(fileName);
        String fileTypeArray[] = fileName.split("");
        for (int i = a.length() - 3; i < a.length(); i++) {
            System.out.println(fileTypeArray[i]);
            b = b + fileTypeArray[i];
        }

        System.out.println(b);
        if(b.equals("gif") || b.equals("jpg") || b.equals("png") || b.equals("jpeg")){
            System.out.println("이미지 파일이므로 등록 가능합니다.");
        }else{
            System.out.println("이미지 파일만 등록가능합니다.");
        }
    }
//    public static boolean fileExtCheck(String fileName){
//        String[] fileNameExt = {"gif", "jpg", "png", "jpeg"};
//        String ext = fileName.substring(
//                fileName.lastIndexOf(".") + 1,
//                fileName.length());
//        for (int i = 0; i < fileNameExt.length; i++) {
//            if(ext.equalsIgnoreCase(fileNameExt[i])){
//                return true;
//            }
//        }
//        return false;
//    }
    public static void main(String[] args) {
        String ssn = "660606-1234561";
        System.out.printf("당신의 성별: %s\n", getGender(ssn));

        String fileName = "text.jpg";
        System.out.println("파일명 :" + fileName);
        fileExtCheck(fileName);
    }


}
