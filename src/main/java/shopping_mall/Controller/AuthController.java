package shopping_mall.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import shopping_mall.Dto.ResponseDto;
import shopping_mall.Dto.SignInDto;
import shopping_mall.Dto.SignInResponseDto;
import shopping_mall.Dto.SignUpDto;
import shopping_mall.Serivce.AuthService;

import javax.servlet.http.HttpSession;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
public class AuthController {

    @Autowired
    AuthService authService;

    public static String removeTags(String html) {
        Pattern pattern = Pattern.compile("<[^>]*>");
        Matcher matcher = pattern.matcher(html);
        return matcher.replaceAll("");
    }

    @GetMapping("/signup")
    public String signUpHome() {
        return "signup";
    }

    @PostMapping("/signup")
    public String signUp(@Validated @ModelAttribute SignUpDto dto, Errors errors, Model model, RedirectAttributes redirectAttributes) {
        if (errors.hasErrors()) {
            model.addAttribute("dto", dto);
            Map<String, String> validatorResult = authService.validateHandle(errors);
            for (String key : validatorResult.keySet()) {
                model.addAttribute(key, validatorResult.get(key));
            }
            model.addAttribute("errors", errors);
            return "signup";
        }
        ResponseDto<?> result = authService.memberInsert(dto);
        if (result.isResult() == true) {
            redirectAttributes.addFlashAttribute("message", "회원 가입이 완료되었습니다.");
            return "redirect:/login";
        } else {
            return "signup";
        }
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @PostMapping("/loginresult")
    public String login(@ModelAttribute SignInDto dto, HttpSession session) {
        ResponseDto<SignInResponseDto> res = authService.signIn(dto);
        // 로그인 성공시 메인 페이지로 리다이렉트 실패시 다시 로그인 화면
        if (res.isResult() == true) {
            System.out.println(res);
            session.setAttribute("login_result", res.getData().getUser());
            System.out.println(res.getData().getUser());
            return "redirect:/home";
        } else {
            return "login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/main";
    }
}
