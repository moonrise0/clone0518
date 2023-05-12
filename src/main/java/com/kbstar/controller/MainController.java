package com.kbstar.controller;

import com.kbstar.dto.Cust;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;



@Controller
@Slf4j
public class MainController {

    @Autowired
    CustService custService;

    @Autowired
    private BCryptPasswordEncoder encoder;
    @RequestMapping("/")
    public String main(Model model){
        model.addAttribute("center", "center");
        return "index";
    }

    @RequestMapping("/men")
    public String mens(Model model){
        model.addAttribute("center", "men");
        return "index";
    }

    @RequestMapping("/women")
    public String womens(Model model){
        model.addAttribute("center", "women");
        return "index";
    }

    @RequestMapping("/about")
    public String about(Model model){
        model.addAttribute("center", "about");
        return "index";
    }

    @RequestMapping("/contact")
    public String contact(Model model){
        model.addAttribute("center", "contact");
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model){
        model.addAttribute("center", "login");
        return "index";
    }

    @RequestMapping("/register")
    public String register(Model model){
        model.addAttribute("center", "register");
        return "index";
    }

    @RequestMapping("/loginimpl")
    public String loginimpl(Model model, String id, String pwd, HttpSession session) throws Exception {
        Cust cust = null;
        String nextPage ="loginfail";
        try {
            cust = custService.get(id);
            //&&가 2개면, 앞에꺼 실패하면 뒤에껀 안 함
            if(cust != null && encoder.matches(pwd, cust.getPwd())){
                nextPage ="loginok";
                //session에 담은것도 jsp파일에서 $ 로 꺼낼 수 있다
                session.setMaxInactiveInterval(100000);
                session.setAttribute("logincust", cust);
            }
        } catch (Exception e) {
            throw new Exception("시스템장애 잠시후 다시 로그인 하세요!");
        }
        model.addAttribute("center", nextPage);
        return "index";
    }


    @RequestMapping("/registerimpl")
    public String registerimpl(Model model, Cust cust, HttpSession session) throws Exception {
        try {
            cust.setPwd(encoder.encode(cust.getPwd()));
            custService.register(cust);
            session.setAttribute("logincust", cust);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("가입 오류");
        }
        model.addAttribute("rcust", cust);
        model.addAttribute("center", "registerok");
        return "index";
    }
}
