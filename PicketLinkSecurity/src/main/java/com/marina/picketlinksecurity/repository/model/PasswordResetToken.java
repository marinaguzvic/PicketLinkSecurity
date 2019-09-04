/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marina.picketlinksecurity.repository.model;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
@Table(name = "password_reset_token")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PasswordResetToken.findAll", query = "SELECT p FROM PasswordResetToken p")
    , @NamedQuery(name = "PasswordResetToken.findById", query = "SELECT p FROM PasswordResetToken p WHERE p.id = :id")
    , @NamedQuery(name = "PasswordResetToken.findByToken", query = "SELECT p FROM PasswordResetToken p WHERE p.token = :token")
    , @NamedQuery(name = "PasswordResetToken.findByAccountId", query = "SELECT p FROM PasswordResetToken p WHERE p.accountId = :accountId")
    , @NamedQuery(name = "PasswordResetToken.findByExpiryDate", query = "SELECT p FROM PasswordResetToken p WHERE p.expiryDate = :expiryDate")})
public class PasswordResetToken implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Column(name = "token")
    private String token;
    @Column(name = "account_id")
    private BigInteger accountId;
    @Basic(optional = false)
    @Column(name = "expiry_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date expiryDate;

    public PasswordResetToken() {
    }

    public PasswordResetToken(Long id) {
        this.id = id;
    }

    public PasswordResetToken(Long id, Date expiryDate) {
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

    public BigInteger getAccountId() {
        return accountId;
    }

    public void setAccountId(BigInteger accountId) {
        this.accountId = accountId;
    }

    public Date getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(Date expiryDate) {
        this.expiryDate = expiryDate;
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
        if (!(object instanceof PasswordResetToken)) {
            return false;
        }
        PasswordResetToken other = (PasswordResetToken) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.marina.picketlinksecurity.repository.model.PasswordResetToken[ id=" + id + " ]";
    }
    
}
