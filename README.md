# Proche 🧭🗺️: gRPC Microservices with MongoDB and Flutter
###### (means Nearby in French)

[//]: # ([![Coverage Status]&#40;https://coveralls.io/repos/github/quabynah-bilson/proche/badge.svg?branch=master&#41;]&#40;https://coveralls.io/github/quabynah-bilson/proche?branch=dev&#41;)

[//]: # ([![Go Report Card]&#40;https://goreportcard.com/badge/github.com/quabynah-bilson/proche&#41;]&#40;https://goreportcard.com/report/github.com/quabynah-bilson/proche&#41;)
[![GoDoc](https://godoc.org/github.com/quabynah-bilson/proche?status.svg)](https://godoc.org/github.com/quabynah-bilson/proche)
[![Rust](https://img.shields.io/badge/rust-%23000000.svg?style=for-the-badge&logo=rust&logoColor=white)](https://github.com/quabynah-bilson/proche)
[![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)](https://github.com/quabynah-bilson/proche)
[![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)](https://github.com/quabynah-bilson/proche)

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/quabynah-bilson/proche/master/LICENSE)

[![GitHub stars](https://img.shields.io/github/stars/quabynah-bilson/proche.svg?style=social&label=Star)](https://github.com/quabynah-bilson/proche/stargazers)
[![GitHub issues](https://img.shields.io/github/issues/quabynah-bilson/proche.svg)](https://github.com/quabynah-bilson/proche/issues)

[![GitHub pull requests](https://img.shields.io/github/issues-pr/quabynah-bilson/proche.svg)](https://github.com/quabynah-bilson/proche/pulls)
[![GitHub pull requests closed](https://img.shields.io/github/issues-pr-closed/quabynah-bilson/proche.svg)](https://github.com/quabynah-bilson/proche/pulls)

[![GitHub contributors](https://img.shields.io/github/contributors/quabynah-bilson/proche.svg)](https://github.com/quabynah-bilson/proche/settings/access?query=filter%3Acollaborators)
[![GitHub last commit](https://img.shields.io/github/last-commit/quabynah-bilson/proche.svg)](https://github.com/quabynah-bilson/proche/commits/dev)

[![GitHub repo size in bytes](https://img.shields.io/github/repo-size/quabynah-bilson/proche.svg)](https://github.com/quabynah-bilson/proche)
[![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/quabynah-bilson/proche.svg)](https://github.com/quabynah-bilson/proche)

[![GitHub language count](https://img.shields.io/github/languages/count/quabynah-bilson/proche.svg)](https://github.com/quabynah-bilson/proche)
[![GitHub top language](https://img.shields.io/github/languages/top/quabynah-bilson/proche.svg)](https://github.com/quabynah-bilson/proche)

This project is an example of a GRPC-based microservices architecture that utilizes MongoDB as its database and is
integrated with a Flutter mobile application.

### Overview

The project is composed of the following components:

#### Core Microservice: (::2000)
This microservice serves as the backbone of the application and contains the business logic of the
system. It provides CRUD (Create, Read, Update, Delete) operations on data related to the system's core entities.

#### Shared Microservice: (::1900)

This microservice contains common functionalities that are shared across different modules of the
system. It includes functionalities such as file uploads, email notifications, and authentication.

#### Auth Microservice: (::1800)

This microservice is responsible for handling user authentication and authorization.

#### Mobile Application:

This is a Flutter-based mobile application that interacts with the microservices to perform various
operations such as viewing data, creating new entities, and updating existing ones.

### Architecture

The following diagram shows the high-level architecture of the system:

#### Architecture Diagram

The three microservices are independent of each other and communicate using the gRPC protocol. The mobile application
communicates with the microservices using the same protocol.

All three microservices are integrated with MongoDB as their database. MongoDB is a NoSQL document-based database that
provides high performance and scalability.

### Installation and Setup

- Install the latest version of MongoDB.
- Clone the project repository.
- Install the dependencies for each microservice and the mobile application.
- Run the MongoDB instance.
- Start the microservices in the following order: Auth Microservice, Shared Microservice, and Core Microservice.
- Start the mobile application.

### Usage

- Use the mobile application to interact with the system.

- Use a gRPC client such as grpcurl or bloomrpc to directly interact with the microservices.

### Conclusion

This project provides an example of how to build a scalable and modular microservices architecture using GRPC and
MongoDB. It also demonstrates how to integrate a Flutter mobile application with the microservices to provide a seamless
user experience.

[//]: # (https://medium.com/javarevisited/10-microservices-design-principles-every-developer-should-know-44f2f69e960f)
[//]: # (https://github.com/Ileriayo/markdown-badges#markdown-badges)
