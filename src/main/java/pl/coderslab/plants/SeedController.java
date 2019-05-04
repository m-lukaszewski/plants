package pl.coderslab.plants;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;


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
    public String seedAddPost(@ModelAttribute("seed") @Valid Seed seed, BindingResult result) {
        if (result.hasErrors()) {
            return "seedNew";
        }
        this.seedRepository.save(seed);
        return "redirect:list";
    }

    @GetMapping("/del/{id}")
    public String delete(@PathVariable Long id) {
        seedRepository.deleteById(id);
        return "redirect:../potList";
    }

    @GetMapping("/edit/{id}")
    public String editGet(@PathVariable Long id, Model model) {
        Optional<Seed> seed = seedRepository.findById(id);
        model.addAttribute("seed", seed);
        return "seedAdd";
    }

    @PostMapping("/edit/{id}")
    public String editPost(@ModelAttribute Seed seed, BindingResult result) {
        seedRepository.save(seed);
        return "redirect:../potList";
    }


}
