package shopping_mall.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import shopping_mall.Entity.User_Entity;

@Repository
public interface UserRepository extends JpaRepository<User_Entity, Long> {
    public boolean existsByUserId(String user_id);
    public User_Entity findByUserId(String id);
}