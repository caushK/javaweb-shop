package shop.dao;

import shop.vo.Commodity;
import shop.vo.User;

import java.util.List;

public interface CommodityDao {
    public List<Commodity> findByType(String type);
    public Commodity selectCartByCommodityID(int commodityid) throws Exception;
   // public int insertCartByCommodityID(Commodity commodity) throws Exception;
}
