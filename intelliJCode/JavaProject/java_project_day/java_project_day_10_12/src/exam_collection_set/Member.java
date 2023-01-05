package exam_collection_set;

public class Member {
    private String name;
    private int age;

    public Member(String name, int age) {
        this.name = name;
        this.age = age;
    }

    @Override
    public String toString(){
        return String.format("member - (name : %s, age : %d) ", name, age);
    }

    @Override
    public boolean equals(Object obj){
        if(obj instanceof Member){
            Member member = (Member) obj;
            if(name.equals(member.name))
                return true;
        }
        return false;
    }
    @Override
    public int hashCode(){
        return name.hashCode();
    }
}
