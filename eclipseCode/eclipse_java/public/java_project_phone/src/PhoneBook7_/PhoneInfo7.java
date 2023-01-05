package PhoneBook7_;

class PhoneInfo7 {
    public String name;
    public String phoneNumber;



    PhoneInfo7(){}

    PhoneInfo7(String name, String phoneNumber){
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
        return name.equals(((PhoneInfo7)obj).name);
    }
    @Override
    public int hashCode(){
        return name.hashCode();
    }


}
class PhoneCompanyInfo extends PhoneInfo7 {
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

class PhoneUnivInfo extends PhoneInfo7 {

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
