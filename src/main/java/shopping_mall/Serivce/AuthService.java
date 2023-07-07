package shopping_mall.Serivce;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import shopping_mall.Dto.ResponseDto;
import shopping_mall.Dto.SignUpDto;
import shopping_mall.Entity.User_Entity;
import shopping_mall.Repository.UserRepository;

import java.util.HashMap;
import java.util.Map;

@Service
public class AuthService {
    @Autowired
    UserRepository userRepository;

    private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    public ResponseDto<?> memberInsert(SignUpDto dto) {
        String id = dto.getUser_id();
        String password = dto.getUser_pw();
        String passwordChk = dto.getUser_pw_chk();
        // ID 중복 체크
        try {
            if (userRepository.existsByUserId(id)) {
                return ResponseDto.setFailed("중복된 이메일 입니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (!password.equals(passwordChk)) {
            return ResponseDto.setFailed("비밀번호가 일치하지 않습니다.");
        }
        User_Entity user = new User_Entity(dto);
        String encodedPassword = passwordEncoder.encode(password);
        user.setUser_pw(encodedPassword);
        try {
            userRepository.save(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseDto.setSuccess("회원가입 성공", null);
    }

    public Map<String, String> validateHandle(Errors errors) {
        Map<String, String> validatorResult = new HashMap<>();

        for (FieldError error : errors.getFieldErrors()) {
            String validKeyName = String.format("valid_%s", error.getField());
            validatorResult.put(validKeyName, error.getDefaultMessage());
        }
        return validatorResult;
    }
}
