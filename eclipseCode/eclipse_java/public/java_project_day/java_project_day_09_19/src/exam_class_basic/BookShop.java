package exam_class_basic;

public class BookShop {
    private String title;
    private String author;
    private int price;

    public String getTitle(){
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    public void bookShopData(String title, String author, int price){
        this.title = title;
        this.author = author;
        this.price = price;
    }
    public String toString(){
        return String.format("책이름: %s\n저자 : %s\n가격: %d", title, author, price);
    }
}
