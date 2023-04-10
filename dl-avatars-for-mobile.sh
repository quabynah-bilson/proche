mkdir -p mobile/assets/img/avatars
cd mobile/assets/img/avatars || exit

# download the avatars
dicebear lorelei . --format png --count 20 --width 200 --height 200 --background "#ffffff" --radius 50 --margin 10 --outDir .

# shellcheck disable=SC2001
# rename the files
for file in *; do mv "$file" "$(echo "$file" | sed 's/-/_/g')"; done
