package shopping_mall.Repository;

import org.hibernate.cfg.JPAIndexHolder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import shopping_mall.Entity.GoodsDetail_Entity;

import java.util.List;

@Repository
public interface Goods_DetailRepository extends JpaRepository<GoodsDetail_Entity, Long> {
    @Query(value="select * from GoodsDetail where Goods_type = ?1", nativeQuery = true)
    public List<GoodsDetail_Entity> findGoodsDetail (String type);

    @Query(value = "select * from GoodsDetail where Goods_name = ?1",nativeQuery = true)
    public GoodsDetail_Entity GoodsInfo (String Name);
}
