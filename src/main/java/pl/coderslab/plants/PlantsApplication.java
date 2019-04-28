package pl.coderslab.plants;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.validation.Validator;

@SpringBootApplication
@ComponentScan(basePackages = "pl.coderslab")
public class PlantsApplication implements WebMvcConfigurer {
    @Bean
    public Validator validator() {
        return new LocalValidatorFactoryBean();
    }
    public static void main(String[] args) {
        SpringApplication.run(PlantsApplication.class, args);
        System.out.println("\n\n\nStart Page: http://localhost:8080/");

    }

}
