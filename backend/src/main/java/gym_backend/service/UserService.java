package gym_backend.service;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import gym_backend.dto.UserDTO;
import gym_backend.entities.UserEntity;
import gym_backend.repositories.UserRepository;

@Service
public class UserService {
    // Atributes
    private final UserRepository repo;

    public UserService(UserRepository repo) {
        this.repo = repo;
    }

    public boolean create(UserDTO dto) {
        UserEntity user = new UserEntity();
        user.setName(dto.getName());
        user.setEmail(dto.getEmail());
        user.setPassword(dto.getPassword());

        if(repo.save(user) != null) {
            return true;
        } else {
            return false;
        }
    }

    public List<UserDTO> getUsers() {
        List<UserEntity> users = repo.findAll();
        List<UserDTO> response = new ArrayList<>();

        for (UserEntity u : users) {
            UserDTO dto = new UserDTO();

            dto.setName(u.getName());
            dto.setEmail(u.getEmail());
            dto.setPassword(u.getPassword());

            response.add(dto);
        }

        return response;
    }

}
