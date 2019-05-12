package pl.coderslab.plants;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.*;


import javax.servlet.http.HttpServletRequest;
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
    @Autowired
    private DestinationRepository destinationRepository;

    @GetMapping("/list")
    public String potList(HttpServletRequest request, ModelMap map, Model model) {
        List<Pot> pots = potRepository.findAll();
        PagedListHolder pagedListHolder = new PagedListHolder(pots);
        int page = ServletRequestUtils.getIntParameter(request, "p", 0);
        pagedListHolder.setPage(page);
        pagedListHolder.setPageSize(10);
        map.put("pagedListHolder", pagedListHolder);
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
        pot.setCreated(LocalDate.now());
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

    @GetMapping("/edit/{id}")
    public String editGet(@PathVariable Long id, Model model) {
        Optional<Pot> pot = potRepository.findById(id);
        model.addAttribute("pot", pot);
        return "potEdit";
    }

    @PostMapping("/edit/{id}")
    public String editPost(@ModelAttribute("pot") @Valid Pot pot, BindingResult result) {
        if (result.hasErrors()) {
            return "potEdit";
        }

        Seed seed = seedRepository.getById(pot.getSeed().getId());
        pot.setGerminate(pot.getCreated().plusDays(seed.getGrowDays()));
        pot.setPlantToGroundDate(pot.getCreated().plusDays(seed.getPlantDays()));
        potRepository.save(pot);
        return "redirect:../list";
    }

    @ModelAttribute("seeds")
    public List<Seed> seeds() {
        return this.seedRepository.findAll();
    }

    @ModelAttribute("destinations")
    public List<Destination> destinations() {
        return this.destinationRepository.findAll();
    }

}

