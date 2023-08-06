package shopping_mall.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import shopping_mall.Entity.*;
import shopping_mall.Repository.CategoriesRepository;
import shopping_mall.Repository.UserRepository;
import shopping_mall.Serivce.AuthService;
import shopping_mall.Serivce.GoodsService;

import javax.servlet.http.HttpServletRequest;
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
    public String Goods(@RequestParam("type") String type, HttpSession session, Model model) {
        List<Goods_Entity> goodsEntityList = goodsService.findGoodsInfo(type);
        User_Entity tmp = (User_Entity) session.getAttribute("login_result");
        User_Entity user = null;
        List<Categories_Entity> categories = null;
        categories = categoriesRepository.findCategories();
        if(tmp != null) {
            user = userRepository.findByUserId(tmp.getUserId());
        }
        model.addAttribute("Goods_info",goodsEntityList);
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

    @GetMapping("/goods_detail")
    public String Goods_Detail (@RequestParam("type_detail") String goods_detail, HttpSession session, HttpServletRequest request, Model model) {
        List<GoodsDetail_Entity> goodsDetailEntities = goodsService.findDetail_Goods(goods_detail);
        User_Entity tmp = (User_Entity) session.getAttribute("login_result");
        User_Entity user = null;
        List<Categories_Entity> categories = null;
        categories = categoriesRepository.findCategories();
        if(tmp != null) {
            user = userRepository.findByUserId(tmp.getUserId());
        }
        model.addAttribute("Goods_detail", goodsDetailEntities);
        model.addAttribute("Categories_List",categories);
        model.addAttribute("user", user);
        return "goods_detail";
    }

    @GetMapping("/mypage")
    public String MyPage (HttpSession session,Model model) {
        List<Categories_Entity> categories = null;
        User_Entity tmp = (User_Entity) session.getAttribute("login_result");
        User_Entity user = null;
        categories = categoriesRepository.findCategories();
        if(tmp != null) {
            user = userRepository.findByUserId(tmp.getUserId());
        }
        model.addAttribute("Categories_List",categories);
        model.addAttribute("user", user);
        return "mypage";
    }

    @GetMapping("/basket")
    public String MyBasket (@RequestParam("UserId") String id, HttpSession session, Model model) {
        List<Categories_Entity> categories = null;
        List<Basket_Entity> basketEntity = null;
        User_Entity tmp = (User_Entity) session.getAttribute("login_result");
        User_Entity user = null;
        basketEntity = goodsService.UserBasket(id);
        categories = categoriesRepository.findCategories();
        if(tmp != null) {
            user = userRepository.findByUserId(tmp.getUserId());
        }
        categories = categoriesRepository.findCategories();
        model.addAttribute("Basket", basketEntity);
        model.addAttribute("Categories_List",categories);
        model.addAttribute("user", user);
        return "basket";
    }

    @GetMapping("/goods_info")
    public String Information (@RequestParam("GoodsId") String GoodsId, HttpSession session, Model model) {
        List<Categories_Entity> categories = null;
        User_Entity tmp = (User_Entity) session.getAttribute("login_result");
        User_Entity user = null;
        GoodsDetail_Entity goodsDetailEntity = goodsService.findGoodsDetail(GoodsId);
        categories = categoriesRepository.findCategories();
        if(tmp != null) {
            user = userRepository.findByUserId(tmp.getUserId());
        }
        categories = categoriesRepository.findCategories();
        model.addAttribute("Categories_List",categories);
        model.addAttribute("user", user);
        model.addAttribute("Goods_info", goodsDetailEntity);
        return "goods_info";
    }
}
