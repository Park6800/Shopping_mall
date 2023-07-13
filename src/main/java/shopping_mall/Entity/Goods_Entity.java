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
@Table(name = "Goods")
public class Goods_Entity {
    @Id
    @Column(name="Goods_id")
    private int Goods_id;
    @Column(name="Goods_type")
    private String GoodsType;
    @Column(name="Type_name")
    private String Type_name;
    @Column(name="Goods_url")
    private String GoodsUrl;
}
