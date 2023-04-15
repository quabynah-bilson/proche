# Media Server

[![GoDoc](https://godoc.org/github.com/quabynah-bilson/proche?status.svg)](https://godoc.org/github.com/quabynah-bilson/proche)

Media Server is a gRPC microservice built using Rust programming language and Cloudinary API for uploading media files.
It allows the user to upload media files of type image or video and returns a URL to access the uploaded file.

## Installation

- Clone the repository and change the directory to the cloned repository
   ```terminal
   git clone https://github.com/quabynah-bilson/proche.git
   cd media-server
   ```

- Install Rust and Cargo
   ```terminal
    curl https://sh.rustup.rs -sSf | sh
    cargo install
    ```

- Create a `.env` file in the root directory and add your Cloudinary API credentials as follows:
    ```terminal
     CLOUDINARY_CLOUD_NAME=your_cloud_name
     CLOUDINARY_API_KEY=your_api_key
     CLOUDINARY_API_SECRET=your_api_secret
     ```

### Usage

- Run the server using the following command:
    ```terminal
    cargo run
    ```

- Use the mobile application to upload media files and get the URL for the uploaded file. The client application can be
  implemented in any programming language that supports gRPC.
- Use a gRPC client such as grpcurl or bloomrpc to directly interact with the microservice.

### API

The gRPC API provided by the media server consists of the following methods:

```protobuf
service MediaService {
  // upload media takes a base64 encoded string and returns a media url
  rpc upload_media (UploadMediaRequest) returns (google.protobuf.StringValue);

  // get media takes a media url and returns a base64 encoded string
  rpc get_media (google.protobuf.StringValue) returns (google.protobuf.StringValue);

  // delete media takes a media url and deletes the media
  rpc delete_media (google.protobuf.StringValue) returns (google.protobuf.Empty);

}
```

## Contributing

Contributions are always welcome. If you have any suggestions, bug reports or feature requests, please create an issue
on the repository.

## License

Media Server is open-sourced software licensed under the [MIT](https://choosealicense.com/licenses/mit/) license.