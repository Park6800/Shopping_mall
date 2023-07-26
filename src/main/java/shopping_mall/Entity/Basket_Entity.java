package shopping_mall.Entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Table (name = "MyBasket")
@Entity
public class Basket_Entity {
    @Id
    @Column (name="User_id")
    public String UserId;
    @Column (name="Goods_id")
    public int GoodsId;
    @Column (name="Goods_count")
    public int GoodsCount;
}
