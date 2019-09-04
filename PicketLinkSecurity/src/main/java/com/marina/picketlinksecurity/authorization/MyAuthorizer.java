/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marina.picketlinksecurity.authorization;

import com.marina.picketlinksecurity.repository.AccountRepository;
import com.marina.picketlinksecurity.repository.UrlActionObjectMappingRepository;
import com.marina.picketlinksecurity.repository.imp.AccountRepositoryImp;
import com.marina.picketlinksecurity.repository.imp.UrlActionObjectMappingRepositoryImp;
import com.marina.picketlinksecurity.repository.model.Privilege;
import com.marina.picketlinksecurity.repository.model.Role;
import com.marina.picketlinksecurity.repository.model.UrlActionObjectMapping;
import javax.inject.Inject;
import org.picketlink.Identity;
import org.picketlink.config.http.PathConfiguration;
import org.picketlink.http.authorization.PathAuthorizer;
import org.picketlink.idm.model.Account;
import org.picketlink.idm.model.basic.User;

/**
 *
 * @author MARINA
 */
public class MyAuthorizer implements PathAuthorizer {

    UrlActionObjectMappingRepository repository = new UrlActionObjectMappingRepositoryImp();
    AccountRepository accountRepository = new AccountRepositoryImp();

    @Inject
    Identity identity;

    @Override
    public boolean authorize(PathConfiguration pc, javax.servlet.http.HttpServletRequest hsr, javax.servlet.http.HttpServletResponse hsr1) {
        String method = hsr.getMethod();
        String uri = hsr.getRequestURI();
        String contextPath = hsr.getContextPath();
        String path = uri.replaceFirst(contextPath, "");
        Account a = identity.getAccount();
        User u = (User)a;
        String name = u.getEmail();
        com.marina.picketlinksecurity.repository.model.Account account = accountRepository.findByUsername(name);
        String generalUrl = convertSpecificToGeneralUrl(path);
        UrlActionObjectMapping mapping = repository.findByUrlAndMethod(generalUrl, method);
        if (mapping == null) {
            return false;
        }
        if (account == null) {
            return false;
        }
        for (Role role : account.getRoleList()) {
            for (Privilege privilege : role.getPrivilegeList()) {
                if ((privilege.getActionId().equals(mapping.getActionId())
                        || privilege.getActionId().getName().equalsIgnoreCase("ANY_PRIVILEGE"))
                        && (privilege.getObjectId().equals(mapping.getObjectId())
                        || privilege.getObjectId().getName().equalsIgnoreCase("ANY"))) {
//                    if (privilege.isIfCreated()) {
//                        if (auditInfo.hasCreatedEntity(path, account.getUsername(), mapping.getObjectPrivilege().getName())) {
//                            return true;
//                        } else {
//                            return false;
//                        }
//
//                    } else {
//                        return true;
//                    }
                    return true;
                }
            }
        }
        return true;
    }

    public String convertSpecificToGeneralUrl(String url) {
        String newUrl = url.replaceAll("\\d+", "{id}");
        System.out.println(newUrl);
        return newUrl;
    }
}
