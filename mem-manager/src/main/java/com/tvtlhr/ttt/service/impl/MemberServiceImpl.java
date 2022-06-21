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
import java.util.stream.Collectors;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {
    Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    MemberRepository memberRepository;

    @Autowired
    Utils utils;

    @Override
    public void submitAttention(List<Integer> idList) {
        for (Integer id: idList) {
            memberRepository.updateAttentionByid(id);
        }
    }

    @Override
    public List<Member> searchMembers(String gender, String age, String isAtending) {
         int ageInt = 0;
        try{
            if(!age.equals("all"))  ageInt = Integer.parseInt(age);
        }catch (Exception e){
            return null;
        }
        List<Member> members = memberRepository.findAll();
        if(!gender.equals("all")){
            members = members.stream().filter(member -> member.getGender().equals(gender)).collect(Collectors.toList());
        }
        if(!age.equals("all")){
            members = members.stream().filter(member -> member.getAge() == Integer.parseInt(age)).collect(Collectors.toList());
        }
        if(!isAtending.equals("all")){
            members = members.stream().filter(member -> member.getIsAtending().equals(isAtending)).collect(Collectors.toList());
        }

        return members;
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
            return "null";
        }
        String code = utils.generateCode();
        member.setCode(code);
        memberRepository.save(member);
        return code;
    }


}
