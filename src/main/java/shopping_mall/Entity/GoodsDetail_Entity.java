package shopping_mall.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "GoodsDetail")
public class GoodsDetail_Entity {
    @Id
    @Column(name="Goods_id")
    private int GoodsId;
    @Column(name="Goods_type")
    private String Goods_type;
    @Column(name="Goods_name")
    private String GoodsName;
    @Column(name="Goods_price")
    private String GoodsPrice;
    @Column (name="Goods_url")
    private String GoodsUrl;
    @Column(name="Goods_country")
    private String Goods_country;
    @Column(name="Goods_seller")
    private String Goods_seller;
    @Column(name="Goods_explain")
    private String GoodsExplain;
    @Column(name="Goods_delivery")
    private int Goods_delivery;
}
