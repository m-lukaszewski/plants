package pl.coderslab.plants;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class Seed {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(unique = true)
    private String seedName;
    private int seedGrowTime;
    private int seedPlantTime;


}
