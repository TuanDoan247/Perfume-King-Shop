
package entity;


public class Bill {
    private String  oID; //varchar(32) primary key
    private String DateofTime;
    private String cname ,cphone, cAddress; 
    private double totalMoney;
    private int status ,cid;

    public Bill() {
    }

    public Bill(String oID, String DateofTime, String cname, String cphone, String cAddress, double totalMoney, int status, int cid) {
        this.oID = oID;
        this.DateofTime = DateofTime;
        this.cname = cname;
        this.cphone = cphone;
        this.cAddress = cAddress;
        this.totalMoney = totalMoney;
        this.status = status;
        this.cid = cid;
    }

    public Bill(String oID, String cname, String cphone, String cAddress, double totalMoney, int status, int cid) {
        this.oID = oID;
        this.cname = cname;
        this.cphone = cphone;
        this.cAddress = cAddress;
        this.totalMoney = totalMoney;
        this.status = status;
        this.cid = cid;
    }

    public String getoID() {
        return oID;
    }

    public void setoID(String oID) {
        this.oID = oID;
    }

    public String getDateofTime() {
        return DateofTime;
    }

    public void setDateofTime(String DateofTime) {
        this.DateofTime = DateofTime;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCphone() {
        return cphone;
    }

    public void setCphone(String cphone) {
        this.cphone = cphone;
    }

    public String getcAddress() {
        return cAddress;
    }

    public void setcAddress(String cAddress) {
        this.cAddress = cAddress;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    @Override
    public String toString() {
        return "Bill{" + "oID=" + oID + ", DateofTime=" + DateofTime + ", cname=" + cname + ", cphone=" + cphone + ", cAddress=" + cAddress + ", totalMoney=" + totalMoney + ", status=" + status + ", cid=" + cid + '}';
    }
}
