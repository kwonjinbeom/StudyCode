package getterSetter;

public class Class_Getter_Setter {
    public String name ;//멤버 필드

    public Class_Getter_Setter(){}
    public Class_Getter_Setter(String name){
        this.name = name;

    }
    public String getName(){
        return name;
    }
    public void setName(String name){
        this.name = name;
    }
}
