package ru.prokhorov.bellproject.model;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Version;

@Data
@Entity
@Table(name = "Document_Type")
public class DocumentType {
    @Id
    private Long id;

    @Version
    private Integer version;

    @Column(name = "code", length = 2, nullable = false)
    private String code;

    @Column(name = "name", length = 113, nullable = false)
    private String name;
}
