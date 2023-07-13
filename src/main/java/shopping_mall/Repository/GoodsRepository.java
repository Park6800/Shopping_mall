package shopping_mall.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import shopping_mall.Entity.Goods_Entity;

import java.util.List;

@Repository
public interface GoodsRepository extends JpaRepository <Goods_Entity,Long> {
    @Query(value="select Goods_type from Goods where Type_name = ?1", nativeQuery = true)
    public List<String> findGoods_type (String Goods);

    @Query(value="select * from Goods where Type_name = ?1",nativeQuery = true)
    public List<Goods_Entity> findGoods (String type);
}
