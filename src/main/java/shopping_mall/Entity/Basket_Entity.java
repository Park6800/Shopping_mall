package shopping_mall.Entity;

import lombok.Data;
import shopping_mall.Dto.BasketDto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Entity
@Table (name = "MyBasket")
public class Basket_Entity {
    @Id
    @Column (name="User_id")
    public String UserId;
    @Column (name="Goods_id")
    public int GoodsId;
    @Column (name="Goods_count")
    public int GoodsCount;

    public Basket_Entity(BasketDto basketDto) {
        this.UserId = basketDto.getUser_id();
        this.GoodsCount = basketDto.getGoods_count();
        this.GoodsId = basketDto.getGoods_id();
    }
}
