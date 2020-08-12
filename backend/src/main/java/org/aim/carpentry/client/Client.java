package org.aim.carpentry.client;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "clients")
public class Client {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name= "client_id")
    private Integer id;

    @Column(name="client_code")
    private String clientCode;

    @Column(name="client_first_name")
    private String firstName;

    @Column(name="client_last_name")
    private String lastName;

    @Column(name="client_email_address")
    private String emailAddress;

    @Column(name="client_phone_number")
    private Integer phoneNumber;

    
    
}