package com.tvtlhr.ttt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FamilyController {

    @GetMapping("/familyMgtPage")
    public String getAddNewMemberPage(){
        return "families";
    }
}
