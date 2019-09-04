/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marina.picketlinksecurity.service;

import com.marina.picketlinksecurity.repository.model.UrlActionObjectMapping;

/**
 *
 * @author MARINA
 */
public interface UrlActionObjectMappingService {
    UrlActionObjectMapping findByUrlAndMethod(String url, String method);
}
