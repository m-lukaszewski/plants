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
import java.util.List;
import java.util.Optional;


@Controller
@RequestMapping("/seed")
public class SeedController {


    @Autowired
    private SeedRepository seedRepository;

    @GetMapping("/list")
    public String seedList(HttpServletRequest request, ModelMap map) {
        List<Seed> seeds = seedRepository.findAll();
        PagedListHolder pagedListHolder = new PagedListHolder(seeds);
        int page = ServletRequestUtils.getIntParameter(request, "p", 0);
        pagedListHolder.setPage(page);
        pagedListHolder.setPageSize(10);
        map.put("pagedListHolder", pagedListHolder);
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
        return "redirect:../list";
    }

    @GetMapping("/edit/{id}")
    public String editGet(@PathVariable Long id, Model model) {
        Optional<Seed> seed = seedRepository.findById(id);
        model.addAttribute("seed", seed);
        return "seedNew";
    }

    @PostMapping("/edit/{id}")
    public String editPost(@ModelAttribute Seed seed, BindingResult result) {
        seedRepository.save(seed);
        return "redirect:../list";
    }


}
