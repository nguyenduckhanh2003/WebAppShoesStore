/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.*;
import Models.Products;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Dell
 */
public class DAO extends DBContext {

    //in ra danh sách các sản phẩm
    public ArrayList<Products> getProducts() {
        ArrayList<Products> products = new ArrayList<>();
        try {
            String sql = "SELECT P.product_id, P.product_name, Ca.category_id, P.price, P.link,P.description, Ca.category_name "
                    + "FROM Products P INNER JOIN Categories Ca ON P.category_id = Ca.category_id;";

            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Products p = new Products();
                p.setProductid(rs.getInt("product_id"));
                p.setProductname(rs.getString("product_name"));
                p.setPrice(rs.getDouble("price"));
                p.setLink(rs.getString("link"));
                p.setDescription(rs.getString("description"));

                Categories ca = new Categories();
                ca.setCategoriesid(rs.getInt("category_id"));
                ca.setCategoriesname(rs.getString("category_name"));
                p.setCategories(ca);
                products.add(p);
            }
        } catch (SQLException ex) {

            ex.printStackTrace();
        }

        return products;
    }

    //phân loại sản phẩm theo categories bằng id
    public ArrayList<Products> getProductsbyCID(String cid) {
        ArrayList<Products> products = new ArrayList<>();
        try {
            String sql = "SELECT P.product_id, P.product_name, Ca.category_id, P.price, P.link,P.description, Ca.category_name "
                    + "FROM Products P INNER JOIN Categories Ca ON P.category_id = Ca.category_id Where P.category_id=?;";

            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, cid);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Products p = new Products();
                p.setProductid(rs.getInt("product_id"));
                p.setProductname(rs.getString("product_name"));
                p.setPrice(rs.getDouble("price"));
                p.setLink(rs.getString("link"));
                p.setDescription(rs.getString("description"));

                Categories ca = new Categories();
                ca.setCategoriesid(rs.getInt("category_id"));
                ca.setCategoriesname(rs.getString("category_name"));
                p.setCategories(ca);
                products.add(p);
            }
        } catch (SQLException ex) {

            ex.printStackTrace();
        }

        return products;
    }

    //show chi tiết 1 sản phẩm
    public Products getProductsbyPID(String id) {
        try {
            String sql = "SELECT P.product_id, P.product_name, Ca.category_id, P.price, P.link,P.description, Ca.category_name "
                    + "FROM Products P INNER JOIN Categories Ca ON P.category_id = Ca.category_id Where P.product_id=?;";

            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Products p = new Products();
                p.setProductid(rs.getInt("product_id"));
                p.setProductname(rs.getString("product_name"));
                p.setPrice(rs.getDouble("price"));
                p.setLink(rs.getString("link"));
                p.setDescription(rs.getString("description"));

                Categories ca = new Categories();
                ca.setCategoriesid(rs.getInt("category_id"));
                ca.setCategoriesname(rs.getString("category_name"));
                p.setCategories(ca);
                return p;
            }
        } catch (SQLException ex) {

            ex.printStackTrace();
        }
        return null;
    }

    //dùng để search các sản phẩm
    public ArrayList<Products> getProductsbySname(String txtSearch) {
        ArrayList<Products> products = new ArrayList<>();
        try {
            String sql = "SELECT P.product_id, P.product_name, Ca.category_id, P.price, P.link,P.description, Ca.category_name "
                    + "FROM Products P INNER JOIN Categories Ca ON P.category_id = Ca.category_id Where P.product_name like ?;";

            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, "%" + txtSearch + "%");
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Products p = new Products();
                p.setProductid(rs.getInt("product_id"));
                p.setProductname(rs.getString("product_name"));
                p.setPrice(rs.getDouble("price"));
                p.setLink(rs.getString("link"));
                p.setDescription(rs.getString("description"));

                Categories ca = new Categories();
                ca.setCategoriesid(rs.getInt("category_id"));
                ca.setCategoriesname(rs.getString("category_name"));
                p.setCategories(ca);
                products.add(p);
            }
        } catch (SQLException ex) {

            ex.printStackTrace();
        }

        return products;
    }

    //nhân dữ liệu categories
    public ArrayList<Categories> getCategories() {
        ArrayList<Categories> categories = new ArrayList<>();
        try {
            String sql = "SELECT *from Categories";

            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Categories ca = new Categories();
                ca.setCategoriesid(rs.getInt("category_id"));
                ca.setCategoriesname(rs.getString("category_name"));
                categories.add(ca);
            }
        } catch (SQLException ex) {

            ex.printStackTrace();
        }

        return categories;
    }

    //Size
    //nhận thông tin từ bảng Size cho từng product
    public ArrayList<Size> getSizesByPID(String id) {
        ArrayList<Size> sizes = new ArrayList<>();
        try {
            String sql = "SELECT *from Size where product_id=? ";

            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Size s = new Size();
                s.setSizeid(rs.getInt("size_id"));
                s.setProductid(rs.getInt("product_id"));
                s.setSizename(rs.getString("size_name"));
                s.setQuantity(rs.getInt("quantity"));
                sizes.add(s);
            }
        } catch (SQLException ex) {

            ex.printStackTrace();
        }

        return sizes;
    }

    //lấy danh sách của sizes
    public ArrayList<Size> getAllSizes() {
        ArrayList<Size> sizes = new ArrayList<>();
        try {
            String sql = "SELECT *from Size";

            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Size s = new Size();
                s.setSizeid(rs.getInt("size_id"));
                s.setProductid(rs.getInt("product_id"));
                s.setSizename(rs.getString("size_name"));
                s.setQuantity(rs.getInt("quantity"));
                sizes.add(s);
            }
        } catch (SQLException ex) {

            ex.printStackTrace();
        }

        return sizes;
    }
    //lấy thông tin của bảng size để kiểm tra khi thêm thông tin mới

    public Size checkSizeInfo(String pid, String sizename) {
        try {
            String sql = "SELECT *from Size where product_id = ? and size_name = ?";

            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, pid);
            statement.setString(2, sizename);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Size s = new Size();
                s.setSizeid(rs.getInt("size_id"));
                s.setProductid(rs.getInt("product_id"));
                s.setSizename(rs.getString("size_name"));
                s.setQuantity(rs.getInt("quantity"));
                return s;
            }
        } catch (SQLException ex) {

            ex.printStackTrace();
        }

        return null;
    }
    //thêm thông tin size và số lượng cho product

    public void insertSize(String pid, String sizename, String quantity) {
        try {
            String sql = "INSERT INTO Size (product_id, size_name, quantity) VALUES(?,?,?)";

            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, pid);
            statement.setString(2, sizename);
            statement.setString(3, quantity);

            statement.executeUpdate();

        } catch (SQLException ex) {

            ex.printStackTrace();
        }
    }

    //lấy thông tin để chỉnh sửa
    public Size getSizebySizeid(String sid) {
        try {
            String sql = "SELECT *from Size where size_id = ? ";

            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, sid);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Size s = new Size();
                s.setSizeid(rs.getInt("size_id"));
                s.setProductid(rs.getInt("product_id"));
                s.setSizename(rs.getString("size_name"));
                s.setQuantity(rs.getInt("quantity"));
                return s;
            }
        } catch (SQLException ex) {

            ex.printStackTrace();
        }

        return null;
    }

    //sửa số lượng 1 size
    public void EditSize(String sizeid, String quantity) {
        try {
            String sql = "UPDATE Size SET quantity = ? WHERE size_id= ?;";

            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, quantity);
            statement.setString(2, sizeid);

            statement.executeUpdate();

        } catch (SQLException ex) {

            ex.printStackTrace();
        }
    }

    //xóa size của 1 sản phẩm
    public void deleteSize(String id) {
        try {
            String sql = "DELETE FROM Size where size_id = ?";

            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, id);
            statement.executeUpdate();

        } catch (SQLException ex) {

            ex.printStackTrace();
        }
    }

    //lấy số lượng của 1 sản phẩm bằng productid và size 
    public Size getSizequantity(int productid, String sizename) {
        try {
            String sql = "SELECT s.quantity from Size s where s.product_id = ? and s.size_name = ?;";

            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, productid);
            statement.setString(2, sizename);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Size u = new Size();
                u.setQuantity(rs.getInt("quantity"));
                return u;
            }
        } catch (SQLException ex) {

            ex.printStackTrace();
        }

        return null;
    }

    //Cart
    //thêm cart
    public void addCart(String userid, String productid, String productname, String sizename, String quantity, String price) {
        try {

            String checkSql = "SELECT * FROM Cart WHERE users_id = ? AND product_id = ? AND size_name=?";
            PreparedStatement checkStatement = connect.prepareStatement(checkSql);
            checkStatement.setString(1, userid);
            checkStatement.setString(2, productid);
            checkStatement.setString(3, sizename);
            ResultSet resultSet = checkStatement.executeQuery();

            if (resultSet.next()) {
                int currentQuantity = resultSet.getInt("quantity");
                int newQuantity = Integer.parseInt(quantity);
                newQuantity += currentQuantity;
                double currentprice = resultSet.getDouble("totalprice");
                double newprice = Double.parseDouble(price);
                newprice += currentprice;
                // Nếu sản phẩm đã tồn tại trong giỏ hàng, cập nhật thông tin
                String updateSql = "UPDATE Cart SET size_name = ?, quantity = ?, totalprice = ? WHERE users_id = ? AND product_id = ?";
                PreparedStatement updateStatement = connect.prepareStatement(updateSql);
                updateStatement.setString(1, sizename);
                updateStatement.setInt(2, newQuantity);
                updateStatement.setDouble(3, newprice);
                updateStatement.setString(4, userid);
                updateStatement.setString(5, productid);
                updateStatement.executeUpdate();
            } else {
                String sql = "INSERT INTO Cart (users_id, product_id, productname, size_name, quantity, totalprice) VALUES(?,?,?,?,?,?)";

                PreparedStatement statement = connect.prepareStatement(sql);
                statement.setString(1, userid);
                statement.setString(2, productid);
                statement.setString(3, productname);
                statement.setString(4, sizename);
                statement.setString(5, quantity);
                statement.setString(6, price);

                statement.executeUpdate();
            }

        } catch (SQLException ex) {

            ex.printStackTrace();
        }
    }

    //nhận danh sách các cart của userid
    public ArrayList<Cart> getCartbyUserID(String userid) {
        ArrayList<Cart> carts = new ArrayList<>();
        try {
            String sql = "SELECT *from Cart where users_id=? ";

            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, userid);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Cart c = new Cart();
                c.setCartid(rs.getInt("cart_id"));
                c.setUserid(rs.getInt("users_id"));
                c.setProductid(rs.getInt("product_id"));
                c.setProductname(rs.getString("productname"));
                c.setSize(rs.getString("size_name"));
                c.setQuantity(rs.getInt("quantity"));
                c.setTotalprice(rs.getDouble("totalprice"));
                carts.add(c);
            }
        } catch (SQLException ex) {

            ex.printStackTrace();
        }

        return carts;
    }
      public ArrayList<Cart> getCartbyPID(String userid) {
        ArrayList<Cart> carts = new ArrayList<>();
        try {
            String sql = "SELECT *from Cart where product_id=? ";

            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, userid);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Cart c = new Cart();
                c.setCartid(rs.getInt("cart_id"));
                c.setUserid(rs.getInt("users_id"));
                c.setProductid(rs.getInt("product_id"));
                c.setProductname(rs.getString("productname"));
                c.setSize(rs.getString("size_name"));
                c.setQuantity(rs.getInt("quantity"));
                c.setTotalprice(rs.getDouble("totalprice"));
                carts.add(c);
            }
        } catch (SQLException ex) {

            ex.printStackTrace();
        }

        return carts;
    }

    //nhận thông tin qua cartid
    public Cart getCartbyCartID(String cartid) {
        try {
            String sql = "SELECT *from Cart where cart_id= ? ";

            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, cartid);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Cart c = new Cart();
                c.setCartid(rs.getInt("cart_id"));
                c.setUserid(rs.getInt("users_id"));
                c.setProductid(rs.getInt("product_id"));
                c.setProductname(rs.getString("productname"));
                c.setSize(rs.getString("size_name"));
                c.setQuantity(rs.getInt("quantity"));
                c.setTotalprice(rs.getDouble("totalprice"));

                return c;
            }
        } catch (SQLException ex) {

            ex.printStackTrace();
        }

        return null;
    }

    //dùng để xóa thông tin cart khi đã order
    public void deleteCart(String id) {
        try {
            String sql = "DELETE FROM Cart where cart_id = ?";

            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, id);
            statement.executeUpdate();

        } catch (SQLException ex) {

            ex.printStackTrace();
        }
    }

    //order
    public void Order(String userid, String name, String address, String phonenumber, String productname, String orderdate, String sizename, String quantity, String totalprice, String payment, String status) {
        try {
            String sql = "INSERT INTO OrderDetails (users_id, name, address, phonenumber, productname, orderdate, size_name,quantity,totalprice,payment,status) VALUES(?,?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, userid);
            statement.setString(2, name);
            statement.setString(3, address);
            statement.setString(4, phonenumber);
            statement.setString(5, productname);
            statement.setString(6, orderdate);
            statement.setString(7, sizename);
            statement.setString(8, quantity);
            statement.setString(9, totalprice);
            statement.setString(10, payment);
            statement.setString(11, status);

            statement.executeUpdate();
        } catch (Exception e) {
        }
    }

    //update lại bảng size khi đã đặt hàng
    public void UpdateQuantity(String productid, String sizename, int quantity) {
        try {
            String sql = "UPDATE Size\n"
                    + "SET  quantity = quantity - ?\n"
                    + "WHERE product_id= ? AND size_name= ? ;";

            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, quantity);
            statement.setString(2, productid);
            statement.setString(3, sizename);

            statement.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public ArrayList<Orderdetails> getOrderByUID(String userid) {
        ArrayList<Orderdetails> orders = new ArrayList<>();
        try {
            String sql = "SELECT *from OrderDetails where users_id=?";

            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, userid);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Orderdetails o = new Orderdetails();
                o.setOrderdetailid(rs.getInt("order_detail_id"));
                o.setUserid(rs.getInt("users_id"));
                o.setName(rs.getString("name"));
                o.setAddress(rs.getString("address"));
                o.setNumber(rs.getString("phonenumber"));
                o.setProductname(rs.getString("productname"));
                o.setOrderdate(rs.getDate("orderdate"));
                o.setSizename(rs.getString("size_name"));
                o.setQuantity(rs.getInt("quantity"));
                o.setTotalprice(rs.getDouble("totalprice"));
                o.setPayment(rs.getString("payment"));
                o.setStatus(rs.getString("status"));
                orders.add(o);
            }
        } catch (SQLException ex) {

            ex.printStackTrace();
        }
        return orders;
    }


    // tìm thông tin để đăng nhập
    public Users loginUsers(String username, String password) {
        try {
            String sql = "SELECT *from Users where username = ? and password = ?;";

            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Users u = new Users();
                u.setUserid(rs.getInt("users_id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setEmail(rs.getString("email"));
                u.setRole(rs.getInt("role"));
                return u;
            }
        } catch (SQLException ex) {

            ex.printStackTrace();
        }

        return null;
    }

    //kiểm tra xem tên tài khoản đã tồn tại chưa khi đăng kí
    public Users checkUsersExist(String username) {
        try {
            String sql = "SELECT *from Users where username = ?;";

            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, username);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Users u = new Users();
                u.setUserid(rs.getInt("users_id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setEmail(rs.getString("email"));
                u.setRole(rs.getInt("role"));
                return u;
            }
        } catch (SQLException ex) {

            ex.printStackTrace();
        }

        return null;
    }

    //đăng kí tài khoản mới
    public void RegisterUsers(String username, String password, String email) {
        try {
            String sql = "INSERT INTO Users(username,password,email,role) values (?,?,?,0)";

            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3, email);
            statement.executeUpdate();

        } catch (SQLException ex) {

            ex.printStackTrace();
        }

    }

    //admin
    //xóa sản phẩm
    public void deleteProduct1(String id) {
        try {
            String sql = "DELETE FROM Products where product_id = ? ";

            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, id);
            statement.executeUpdate();

        } catch (SQLException ex) {

            ex.printStackTrace();
        }
    }
     public void deleteProduct2(String id) {
        try {
             String deleteProductsQuery = "DELETE FROM Products WHERE product_id = ?";
        String deleteCartQuery = "DELETE FROM Cart WHERE product_id = ?";

           PreparedStatement deleteProductsStatement = connect.prepareStatement(deleteProductsQuery);
        PreparedStatement deleteCartStatement = connect.prepareStatement(deleteCartQuery);
            deleteProductsStatement.setString(1, id);
            deleteCartStatement.setString(2, id);
            deleteProductsStatement.executeUpdate();
            deleteCartStatement.executeUpdate();

        } catch (SQLException ex) {

            ex.printStackTrace();
        }
    }
    
    public void deletepCart(String id) {
        try {
            String sql = "";

            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, id);
            statement.executeUpdate();

        } catch (SQLException ex) {

            ex.printStackTrace();
        }
    }
        public void deletepSizeofP(String id) {
        try {
            String sql = "DELETE FROM Size where product_id = ?";

            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, id);
            statement.executeUpdate();

        } catch (SQLException ex) {

            ex.printStackTrace();
        }
    }

    //thêm 1 sản phẩm mới
    public void insertproduct(String name, String categories, String price, String link, String description) {
        try {
            String sql = "INSERT INTO Products (product_name, category_id, price, link , description) VALUES(?,?,?,?,?)";

            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, categories);
            statement.setString(3, price);
            statement.setString(4, link);
            statement.setString(5, description);

            statement.executeUpdate();

        } catch (SQLException ex) {

            ex.printStackTrace();
        }
    }

    //sửa sản phẩm
    public void Editproduct(String name, String categories, String price, String link, String description, String id) {
        try {
            String sql = "UPDATE Products\n"
                    + "SET product_name = ?, \n"
                    + "    category_id = ?, \n"
                    + "    price = ?, \n"
                    + "    link = ?, \n"
                    + "    description = ?\n"
                    + "WHERE product_id=?;";

            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, categories);
            statement.setString(3, price);
            statement.setString(4, link);
            statement.setString(5, description);
            statement.setString(6, id);

            statement.executeUpdate();

        } catch (SQLException ex) {

            ex.printStackTrace();
        }
    }

    //nhận thông tin 1 user để chình sửa
    public Users getUserByID(String id) {
        try {
            String sql = "Select* from Users where users_id = ?";
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Users u = new Users();
                u.setUserid(rs.getInt("users_id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setEmail(rs.getString("email"));
                u.setRole(rs.getInt("role"));
                return u;
            }
        } catch (Exception e) {
        }
        return null;
    }

    //chỉnh sửa role của 1 user bằng userid
    public void EditUser(int role, String id) {
        try {
            String sql = "UPDATE Users\n"
                    + "SET  role = ?\n"
                    + "WHERE users_id=?;";

            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, role);
            statement.setString(2, id);

            statement.executeUpdate();

        } catch (SQLException ex) {

            ex.printStackTrace();
        }
    }

    //danh sách các users trong hệ thống
    public ArrayList<Users> getUsers() {
        ArrayList<Users> users = new ArrayList<>();
        try {
            String sql = "Select u.users_id,u.username,u.password,u.email,u.role from Users u where u.role=0 or u.role=2";
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Users u = new Users();
                u.setUserid(rs.getInt("users_id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setEmail(rs.getString("email"));
                u.setRole(rs.getInt("role"));
                users.add(u);

            }

        } catch (Exception e) {
        }
        return users;
    }
      //danh sách orders
    public ArrayList<Orderdetails> getAllOrders() {
        ArrayList<Orderdetails> orders = new ArrayList<>();
        try {
            String sql = "SELECT *from OrderDetails";

            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Orderdetails o = new Orderdetails();
                o.setOrderdetailid(rs.getInt("order_detail_id"));
                o.setUserid(rs.getInt("users_id"));
                o.setName(rs.getString("name"));
                o.setAddress(rs.getString("address"));
                o.setNumber(rs.getString("phonenumber"));
                o.setProductname(rs.getString("productname"));
                o.setOrderdate(rs.getDate("orderdate"));
                o.setSizename(rs.getString("size_name"));
                o.setQuantity(rs.getInt("quantity"));
                o.setTotalprice(rs.getDouble("totalprice"));
                o.setPayment(rs.getString("payment"));
                o.setStatus(rs.getString("status"));
                orders.add(o);
            }
        } catch (SQLException ex) {

            ex.printStackTrace();
        }
        return orders;
    }
    
    // lấy thông tin từng đơn hàng.
    public Orderdetails getOrderByOID(String oid) {
        try {
            String sql = "SELECT * from OrderDetails where order_detail_id=?";
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, oid);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Orderdetails o = new Orderdetails();
                o.setOrderdetailid(rs.getInt("order_detail_id"));
                o.setUserid(rs.getInt("users_id"));
                o.setName(rs.getString("name"));
                o.setAddress(rs.getString("address"));
                o.setNumber(rs.getString("phonenumber"));
                o.setProductname(rs.getString("productname"));
                o.setOrderdate(rs.getDate("orderdate"));
                o.setSizename(rs.getString("size_name"));
                o.setQuantity(rs.getInt("quantity"));
                o.setTotalprice(rs.getDouble("totalprice"));
                o.setPayment(rs.getString("payment"));
                o.setStatus(rs.getString("status"));
                return o;
            }
        } catch (SQLException ex) {

            ex.printStackTrace();
        }
        return null;
    }

    // cập nhật trạng thái đơn hàng
    public void UpdateStatus(String oid, String status) {
        try {
            String sql = "UPDATE OrderDetails\n"
                    + "SET  status = ?\n"
                    + "WHERE order_detail_id= ? ;";

            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, status);
            statement.setString(2, oid);

            statement.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public static void main(String[] args) {
        DAO c = new DAO();
//        c.UpdateStatus("1", "Chuẩn bị");
//        Orderdetails o = c.getOrderByOID("1");
//        System.err.println(o);
//        ArrayList<Orderdetails> o = c.getOrderByUID("1");
//        for (Orderdetails orderdetails : o) {
//            System.err.println(orderdetails);
//        }
//        ArrayList<Orderdetails> o = c.getAllOrders();
//        for (Orderdetails orderdetails : o) {
//            System.err.println(orderdetails);
//        }
//        c.UpdateQuantity("1", "39", 1);
//        c.Order("1", "khanmh", "aaa", "0123", "aaa", "2022-03-04", "39", "1", "100", "aaaa", "aaaaa");
//        c.EditSize("1", "50");
//        c.insertSize("2", "42", "5");
//        ArrayList<Size> s = c.getAllSizes();
//        for (Size size : s) {
//            System.err.println(size);
//        }
//        ArrayList<Products> products = c.getProducts();
//        ArrayList<Categories> caProductses = c.getCategories();
//        ArrayList<Products> ca = c.getProductsbyCID("1");
//        Products p = c.getProductsbyPID("1");
//        ArrayList<Products> s = c.getProductsbySname("Nike");
////        for (Products r : s) {
////            System.out.println(r);
////        }
//        Users us = c.loginUsers("john_doe", "12345");
//        System.out.println(us);
////        System.err.println(p);
//        System.out.println();
//        c.getProducts();
//        for (Products a : products) {
//            System.out.println(a);
//        }
//        for (Categories o : caProductses) {
//            System.out.println(o);
//        }
//        for (Products b : ca) {
//            System.out.println(b);
//        }
//        c.getProducts();
//c.Editproduct("khanh", "1", "1234", "aaaaaaaa", "hello", "34");
//Users u= c.getUserByID("2");
//        System.err.println(u);
//        c.EditUser(0, "1");
//        c.RegisterUsers("khanh2003", "123", "123@gmail.com");
//ArrayList<Cart> carts = c.getCartbyUserID("1");
//        for (Cart a : carts) {
//            System.err.println(a.getCartid());
//        }

//Size s= c.getSizequantity(1, "39");
//        System.err.println(s.getQuantity());
//c.addCart("1", "3", "Adidas Forum Low CL", "40", "1","99.99" );
//c.insertproduct("Khánh", "1", "12", "aaaaa", "aaaaa");
    }

}
