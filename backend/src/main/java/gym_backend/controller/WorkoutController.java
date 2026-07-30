package gym_backend.controller;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

// import gym_backend.dto.ExerciseDTO;
import gym_backend.dto.WorkoutDTO;
import gym_backend.enums.Muscle;
import gym_backend.service.VolumeCalculator;

import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
// import org.springframework.web.bind.annotation.RequestParam;



@RestController
public class WorkoutController {
    
    // Atributos
    VolumeCalculator volCalc;

    // Construtor
    public WorkoutController (VolumeCalculator volCalc) {
        this.volCalc = volCalc;
    }

    // @PostMapping("/exercise")
    // public ExerciseDTO receiveExercise (@RequestBody ExerciseDTO ex1) {
    //     return ex1;
    // }

    @PostMapping("/workout")
    public void receiveWorkout (@RequestBody WorkoutDTO w1) {
        // Toda vez que ele recebe um workout...
        volCalc.addWorkout(w1);
    }

    @GetMapping("/volume")
    public Map<Muscle, Double> getWeekVolume() {
        return volCalc.weekVolume();
    }

}
