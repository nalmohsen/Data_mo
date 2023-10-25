-- Created by Vertabelo (http://vertabelo.com)

-- tables
-- Table: Favorites
CREATE TABLE Favorites (
    id int  NOT NULL,
    posting_id int  NOT NULL,
    user_id int  NOT NULL,
    date_fav date  NOT NULL,
    CONSTRAINT Favorites_pk PRIMARY KEY (id)
);

-- Table: Post_images
CREATE TABLE Post_images (
    id int  NOT NULL,
    url text  NOT NULL,
    Posting_id int  NOT NULL,
    CONSTRAINT Post_images_pk PRIMARY KEY (id)
);

-- Table: Posting
CREATE TABLE Posting (
    id int  NOT NULL,
    user_id serial  NOT NULL,
    title text  NOT NULL,
    description text  NOT NULL,
    category text  NOT NULL,
    price int  NOT NULL,
    location text  NOT NULL,
    date_posted timestamp  NOT NULL,
    image_id int  NOT NULL,
    User_user_id int  NOT NULL,
    CONSTRAINT Posting_pk PRIMARY KEY (id)
);

-- Table: User
CREATE TABLE User (
    user_id int  NOT NULL,
    name text  NOT NULL,
    email text  NOT NULL,
    password text  NOT NULL,
    Favorites_id int  NOT NULL,
    personal_posts int  NOT NULL,
    replys_id int  NOT NULL,
    CONSTRAINT User_pk PRIMARY KEY (user_id)
);

-- Table: replys
CREATE TABLE replys (
    id int  NOT NULL,
    posting_id int  NOT NULL,
    user_id int  NOT NULL,
    message text  NOT NULL,
    date_sent datetime  NOT NULL,
    CONSTRAINT replys_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: Favorites_User (table: Favorites)
ALTER TABLE Favorites ADD CONSTRAINT Favorites_User FOREIGN KEY Favorites_User (<EMPTY>)
    REFERENCES User (user_id);

-- Reference: Post_images_Posting (table: Post_images)
ALTER TABLE Post_images ADD CONSTRAINT Post_images_Posting FOREIGN KEY Post_images_Posting (Posting_id)
    REFERENCES Posting (id);

-- Reference: Posting_User (table: Posting)
ALTER TABLE Posting ADD CONSTRAINT Posting_User FOREIGN KEY Posting_User (User_user_id)
    REFERENCES User (user_id);

-- Reference: User_replys (table: User)
ALTER TABLE User ADD CONSTRAINT User_replys FOREIGN KEY User_replys (replys_id)
    REFERENCES replys (id);
