package pl.coderslab.plants;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SeedRepository extends JpaRepository<Seed, Long> {

    Seed getByName(String name);

    Seed getById(Long id);
}
