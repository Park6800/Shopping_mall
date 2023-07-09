package shopping_mall.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import shopping_mall.Entity.User_Entity;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SignInResponseDto {
    private int exprTime;
    private User_Entity user;
}