package pl.coderslab.plants;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;
import java.util.List;


@Controller
@RequestMapping("/seed")
public class SeedController {


    @Autowired
    private SeedRepository seedRepository;

    @GetMapping("/list")
    public String seedList(Model model) {
        List<Seed> seeds = seedRepository.findAll();
        model.addAttribute("seeds", seeds);
        return "seedList";
    }

    @GetMapping("/add")
    public String seedAdd(Model model) {
        model.addAttribute("seed", new Seed());
        return "seedNew";
    }

    @PostMapping("/add")
    public String seedAddPost(@ModelAttribute("form")  @Valid Seed seed, BindingResult result) {
        if (result.hasErrors()) {
            return "seedNew";
        }
        this.seedRepository.save(seed);
        return "redirect:list";
    }



}
