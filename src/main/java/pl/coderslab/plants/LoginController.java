package pl.coderslab.plants;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
//@RequestMapping("/logout")
public class LoginController {

@GetMapping("/logout")
    public String logout() {
        return "logout";
    }
@GetMapping("/login")
    public String login() {
    return "login";
}
}
