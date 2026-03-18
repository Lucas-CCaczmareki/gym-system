package gym_backend;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import gym_backend.entities.TestEntity;
import gym_backend.repositories.TestRepository;

@Configuration
public class TestConfig {

    @Bean //this will become a object that spring will create and manage alone (usually it returns the object to you)
    
    // CommandLineRunner is an interface from spring that will run a Code everytime the application starts
    CommandLineRunner run(TestRepository repository) {
        
        //Args mean I am returning a lamba, so we are creating and implementation of CommandLineRunner
        // In this case equals:
        // return new CommandLineRunner() {
        //     @Override
        //     public void run(String[] args) {
        //         //same code
        //     }
        // };

        return args -> {
            TestEntity a = new TestEntity();
            a.setName("Lucas");

            TestEntity b = new TestEntity();
            b.setName("Maria");

            repository.save(a);
            repository.save(b);
        };
    }
}