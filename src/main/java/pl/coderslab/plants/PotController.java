package pl.coderslab.plants;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;


import javax.validation.Valid;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;


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
        System.out.println("---------------"+pots.toString());
        model.addAttribute("pots", pots);
        model.addAttribute("currentDate", LocalDate.now());
        return "potList";
    }

    @GetMapping("/add")
    public String potAdd(Model model) {
        model.addAttribute("pot", new Pot());
        return "potNew";
    }

    @PostMapping("/add")
    public String potAddPost(@ModelAttribute("pot") @Valid Pot pot, BindingResult result) {
        if (result.hasErrors()) {
            return "potNew";
        }
        this.potRepository.save(pot);
        if (pot.getName().isEmpty() == true) {
            pot.setUniqueName();
        }

        Seed seed = seedRepository.getById(pot.getSeed().getId());
        pot.setGerminate(pot.getCreated().plusDays(seed.getGrowDays()));
        pot.setPlantToGroundDate(pot.getCreated().plusDays(seed.getPlantDays()));
        potRepository.save(pot);
        return "redirect:list";
    }

    @GetMapping("/del/{id}")
    public String delete(@PathVariable Long id) {
        potRepository.deleteById(id);
        return "redirect:../list";

    }

    @ModelAttribute("seeds")
    public List<Seed> seeds() {
        return this.seedRepository.findAll();
    }

}

