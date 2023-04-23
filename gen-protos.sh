# shellcheck disable=SC2046
# define the path to the core-server directory
CORE_SERVER_DIR=core-server
CORE_PROTO_PATH=$CORE_SERVER_DIR/protos

# define the path to the auth-server directory
AUTH_SERVER_DIR=auth-server
AUTH_PROTO_PATH=$AUTH_SERVER_DIR/proto

# define the path to the media-server directory
MEDIA_SERVER_DIR=media-server
MEDIA_PROTO_PATH=$MEDIA_SERVER_DIR/proto

# define the path to the shared-server directory
SHARED_SERVER_DIR=shared-server
SHARED_PROTO_PATH=$SHARED_SERVER_DIR/proto

# define the path to the payment-server directory
PAYMENT_SERVER_DIR=payment-server
PAYMENT_PROTO_PATH=$PAYMENT_SERVER_DIR/proto

# define the path to the sms-server directory
SMS_SERVER_DIR=sms-server
SMS_PROTO_PATH=$SMS_SERVER_DIR/proto

# define the path to the notification-server directory
NOTIFICATION_SERVER_DIR=notification-server
NOTIFICATION_PROTO_PATH=$NOTIFICATION_SERVER_DIR/proto

# define the path to the mobile directory
MOBILE_DIR=mobile
MOBILE_OUT_DIR=$MOBILE_DIR/lib/generated/protos

mkdir -p "$MOBILE_DIR/lib/generated/protos"
mkdir -p "$CORE_SERVER_DIR/gen"
mkdir -p "$MEDIA_SERVER_DIR/gen"
mkdir -p "$PAYMENT_SERVER_DIR/gen"
mkdir -p "$SHARED_SERVER_DIR/gen"
mkdir -p "$NOTIFICATION_SERVER_DIR/gen"

# generate for core-server using golang
protoc -I=$CORE_PROTO_PATH -I=$AUTH_PROTO_PATH -I=$MEDIA_PROTO_PATH --go_out=$CORE_SERVER_DIR/gen --go_opt=paths=source_relative \
  --go-grpc_out=$CORE_SERVER_DIR/gen --go-grpc_opt=paths=source_relative \
  $(find $CORE_PROTO_PATH -iname "*.proto") $(find $AUTH_PROTO_PATH -iname "*.proto") $(find $MEDIA_PROTO_PATH -iname "*.proto")

# generate for media-server using golang
protoc -I=$MEDIA_PROTO_PATH --go_out=$MEDIA_SERVER_DIR/gen --go_opt=paths=source_relative \
  --go-grpc_out=$MEDIA_SERVER_DIR/gen --go-grpc_opt=paths=source_relative \
  $(find $MEDIA_PROTO_PATH -iname "*.proto")

# generate for shared-server using golang
protoc -I=$SHARED_PROTO_PATH --go_out=$SHARED_SERVER_DIR/gen --go_opt=paths=source_relative \
  --go-grpc_out=$SHARED_SERVER_DIR/gen --go-grpc_opt=paths=source_relative \
  $(find $SHARED_PROTO_PATH -iname "*.proto")

# generate for shared-server using golang
protoc -I=$NOTIFICATION_PROTO_PATH --go_out=$NOTIFICATION_SERVER_DIR/gen --go_opt=paths=source_relative \
  --go-grpc_out=$NOTIFICATION_SERVER_DIR/gen --go-grpc_opt=paths=source_relative \
  $(find $NOTIFICATION_PROTO_PATH -iname "*.proto")

# copy the proto file from media-server to auth-server
#rm -f $AUTH_PROTO_PATH/media.proto
#cp $MEDIA_PROTO_PATH/media.proto $AUTH_PROTO_PATH/media.proto

# generate for auth-server using rust
#cargo build --manifest-path $AUTH_SERVER_DIR/Cargo.toml

# generate for sms-server using rust
#cargo build --manifest-path $SMS_SERVER_DIR/Cargo.toml

# generate for flutter using dart
#protoc -I=$AUTH_PROTO_PATH -I=$SHARED_PROTO_PATH -I=$CORE_PROTO_PATH -I=$SMS_PROTO_PATH -I=$NOTIFICATION_PROTO_PATH \
#  --dart_out=grpc:$MOBILE_OUT_DIR \
#  auth.proto
#  $(find $AUTH_PROTO_PATH -iname "*.proto") $(find $SHARED_PROTO_PATH -iname "*.proto") $(find $CORE_PROTO_PATH -iname "*.proto") $(find $NOTIFICATION_PROTO_PATH -iname "*.proto")
