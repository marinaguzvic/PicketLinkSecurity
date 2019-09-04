/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marina.picketlinksecurity.repository;

import com.marina.picketlinksecurity.repository.model.Account;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author MARINA
 */
public interface AccountRepository {

    public void startDBTransaction();

    public void commitDBTransaction();

    public void rollbackDBTransaction();

    public Account findByUsername(String username);
}
