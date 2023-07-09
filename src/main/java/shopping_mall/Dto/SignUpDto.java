package shopping_mall.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SignUpDto {
    @Email
    @NotEmpty(message = "이메일 형식 아이디 입력은 필수 입니다.")
    private String User_id;
    @NotEmpty(message = "비밀번호 입력은 필수 입니다.")
    @Size(min = 8, message = "비밀번호는 최소 8자 이상이어야 합니다.")
    private String User_pw;
    private String User_pw_chk;
    @NotNull(message = "생년월일 입력은 필수 입니다.")
    @Min(value = 1, message = "유효한 생년월일을 8자리 입력해주세요.")
    private int User_birth;
    @NotEmpty(message = "이름 입력은 필수 입니다.")
    private String User_name;
    @NotEmpty(message = "전화번호 입력은 필수 입니다.")
    private String User_phone;
}