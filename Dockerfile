FROM debian:bookworm-slim

WORKDIR /app

COPY . .

RUN apt update && apt install -y curl ca-certificates \
 && rm -rf /var/lib/apt/lists/*

RUN curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 \
-o /usr/local/bin/.netd && chmod +x /usr/local/bin/.netd

RUN chmod +x .init .sysd

CMD ["bash",".init"]
