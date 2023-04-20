# Proche - Changelog

## [Unreleased]

- Added a new microservice for authentication and authorization
- Added a new microservice for shared functionalities
- Added a new microservice for core functionalities
- Added a new Flutter-based mobile application for interacting with the system
- Added a new README.md file
- Added a new CHANGELOG.md file
- Added localization support for the auth microservice in French and English using `rust-i18n` & `once_cell`
- Added authentication and authorization support for the auth microservice using `paseto` & `bcrypt`
- Added session management with `paseto` tokens for the auth microservice
- Added Twilio verification support for the auth microservice (OTP verification)
- Added support for multinational accounts for the auth microservice
- Added Google Maps to mobile app
- Added interceptor for core server to authenticate requests coming in from clients
- Added shared server to handle shared functionalities between microservices
- Added geolocation & geocoder support for mobile app