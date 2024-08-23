public class temperature {
	public static Decimal temp(Decimal fh)
    {
        Decimal res = (fh-32) *5/9;
        return res.setScale(2);
    }
    
}