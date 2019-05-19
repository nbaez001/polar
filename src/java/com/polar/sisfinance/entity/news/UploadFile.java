/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.entity.news;

import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author nerio
 */
public class UploadFile {

    private MultipartFile file;

    public UploadFile() {
    }

    public UploadFile(MultipartFile file) {
        this.file = file;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }
}
