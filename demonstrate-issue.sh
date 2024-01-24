#!/usr/bin/env bash
docker compose down
docker compose build
clear

echo
echo 'I will demonstrate the different handling of SIGKILL when using the `bun run` script wrapper'
echo
echo 'First, I will start the docker container with the underlying dev server: the Dockerfiles default command is `next dev`'
echo
echo 'Then I will kill that docker container, and it will take <1 seconds to exit. SIGKILL is immediately recieved.'
echo
echo 'Next, I will start the docker container with the default command - using a `bun run` script (bun run dev) to alias our `next dev` command...'
echo
echo 'Then I will kill that docker container, and it will take 10 seconds to exit. SIGKILL is apparently not bubbled to the child process.'

set +x

docker compose up -d demo-no-alias
sleep 2
docker compose down

docker compose up -d demo-with-alias
sleep 2
docker compose down

