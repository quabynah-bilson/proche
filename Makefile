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