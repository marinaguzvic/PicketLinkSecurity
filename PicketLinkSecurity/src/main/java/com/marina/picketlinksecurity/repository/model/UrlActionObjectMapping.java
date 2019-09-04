/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marina.picketlinksecurity.repository.model;

import java.io.Serializable;
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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author MARINA
 */
@Entity
@Table(name = "url_action_object_mapping")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UrlActionObjectMapping.findAll", query = "SELECT u FROM UrlActionObjectMapping u")
    , @NamedQuery(name = "UrlActionObjectMapping.findById", query = "SELECT u FROM UrlActionObjectMapping u WHERE u.id = :id")
    , @NamedQuery(name = "UrlActionObjectMapping.findByUrl", query = "SELECT u FROM UrlActionObjectMapping u WHERE u.url = :url")
    , @NamedQuery(name = "UrlActionObjectMapping.findByMethod", query = "SELECT u FROM UrlActionObjectMapping u WHERE u.method = :method")})
public class UrlActionObjectMapping implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Column(name = "url")
    private String url;
    @Column(name = "method")
    private String method;
    @JoinColumn(name = "action_id", referencedColumnName = "id")
    @ManyToOne
    private ActionPrivilege actionId;
    @JoinColumn(name = "object_id", referencedColumnName = "id")
    @ManyToOne
    private ObjectPrivilege objectId;

    public UrlActionObjectMapping() {
    }

    public UrlActionObjectMapping(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public ActionPrivilege getActionId() {
        return actionId;
    }

    public void setActionId(ActionPrivilege actionId) {
        this.actionId = actionId;
    }

    public ObjectPrivilege getObjectId() {
        return objectId;
    }

    public void setObjectId(ObjectPrivilege objectId) {
        this.objectId = objectId;
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
        if (!(object instanceof UrlActionObjectMapping)) {
            return false;
        }
        UrlActionObjectMapping other = (UrlActionObjectMapping) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.marina.picketlinksecurity.repository.model.UrlActionObjectMapping[ id=" + id + " ]";
    }
    
}
