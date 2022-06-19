package com.tvtlhr.ttt.service.impl;

import com.tvtlhr.ttt.entity.Member;
import com.tvtlhr.ttt.repository.MemberRepository;
import com.tvtlhr.ttt.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    MemberRepository memberRepository;

    @Override
    public List<Member> getAllMembers() {
        return memberRepository.findAll();
    }
}
