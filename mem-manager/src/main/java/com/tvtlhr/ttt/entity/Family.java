package com.tvtlhr.ttt.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity
@Data
public class Family {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int familyId;

    @Column
    private String name;

    @OneToMany(mappedBy="family")
    private List<Member> members;
}
