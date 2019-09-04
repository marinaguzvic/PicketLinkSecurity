/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marina.picketlinksecurity.repository.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author MARINA
 */
@Entity
@Table(name = "email_verification_token")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EmailVerificationToken.findAll", query = "SELECT e FROM EmailVerificationToken e")
    , @NamedQuery(name = "EmailVerificationToken.findById", query = "SELECT e FROM EmailVerificationToken e WHERE e.id = :id")
    , @NamedQuery(name = "EmailVerificationToken.findByToken", query = "SELECT e FROM EmailVerificationToken e WHERE e.token = :token")
    , @NamedQuery(name = "EmailVerificationToken.findByExpiryDate", query = "SELECT e FROM EmailVerificationToken e WHERE e.expiryDate = :expiryDate")})
public class EmailVerificationToken implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Column(name = "token")
    private String token;
    @Basic(optional = false)
    @Column(name = "expiry_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date expiryDate;
    @JoinColumn(name = "account_id", referencedColumnName = "id")
    @ManyToOne
    private Account accountId;

    public EmailVerificationToken() {
    }

    public EmailVerificationToken(Long id) {
        this.id = id;
    }

    public EmailVerificationToken(Long id, Date expiryDate) {
        this.id = id;
        this.expiryDate = expiryDate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Date getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(Date expiryDate) {
        this.expiryDate = expiryDate;
    }

    public Account getAccountId() {
        return accountId;
    }

    public void setAccountId(Account accountId) {
        this.accountId = accountId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EmailVerificationToken)) {
            return false;
        }
        EmailVerificationToken other = (EmailVerificationToken) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.marina.picketlinksecurity.repository.model.EmailVerificationToken[ id=" + id + " ]";
    }
    
}
