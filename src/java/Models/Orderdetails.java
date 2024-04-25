/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

//hello world
import java.util.Date;

/**
 *
 * @author Dell
 */
public class Orderdetails {

    private int orderdetailid;
    private int userid;
    private String name;
    private String address;
    private String number;
    private String productname;
    private Date orderdate;
    private String sizename;
    private int quantity;
    private double totalprice;
    private String payment;
    private String status;
    
    public Orderdetails() {
    }

    public Orderdetails(int orderdetailid, int userid, String name, String address, String number, String productname, Date orderdate, String sizename, int quantity, double totalprice, String payment, String status) {
        this.orderdetailid = orderdetailid;
        this.userid = userid;
        this.name = name;
        this.address = address;
        this.number = number;
        this.productname = productname;
        this.orderdate = orderdate;
        this.sizename = sizename;
        this.quantity = quantity;
        this.totalprice = totalprice;
        this.payment = payment;
        this.status = status;
    }

    public int getOrderdetailid() {
        return orderdetailid;
    }

    public void setOrderdetailid(int orderdetailid) {
        this.orderdetailid = orderdetailid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public Date getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(Date orderdate) {
        this.orderdate = orderdate;
    }

    public String getSizename() {
        return sizename;
    }

    public void setSizename(String sizename) {
        this.sizename = sizename;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(double totalprice) {
        this.totalprice = totalprice;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

  

    

}
