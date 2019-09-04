/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marina.picketlinksecurity.repository.imp;

import com.marina.picketlinksecurity.repository.AccountRepository;
import com.marina.picketlinksecurity.repository.model.Account;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author MARINA
 */
public class AccountRepositoryImp implements AccountRepository{
    private EntityManager em;

    public AccountRepositoryImp() {
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
    public Account findByUsername(String username) {
        Query query = em.createNamedQuery("Account.findByUsername");
        query.setParameter("username", username);
        List<Account> accounts = query.getResultList();
        if(accounts.isEmpty()){
            return null;
        }else{
            return accounts.get(0);
        }
    }
}
