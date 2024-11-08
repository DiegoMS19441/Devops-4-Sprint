DROP TABLE USERS_ROLES CASCADE CONSTRAINTS;
DROP TABLE USUARIO CASCADE CONSTRAINTS;
DROP TABLE ROLE CASCADE CONSTRAINTS;


CREATE TABLE ROLE (
    role_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    role_name VARCHAR2(255) NOT NULL UNIQUE,
    label VARCHAR2(255) NOT NULL
);

CREATE TABLE USUARIO (
    user_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    username VARCHAR2(255) NOT NULL UNIQUE,
    password VARCHAR2(255) NOT NULL
);

CREATE TABLE USERS_ROLES (
    user_id NUMBER NOT NULL,
    role_id NUMBER NOT NULL,
    CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES USUARIO(user_id) ON DELETE CASCADE,
    CONSTRAINT fk_role_id FOREIGN KEY (role_id) REFERENCES ROLE(role_id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, role_id)
);
