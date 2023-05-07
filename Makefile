# generate protos for core-server golang microservice
generate-proto:
	chmod +x ./gen-protos.sh && \
	./gen-protos.sh

# add packages for mobile
add-packages-for-mobile:
	cd mobile && \
	flutter pub add grpc protobuf protobuf_google google_maps_flutter intl injectable get_it bloc flutter_bloc modal_bottom_sheet pinput dartz lottie google_fonts device_info_plus flutter_secure_storage && \
	flutter pub add --dev build_runner injectable_generator injectable_generator flutter_launcher_icons flutter_native_splash mocktail && \
	flutter pub upgrade --major-versions

# download avatars for mobile
generate-avatars-for-mobile:
	chmod +x ./dl-avatars-for-mobile.sh && \
	./dl-avatars-for-mobile.sh

# generate splash screen + launcher icons for mobile
generate-splash-screen-and-launcher-icons:
	cd mobile && \
	flutter pub run flutter_launcher_icons:main && \
	flutter pub run flutter_native_splash:create

generate-language-auth:
	cd auth-server && cargo install rust-i18n && cargo i18n

generate-language-mobile:
	cd mobile && flutter gen-l10n

gen-signing-key-for-android:
	keytool -genkey -v -keystore mobile/android/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload

gen-docker-images:
	docker build -t quabynah1809/proche-auth-server:latest -f ./auth-server/Dockerfile ./auth-server
	docker build -t quabynah1809/proche-sms-server:latest -f ./sms-server/Dockerfile ./sms-server
	docker build -t quabynah1809/proche-core-server:latest -f ./core-server/Dockerfile ./core-server
	docker build -t quabynah1809/proche-notification-server:latest -f ./notification-server/Dockerfile ./notification-server
	docker build -t quabynah1809/proche-media-server:latest -f ./media-server/Dockerfile ./media-server
	docker build -t quabynah1809/proche-shared-server:latest -f ./shared-server/Dockerfile ./shared-server

start-servers:
	docker-compose up

stop-servers:
	docker-compose down
