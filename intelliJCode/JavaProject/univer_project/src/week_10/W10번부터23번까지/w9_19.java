//package week_10;
//
//public class Zebra extends Horse {
//    public int numOfStripe;
//
//    Zebra(){}
//    Zebra(int numOfStripe, int numOfLeg, String power, String color, int speed){
//        this.numOfStripe = numOfStripe;
//        this.numOfLeg = numOfLeg;
//        this.power = power;
//        this.color = color;
//        this.speed = speed;
//    }
//
//    public int getNumOfStripe(){return numOfStripe;}
//    public void setNumOfStripe(){this.numOfStripe = numOfStripe;}
//    public int getNumOfLeg(){return numOfLeg;}
//    public void setNumOfLeg(){this.numOfLeg = numOfLeg;}
//    public String getPower(){return power;}
//    public void setPower(){this.power = power;}
//    public String getColor(){return color;}
//    public void setColor(){this.color = color;}
//    public int getSpeed(){return speed;}
//    public void setSpeed(){this.speed = speed;}
//
//    @Override
//    public void run() {
//        super.run();
//    }
//
//    @Override
//    public String toString() {
//        return "numOfStripe=" + numOfStripe +" "+ super.toString() ;
//    }
//
//    public static void main(String[] args) {
//        Zebra zebra = new Zebra(2,4,"Strong","brown",6);
//        zebra.run();
//
//        Zebra zebra1 = new Zebra();
//        zebra1.run();
//    }
//}
