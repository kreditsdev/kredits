set -ex && mkdir -p build/release/bin
set -ex && docker create --name kredits-daemon-container kredits-daemon-image
set -ex && docker cp kredits-daemon-container:/usr/local/bin/ build/release/
set -ex && docker rm kredits-daemon-container
