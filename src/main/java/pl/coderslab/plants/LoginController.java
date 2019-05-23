package pl.coderslab.plants;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.security.Security;

@Controller
//@RequestMapping("/logout")
public class LoginController {

    @Autowired
    private LogsRepository logsRepository;

    @GetMapping("/logout")
    public String logout() {
        return "logout";
    }

    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String login(HttpServletRequest request) {
        Logs logs = new Logs();
        logs.setIp(request.getRemoteAddr());
        logs.setName(request.getRemoteUser());
        logsRepository.save(logs);
        System.out.println("---------------------"+request.getRemoteAddr()+request.getRemoteUser());
        return "login";
    }

    @RequestMapping(value = {"/loginPost"}, method = RequestMethod.POST)
    public String loginPost() {
        return "home";
    }
}

