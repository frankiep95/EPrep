package com.prep;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = { " com.prep"})
public class EPrepApplication {

	public static void main(String[] args) {
		SpringApplication.run(EPrepApplication.class, args);
	}

}
