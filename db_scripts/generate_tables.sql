
--DROP SCHEMA messenger CASCADE

CREATE SCHEMA messenger;


CREATE TABLE  messenger.user (
    user_id text PRIMARY KEY,
    first_name text,
    last_name text, 
    email text,
    last_update timestamp,
    insert_date timestamp
);


CREATE TABLE  messenger.image (
    image_id SERIAL PRIMARY KEY,
    content real,
    user_id text NOT NULL REFERENCES messenger.user (user_id), 
    last_update timestamp, 
    insert_date timestamp 
);

CREATE TABLE messenger.user_contacts (
    user_id text NOT NULL REFERENCES messenger.user (user_id), 
    contact_id text NOT NULL REFERENCES messenger.user (user_id), 
    last_update timestamp,
    insert_time timestamp,
    PRIMARY KEY (contact_id, user_id)
);



CREATE TABLE messenger.online_status_code (
    code_id SERIAL PRIMARY KEY,
    code text NOT NULL,
    fqname text NOT NULL, 
    last_update timestamp,
    insert_time timestamp
);

CREATE TABLE messenger.user_status (
    status_id SERIAL PRIMARY KEY,
    user_id text NOT NULL REFERENCES messenger.user (user_id), 
    status_code_id int NOT NULL REFERENCES messenger.online_status_code (code_id), 
    last_update timestamp,
    insert_time timestamp
);


CREATE TABLE  messenger.auth (
    auth_id SERIAL PRIMARY KEY,
    username text,
    pass_key text, 
    user_id text NOT NULL REFERENCES messenger.user (user_id)
);



CREATE TABLE  messenger.user_message (
    message_id SERIAL PRIMARY KEY,
    last_update timestamp,
    insert_time timestamp,
    content text, 
    sender_id text NOT NULL REFERENCES messenger.user (user_id),
    receiver_id text NOT NULL REFERENCES messenger.user (user_id), 
    recieved_time timestamp
);



CREATE TABLE messenger.notification_code (
    code_id SERIAL PRIMARY KEY,
    code text NOT NULL,
    fqname text NOT NULL, 
    last_update timestamp,
    insert_time timestamp
);

CREATE TABLE  messenger.notification (
    notification_id SERIAL PRIMARY KEY,
    last_update timestamp,
    insert_time timestamp,
    receiver_id text NOT NULL REFERENCES messenger.user (user_id), 
    trigger_id text,
    notification_cd_id int NOT NULL REFERENCES messenger.notification_code (code_id),
    type_code_id text, 
    content text
);





CREATE TABLE  messenger.group (
    group_id text PRIMARY KEY,
    group_name timestamp,
    insert_date timestamp,
    last_update timestamp
);


CREATE TABLE  messenger.group_member (
    group_id int,
    member_id text NOT NULL REFERENCES messenger.user (user_id),
    is_admin boolean, 
    insert_date timestamp,
    last_update timestamp
);


CREATE TABLE  messenger.grp_message (
    message_id SERIAL PRIMARY KEY,
    last_update timestamp,
    insert_time timestamp,
    content text, 
    sender_id text NOT NULL REFERENCES messenger.user (user_id),
    receiver_id text NOT NULL REFERENCES messenger.group (group_id)
);