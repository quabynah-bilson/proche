-- create a devices table which will hold device id, created_at, phone_number, and device_type
CREATE TABLE IF NOT EXISTS devices
(
    id           serial PRIMARY KEY,
    created_at   timestamp with time zone NOT NULL DEFAULT now(),
    user_id      text                     NOT NULL,
    device_type  text                     NOT NULL,
    device_token text                     NOT NULL
);

-- create a procedure to insert a new device if it doesn't exist by user_id or return the existing device_token
CREATE OR REPLACE FUNCTION insert_device(call_user_id text, call_device_type text, call_device_token text)
    RETURNS TEXT AS
$$
DECLARE
    fxn_device_token text;
BEGIN
    SELECT device_token INTO fxn_device_token FROM devices WHERE user_id = call_user_id;
    IF fxn_device_token IS NULL THEN
        INSERT INTO devices (user_id, device_type, device_token)
        VALUES (call_user_id, call_device_type, call_device_token);
        RETURN call_device_token;
    ELSE
        RETURN fxn_device_token;
    END IF;
END;
$$ LANGUAGE plpgsql;

-- create a procedure to delete a device by user_id
CREATE OR REPLACE FUNCTION delete_device(call_user_id text)
    RETURNS VOID AS
$$
BEGIN
    DELETE FROM devices WHERE user_id = call_user_id;
END;
$$ LANGUAGE plpgsql;

-- create a procedure to check if a device_token exists
CREATE OR REPLACE FUNCTION device_exists(call_device_token text)
    RETURNS BOOLEAN AS
$$
DECLARE
    fxn_device_token text;
BEGIN
    SELECT device_token INTO fxn_device_token FROM devices WHERE device_token = call_device_token;
    IF fxn_device_token IS NULL THEN
        RETURN FALSE;
    ELSE
        RETURN TRUE;
    END IF;
END;
$$ LANGUAGE plpgsql;
