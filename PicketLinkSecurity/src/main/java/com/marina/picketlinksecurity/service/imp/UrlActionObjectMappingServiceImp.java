/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marina.picketlinksecurity.service.imp;

import com.marina.picketlinksecurity.repository.UrlActionObjectMappingRepository;
import com.marina.picketlinksecurity.repository.imp.UrlActionObjectMappingRepositoryImp;
import com.marina.picketlinksecurity.repository.model.UrlActionObjectMapping;
import com.marina.picketlinksecurity.service.UrlActionObjectMappingService;

/**
 *
 * @author MARINA
 */
public class UrlActionObjectMappingServiceImp implements UrlActionObjectMappingService{
    
    UrlActionObjectMappingRepository repository = new UrlActionObjectMappingRepositoryImp();


    @Override
    public UrlActionObjectMapping findByUrlAndMethod(String url, String method) {
        return repository.findByUrlAndMethod(url, method);
    }
    
}
