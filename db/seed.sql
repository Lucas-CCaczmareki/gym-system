-- zera tudo toda vez q eu for rodar o seed.sql. util pra ir testando nesse começo
TRUNCATE TABLE usr, exercise, muscle, mscl_activation, routine, workout,
    routine_workout, plan, session, execution, training_set
    RESTART IDENTITY CASCADE;

CREATE EXTENSION IF NOT EXISTS pgcrypto;

INSERT INTO usr (email, nome, senha) VALUES
    ('admin@gmail.com', 'Admin', crypt('admin123', gen_salt('bf'))),
    ('lucascaczmareki@gmail.com', 'Lucas Caczmareki', crypt ('lucas123', gen_salt('bf'))),
    ('joao@gmail.com', 'Joao Godinho', crypt ('joao123', gen_salt('bf')));
    
INSERT INTO equipment ("name", base_weight) VALUES
    ('Barbell', 10),            --1
    ('Olympic barbell', 20),    --2
    ('Smith', 5),               --3
    ('Pulley', 0),              --4
    ('Machine', 5),             --5
    ('Dumbbell', 0),            --6
    ('Bodyweight', 0);          --7

INSERT INTO muscle ("name") VALUES
    ('Peitoral'),
    ('Deltoide'),
    ('Tríceps'),
    ('Bíceps'),
    ('Dorsais'),
    ('Romboides'),
    ('Trapézio'),
    ('Lombar'),
    ('Antebraço'),
    ('Quadríceps'),
    ('Isquiotibiais'),
    ('Glúteo'),
    ('Adutores'),
    ('Panturrilha'),
    ('Abdômen'),
    ('Flexores de quadril');

-- Isso aqui foi gerado por IA com base na base de exercícios no "exercises.md" que eu criei.
-- deve ter jeitos mais inteligentes de fazer depois, vou estudar. Um amigo me recomendou ORM insert.

