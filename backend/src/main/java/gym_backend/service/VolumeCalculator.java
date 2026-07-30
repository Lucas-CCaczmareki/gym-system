package gym_backend.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import gym_backend.dto.ExerciseDTO;
import gym_backend.dto.TargetMuscle;
import gym_backend.dto.WorkoutDTO;
import gym_backend.enums.Muscle;
import gym_backend.enums.MuscleRole;


// Maybe I'll have to reset it once a week? dont know how yet
@Service
public class VolumeCalculator { 
    //Atributos

    // This also shouldn't be here. The data structure should be somewhere else.
    private List<WorkoutDTO> week = new ArrayList<>(); // receives a week of training   
    private Map<Muscle, Double> volume = new HashMap<>();
    
    // This is not supposed to be here, but will be for test purposes
    public void addWorkout(WorkoutDTO workout) {
        week.add(workout);  // add a workout to the week
    }

    // There is a problem here, if the user calls it twice it will calculate again, even if its the same workout
    public Map<Muscle, Double> weekVolume() {
        // Reset map
        volume = new HashMap<>();

        // Percorrer todos os treinos da semana
        for(WorkoutDTO workout : week) {
            // Percorrer o exercises do dto
            for(ExerciseDTO exercise : workout.getExercises()) {
                // Percorrer o vetor de target e somar 1.0*sets.size se for primary ou 0.5*sets.size se for secondary
                for(TargetMuscle target : exercise.getTarget()) {
                    Muscle muscle = target.getMuscle();
                    Double muscle_vol = (double) exercise.getSets().size();

                    if(target.getRole() == MuscleRole.PRIMARY) {
                        // The function merge receives the key, the value and a function
                        // If the place you are trying to update already has a value, it will merge
                        // using the function you specified. This bi function receives two params
                        // and make an operation using them, in this case, it sum the old with the new.
                        volume.merge(muscle, muscle_vol*1.0, (oldValue, newValue) -> oldValue + (newValue*1.0));
                    } else { //se não for, esse músculo é secundário
                        volume.merge(muscle, muscle_vol*0.5, (oldValue, newValue) -> oldValue + (newValue*0.5));
                    }
                }        
            } 
        }

        return volume;
    }

}
