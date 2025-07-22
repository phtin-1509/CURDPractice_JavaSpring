package com.example.Shop.Project.services;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;

@Service
public class UploadService {
    private final ServletContext servletContext;

    public UploadService(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    // Method to handle file upload
    public String handleFileUpload(MultipartFile file, String fileName) {
        if(file.isEmpty()) {
            return "File is empty"; // Handle empty file case
        }
        String rootPath = this.servletContext.getRealPath("/resources/images/" + fileName);
        String finalName = " ";
        try {
            byte[] bytes = file.getBytes();

            File dir = new File(rootPath + File.separator + fileName);
            if (!dir.exists())
                dir.mkdirs();

            finalName = System.currentTimeMillis() + "-" + file.getOriginalFilename();
            // Create the file on server
            File serverFile = new File(dir.getAbsolutePath() + File.separator + finalName);

            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return finalName; // Return the path of the uploaded file
    }
    // Additional methods for file handling can be added here
}
