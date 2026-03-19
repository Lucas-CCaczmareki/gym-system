package gym_backend.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

import gym_backend.dto.UserDTO;
import gym_backend.dto.EchoResponse;
import gym_backend.service.UserService;

@RestController
public class UserController {
    //Atributes
    UserService userServ;
    
    public UserController(UserService userServ) {
        this.userServ = userServ;
    }

    @PostMapping("/user")
    public EchoResponse create(@RequestBody UserDTO u) {
        if (userServ.create(u)){
            return new EchoResponse("success");
        } else {
            return new EchoResponse("failure");
        }
    }

    @GetMapping("/users")
    public List<UserDTO> getUsers() {
        return userServ.getUsers();
    }

    //later map "user/{id} to get a specific user"

}
