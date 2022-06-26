package com.tvtlhr.ttt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

    @GetMapping("/homePageMemberManager")
    public ModelAndView getAddNewMemberPage(){
        ModelAndView mv = new ModelAndView("index");
        return mv;
    }
}
