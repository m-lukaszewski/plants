package pl.coderslab.plants;

import lombok.Data;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;

@Entity
@Data
public class Pot {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    @ManyToOne
    @JoinColumn(name = "seed_id")
    private Seed seed;
    @UpdateTimestamp
    private LocalDate created;
    private LocalDate germinate;
    private LocalDate plantToGroundDate;
    private String comment;

    public void setUniqueName() {
        this.name = "D-" + this.id.toString();

    }
}
