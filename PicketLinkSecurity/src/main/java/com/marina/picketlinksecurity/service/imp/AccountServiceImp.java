/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marina.picketlinksecurity.service.imp;

import com.marina.picketlinksecurity.repository.AccountRepository;
import com.marina.picketlinksecurity.repository.imp.AccountRepositoryImp;
import com.marina.picketlinksecurity.repository.model.Account;
import com.marina.picketlinksecurity.service.AccountService;

/**
 *
 * @author MARINA
 */
public class AccountServiceImp implements AccountService{
    AccountRepository accountRepository;

    public AccountServiceImp() {
        accountRepository = new AccountRepositoryImp();
    }
    
    

    @Override
    public Account getAccountByUsername(String username) {
        return accountRepository.findByUsername(username);
    }
}
