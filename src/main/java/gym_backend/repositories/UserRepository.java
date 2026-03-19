package gym_backend.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import gym_backend.entities.UserEntity;

public interface UserRepository extends JpaRepository<UserEntity, Long>{
    //CRUD operations will be created automatically
}
