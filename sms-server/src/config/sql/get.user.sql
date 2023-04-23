-- create a procedure to get a user by phone number
CREATE OR REPLACE FUNCTION get_user_by_phone_number(user_phone_number VARCHAR(255))
    RETURNS TABLE(id INTEGER, created_at TIMESTAMP, phone_number VARCHAR(255)) AS $$
BEGIN
    RETURN QUERY SELECT * FROM sms_verification WHERE phone_number = user_phone_number;
END;
$$ LANGUAGE plpgsql;