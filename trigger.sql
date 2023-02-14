DROP TABLE IF EXISTS mentors;
CREATE TABLE mentors(
                        id INT GENERATED ALWAYS AS IDENTITY,
                        first_name varchar(40) not null,
                        last_name varchar(40) not null ,
                        primary key(id)
);

DROP TABLE IF EXISTS mentor_audit;
CREATE TABLE mentor_audit(
                             id INT GENERATED ALWAYS AS IDENTITY,
                             mentor_id INT not null,
                             last_name varchar(40) not null ,
                             changed_on timestamp(6) not null,
                             primary key(id)
);


insert into mentors(first_name, last_name) values ('Harold','Finch');
insert into mentors(first_name, last_name) values ('Severus','Snape');

CREATE OR REPLACE FUNCTION log_last_name_changes()
returns trigger
language plpgsql
as
    $$
    begin
        IF NEW.last_name <> OLD.last_name THEN
            INSERT INTO mentor_audit(mentor_id,last_name,changed_on) VALUES
            (OLD.id,OLD.last_name,now());
        end if;

        Return NEW;
    end
    $$;

CREATE TRIGGER last_name_change
    BEFORE update
    ON mentors
    FOR EACH ROW
    EXECUTE PROCEDURE log_last_name_changes();

update mentors
set last_name ='XYZ'
where id =2;
