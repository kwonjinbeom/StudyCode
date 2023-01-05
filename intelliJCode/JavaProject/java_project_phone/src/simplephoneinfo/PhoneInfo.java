package simplephoneinfo;

public class PhoneInfo {
    private String name;
    private String phoneNumber;
    private String birthday;

    PhoneInfo(){}
    PhoneInfo(String name, String phoneNumber){
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.birthday = null;
    }
    PhoneInfo(String name, String phoneNumber,String birthday){
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.birthday = birthday;
    }

    public String getName(){return name;}
    public void setName(String name){this.name = name;}
    public String getPhoneNumber(){return phoneNumber;}
    public void setPhoneNumber(String phoneNumber){this.phoneNumber = phoneNumber;}
    public String getBirthday(){return birthday;}
    public void setBirthday(String birthday){this.birthday = birthday;}
    public void showPhoneInfo(){
        if(birthday==null){
            System.out.println("name: "+ name + "\nphone: " + phoneNumber);
        }else{
            System.out.println("name: "+ name + "\nphone: " + phoneNumber + "\nbirth: " + birthday);
        }
    }
}
