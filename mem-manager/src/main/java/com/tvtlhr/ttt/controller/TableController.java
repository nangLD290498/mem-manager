package com.tvtlhr.ttt.controller;

import com.tvtlhr.ttt.entity.Member;
import com.tvtlhr.ttt.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;
import java.util.stream.Collectors;

@Controller
public class TableController {
    Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private MemberService memberService;

    @Value("${code.value}")
    private String codePrefix;

    @GetMapping("/members")
    public ModelAndView show(@RequestParam(required = false) String code){
        ModelAndView mv = new ModelAndView("tables");
        List<Member> members = new ArrayList<>();
        List<Integer> ages = new ArrayList<>();
        members = memberService.getAllMembers();
        ages = members.stream().map(Member::getAge).distinct().collect(Collectors.toList());
        if(code == null || code.isBlank()){
            // members giữ nguyên
        }else {
            Member member = memberService.getByCode(code);
            members.clear();
            if(member != null) {
                members.add(member);
            }
            mv.addObject("param_code", code);
        }
        logger.info("members " + members.toString());
        mv.addObject("members", members);
        mv.addObject("ages", ages);
        return mv;
    }

    @GetMapping("/addNewMemForm")
    public String getAddNewMemberPage(Model model){
        model.addAttribute("member", new Member());
        return "addNewMem";
    }

    @RequestMapping(value = "/addNewMem", method = RequestMethod.POST)
    public String addNewMember(
            @Validated @ModelAttribute("member")Member member,
            @RequestParam String isAtending,
            BindingResult result){
        if(result.hasErrors()){
            return "addNewMem";
        }
        String code = memberService.createNewMember(member);
        if(code.contains(codePrefix)) return "redirect:/members?code=" + code;
        else return "addNewMem";
    }

    @GetMapping(value = "/deleteMem") //get thôi cũng được
    public ModelAndView deleteMember(@RequestParam String code){
        ModelAndView mv = new ModelAndView("redirect:/members");
        boolean isDeleted =  memberService.deleteMember(code);
        return mv;
    }

    @GetMapping(value = "/getDetails")
    public ModelAndView getDetails(@RequestParam int id){
        ModelAndView mv = new ModelAndView("detailedMember");
        Optional<Member> member =  memberService.findByID(id);
        if (member.isPresent()) {
            mv.addObject("member", member.get());
            mv.addObject("isAtending", member.get().getIsAtending());
        } else {
            return new ModelAndView("tables");
        }
        return mv;
    }

    @GetMapping(value = "/updateMemPage")
    public ModelAndView updateMember(@RequestParam int id){
        ModelAndView mv = new ModelAndView("editMem");
        Optional<Member> member =  memberService.findByID(id);
        if (member.isPresent()) {
            mv.addObject("member", member.get());
            mv.addObject("isAtending", member.get().getIsAtending());
        } else {
            return new ModelAndView("tables");
        }
        return mv;
    }

    @GetMapping(value = "/updateMember")
    public ModelAndView doUpdateMember(
            @Validated @ModelAttribute("member")Member member,
            @RequestParam String isAtending,
            BindingResult result){
        ModelAndView mv = new ModelAndView();
        if(result.hasErrors()){
            mv.setViewName("editMem");
            return mv;
        }
        logger.info("isAtending " + isAtending);
        boolean isUpdate = memberService.updateMember(member);

        if(isUpdate) mv.setViewName("redirect:/members?code="+member.getCode());
        else mv.setViewName("redirect:/updateMemPage?id="+member.getId());
        return mv;
    }

    @GetMapping(value = "/searchMembers")
    public ModelAndView searchMembers(
            @RequestParam String gender,
            @RequestParam String age){
        ModelAndView mv = new ModelAndView("tables");
        List<Member> members = memberService.getAllMembers();
        List<Integer> ages = members.stream().map(Member::getAge).distinct().collect(Collectors.toList());
        mv.addObject("ages", ages);
        logger.info(age + " || " + gender);
        List<Member> filteredMembers = memberService.searchMembers(gender, age);
        mv.addObject("members", filteredMembers);

        return mv;
    }
}
