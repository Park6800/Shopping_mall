package shopping_mall.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import shopping_mall.Entity.Basket_Entity;

import java.util.List;

@Repository
public interface BasketRepository extends JpaRepository <Basket_Entity, Long> {

    @Query(value = "select * from MyBasket where User_id = ?1", nativeQuery = true)
    public List<Basket_Entity> findUserBasket (String Id);
}
