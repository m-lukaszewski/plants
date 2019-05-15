package pl.coderslab.plants;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SeedRepository extends JpaRepository<Seed, Long> {

    Seed getByName(String name);

    Seed getById(Long id);
    List<Seed> findAllByName(String name);
    List<Seed> findAllByGrowDays(Long growDays);
    List<Seed> findAllByGrowDaysBetween(Long min, Long max);

    List<Seed> findAllByPlantDays(Long plantDays);
    List<Seed> findAllByPlantDaysBetween(Long min, Long max);

    List<Seed> findAllByComment(String comment);

}
