package shopping_mall.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import shopping_mall.Entity.User_Entity;
import shopping_mall.Repository.UserRepository;
import shopping_mall.Serivce.AuthService;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController {
    @Autowired
    UserRepository userRepository;

    @Autowired
    AuthService authService;
    @GetMapping("/home")
    public String Home(HttpSession session, Model model) {
        User_Entity tmp = (User_Entity) session.getAttribute("login_result");
        User_Entity user = null;

        System.out.println("tmp : " + tmp);
        if(tmp != null) {
            user = userRepository.findByUserId(tmp.getUserId());

            System.out.println("home : " + user);
        }

        model.addAttribute("user", user);
        return "home";
    }
}
