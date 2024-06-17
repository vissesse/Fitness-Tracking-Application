-- Active: 1717946364522@@127.0.0.1@5432@app
CREATE SCHEMA fitness_tracking;
drop Table fitness_tracking.users;
drop Table fitness_tracking.activities;
drop Table fitness_tracking.Workout;
drop Table fitness_tracking.goals;
drop Table fitness_tracking.activities_goals;
CREATE TABLE fitness_tracking.users (
    user_id uuid PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE fitness_tracking.activities (
    activity_id uuid PRIMARY KEY,
    type VARCHAR(50) NOT NULL,
    -- Tipo de atividade (corrida, musculação, natação, etc.)
    description TEXT,
    -- Descrição detalhada da atividade
    calories_per_unit DECIMAL(10, 2) -- Calorias queimadas por unidade (por exemplo, por km percorrido) 
);
CREATE TABLE fitness_tracking.weightlifting_exercises (
    weightlif_id uuid PRIMARY KEY,
    activity_id uuid,
    name VARCHAR(100) NOT NULL,
    -- Nome do exercício de musculação
    sets INT NOT NULL,
    -- Número de séries
    repetitions INT NOT NULL,
    -- Número de repetições por série
    weight DECIMAL(10, 2) NOT NULL,
    -- Peso utilizado (em quilos, por exemplo)
    date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Data e hora do registro do exercício
    user_id INT REFERENCES users(id),
    -- ID do usuário que realizou o exercício
    FOREIGN KEY (activity_id) REFERENCES fitness_tracking.activities(activity_id)
);
CREATE TABLE fitness_tracking.Workout (
    workout_id uuid PRIMARY KEY,
    activity_id UUID NOT NULL,
    user_id UUID NOT NULL,
    date TIMESTAMP NOT NULL,
    -- Data e hora do treino
    duration INT NOT NULL,
    -- Duração do treino em minutos
    distance DECIMAL(10, 2) null,
    -- Distância percorrida (opcional)
    calories DECIMAL(10, 2),
    -- Calorias queimadas durante o treino
    pace  VARCHAR(255),
    location VARCHAR(255),
    -- Localização onde o treino foi realizado (opcional)
    FOREIGN key (user_id) REFERENCES fitness_tracking.users(user_id) ON DELETE CASCADE,
    -- ID do usuário que realizou o treino
    FOREIGN KEY (activity_id) REFERENCES fitness_tracking.activities(activity_id) ON DELETE CASCADE
);
CREATE TABLE fitness_tracking.goals (
    goal_id uuid PRIMARY KEY,
    user_id UUID NOT NULL,
    description TEXT NOT NULL,
    target NUMERIC,
    type VARCHAR(100) NOT NULL,
    send_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES fitness_tracking.users(user_id)
);
CREATE TABLE fitness_tracking.activities_goals(
    activity_goals_id uuid PRIMARY KEY,
    goal_id UUID NOT NULL,
    activity_id UUID NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (activity_id) REFERENCES fitness_tracking.activities(activity_id),
    FOREIGN KEY (goal_id) REFERENCES fitness_tracking.goals(goal_id)
);
INSERT INTO fitness_tracking.users (user_id, name, email, password)
VALUES (
        'aa354842-59bf-42e6-be3a-6188dbb5fff8',
        'John Doe',
        'john.doe@example.com',
        'password123'
    ),
    (
        'd5f5c6cb-bf69-4743-a288-dafed2517e38',
        'Jane Smith',
        'jane.smith@example.com',
        'password456'
    );
--- create activity
INSERT INTO fitness_tracking.activities (
        activity_id,
        created_by,
        type,
        duraction,
        distance,
        calories_burned,
        localization
    )
VALUES (
        'ab354842-59bf-42e6-be3a-6188dbb5fff8',
        'aa354842-59bf-42e6-be3a-6188dbb5fff8',
        'cardio',
        30,
        1000,
        189,
        'Luanda, principal road'
    );
SELECT u.name as userName,
    m.*
FROM fitness_tracking.messages m
    inner join fitness_tracking.users u on u.user_id = m.user_id
WHERE message_id = '707b322d-df74-4874-b710-796d93629a50';
select uuid();