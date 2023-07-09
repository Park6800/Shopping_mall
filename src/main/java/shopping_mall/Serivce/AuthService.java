package shopping_mall.Serivce;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import shopping_mall.Dto.ResponseDto;
import shopping_mall.Dto.SignInDto;
import shopping_mall.Dto.SignInResponseDto;
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
        // key value 오류
        Map<String, String> validatorResult = new HashMap<>();

        for (FieldError error : errors.getFieldErrors()) {
            String validKeyName = String.format("valid_%s", error.getField());
            validatorResult.put(validKeyName, error.getDefaultMessage());
        }
        return validatorResult;
    }

    public ResponseDto<SignInResponseDto> signIn(SignInDto dto) {
        String id = dto.getUser_id();
        String password = dto.getUser_pw();

        User_Entity userentity = null;
        try {
            userentity = userRepository.findByUserId(id);
//			잘못된 이메일
            if (userentity == null) return ResponseDto.setFailed("sign in failed");
//			잘못된 패스워드
            if (!passwordEncoder.matches(password,userentity.getUser_pw())) {
                return ResponseDto.setFailed("sign in failed");
            }

        } catch (Exception error) {
            return ResponseDto.setFailed("Database Error");
        }
        // 세션에 비밀번호 정보는 담지 않기 위해서 초기화
        userentity.setUser_pw("");

        // 세션 유지 시간 1 시간 3600000 밀리초 = 1시간
        int exprTime = 7200000;

        SignInResponseDto signInResponseDto = new SignInResponseDto(exprTime, userentity);
        return ResponseDto.setSuccess("sign in success !", signInResponseDto);
    }
}
