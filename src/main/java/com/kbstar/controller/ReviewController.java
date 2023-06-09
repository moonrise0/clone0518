package com.kbstar.controller;

import com.kbstar.dto.Review;
import com.kbstar.service.ReviewService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
public class ReviewController {
    @Autowired
    ReviewService reviewService;
    @RequestMapping("/reviewimpl")
    public String get(Model model, Review review, String id) throws Exception {
        log.info(review.toString());
        reviewService.register(review);
        model.addAttribute("center","item/get");
        return "redirect:/item/get?id="+id;
    }
}
