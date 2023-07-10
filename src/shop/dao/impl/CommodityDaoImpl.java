package shop.dao.impl;

import shop.dao.CommodityDao;
import shop.db.DBConnect;
import shop.vo.Cart;
import shop.vo.Commodity;
import shop.vo.TotalOrder;
import shop.vo.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CommodityDaoImpl implements CommodityDao {
    @Override
    public ArrayList<Commodity> findByType(String type) {
        PreparedStatement pstmt = null;
        DBConnect dbc = null;
        ResultSet rs=null;
        ArrayList<Commodity> list=new ArrayList<>();

        try{
            dbc = new DBConnect();
            String sql = "select * from commodity co , category ca where co.Subcalss=ca.Subcalss and ca.Majorcategories=?";
                    pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setString(1,type);
                    rs = pstmt.executeQuery();
                    while (rs.next()){
                        Commodity commodity=new Commodity();
                        commodity.setCommodityid(rs.getInt(1));
                        commodity.setCommodityname(rs.getString(2));
                        commodity.setPrice(rs.getInt(3));
                        commodity.setSubclass(rs.getString(4));
                        commodity.setExplain(rs.getString(5));
                        commodity.setLnventory(rs.getInt(6));
                        commodity.setBusinessid(rs.getInt(7));
                        commodity.setMajorclass(rs.getString(11));
                        commodity.setImg(rs.getString(9));
                        list.add(commodity);


                    }
            return list;

        }catch(Exception ex){
            ex.printStackTrace();
            return null;
        }finally{
            //释放数据集对象
            if(rs!=null){
                try{
                    rs.close();
                    rs = null;
                }catch(Exception ex){
                    ex.printStackTrace();
                }
            }
            //释放语句对象
            if(pstmt!=null){
                try{
                    pstmt.close();
                    pstmt=null;
                }catch(Exception ex){
                    ex.printStackTrace();
                }
            }
        }

    }




    public Commodity findCommodityById(int commodityid){
        PreparedStatement pstmt = null;
        DBConnect dbc = null;
        ResultSet rs=null;
        try {
            dbc = new DBConnect();
            String sql="select * from commodity where commodityid=?;";
            pstmt =dbc.getConnection().prepareStatement(sql);
            pstmt.setInt(1,commodityid);
            rs=pstmt.executeQuery();
            if(rs.next()){
                Commodity commodity=new Commodity();
                commodity.setCommodityid(rs.getInt(1));
                commodity.setCommodityname(rs.getString(2));
                commodity.setPrice(rs.getInt(3));
                commodity.setSubclass(rs.getString(4));
                commodity.setExplain(rs.getString(5));
                commodity.setLnventory(rs.getInt(6));
                commodity.setBusinessid(rs.getInt(7));
                commodity.setMajorclass(rs.getString(8));
                commodity.setImg(rs.getString(9));

                return commodity;
            }
            else {
                return null;
            }
        } catch (Exception exception) {
            exception.printStackTrace();
            return null;
        }finally {
            if(rs!=null){
                try{
                    rs.close();
                    rs=null;
                }catch (Exception exception){
                    exception.printStackTrace();
                }
            }
            if(pstmt!=null){
                try{
                    pstmt.close();
                    pstmt=null;
                }catch (Exception exception){
                    exception.printStackTrace();
                }
            }
        }

    }
    public ArrayList<Commodity> searchCommodity(String commodityname){
        PreparedStatement pstmt = null;
        DBConnect dbc = null;
        ResultSet rs=null;
        ArrayList<Commodity> list=new ArrayList<>();
        try {
            dbc = new DBConnect();
            String sql="select * from commodity where commodityname like ?;";
            pstmt =dbc.getConnection().prepareStatement(sql);
            pstmt.setString(1,"%"+commodityname+"%");
            rs=pstmt.executeQuery();
            while(rs.next()){
                Commodity commodity=new Commodity();
                commodity.setCommodityid(rs.getInt(1));
                commodity.setCommodityname(rs.getString(2));
                commodity.setPrice(rs.getInt(3));
                commodity.setSubclass(rs.getString(4));
                commodity.setExplain(rs.getString(5));
                commodity.setLnventory(rs.getInt(6));
                commodity.setBusinessid(rs.getInt(7));
                commodity.setMajorclass(rs.getString(8));
                commodity.setImg(rs.getString(9));
                list.add(commodity);

            }
            return list;

        } catch (Exception exception) {
            exception.printStackTrace();
            return null;
        }finally {
            if(rs!=null){
                try{
                    rs.close();
                    rs=null;
                }catch (Exception exception){
                    exception.printStackTrace();
                }
            }
            if(pstmt!=null){
                try{
                    pstmt.close();
                    pstmt=null;
                }catch (Exception exception){
                    exception.printStackTrace();
                }
            }
        }
    }
//llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
    public Commodity selectCartByCommodityID(int commodityid) throws Exception{


        PreparedStatement pst = null;
        DBConnect dbco = null;
        String sql = "select * from commodity where commodityid=?";
        Commodity commodity=null;

        try{
                dbco = new DBConnect();
                pst = dbco.getConnection().prepareStatement(sql);
                pst.setInt(1,commodityid );
                ResultSet res = pst.executeQuery();
            while (res.next()) {
                commodity = new Commodity(res.getInt("commodityid"),res.getString("commodityname"),
                        res.getInt("price"),res.getString("Subcalss"),res.getString("explain"),
                        res.getInt("Inventory"),res.getInt("businessid"),res.getString("Majorclass"),
                        res.getString("img"));
            }


                res.close();
                pst.close();

            return commodity;
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
            return null;
        }
        finally{
            dbco.close();
        }

    }

}

