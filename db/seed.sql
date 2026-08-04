-- zera tudo toda vez q eu for rodar o seed.sql. util pra ir testando nesse começo
TRUNCATE TABLE usr, exercise, muscle, mscl_activation, routine, workout,
    routine_workout, plan, session, execution, training_set
    RESTART IDENTITY CASCADE;

CREATE EXTENSION IF NOT EXISTS pgcrypto;

INSERT INTO usr (email, nome, senha) VALUES
    ('admin@gmail.com', 'Admin', crypt('admin123', gen_salt('bf'))),
    ('lucascaczmareki@gmail.com', 'Lucas Caczmareki', crypt ('lucas123', gen_salt('bf'))),
    ('joao@gmail.com', 'Joao Godinho', crypt ('joao123', gen_salt('bf')));
    
INSERT INTO exercise("name", equip, base_weight, "type") VALUES
    ('supino reto', )