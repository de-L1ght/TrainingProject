package ru.prokhorov.bellproject.model;

import lombok.Data;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Version;
import java.util.List;

@Data
@Entity
public class Organization {
    @Id
    private Long id;

    @Version
    private Integer version;

    @Column(length = 50, nullable = false)
    private String name;

    @Column(name = "full_name", length = 100, nullable = false)
    private String fullName;

    @Column(length = 10, nullable = false)
    private String inn;

    @Column(length = 9, nullable = false)
    private String kpp;

    @Column(length = 120, nullable = false)
    private String address;

    @Column(length = 11)
    private String phone;

    @Column(name = "is_active", nullable = false)
    private Boolean isActive;

    @OneToMany(mappedBy = "organization", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Office> offices;
}
