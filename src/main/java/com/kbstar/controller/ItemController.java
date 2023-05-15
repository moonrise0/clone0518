package com.kbstar.controller;

import com.kbstar.dto.Cart;
import com.kbstar.dto.Item;
import com.kbstar.dto.ItemSearch;
import com.kbstar.service.CartService;
import com.kbstar.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@Slf4j
@RequestMapping("/item")
public class ItemController {
    @Autowired
    ItemService itemService;
    @Autowired
    CartService cartService;
    String dir= "item/";

    @RequestMapping("/get")
    public String get(Model model, Integer id) throws Exception {
        Item item = null;
        item = itemService.get(id);
        model.addAttribute("gitem",item);
        model.addAttribute("center",dir+"get");
        return "index";
    }
    @RequestMapping("/addcart")
    public String addcart(Model model, Cart cart) throws Exception {
        cartService.register(cart);
        return "redirect:/item/get?id="+cart.getItem_id();
//        return "redirect:/item/get?id="+cart.getCust_id();
    }
    @RequestMapping("/cart")
    public String cart(Model model, HttpSession session){
        model.addAttribute("center", dir+"cart");
        return "index";
    }

    public String allcart(Model model, String id) throws Exception {
        List<Cart> list = null;
        list = cartService.getMyCart(id);

        model.addAttribute("allcart",list);
        model.addAttribute("center","cart");
        return "index";
    }

    @RequestMapping("/search")
    public String search(Model model, ItemSearch ms) throws Exception {
        List<Item> list = null;
        list = itemService.search(ms);
        model.addAttribute("ms", ms);
        model.addAttribute("ilist", list);
        model.addAttribute("center", dir+"all");
        return "index";
    }
}
