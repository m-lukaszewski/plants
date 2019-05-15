package pl.coderslab.plants;

import org.springframework.data.jpa.repository.JpaRepository;


import java.time.LocalDate;
import java.util.List;

public interface PotRepository extends JpaRepository<Pot, Long> {

    Pot getById(Long id);
    Pot findByName(String name);
    Pot findBySeed(String seed);

    List<Pot> findAllById(Long id);
    List<Pot> findAllByGerminate(LocalDate germinate);
    List<Pot> findAllByGerminateBefore(LocalDate germinate);
    List<Pot> findAllByGerminateAfter(LocalDate germinate);
    List<Pot> findAllByGerminateBetween(LocalDate min, LocalDate max);


    List<Pot> findAllByCreated(LocalDate created);
    List<Pot> findAllByCreatedBetween(LocalDate min, LocalDate max);
    List<Pot> findAllByCreatedBefore(LocalDate date);
    List<Pot> findAllByCreatedAfter(LocalDate date);



    List<Pot> findAllByPlantToGroundDate(LocalDate plantToGroundDate);
    List<Pot> findAllByPlantToGroundDateBefore(LocalDate plantToGroundDate);
    List<Pot> findAllByPlantToGroundDateAfter(LocalDate plantToGroundDate);
    List<Pot> findAllByPlantToGroundDateBetween(LocalDate min, LocalDate max);



    List<Pot> findAllByDestination(String destination);
}
