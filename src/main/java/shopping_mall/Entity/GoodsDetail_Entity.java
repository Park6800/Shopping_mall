package shopping_mall.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "GoodsDetail")
public class GoodsDetail_Entity {
    @Id
    @Column(name="Goods_id")
    private int Goods_id;
    @Column(name="Goods_type")
    private String Goods_type;
    @Column(name="Goods_name")
    private String Goods_name;
    @Column(name="Goods_price")
    private String Goods_price;
    @Column(name="Goods_country")
    private String Goods_country;
    @Column(name="Goods_seller")
    private String Goods_seller;
}
