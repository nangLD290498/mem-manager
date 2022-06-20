package com.tvtlhr.ttt.service.impl;

import com.tvtlhr.ttt.entity.Member;
import com.tvtlhr.ttt.repository.MemberRepository;
import com.tvtlhr.ttt.service.MemberService;
import com.tvtlhr.ttt.utils.Utils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {
    Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    MemberRepository memberRepository;

    @Autowired
    Utils utils;

    @Override
    public List<Member> searchMembers(String gender, String age) {
        Integer ageInt= 0;
        try{
            if(!age.equals("all")) ageInt = Integer.parseInt(age);
        }catch (Exception e){
            return null;
        }
        List<Member> members = new ArrayList<>();
        if(gender.equals("all") && age.equals("all")){
            return memberRepository.findAll();
        }
        if(gender.equals("all") && !age.equals("all")){ // ngon
            return memberRepository.findByAge(ageInt);
        }
        if(!gender.equals("all") && age.equals("all")){
            return memberRepository.findByGender(gender);
        }
        if(!gender.equals("all") && !age.equals("all")){
            return memberRepository.findByGenderAndAge(gender, ageInt);
        }

        return null;
    }

    @Override
    public boolean updateMember(Member member) {
        if(memberRepository.existsInDB(member.getId(),
                member.getName(),
                member.getPhoneNumber(),
                member.getCode(),
                member.getAge(),
                member.getGender(),
                member.getIsAtending(),
                member.getRelativeName(),
                member.getRelationship(),
                member.getRelativePhoneNumber())) return false;
        Member mem = memberRepository.save(member);
        return mem != null;
    }

    @Override
    public Optional<Member> findByID(int id) {
        return memberRepository.findById(id);
    }

    @Override
    public boolean deleteMember(String code) {
        memberRepository.deleteByCode(code);
        return true;
    }

    @Override
    public Member getByCode(String code) {
        return memberRepository.findByCode(code);
    }

    @Override
    public List<Member> getAllMembers() {
        return memberRepository.findAll();
    }

    @Override
    public String createNewMember(Member member) {
        if(memberRepository.existsMemberByNameAndPhoneNumber(member.getName(), member.getPhoneNumber())){
            return null;
        }
        String code = utils.generateCode();
        member.setCode(code);
        memberRepository.save(member);
        return code;
    }


}
