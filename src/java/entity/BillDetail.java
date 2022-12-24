package entity;

public class BillDetail {
    private String pid ,oID;
    private int quantity, priceMoney, totalMoney;

    public BillDetail() {
    }

    public BillDetail(String pid, String oID, int quantity, int priceMoney, int totalMoney) {
        this.pid = pid;
        this.oID = oID;
        this.quantity = quantity;
        this.priceMoney = priceMoney;
        this.totalMoney = totalMoney;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getoID() {
        return oID;
    }

    public void setoID(String oID) {
        this.oID = oID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPriceMoney() {
        return priceMoney;
    }

    public void setPriceMoney(int priceMoney) {
        this.priceMoney = priceMoney;
    }

    public int getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(int totalMoney) {
        this.totalMoney = totalMoney;
    }

    @Override
    public String toString() {
        return "BillDetail{" + "pid=" + pid + ", oID=" + oID + ", quantity=" + quantity + ", priceMoney=" + priceMoney + ", totalMoney=" + totalMoney + '}';
    }
}
