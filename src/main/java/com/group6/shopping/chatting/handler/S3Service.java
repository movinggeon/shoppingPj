package com.group6.shopping.chatting.handler;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.ObjectMetadata;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;


@Service
@RequiredArgsConstructor
@Getter
public class S3Service {
    final private AmazonS3 s3Client;

    String bucketName = "aa";
    String accessKey = "aa";
    String secretKey = "aa";
    String folderName = getFolder();

    public S3Service() {
        AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);

        this.s3Client = AmazonS3ClientBuilder.standard()
                .withCredentials(new AWSStaticCredentialsProvider(credentials))
                .withRegion(Regions.AP_NORTHEAST_2)
                .build();
    }

    // upload original image file
    public void uploadFile(byte[] bytes,String fileName) {
        try {
            //set ObjectMatadata
            String s3Path = folderName + "/" + fileName;

            ObjectMetadata objectMetadata = new ObjectMetadata();
            objectMetadata.setContentLength(bytes.length);
            objectMetadata.setContentType("image/jpg");

            // save in S3
            ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bytes);
            this.s3Client.putObject(this.bucketName, s3Path.replace(File.separatorChar, '/'), byteArrayInputStream, objectMetadata);

            byteArrayInputStream.close();

        } catch (Exception e) {
           // log.error(e.getMessage());
            System.out.println(e.getMessage());
        }
    }

    private String getFolder(){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        Date date =new Date();
        String str=sdf.format(date);
        return str.replace("-",File.separator);
    }
}