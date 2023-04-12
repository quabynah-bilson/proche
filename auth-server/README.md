# Authentication Server

![Rust](https://img.shields.io/badge/rust-%23000000.svg?style=for-the-badge&logo=rust&logoColor=white)
![MongoDB](https://img.shields.io/badge/MongoDB-%234ea94b.svg?style=for-the-badge&logo=mongodb&logoColor=white)
![gRPC](https://img.shields.io/badge/gRPC-%2300C7B7.svg?style=for-the-badge&logo=grpc&logoColor=white)
![PASETO](https://img.shields.io/badge/PASETO-%23E10098.svg?style=for-the-badge&logo=paragon&logoColor=white)

This is a sample authentication server implemented in Rust using gRPC and MongoDB. The server uses PASETO (
Platform-Agnostic Security Tokens) for token management.

### Features

- User authentication and registration with hashed passwords
- Authentication & Authorization tokens generation and verification with PASETO
- Token revocation (blacklisting)
- Session management

### Technologies

- Rust programming language
- gRPC for communication between client and server
- MongoDB for data storage
- PASETO for token management

### Requirements

- Rust
- Cargo
- MongoDB

### Installation

- Clone the repository: git clone https://github.com/username/rust-authentication-server.git

- Setup your environment variables with file `.env` like this:
    ```.env
    # database config
    DATABASE_URI=mongodb://localhost:27017/proche_dev
    DATABASE_NAME=proche_dev
    ACCOUNT_COLLECTION=accounts
    TOKEN_COLLECTION=tokens
    
    # paseto config
    AUTH_TOKEN=<32-bits paseto_secret_key>
    PUB_AUTH_TOKEN=<32-bits paseto_secret_key>

    # sms config
    TEXT_LOCAL_API_KEY=<your api key>
    ```

- Install the dependencies: cargo build

- Run the server: cargo run

### Configuration

The server reads the configuration from the `.env` file.

- Start the server: cargo run

- Send a gRPC request to the server for authentication or registration. The server exposes the following methods:

#### Authentication

###### Login

```protobuf
rpc login (LoginRequest) returns (google.protobuf.StringValue)
```

This RPC is used to authenticate a user by providing their login credentials. The LoginRequest message contains the
user's email and password. If the credentials are valid, the RPC returns a token as a string value.

###### Register

```protobuf
rpc register (RegisterRequest) returns (google.protobuf.StringValue)
```

This RPC is used to register a new user in the system. The RegisterRequest message contains the user's email, password,
and other necessary information. If the registration is successful, the RPC returns a token as a string value.

###### Reset Password

```protobuf
rpc reset_password (ResetPasswordRequest) returns (google.protobuf.StringValue)
```

This RPC is used to reset a user's password. The ResetPasswordRequest message contains the user's email and a new
password. If the reset is successful, the RPC returns a token as a string value.

###### Logout

```protobuf
rpc logout (google.protobuf.Empty) returns (google.protobuf.Empty)
```

This RPC is used to log out a user from the system. It does not take any parameters and returns an empty message.

##### Authorization

###### Request Public Access Token

```protobuf
rpc request_public_access_token (google.protobuf.Empty) returns (google.protobuf.StringValue)
```

This RPC is used to request a public access token for unauthenticated calls. It does not take any parameters and returns
a token as a string value.

###### Validate Access Token

```protobuf
rpc validate_access_token (google.protobuf.Empty) returns (ValidateAccessTokenResponse)
```

This RPC is used to validate an access token from microservices for authorization. It does not take any parameters and
returns a ValidateAccessTokenResponse message.

##### Account

###### Get Account

```protobuf
rpc get_account (google.protobuf.Empty) returns (Account)
```

This RPC is used to retrieve the current user's account information. It does not take any parameters and returns an
Account message.

###### Get Account by Phone Number

```protobuf
rpc get_account_by_phone_number (google.protobuf.StringValue) returns (Account)
```

This RPC is used to retrieve an account information by providing the account's phone number. It takes a phone number as
a string parameter and returns an Account message.

###### Update Account

```protobuf
rpc update_account (Account) returns (Account)
```

This RPC is used to update the current user's account information. It takes an Account message as a parameter and
returns an updated Account message.

###### Delete Account

```protobuf
rpc delete_account (google.protobuf.Empty) returns (google.protobuf.Empty)
```

This RPC is used to delete the current user's account. It does not take any parameters and returns an empty message.

##### Phone Verification

###### Send Phone Verification Code

```protobuf
rpc send_phone_verification_code (google.protobuf.StringValue) returns (google.protobuf.Empty)
```

This RPC is used to send a phone verification code to a user's phone number. It takes a phone number as a string
parameter and returns an empty message.

###### Verify Phone Verification Code

```protobuf
rpc verify_phone_verification_code (VerifyPhoneRequest) returns (google.protobuf.Empty)
```

This RPC is used to verify a phone verification code provided by the user. The VerifyPhoneRequest message contains the
user's phone number and the verification code. If the verification is successful, the RPC returns an empty message.

##### Referral Code

###### Get Referral Code

```protobuf
rpc get_referral_code (google.protobuf.Empty) returns (google.protobuf.StringValue)
```

This RPC is used to retrieve the current user's referral code. It does not take any parameters and returns a referral
code as a string value.

###### Get Referral Code by Phone Number

```protobuf
rpc get_referral_code_by_phone_number (google.protobuf.StringValue) returns (google.protobuf.StringValue)
```

This RPC is used to retrieve a referral code by providing the account's phone number. It takes a phone number as a
string parameter and returns a referral code as a string value.

### Contributing

- Fork the repository

- Create a new branch: git checkout -b new-feature

- Make your changes and commit them: git commit -am 'Add new feature'

- Push the changes to your branch: git push origin new-feature

- Submit a pull request

### License

This project is licensed under the MIT License. See the LICENSE file for details.