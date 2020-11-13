package ru.prokhorov.bellproject.model;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Version;

@Data
@Entity
public class Country {
    @Id
    private Long id;

    @Version
    private Integer version;

    @Column(length = 3, nullable = false)
    private String code;

    @Column(length = 40, nullable = false)
    private String name;
}
