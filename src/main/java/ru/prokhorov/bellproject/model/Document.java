package ru.prokhorov.bellproject.model;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Version;
import javax.persistence.ManyToOne;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.MapsId;
import javax.persistence.JoinColumn;
import java.util.Date;

@Data
@Entity
public class Document {
    @Id
    @Column(name = "user_id")
    private Long userId;

    @Version
    private Integer version;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "type_id", nullable = false)
    private DocumentType documentType;

    @Column(length = 20, nullable = false)
    private String number;

    @Column(nullable = false)
    private Date date;

    @OneToOne
    @MapsId
    @JoinColumn(name = "user_id")
    private User user;
}
