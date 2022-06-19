package com.tvtlhr.ttt.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class Member {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @ManyToOne
    @JoinColumn(name="familyId", nullable=false)
    private Family family;

    @Column(nullable = false, unique = true)
    private String code;

    @Column
    private String name;

    @Column
    private int age;

    @Column
    private String phoneNumber;

    @Column
    private String gender;

    @Column
    private String parentName;

    @Column
    private String relationship;

    @Column
    private String parentPhoneNumber;

}
