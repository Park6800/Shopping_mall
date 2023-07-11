package shopping_mall.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import shopping_mall.Entity.Categories_Entity;

import java.util.List;

@Repository
public interface CategoriesRepository extends JpaRepository<Categories_Entity, Long> {
    @Query(value="select * from Categories order by Type_id asc", nativeQuery = true)
    public List<Categories_Entity> findCategories();
}
