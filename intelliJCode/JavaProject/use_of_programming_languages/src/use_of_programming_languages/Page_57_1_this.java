package use_of_programming_languages;

public class Page_57_1_this {
    private int posX;
    private int posY;

    public void out(){
        System.out.println("[" + posX + "," + posY + "]");}

    public int getPosX(){   return posX;}
    public void setPosX(int posX){  this.posX = posX;}

    public int getPosY(){   return posY;}
    public void setPosY(int posY){  this.posY = posY;}

    public Page_57_1_this(){
        this(10,20);
        }
    public Page_57_1_this(int posX, int posY){
        this.posX = posX;
        this.posY = posY;
        }
    }

