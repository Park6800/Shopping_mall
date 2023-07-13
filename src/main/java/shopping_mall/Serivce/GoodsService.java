package shopping_mall.Serivce;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import shopping_mall.Entity.Goods_Entity;
import shopping_mall.Repository.GoodsRepository;

import java.util.List;

@Service
public class GoodsService {
    @Autowired
    GoodsRepository goodsRepository;

    public List<String> findGoods_type(String type_name) {
        List<String> Goods_name = null;
        try {
            Goods_name = goodsRepository.findGoods_type(type_name);
        } catch (Exception error) {
            error.printStackTrace();
        }
        return Goods_name;
    }

    public List<Goods_Entity> findGoodsInfo (String Type) {
        List<Goods_Entity> goodsEntityList = null;
        try {
            goodsEntityList = goodsRepository.findGoods(Type);
        } catch (Exception error) {
            error.printStackTrace();
        }
        return goodsEntityList;
    }
}
