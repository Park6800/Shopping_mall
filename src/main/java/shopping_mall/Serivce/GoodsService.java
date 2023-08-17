package shopping_mall.Serivce;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import shopping_mall.Dto.BasketDto;
import shopping_mall.Entity.Basket_Entity;
import shopping_mall.Entity.GoodsDetail_Entity;
import shopping_mall.Entity.Goods_Entity;
import shopping_mall.Repository.BasketRepository;
import shopping_mall.Repository.GoodsRepository;
import shopping_mall.Repository.Goods_DetailRepository;

import java.util.List;

@Service
public class GoodsService {
    @Autowired
    GoodsRepository goodsRepository;
    @Autowired
    Goods_DetailRepository goodsDetailRepository;
    @Autowired
    BasketRepository basketRepository;

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

    public List<GoodsDetail_Entity> findDetail_Goods (String type) {
        System.out.println("Type : " + type);
        List<GoodsDetail_Entity> goodsDetailEntities = null;
        try {
            goodsDetailEntities = goodsDetailRepository.findGoodsDetail(type);
        } catch (Exception error) {
            error.printStackTrace();
        }
        System.out.println("Service : " + goodsDetailEntities);
        return goodsDetailEntities;
    }

    public List<Basket_Entity> UserBasket (String id) {
        List<Basket_Entity> basketEntities = null;
        try {
            basketEntities = basketRepository.findUserBasket(id);
        } catch (Exception error) {
            error.printStackTrace();
        }
        return basketEntities;
    }

    public GoodsDetail_Entity findGoodsDetail (String GoodsName) {
        GoodsDetail_Entity goodsDetailEntity = null;
            try {
                goodsDetailEntity = goodsDetailRepository.GoodsInfo(GoodsName);
            } catch (Exception error) {
                error.printStackTrace();
            }
        return goodsDetailEntity;
    }

    public String InsertBasket(BasketDto basketDto) {
        Basket_Entity basketEntity = new Basket_Entity(basketDto);
        try {
            basketRepository.save(basketEntity);
        } catch (Exception error) {
            error.printStackTrace();
        }
        return "null";
    }
}
