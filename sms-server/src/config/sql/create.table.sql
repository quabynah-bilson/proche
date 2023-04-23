-- create sms_verification table with props: id, created_at, phone_number
CREATE TABLE IF NOT EXISTS sms_verification (
                                  id SERIAL PRIMARY KEY,
                                  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
                                  phone_number VARCHAR(255) NOT NULL
);