package shopping_mall.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import shopping_mall.Entity.Categories_Entity;
import shopping_mall.Entity.User_Entity;
import shopping_mall.Repository.CategoriesRepository;
import shopping_mall.Repository.UserRepository;
import shopping_mall.Serivce.AuthService;
import shopping_mall.Serivce.GoodsService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class HomeController {
    @Autowired
    UserRepository userRepository;
    @Autowired
    CategoriesRepository categoriesRepository;
    @Autowired
    GoodsService goodsService;
    @Autowired
    AuthService authService;
    @GetMapping("/home")
    public String Home(HttpSession session, Model model) {
        User_Entity tmp = (User_Entity) session.getAttribute("login_result");
        User_Entity user = null;
        List<Categories_Entity> categories = null;
        categories = categoriesRepository.findCategories();
        if(tmp != null) {
            user = userRepository.findByUserId(tmp.getUserId());
        }
        model.addAttribute("Categories_List",categories);
        model.addAttribute("user", user);
        return "home";
    }

    @GetMapping("/goods")
    public String Goods(@PathVariable("type") String type, HttpSession session, Model model) {
        User_Entity tmp = (User_Entity) session.getAttribute("login_result");
        User_Entity user = null;
        List<Categories_Entity> categories = null;
        categories = categoriesRepository.findCategories();
        if(tmp != null) {
            user = userRepository.findByUserId(tmp.getUserId());
        }
        model.addAttribute("Categories_List",categories);
        model.addAttribute("user", user);
        return "goods";
    }

    @PostMapping("/Categories")
    @ResponseBody
    public List<String> Goods_type (@RequestParam("typeName") String type_name) {
        List<String> Goods_Type = goodsService.findGoods_type(type_name);
        return Goods_Type;
    }
}
