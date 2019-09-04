/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marina.picketlinksecurity.authentication;

import com.marina.picketlinksecurity.repository.AccountRepository;
import com.marina.picketlinksecurity.repository.model.Account;
import com.marina.picketlinksecurity.service.AccountService;
import com.marina.picketlinksecurity.service.imp.AccountServiceImp;
import javax.inject.Inject;
import org.picketlink.annotations.PicketLink;
import org.picketlink.authentication.BaseAuthenticator;
import org.picketlink.credential.DefaultLoginCredentials;
import org.picketlink.idm.credential.encoder.BCryptPasswordEncoder;
import org.picketlink.idm.model.basic.User;

/**
 *
 * @author MARINA
 */
@PicketLink
public class JPAAuthenticator extends BaseAuthenticator {

    AccountService accountService = new AccountServiceImp();
    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder(0);
    @Inject
    DefaultLoginCredentials credentials;

    @Override
    public void authenticate() {
        Account account = accountService.getAccountByUsername(credentials.getUserId());
        if(account != null && passwordEncoder.verify(credentials.getPassword(), account.getPassword())){
            setStatus(AuthenticationStatus.SUCCESS);
            User user = new User(credentials.getUserId());
            user.setEmail(credentials.getUserId());
            user.setCreatedDate(account.getCreated());
            user.setEnabled(account.getEnabled());
            user.setFirstName(account.getFirstName());
            user.setLastName(account.getLastName());
            setAccount(user);
        }else{
            setStatus(AuthenticationStatus.FAILURE);
        }

    }

}
