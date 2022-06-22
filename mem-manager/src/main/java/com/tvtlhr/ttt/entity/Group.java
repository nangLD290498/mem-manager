package com.tvtlhr.ttt.entity;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.List;

@Entity
@Data
public class Group {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int groupId;

    @OneToMany(mappedBy = "group")
    private List<Family> families;

    @Column
    @NotNull
    private String groupName;

    @Column
    private Integer startAge;

    @Column
    private Integer endAge;
}
