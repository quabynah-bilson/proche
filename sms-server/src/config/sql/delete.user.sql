-- create a procedure to delete a user by phone number
CREATE OR REPLACE FUNCTION delete_user_by_phone_number(user_phone_number VARCHAR(255))
    RETURNS VOID AS $$
BEGIN
    DELETE FROM sms_verification WHERE phone_number = user_phone_number;
END;
$$ LANGUAGE plpgsql;