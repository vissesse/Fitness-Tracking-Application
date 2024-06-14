-- Active: 1717946364522@@127.0.0.1@5432@appchat


CREATE TABLE users (
    user_id uuid PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE conversations (
    conversation_id uuid PRIMARY KEY,
    created_by UUID NOT NULL,
    name VARCHAR(100), -- Used for group 
    type VARCHAR(10) NOT NULL CHECK (type IN ('individual', 'group')),
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    FOREIGN KEY (created_by) REFERENCES users(created_by)
);

CREATE TABLE participants (
    participant_id uuid PRIMARY KEY,
    conversation_id UUID NOT NULL,
    user_id UUID NOT NULL,
    join_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (conversation_id) REFERENCES conversations(conversation_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE messages (
    message_id uuid PRIMARY KEY,
    conversation_id UUID NOT NULL,
    user_id UUID NOT NULL,
    content TEXT NOT NULL,
    status VARCHAR(10) NOT NULL CHECK (status IN ('sent', 'delivered', 'read')),
    send_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT null,
    FOREIGN KEY (conversation_id) REFERENCES conversations(conversation_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
 

INSERT INTO users (user_id, name, email, password) VALUES
('aa354842-59bf-42e6-be3a-6188dbb5fff8','John Doe', 'john.doe@example.com', 'password123'),
('d5f5c6cb-bf69-4743-a288-dafed2517e38', 'Jane Smith', 'jane.smith@example.com', 'password456');

SELECT u.name as userName, m.* FROM 
messages m 
inner join users u on u.user_id=m.user_id  
WHERE message_id = '707b322d-df74-4874-b710-796d93629a50';