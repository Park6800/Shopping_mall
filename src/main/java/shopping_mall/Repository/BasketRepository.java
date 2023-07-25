package shopping_mall.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import shopping_mall.Entity.Basket_Entity;

@Repository
public interface BasketRepository extends JpaRepository <Basket_Entity, Long> {


}
