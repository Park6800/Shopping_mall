package shopping_mall.Entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import shopping_mall.Dto.SignUpDto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "User_info")
public class User_Entity {
    @Id
    @Column(name = "User_id")
    private String userId;
    @Column(name = "User_pw")
    private String user_pw;
    @Column(name = "User_birth")
    private int user_birth;
    @Column(name = "User_name")
    private String user_name;
    @Column(name = "User_phone")
    private int user_phone;

    public User_Entity(SignUpDto dto) {
        this.userId = dto.getUser_id();
        this.user_pw = dto.getUser_pw();
        this.user_birth = dto.getUser_birth();
        this.user_name = dto.getUser_name();
        this.user_phone = dto.getUser_phone();
    }
}
