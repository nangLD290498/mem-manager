package com.tvtlhr.ttt.service.impl;

import com.tvtlhr.ttt.entity.Member;
import com.tvtlhr.ttt.repository.MemberRepository;
import com.tvtlhr.ttt.service.MemberService;
import com.tvtlhr.ttt.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    MemberRepository memberRepository;

    @Autowired
    Utils utils;

    @Override
    public List<Member> getAllMembers() {
        return memberRepository.findAll();
    }

    @Override
    public boolean createNewMember(Member member) {
        if(memberRepository.existsMemberByNameAndPhoneNumber(member.getName(), member.getPhoneNumber())){
            return false;
        }
        member.setCode(utils.generateCode());
        memberRepository.save(member);
        return true;
    }


}
