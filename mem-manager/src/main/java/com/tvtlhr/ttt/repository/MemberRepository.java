package com.tvtlhr.ttt.repository;

import com.tvtlhr.ttt.entity.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MemberRepository extends JpaRepository<Member, Integer>{
    List<Member> findByAge(int age);
    List<Member> findByGender(String gender);
    List<Member> findByGenderAndAge(String gender,int age);
    Long deleteByCode(String code);
    Member findByCode(String code);

    @Modifying
    @Query("UPDATE Member SET isAtending = CASE isAtending WHEN 'true' THEN 'false' ELSE 'true' END WHERE id = :id")
    void updateAttentionByid(@Param("id") Integer id);

    @Query("select case when count(c)> 0 then true else false end from Member c where lower(c.name) = lower(:name) and c.phoneNumber = :phone")
    Boolean existsMemberByNameAndPhoneNumber(@Param("name") String name, @Param("phone") String phone);

    @Query("select case when count(c)> 0 then true else false end from Member c " +
            "where c.id = :id and c.phoneNumber = :phone " +
            "and lower(c.name) = lower(:name) " +
            "and lower(c.code) = lower(:code) " +
            "and c.age = :age  " +
            "and lower(c.gender) = lower(:gender) " +
            "and lower(c.isAtending) = lower(:isAtending)" +
            "and lower(c.relativeName) = lower(:relativeName) " +
            "and lower(c.relationship) = lower(:relationship)" +
            "and lower(c.relativePhoneNumber) = lower(:relativePhoneNumber)")
    Boolean existsInDB(@Param("id") int id,
                       @Param("name") String name,
                       @Param("phone") String phone,
                       @Param("code") String code,
                       @Param("age") int age,
                       @Param("gender") String gender,
                       @Param("isAtending") String isAtending,
                       @Param("relativeName") String relativeName,
                       @Param("relationship") String relationship,
                       @Param("relativePhoneNumber") String relativePhoneNumber
                       );

}
