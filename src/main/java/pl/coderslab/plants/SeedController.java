package pl.coderslab.plants;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.util.List;


@Controller
public class SeedController {

    @Autowired
    private PotRepository potRepository;
    @Autowired
    private SeedRepository seedRepository;

    @GetMapping("/seed/list")
    public String seedList(Model model) {
        List<Seed> seeds = seedRepository.findAll();
        model.addAttribute("seeds", seeds);
        return "seedList";
    }

    @GetMapping("/seed/add")
    public String seedAdd(Model model) {
        model.addAttribute("seed", new Seed());
        return "seedNew";
    }

    @PostMapping("/seed/add")
    public String seedAddPost(@ModelAttribute("form")  @Valid Seed seed, BindingResult result) {
        if (result.hasErrors()) {
            return "seedNew";
        }
        this.seedRepository.save(seed);
        return "seedList";
    }



}
