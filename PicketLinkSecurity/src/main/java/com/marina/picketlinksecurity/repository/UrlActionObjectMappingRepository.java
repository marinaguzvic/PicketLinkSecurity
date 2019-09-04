/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marina.picketlinksecurity.repository;

import com.marina.picketlinksecurity.repository.model.UrlActionObjectMapping;

/**
 *
 * @author MARINA
 */
public interface UrlActionObjectMappingRepository {

    public void startDBTransaction();

    public void commitDBTransaction();

    public void rollbackDBTransaction();

    public UrlActionObjectMapping findByUrlAndMethod(String url, String method);
}
