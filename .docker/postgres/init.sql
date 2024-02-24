CREATE TABLE todo (
    id SERIAL PRIMARY KEY,
    titre VARCHAR(255) NOT NULL,
    done BOOLEAN NOT NULL
);

INSERT INTO todo (titre, done) VALUES ('Faire les courses', false);
INSERT INTO todo (titre, done) VALUES ('Répondre aux emails', false);
INSERT INTO todo (titre, done) VALUES ('Terminer le projet', true);
INSERT INTO todo (titre, done) VALUES ('Préparer la réunion', false);
INSERT INTO todo (titre, done) VALUES ('Exercice physique', false);
INSERT INTO todo (titre, done) VALUES ('Lire un livre', false);
INSERT INTO todo (titre, done) VALUES ('Apprendre une nouvelle compétence', false);
INSERT INTO todo (titre, done) VALUES ('Planifier les vacances', false);
INSERT INTO todo (titre, done) VALUES ('Réviser le code', false);
INSERT INTO todo (titre, done) VALUES ('Réparer le téléphone', false);
