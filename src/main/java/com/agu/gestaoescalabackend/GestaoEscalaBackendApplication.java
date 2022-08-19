package com.agu.gestaoescalabackend;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@Slf4j
public class GestaoEscalaBackendApplication {

	public static void main(String[] args) {
		SpringApplication.run(GestaoEscalaBackendApplication.class, args);
		log.info("Application started");
		log.info("teste 2");
	}

}
