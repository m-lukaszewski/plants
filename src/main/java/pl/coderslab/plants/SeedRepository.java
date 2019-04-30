package pl.coderslab.plants;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SeedRepository extends JpaRepository<Seed, Long> {

    public Seed getByName(String name);

    public Seed getById(Long id);
}
