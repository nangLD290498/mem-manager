package com.tvtlhr.ttt.repository;

import com.tvtlhr.ttt.entity.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberRepository extends JpaRepository<Member, Integer>{

    @Query("select case when count(c)> 0 then true else false end from Member c where lower(c.name) = lower(:name) and c.phoneNumber = :phone")
    Boolean existsMemberByNameAndPhoneNumber(@Param("name") String name, @Param("phone") String phone);

}
