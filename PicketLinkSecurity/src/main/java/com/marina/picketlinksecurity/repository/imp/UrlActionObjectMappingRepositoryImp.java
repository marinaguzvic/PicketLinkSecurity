/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marina.picketlinksecurity.repository.imp;

import com.marina.picketlinksecurity.repository.UrlActionObjectMappingRepository;
import com.marina.picketlinksecurity.repository.model.UrlActionObjectMapping;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author MARINA
 */
public class UrlActionObjectMappingRepositoryImp implements UrlActionObjectMappingRepository{

    private EntityManager em;

    public UrlActionObjectMappingRepositoryImp() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("com.marina_PicketLinkSecurity_jar_1.0-SNAPSHOTPU");
        em = emf.createEntityManager();
    }
    
    
    
    @Override
    public void startDBTransaction() {
        em.getTransaction().begin();
    }

    @Override
    public void commitDBTransaction() {
        em.getTransaction().commit();
    }

    @Override
    public void rollbackDBTransaction() {
        em.getTransaction().rollback();
    }
    
    @Override
    public UrlActionObjectMapping findByUrlAndMethod(String url, String method) {
         Query query = em.createQuery("select u from UrlActionObjectMapping u where u.url = :url AND u.method = :method");
         query.setParameter("url", url);
         query.setParameter("method", method);
         List<UrlActionObjectMapping> mappings = query.getResultList();
         if(mappings.isEmpty()){
             return null;
         }else{
             return mappings.get(0);
         }
    }
    
}
