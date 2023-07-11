package shopping_mall.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import shopping_mall.Dto.CategoriesDto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="Categories")
public class Categories_Entity {
    @Id
    @Column(name="Type_id")
    private int TypeId;
    @Column(name="Type_name")
    private String TypeName;

    public static Categories_Entity toSaveEntity(CategoriesDto categoriesDto) {
        Categories_Entity categories_entity = new Categories_Entity();
        categories_entity.setTypeId(categoriesDto.getType_id());
        categories_entity.setTypeName(categoriesDto.getType_name());
        return categories_entity;
    }

    public String getType_name() {
        return TypeName;
    }
}
