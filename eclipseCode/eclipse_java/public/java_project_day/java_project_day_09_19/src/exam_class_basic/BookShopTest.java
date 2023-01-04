package exam_class_basic;

public class BookShopTest {
    public static void main(String[] args) {
        BookShop bs = new BookShop();

        System.out.println("<<값 대입>>");
        bs.bookShopData("Web/servlet", "Dominica", 30000);

        System.out.println("책이름 : " + bs.getTitle());
        System.out.println("저자 : " + bs.getAuthor());
        System.out.println("가격 : " + bs.getPrice());

        System.out.println("\n<<값 변경 후 출력>>");
        bs.setTitle("안드로이드 이렇게 시작하세요");
        bs.setAuthor("홍길동");
        bs.setPrice(30000);

        System.out.println(bs.toString());
    }
}
