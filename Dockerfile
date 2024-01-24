FROM node:18-bookworm AS devcontainer
RUN apt-get update && apt-get install -yq netcat-traditional jq yq
RUN curl -fsSL https://bun.sh/install | bash
ENV PATH=/root/.bun/bin/:$PATH
WORKDIR /app
