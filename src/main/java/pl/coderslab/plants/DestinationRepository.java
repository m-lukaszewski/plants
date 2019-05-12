package pl.coderslab.plants;

import org.springframework.data.jpa.repository.JpaRepository;

public interface DestinationRepository extends JpaRepository<Destination, Long> {
    Destination getById(Long id);
}
