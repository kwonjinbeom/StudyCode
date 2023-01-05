package PhoneBook8;

import java.io.Serializable;

class PhoneInfo8 implements Serializable { // 미리 객체를 직렬화(객체를 데이터 Stream으로 쓸 때 사용)
    private static final long serialVersionUID = 1L;
    //Serializable 이 포함된 직렬화 객체에 serialVersionUID 값을 포함시키는 이유는
    // 다시 역직렬화를 해서 읽어 들일 때 현재 캐스팅한 클래스에
    // 포함되어 있는 serialVersionUID 번호와
    // 역직렬화한 객체의 serialVersionUID 번호가 맞는지 확인하기 위해서 입니다.
    // 이것이 맞지 않는다면 상태가 변경되었다고 판단하고 예외를 발생 시킵니다.
    //발생에러 InvalidClassException
    public String name;
    public String phoneNumber;



    PhoneInfo8(){}

    PhoneInfo8(String name, String phoneNumber){
        this.name = name;
        this.phoneNumber = phoneNumber;
    }

    public String getName(){return name;}
    public void setName(String name){this.name = name;}
    public String getPhoneNumber(){return phoneNumber;}
    public void setPhoneNumber(String phoneNumber){this.phoneNumber = phoneNumber;}


    public void showPhoneInfo(){
        System.out.println("name: "+ name);
        System.out.println("phone: "+ phoneNumber);
    }
    @Override
    public boolean equals(Object obj){
        return name.equals(((PhoneInfo8)obj).name);
    }
    @Override
    public int hashCode(){
        return name.hashCode();
    }
    //Hashset은 중복을 허용하지 않는다. 하지만 객체의 경우 생성 시 주소 값으로 저장되기 때문에
    //hashCode의 직접적인 비교를 하지 않으면 객체의 필드 값이 같아도 중복을 구별할 수 없다.
    //그러므로 이름을 기준으로 한 name.hashCode 를 토대로 equals 메서드를 실행해 재확인.
    //한줄요약: hashset에서 객체 단위의 중복 판별은 hashCode와 equals의 재정의 필수.
}
class PhoneCompanyInfo extends PhoneInfo8 {
    private String company;

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    PhoneCompanyInfo() {
    }

    PhoneCompanyInfo(String name, String phoneNumber, String company) {
        super(name, phoneNumber);
        this.company = company;
    }
    @Override
    public void showPhoneInfo(){
        super.showPhoneInfo();
        System.out.println("회사: " + company);
    }
}

class PhoneUnivInfo extends PhoneInfo8 {

    private String major;
    private int year;

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    PhoneUnivInfo() {
    }

    PhoneUnivInfo(String name, String phoneNumber, String major, int year) {
        super(name, phoneNumber);
        this.major = major;
        this.year = year;
    }

    @Override
    public void showPhoneInfo(){
        super.showPhoneInfo();
        System.out.println("전공: " + major);
        System.out.println("학년: " + year);
    }
}
