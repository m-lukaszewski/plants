package pl.coderslab.plants;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.data.annotation.CreatedDate;

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
    @NotNull
    @NotFound(action = NotFoundAction.IGNORE)
    @JoinColumn(name = "seed_id")
    private Seed seed;
    private LocalDate created;
    private LocalDate germinate;
    private LocalDate plantToGroundDate;
    private String comment;

    public void setUniqueName() {
        this.name = "D-" + this.id.toString();

    }
}
