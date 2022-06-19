package com.tvtlhr.ttt.service;

import com.tvtlhr.ttt.entity.Member;
import org.springframework.stereotype.Service;

import java.util.List;

public interface MemberService {

    List<Member> getAllMembers();
}
