package exam_api_stringbuffer.exam01_method;

public class StringBufferExample {
    public static void main(String[] args) {
        StringBuffer sb = new StringBuffer("This");

        sb.append(" is pencil ");
        System.out.println(sb);

        sb.insert(7, " my");
        System.out.println(sb);

        sb.replace(8, 10, "your");
        System.out.println(sb);

        sb.delete(8, 13);
        System.out.println(sb);

        sb.setLength(4);
        System.out.println(sb);

        sb.reverse();
        System.out.println(sb);

        sb.delete(0, sb.length());
        System.out.println(sb.toString().isEmpty());
    }
}
