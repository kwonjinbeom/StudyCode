package exam_multi_type_parameter;

public class Product <T,M>{
    private T kind; // 상품의 종류
    private M model; // 상품의 모델명

    public Product(){}
    public Product(T kind, M model){
        this.kind = kind;
        this.model = model;
    }
    public T getKind(){
        return this.kind;
    }

    public M getModel() {
        return model;
    }

    public void setKind(T kind) {
        this.kind = kind;
    }

    public void setModel(M model) {
        this.model = model;
    }
    @Override
    public String toString(){
        return "kind : " + kind.getClass().getSimpleName().toUpperCase() + ", model :" +model;
    }
}
