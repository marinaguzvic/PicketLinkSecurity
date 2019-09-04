/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marina.picketlinksecurity.initializer;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import org.picketlink.idm.IdentityManager;
import org.picketlink.idm.PartitionManager;
import org.picketlink.idm.credential.Password;
import org.picketlink.idm.model.basic.User;

/**
 *
 * @author MARINA
 */
public class SecurityInitializer {
    
    @Inject
    private PartitionManager partitionManager;

    @PostConstruct
    public void create() {
        IdentityManager identityManager = this.partitionManager.createIdentityManager();

        User user = new User("jane");

        user.setEmail("jane@doe.com");
        user.setFirstName("Jane");
        user.setLastName("Doe");

        identityManager.add(user);
        identityManager.updateCredential(user, new Password("abcd1234"));
    }
}
