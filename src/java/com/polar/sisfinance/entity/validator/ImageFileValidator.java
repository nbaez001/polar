/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.polar.sisfinance.entity.validator;

import com.polar.sisfinance.entity.news.UploadFile;
import org.springframework.validation.Errors;

/**
 *
 * @author nerio
 */
public class ImageFileValidator {

    private final int limit_size = 10240000;
    private final String limit_type_file = "jpg|jpeg|png|gif";

    public boolean supports(Class<?> arg0) {
        return UploadFile.class.equals(arg0);
    }

    public void validate(Object arg0, Errors arg1) {
        UploadFile file = (UploadFile) arg0;
        if (file.getFile().getSize() == 0) {
            arg1.rejectValue("file", "required.fileUpload");
        } else if (file.getFile().getSize() > limit_size) {
            arg1.rejectValue("file", "error.filesize");
        } else if (!checkFileType(file.getFile().getOriginalFilename())) {
            arg1.rejectValue("file", "error.filetype");
        }
    }

    private boolean checkFileType(String fileName) {
        if (fileName.length() > 0) {
            String[] parts = fileName.split("\\.");
            if (parts.length > 0) {
                String extension = parts[parts.length - 1];
                return this.limit_type_file.contains(extension);
            }
        }
        return false;
    }
}
