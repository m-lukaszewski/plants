package pl.coderslab.plants;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class PlantsApplication {

    public static void main(String[] args) {
        SpringApplication.run(PlantsApplication.class, args);
        System.out.println("\n\n\nStart Page: http://localhost:8080/");

    }

}
