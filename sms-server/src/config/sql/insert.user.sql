-- create a procedure to insert a new user
CREATE OR REPLACE FUNCTION insert_user(user_phone_number VARCHAR(255))
    RETURNS VOID AS $$
BEGIN
    INSERT INTO sms_verification (phone_number) VALUES (user_phone_number);
END;
$$ LANGUAGE plpgsql;