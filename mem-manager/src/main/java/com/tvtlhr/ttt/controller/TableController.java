package com.tvtlhr.ttt.controller;

import com.tvtlhr.ttt.entity.DowloadObject;
import com.tvtlhr.ttt.entity.Family;
import com.tvtlhr.ttt.entity.Member;
import com.tvtlhr.ttt.service.FamilyService;
import com.tvtlhr.ttt.service.MemberService;
import com.tvtlhr.ttt.utils.ExcelWriter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.*;
import java.util.stream.Collectors;

@Controller
public class TableController {
    Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private MemberService memberService;

    @Autowired
    private FamilyService familyService;

    @Autowired
    private ExcelWriter writer;
    @Value("${code.value}")
    private String codePrefix;

    @GetMapping("/members")
    public ModelAndView show(@RequestParam(required = false) String code,
                             @RequestParam(required = false) String message){
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
        if(message !=null) mv.addObject("message", message);
        return mv;
    }

    @GetMapping("/addNewMemForm")
    public String getAddNewMemberPage(){
        return "addNewMem";
    }

    @RequestMapping(value = "/addNewMem", method = RequestMethod.POST)
    public ModelAndView addNewMember(
            @Valid @ModelAttribute("member")Member member,
            BindingResult result){
        if(result.hasErrors()){
            return new ModelAndView("addNewMem");
        }
        Member mem = memberService.createNewMember(member);
        if(mem != null) {
            ModelAndView mv = new ModelAndView("redirect:/members?code=" + mem.getCode());
            if(mem.getFamily() == null) {
                mv.addObject("message", "Đã thêm thành công khóa sinh " + member.getName());
            }else{
                mv.addObject("message", "Đã thêm thành công khóa sinh " + member.getName()+ " và thêm vào gia đình "+ mem.getFamily().getName());
            }
            return mv;
        } else {
            ModelAndView mv = new ModelAndView("addNewMem");
            mv.addObject("existed", "true" );
            return mv;
        }
    }

    @GetMapping(value = "/deleteMem")
    public ModelAndView deleteMember(@RequestParam String code){
        ModelAndView mv = new ModelAndView("redirect:/members");
        boolean isDeleted =  memberService.deleteMember(code);
        mv.addObject("message", "Đã xóa khóa sinh thành công");
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
    public ModelAndView updateMember(@RequestParam int id, @RequestParam(required = false) String existed,
            @RequestParam(required = false) String familyMgt){
        ModelAndView mv = new ModelAndView("editMem");
        Optional<Member> member =  memberService.findByID(id);
        List<Family> families = familyService.getByGroup(id);
        if (member.isPresent()) {
            mv.addObject("member", member.get());
            mv.addObject("families", families);
            mv.addObject("isAtending", member.get().getIsAtending());
        } else {
            return new ModelAndView("tables");
        }
        if(existed !=null && existed.equals("true")) mv.addObject("existed", "true");
        if(familyMgt !=null && familyMgt.equals("true")) mv.addObject("familyMgt", "true");
        return mv;
    }

    @GetMapping(value = "/updateMember")
    public ModelAndView doUpdateMember(
            @Validated @ModelAttribute("member")Member member,
            @RequestParam String isAtending,
            @RequestParam(required = false) String familyMgt,
            @RequestParam(required = false) Integer familyId,
            BindingResult result){
        ModelAndView mv = new ModelAndView();
        if(result.hasErrors()){
            mv.setViewName("editMem");
            return mv;
        }
        logger.info("isAtending " + isAtending);
        boolean isUpdate = memberService.updateMember(member, familyId);

        if(isUpdate) {
            logger.info("familyMgt " + familyMgt);
            if(familyMgt != null && familyMgt.equals("true")){
                mv.setViewName("redirect:/familyMgt");
            }else{
                mv.setViewName("redirect:/members?code="+member.getCode());
            }

            mv.addObject("message", "Chỉnh sửa thành công khóa sinh "  + member.getName());
        }
        else {
            mv.addObject("existed", "true" );
            mv.setViewName("redirect:/updateMemPage?id=" + member.getId());
        }
        return mv;
    }

    @GetMapping(value = "/searchMembers")
    public ModelAndView searchMembers(
            @RequestParam String gender,
            @RequestParam String age,
            @RequestParam String isAtending){
        ModelAndView mv = new ModelAndView("tables");
        List<Member> members = memberService.getAllMembers();
        List<String> ages = members.stream().map(Member::getAgeString).distinct().collect(Collectors.toList());
        mv.addObject("ages", ages);
        logger.info(age + " || " + gender);
        List<Member> filteredMembers = memberService.searchMembers(gender, age, isAtending);
        mv.addObject("members", filteredMembers);
        mv.addObject("age", age);
        mv.addObject("gender", gender);
        mv.addObject("isAtending", isAtending);
        return mv;
    }

    @GetMapping(value = "/submitAttention")
    public ModelAndView submitAttention(@RequestParam List<Integer> idList){
        ModelAndView mv = new ModelAndView("redirect:/members");
        String message = "";
        if(!CollectionUtils.isEmpty(idList)) {
            memberService.submitAttention(idList);
            message = "Lưu điểm danh thành công";
        }else{
            message = "Hãy thay đổi cột điểm danh để thực hiện điểm danh";
        }
        mv.addObject("message", message);
        return mv;
    }

    @GetMapping(value = "/exportExcel")
    public ModelAndView exportExcel(HttpServletResponse response){
        ModelAndView mv = new ModelAndView();
        List<Member> members = memberService.getAllMembers();
        List<DowloadObject> dowloadObjects = DowloadObject.fromMember(members);
        writer.writeToExcelInMultiSheets("khoa_sinh.xlsx", "Tất cả khóa sinh", dowloadObjects, response);
        return mv;
    }

    @GetMapping(value = "/deleteAll")
    public ModelAndView deleteAll(HttpServletResponse response){
        ModelAndView mv = new ModelAndView("redirect:/members");
        List<Member> members = memberService.getAllMembers();
        if(members == null || members.size() == 0){
            mv.addObject("message", "Không còn khóa sinh nào để thực hiện xóa");
        }else {
            memberService.deleteAll();
            mv.addObject("message", "Đã xóa tất cả các khóa sinh");
        }
        return mv;
    }
}
