package ru.prokhorov.bellproject.model;

import lombok.Data;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Version;
import javax.persistence.JoinColumn;
import javax.persistence.FetchType;
import javax.persistence.Column;
import java.util.List;

@Data
@Entity
public class Office {
    @Id
    private Long id;

    @Version
    private Integer version;


    @Column(length = 50, nullable = false)
    private String name;

    @Column(length = 120, nullable = false)
    private String address;

    @Column(length = 11)
    private String phone;

    @Column(name = "is_active", nullable = false)
    private Boolean isActive;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "organization_id", nullable = false)
    private Organization organization;

    @OneToMany(mappedBy = "office", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<User> users;
}
