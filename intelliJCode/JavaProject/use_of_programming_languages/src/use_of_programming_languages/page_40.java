package use_of_programming_languages;

public class page_40 {
    public static void main(String[] args) {
        String origin[] = {"Apple", "Banana", "Orange"};
        String copy_origin[] ={};

        copy_origin = origin;

        for (int i = 0; i < copy_origin.length; i++){
            System.out.println(copy_origin[i]);
        }

        copy_origin[1] = "Pineapple";

        for (int i = 0; i < copy_origin.length; i++){
            System.out.println(copy_origin[i]);
        }


    }
}
//내 식으로 변형해서 했음