package org.aim.carpentry.project;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

import org.aim.carpentry.client.Client;

import java.util.List;

@Entity
@Table(name = "projects")
public class Project {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "project_id")
    private Integer id;

    @Column(name = "project_code")
    private String projectCode;

    @Column(name = "project_desc")
    private String projectDescription;

    @Column(name = "status_id")
    private Integer statusId;

    @Column(name = "client_id")
    private Integer clientId;

    @Column(name = "client_project_number")
    private Integer clientProjectNumber;


    
}