INSERT INTO exercise ("name", "type", idEquipment, f_oneside) VALUES
    -- Peito
    ('Supino reto', 'compound', (SELECT id FROM equipment WHERE name = 'Barbell')),
    ('Supino reto', 'compound', (SELECT id FROM equipment WHERE name = 'Olympic barbell')),
    ('Supino reto', 'compound', (SELECT id FROM equipment WHERE name = 'Smith')),
    ('Supino reto', 'compound', (SELECT id FROM equipment WHERE name = 'Machine')),
    ('Supino reto', 'compound', (SELECT id FROM equipment WHERE name = 'Dumbbell')),

    ('Supino inclinado', 'compound', (SELECT id FROM equipment WHERE name = 'Barbell')),
    ('Supino inclinado', 'compound', (SELECT id FROM equipment WHERE name = 'Olympic barbell')),
    ('Supino inclinado', 'compound', (SELECT id FROM equipment WHERE name = 'Smith')),
    ('Supino inclinado', 'compound', (SELECT id FROM equipment WHERE name = 'Machine')),
    ('Supino inclinado', 'compound', (SELECT id FROM equipment WHERE name = 'Dumbbell')),

    ('Supino declinado', 'compound', (SELECT id FROM equipment WHERE name = 'Barbell')),
    ('Supino declinado', 'compound', (SELECT id FROM equipment WHERE name = 'Olympic barbell')),
    ('Supino declinado', 'compound', (SELECT id FROM equipment WHERE name = 'Smith')),
    ('Supino declinado', 'compound', (SELECT id FROM equipment WHERE name = 'Machine')),
    ('Supino declinado', 'compound', (SELECT id FROM equipment WHERE name = 'Dumbbell'));

    ('Mergulho em paralela', 'compound', (SELECT id FROM equipment WHERE name = 'Bodyweight')),
    ('Mergulho em paralela', 'compound', (SELECT id FROM equipment WHERE name = 'Machine')), --num graviton por exemplo
    
    ('Crucifixo', 'isolated', (SELECT id FROM equipment WHERE name = 'Dumbbell')),
    ('Crucifixo inclinado', 'isolated', (SELECT id FROM equipment WHERE name = 'Dumbbell')),
    ('Crucifixo declinado', 'isolated', (SELECT id FROM equipment WHERE name = 'Dumbbell')),

    ('Crucifixo', 'isolated', (SELECT id FROM equipment WHERE name = 'Machine'));
    ('Crucifixo inclinado', 'isolated', (SELECT id FROM equipment WHERE name = 'Machine')); -- no peckdeck impossivel, mas tem máquinas pra isso
    ('Crucifixo declinado', 'isolated', (SELECT id FROM equipment WHERE name = 'Machine')); -- variação da posição do banco no peck deck por exemplo
    
    ('Crossover', 'isolated', (SELECT id FROM equipment WHERE name = 'Pulley')),            -- mesmo exercicio mas muda de nome
    ('Crossover inclinado', 'isolated', (SELECT id FROM equipment WHERE name = 'Pulley')),  -- dá pra chamar de crossover polia baixa
    ('Crossover declinado', 'isolated', (SELECT id FROM equipment WHERE name = 'Pulley')),  -- da pra chamar de crossover polia alta

    -- Costas
    ('Barra fixa', 'compound', (SELECT id FROM equipment WHERE name = 'Bodyweight')),
    ('Barra fixa', 'compound', (SELECT id FROM equipment WHERE name = 'Machine')),      -- graviton
    ('Pulley frente', 'compound', (SELECT id FROM equipment WHERE name = 'Pulley')),    -- mesmo exercicio mas muda de nome

    ('Face pull', 'isolated', (SELECT id FROM equipment WHERE name = 'Pulley')),

    ('Pulldown', 'isolated', (SELECT id FROM equipment WHERE name = 'Pulley')),
    ('Pulldown', 'isolated', (SELECT id FROM equipment WHERE name = 'Machine')),

    ('Remada baixa', 'compound', (SELECT id FROM equipment WHERE name = 'Pulley')),
    ('Remada baixa', 'compound', (SELECT id FROM equipment WHERE name = 'Pulley'), TRUE), --unilateral
    ('Remada baixa', 'compound', (SELECT id FROM equipment WHERE name = 'Machine')),
    ('Remada baixa', 'compound', (SELECT id FROM equipment WHERE name = 'Machine'), TRUE), --unilateral
    
    ('Remada curvada', 'compound', (SELECT id FROM equipment WHERE name = 'Barbell')),
    ('Remada curvada', 'compound', (SELECT id FROM equipment WHERE name = 'Olympic barbell')),
    ('Remada curvada', 'compound', (SELECT id FROM equipment WHERE name = 'Dumbbell')),
    ('Remada curvada', 'compound', (SELECT id FROM equipment WHERE name = 'Machine')),

    ('Remada cavalinho', 'compound', (SELECT id FROM equipment WHERE name = 'Barbell')),
    ('Remada cavalinho', 'compound', (SELECT id FROM equipment WHERE name = 'Machine')),

    ('Remada serrote', 'compound', (SELECT id FROM equipment WHERE name = 'Dumbbell'), TRUE),

    ('Remada articulada', 'compound', (SELECT id FROM equipment WHERE name = 'Pulley')),
    ('Remada articulada', 'compound', (SELECT id FROM equipment WHERE name = 'Machine')),

    --continuar revisando daqui
    -- Ombro
    ('Desenvolvimento militar', 'compound', (SELECT id FROM equipment WHERE name = 'Barbell')),
    ('Desenvolvimento militar', 'compound', (SELECT id FROM equipment WHERE name = 'Olympic barbell')),
    ('Desenvolvimento militar', 'compound', (SELECT id FROM equipment WHERE name = 'Smith')),
    ('Desenvolvimento com halteres', 'compound', (SELECT id FROM equipment WHERE name = 'Dumbbell')),
    ('Desenvolvimento Arnold', 'compound', (SELECT id FROM equipment WHERE name = 'Dumbbell')),
    ('Elevação lateral', 'isolated', (SELECT id FROM equipment WHERE name = 'Dumbbell')),
    ('Elevação lateral', 'isolated', (SELECT id FROM equipment WHERE name = 'Pulley')),
    ('Elevação frontal', 'isolated', (SELECT id FROM equipment WHERE name = 'Dumbbell')),
    ('Elevação frontal', 'isolated', (SELECT id FROM equipment WHERE name = 'Pulley')),
    ('Encolhimento', 'isolated', (SELECT id FROM equipment WHERE name = 'Barbell')),
    ('Encolhimento', 'isolated', (SELECT id FROM equipment WHERE name = 'Dumbbell')),
    ('Encolhimento', 'isolated', (SELECT id FROM equipment WHERE name = 'Smith'));
    ('Crucifixo invertido', 'isolated', (SELECT id FROM equipment WHERE name = 'Machine')),
    ('Crucifixo invertido', 'isolated', (SELECT id FROM equipment WHERE name = 'Pulley'));

    -- Biceps
    ('Rosca direta', 'isolated', (SELECT id FROM equipment WHERE name = 'Barbell')),
    ('Rosca direta', 'isolated', (SELECT id FROM equipment WHERE name = 'Olympic barbell')),
    ('Rosca barra W', 'isolated', (SELECT id FROM equipment WHERE name = 'Barbell')),
    ('Rosca alternada com halteres', 'isolated', (SELECT id FROM equipment WHERE name = 'Dumbbell')),
    ('Rosca martelo', 'isolated', (SELECT id FROM equipment WHERE name = 'Dumbbell')),
    ('Rosca martelo', 'isolated', (SELECT id FROM equipment WHERE name = 'Pulley')),
    ('Rosca Scott', 'isolated', (SELECT id FROM equipment WHERE name = 'Machine')),
    ('Rosca Scott', 'isolated', (SELECT id FROM equipment WHERE name = 'Barbell')),
    ('Rosca na polia', 'isolated', (SELECT id FROM equipment WHERE name = 'Pulley')),
    ('Rosca concentrada', 'isolated', (SELECT id FROM equipment WHERE name = 'Dumbbell'));

    -- Triceps
    ('Tríceps testa', 'isolated', (SELECT id FROM equipment WHERE name = 'Barbell')),
    ('Tríceps testa', 'isolated', (SELECT id FROM equipment WHERE name = 'Dumbbell')),
    ('Tríceps francês', 'isolated', (SELECT id FROM equipment WHERE name = 'Dumbbell')),
    ('Tríceps francês', 'isolated', (SELECT id FROM equipment WHERE name = 'Barbell')),
    ('Tríceps na polia com barra reta', 'isolated', (SELECT id FROM equipment WHERE name = 'Pulley')),
    ('Tríceps na polia com corda', 'isolated', (SELECT id FROM equipment WHERE name = 'Pulley')),
    ('Tríceps supinado na polia', 'isolated', (SELECT id FROM equipment WHERE name = 'Pulley'));

    -- Quadríceps
    ('Agachamento livre', 'compound', (SELECT id FROM equipment WHERE name = 'Barbell')),
    ('Agachamento livre', 'compound', (SELECT id FROM equipment WHERE name = 'Olympic barbell')),
    ('Agachamento no Smith', 'compound', (SELECT id FROM equipment WHERE name = 'Smith')),
    ('Agachamento hack', 'compound', (SELECT id FROM equipment WHERE name = 'Machine')),
    ('Leg press', 'compound', (SELECT id FROM equipment WHERE name = 'Machine')),
    ('Cadeira extensora', 'isolated', (SELECT id FROM equipment WHERE name = 'Machine')),
    ('Afundo com halteres', 'compound', (SELECT id FROM equipment WHERE name = 'Dumbbell')),
    ('Agachamento búlgaro', 'compound', (SELECT id FROM equipment WHERE name = 'Dumbbell'));

    -- Posterior de coxa
    ('Levantamento terra convencional', 'compound', (SELECT id FROM equipment WHERE name = 'Barbell')),
    ('Levantamento terra convencional', 'compound', (SELECT id FROM equipment WHERE name = 'Olympic barbell')),
    ('Levantamento terra romeno', 'compound', (SELECT id FROM equipment WHERE name = 'Barbell')),
    ('Levantamento terra romeno', 'compound', (SELECT id FROM equipment WHERE name = 'Olympic barbell')),
    ('Levantamento terra romeno', 'compound', (SELECT id FROM equipment WHERE name = 'Dumbbell')),
    ('Levantamento terra stiff', 'compound', (SELECT id FROM equipment WHERE name = 'Barbell')),
    ('Levantamento terra stiff', 'compound', (SELECT id FROM equipment WHERE name = 'Olympic barbell')),
    ('Levantamento terra stiff', 'compound', (SELECT id FROM equipment WHERE name = 'Dumbbell')),
    ('Mesa flexora', 'isolated', (SELECT id FROM equipment WHERE name = 'Machine')),
    ('Mesa flexora em pé', 'isolated', (SELECT id FROM equipment WHERE name = 'Machine')),
    ('Good morning', 'compound', (SELECT id FROM equipment WHERE name = 'Barbell')),
    ('Good morning', 'compound', (SELECT id FROM equipment WHERE name = 'Olympic barbell'));

    -- Gluteos, adutores e abdutores
    ('Elevação pélvica', 'compound', (SELECT id FROM equipment WHERE name = 'Barbell')),
    ('Elevação pélvica', 'compound', (SELECT id FROM equipment WHERE name = 'Machine')),
    ('Elevação pélvica', 'compound', (SELECT id FROM equipment WHERE name = 'Bodyweight')),
    ('Ponte de glúteo', 'compound', (SELECT id FROM equipment WHERE name = 'Bodyweight')),
    ('Ponte de glúteo', 'compound', (SELECT id FROM equipment WHERE name = 'Machine')),
    ('Cadeira abdutora', 'isolated', (SELECT id FROM equipment WHERE name = 'Machine')),
    ('Cadeira adutora', 'isolated', (SELECT id FROM equipment WHERE name = 'Machine'));

    -- Panturrilha
    ('Panturrilha em pé', 'isolated', (SELECT id FROM equipment WHERE name = 'Machine')),
    ('Panturrilha em pé', 'isolated', (SELECT id FROM equipment WHERE name = 'Smith')),
    ('Panturrilha em pé unilateral', 'isolated', (SELECT id FROM equipment WHERE name = 'Dumbbell')),
    ('Panturrilha em pé unilateral', 'isolated', (SELECT id FROM equipment WHERE name = 'Bodyweight')),
    ('Panturrilha sentado', 'isolated', (SELECT id FROM equipment WHERE name = 'Machine')),
    ('Panturrilha no leg press', 'isolated', (SELECT id FROM equipment WHERE name = 'Machine'));

    -- Core, abs
    ('Abdominal declinado', 'isolated', (SELECT id FROM equipment WHERE name = 'Bodyweight')),
    ('Abdominal na corda', 'isolated', (SELECT id FROM equipment WHERE name = 'Pulley')),
    ('Abdominal suspenso', 'isolated', (SELECT id FROM equipment WHERE name = 'Bodyweight')),
    ('Abdominal com peso', 'isolated', (SELECT id FROM equipment WHERE name = 'Bodyweight')),
    ('Prancha', 'isolated', (SELECT id FROM equipment WHERE name = 'Bodyweight'));

    ('Hiperextensão lombar', 'isolated', (SELECT id FROM equipment WHERE name = 'Machine')),
    ('Hiperextensão lombar', 'isolated', (SELECT id FROM equipment WHERE name = 'Bodyweight')),
    ('Extensão lombar na máquina', 'isolated', (SELECT id FROM equipment WHERE name = 'Machine'));

