-- create a procedure to check if the user created_at is older than 10 minutes
CREATE OR REPLACE FUNCTION is_user_created_at_older_than_10_minutes(user_phone_number VARCHAR(255))
    RETURNS BOOLEAN AS $$
DECLARE
    user_created_at TIMESTAMP;
BEGIN
    SELECT created_at INTO user_created_at FROM sms_verification WHERE phone_number = user_phone_number;
    RETURN user_created_at < NOW() - INTERVAL '10 minutes';
END;
$$ LANGUAGE plpgsql;