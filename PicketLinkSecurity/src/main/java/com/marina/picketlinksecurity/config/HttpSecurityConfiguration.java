/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marina.picketlinksecurity.config;

import com.marina.picketlinksecurity.authorization.MyAuthorizer;
import javax.enterprise.event.Observes;
import org.picketlink.config.SecurityConfigurationBuilder;
import org.picketlink.event.SecurityConfigurationEvent;

/**
 *
 * @author MARINA
 */
public class HttpSecurityConfiguration {

    public void onInit(@Observes SecurityConfigurationEvent event) {
        SecurityConfigurationBuilder builder = event.getBuilder();
        
        builder
                .http()
                .allPaths()
                .authenticateWith()
                .form()
                .authenticationUri("/perform_login")
                .loginPage("/login")
                .errorPage("/error")
                .authorizeWith().authorizer(MyAuthorizer.class)
                .forPath("/perform_logout")
                .logout()
                .redirectTo("/login");
    }
}
