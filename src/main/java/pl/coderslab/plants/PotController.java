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
@RequestMapping("/pot")
public class PotController {

    @Autowired
    private PotRepository potRepository;
    @Autowired
    private SeedRepository seedRepository;

    @GetMapping("/list")
    public String potList(Model model) {
        List<Pot> pots = potRepository.findAll();
        model.addAttribute("pots", pots);
        return "potList";
    }

    @GetMapping("/add")
    public String potAdd(Model model) {
        model.addAttribute("pot", new Pot());
        return "potNew";
    }

    @PostMapping("/add")
    public String potAddPost(@ModelAttribute("pot")  @Valid Pot pot, BindingResult result) {
        if (result.hasErrors()) {
            return "potNew";
        }
        this.potRepository.save(pot);
        pot.setUniqueName();

        Seed seed = pot.getSeed();
        pot.setGerminate(seed);
        this.potRepository.save(pot);
        return "redirect:list";
    }



    @ModelAttribute("seeds")
    public List<Seed> seeds(){
        return this.seedRepository.findAll();
    }
}
