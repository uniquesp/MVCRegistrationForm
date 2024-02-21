package com.util;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.Base64;

public class ImageConversion {

	public String encodeImage(InputStream inputStream) {
		 // Create a ByteArrayOutputStream to hold the image data
	    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
	 // Create a byte buffer to read the image data in chunks
	    byte[] buffer = new byte[4096];
	    try {
	        int bytesRead = -1;
	        // Read the input stream in chunks and write to the ByteArrayOutputStream
	        while ((bytesRead = inputStream.read(buffer)) != -1) {
	            outputStream.write(buffer, 0, bytesRead);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	 // Convert the ByteArrayOutputStream to a byte array
	    byte[] imageBytes = outputStream.toByteArray();
	    // Encode the byte array to Base64
	    return Base64.getEncoder().encodeToString(imageBytes);
	}
}
