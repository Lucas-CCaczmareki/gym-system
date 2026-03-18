package gym_backend.entities;

import jakarta.persistence.*;

@Entity // tells the JPA that this class is a table
@Table(name = "test_entity")
public class TestEntity {
    
    @Id //primary key
    @GeneratedValue(strategy = GenerationType.IDENTITY) //auto increment id (dont know how tho)0
    private Long id;

    private String name;
    
    //getters and setters
    public Long getId() { return id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

}