INSERT INTO mscl_activation (idExercise, idMuscle, "role")
SELECT e.id, m."name", v.role_::muscle_role
FROM (VALUES
    ('Supino reto', 'Peitoral', 'primary'),
    ('Supino reto', 'Deltoide', 'secondary'),
    ('Supino reto', 'Tríceps', 'secondary'),
    ('Supino inclinado', 'Peitoral', 'primary'),
    ('Supino inclinado', 'Deltoide', 'secondary'),
    ('Supino inclinado', 'Tríceps', 'secondary'),
    ('Supino declinado', 'Peitoral', 'primary'),
    ('Supino declinado', 'Deltoide', 'secondary'),
    ('Supino declinado', 'Tríceps', 'secondary'),
    ('Mergulho em paralela', 'Peitoral', 'primary'),
    ('Mergulho em paralela', 'Tríceps', 'primary'),
    ('Mergulho em paralela', 'Deltoide', 'secondary'),
    ('Crossover na polia', 'Peitoral', 'primary'),
    ('Crossover na polia', 'Deltoide', 'secondary'),
    ('Crucifixo', 'Peitoral', 'primary'),
    ('Crucifixo', 'Deltoide', 'secondary'),
    ('Barra fixa', 'Dorsais', 'primary'),
    ('Barra fixa', 'Bíceps', 'secondary'),
    ('Barra fixa', 'Deltoide', 'secondary'),
    ('Pulley frente', 'Dorsais', 'primary'),
    ('Pulley frente', 'Bíceps', 'secondary'),
    ('Pulley frente', 'Deltoide', 'secondary'),
    ('Remada baixa', 'Dorsais', 'primary'),
    ('Remada baixa', 'Romboides', 'primary'),
    ('Remada baixa', 'Bíceps', 'secondary'),
    ('Remada baixa', 'Deltoide', 'secondary'),
    ('Remada curvada', 'Dorsais', 'primary'),
    ('Remada curvada', 'Romboides', 'primary'),
    ('Remada curvada', 'Lombar', 'secondary'),
    ('Remada curvada', 'Bíceps', 'secondary'),
    ('Remada unilateral', 'Dorsais', 'primary'),
    ('Remada unilateral', 'Romboides', 'primary'),
    ('Remada unilateral', 'Bíceps', 'secondary'),
    ('Remada unilateral', 'Deltoide', 'secondary'),
    ('Remada cavalinho', 'Dorsais', 'primary'),
    ('Remada cavalinho', 'Bíceps', 'secondary'),
    ('Remada cavalinho', 'Deltoide', 'secondary'),
    ('Puxada supinada', 'Dorsais', 'primary'),
    ('Puxada supinada', 'Bíceps', 'secondary'),
    ('Face pull', 'Deltoide', 'primary'),
    ('Face pull', 'Trapézio', 'secondary'),
    ('Crucifixo invertido', 'Deltoide', 'primary'),
    ('Crucifixo invertido', 'Trapézio', 'secondary'),
    ('Desenvolvimento militar', 'Deltoide', 'primary'),
    ('Desenvolvimento militar', 'Tríceps', 'secondary'),
    ('Desenvolvimento com halteres', 'Deltoide', 'primary'),
    ('Desenvolvimento com halteres', 'Tríceps', 'secondary'),
    ('Desenvolvimento Arnold', 'Deltoide', 'primary'),
    ('Desenvolvimento Arnold', 'Tríceps', 'secondary'),
    ('Elevação lateral', 'Deltoide', 'primary'),
    ('Elevação frontal', 'Deltoide', 'primary'),
    ('Encolhimento', 'Trapézio', 'primary'),
    ('Rosca direta', 'Bíceps', 'primary'),
    ('Rosca barra W', 'Bíceps', 'primary'),
    ('Rosca alternada com halteres', 'Bíceps', 'primary'),
    ('Rosca martelo', 'Bíceps', 'primary'),
    ('Rosca martelo', 'Antebraço', 'secondary'),
    ('Rosca Scott', 'Bíceps', 'primary'),
    ('Rosca na polia', 'Bíceps', 'primary'),
    ('Rosca concentrada', 'Bíceps', 'primary'),
    ('Tríceps testa', 'Tríceps', 'primary'),
    ('Tríceps francês', 'Tríceps', 'primary'),
    ('Tríceps na polia com barra reta', 'Tríceps', 'primary'),
    ('Tríceps na polia com corda', 'Tríceps', 'primary'),
    ('Tríceps supinado na polia', 'Tríceps', 'primary'),
    ('Agachamento livre', 'Quadríceps', 'primary'),
    ('Agachamento livre', 'Glúteo', 'secondary'),
    ('Agachamento livre', 'Isquiotibiais', 'secondary'),
    ('Agachamento livre', 'Abdômen', 'secondary'),
    ('Agachamento livre', 'Lombar', 'secondary'),
    ('Agachamento no Smith', 'Quadríceps', 'primary'),
    ('Agachamento no Smith', 'Glúteo', 'secondary'),
    ('Agachamento hack', 'Quadríceps', 'primary'),
    ('Agachamento hack', 'Glúteo', 'secondary'),
    ('Leg press', 'Quadríceps', 'primary'),
    ('Leg press', 'Glúteo', 'secondary'),
    ('Leg press', 'Isquiotibiais', 'secondary'),
    ('Cadeira extensora', 'Quadríceps', 'primary'),
    ('Afundo com halteres', 'Quadríceps', 'primary'),
    ('Afundo com halteres', 'Glúteo', 'secondary'),
    ('Agachamento búlgaro', 'Quadríceps', 'primary'),
    ('Agachamento búlgaro', 'Glúteo', 'primary'),
    ('Agachamento búlgaro', 'Abdômen', 'secondary'),
    ('Levantamento terra convencional', 'Isquiotibiais', 'primary'),
    ('Levantamento terra convencional', 'Glúteo', 'primary'),
    ('Levantamento terra convencional', 'Lombar', 'primary'),
    ('Levantamento terra convencional', 'Dorsais', 'secondary'),
    ('Levantamento terra convencional', 'Trapézio', 'secondary'),
    ('Levantamento terra romeno', 'Isquiotibiais', 'primary'),
    ('Levantamento terra romeno', 'Glúteo', 'primary'),
    ('Levantamento terra romeno', 'Lombar', 'secondary'),
    ('Levantamento terra stiff', 'Isquiotibiais', 'primary'),
    ('Levantamento terra stiff', 'Glúteo', 'secondary'),
    ('Levantamento terra stiff', 'Lombar', 'secondary'),
    ('Mesa flexora', 'Isquiotibiais', 'primary'),
    ('Mesa flexora em pé', 'Isquiotibiais', 'primary'),
    ('Good morning', 'Isquiotibiais', 'primary'),
    ('Good morning', 'Lombar', 'primary'),
    ('Elevação pélvica', 'Glúteo', 'primary'),
    ('Elevação pélvica', 'Isquiotibiais', 'secondary'),
    ('Ponte de glúteo', 'Glúteo', 'primary'),
    ('Cadeira abdutora', 'Glúteo', 'primary'),
    ('Cadeira adutora', 'Adutores', 'primary'),
    ('Panturrilha em pé', 'Panturrilha', 'primary'),
    ('Panturrilha em pé unilateral', 'Panturrilha', 'primary'),
    ('Panturrilha sentado', 'Panturrilha', 'primary'),
    ('Panturrilha no leg press', 'Panturrilha', 'primary'),
    ('Abdominal declinado', 'Abdômen', 'primary'),
    ('Abdominal na corda', 'Abdômen', 'primary'),
    ('Abdominal suspenso', 'Abdômen', 'primary'),
    ('Abdominal suspenso', 'Flexores de quadril', 'secondary'),
    ('Abdominal com peso', 'Abdômen', 'primary'),
    ('Prancha', 'Abdômen', 'primary'),
    ('Hiperextensão lombar', 'Lombar', 'primary'),
    ('Extensão lombar na máquina', 'Lombar', 'primary')
) AS v(ex_name, musc_name, role_)
JOIN exercise e ON e."name" = v.ex_name
JOIN muscle m ON m."name" = v.musc_name;
