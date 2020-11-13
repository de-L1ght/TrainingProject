package ru.prokhorov.bellproject.model;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Version;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import javax.persistence.FetchType;
import javax.persistence.OneToOne;
import javax.persistence.CascadeType;
import javax.persistence.PrimaryKeyJoinColumn;

@Data
@Entity
public class User {
    @Id
    private Long id;

    @Version
    private Integer version;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "office_id", nullable = false)
    private Office office;

    @Column(name = "first_name", length = 15, nullable = false)
    private String firstName;

    @Column(name = "second_name", length = 20)
    private String secondName;

    @Column(name = "last_name", length = 25)
    private String lastName;

    @Column(length = 40, nullable = false)
    private String position;

    @Column(length = 11)
    private String phone;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "country_id", nullable = false)
    private Country country;

    @Column(name = "is_identified", nullable = false)
    private Boolean isIdentified;

    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
    @PrimaryKeyJoinColumn
    private Document document;
}