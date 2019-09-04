/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marina.picketlinksecurity.repository.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author MARINA
 */
@Entity
@Table(name = "object_privilege")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ObjectPrivilege.findAll", query = "SELECT o FROM ObjectPrivilege o")
    , @NamedQuery(name = "ObjectPrivilege.findById", query = "SELECT o FROM ObjectPrivilege o WHERE o.id = :id")
    , @NamedQuery(name = "ObjectPrivilege.findByName", query = "SELECT o FROM ObjectPrivilege o WHERE o.name = :name")})
public class ObjectPrivilege implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Column(name = "name")
    private String name;
    @OneToMany(mappedBy = "objectId")
    private List<Privilege> privilegeList;
    @OneToMany(mappedBy = "objectId")
    private List<UrlActionObjectMapping> urlActionObjectMappingList;

    public ObjectPrivilege() {
    }

    public ObjectPrivilege(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @XmlTransient
    public List<Privilege> getPrivilegeList() {
        return privilegeList;
    }

    public void setPrivilegeList(List<Privilege> privilegeList) {
        this.privilegeList = privilegeList;
    }

    @XmlTransient
    public List<UrlActionObjectMapping> getUrlActionObjectMappingList() {
        return urlActionObjectMappingList;
    }

    public void setUrlActionObjectMappingList(List<UrlActionObjectMapping> urlActionObjectMappingList) {
        this.urlActionObjectMappingList = urlActionObjectMappingList;
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
        if (!(object instanceof ObjectPrivilege)) {
            return false;
        }
        ObjectPrivilege other = (ObjectPrivilege) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.marina.picketlinksecurity.repository.model.ObjectPrivilege[ id=" + id + " ]";
    }
    
}
