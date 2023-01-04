package week_10.W24번부터29번까지;

public class BioKey extends Key{
    public int fingerprint;

    @Override
    public String toString() {
        return "fingerprint=" + fingerprint + " " + super.toString();
    }
}
