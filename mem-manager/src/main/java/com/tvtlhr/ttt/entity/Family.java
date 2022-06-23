package com.tvtlhr.ttt.entity;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.awt.print.Book;
import java.util.List;

@Entity
@Data
public class Family {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @ManyToOne
    @JoinColumn(name="group_id", nullable = true, referencedColumnName = "id")
    private Group group;

    @Column
    @NotNull
    private String name;

    @OneToMany( cascade = {CascadeType.PERSIST})
    @JoinColumn(name = "family_id", referencedColumnName = "id")
    private List<Member> members;
}
