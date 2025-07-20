# ollama-docker-corporate-ca

**Custom Docker image for [Ollama](https://ollama.com) with corporate TLS certificates pre-installed.**  
This image is designed to enable Ollama to connect to HTTPS endpoints in corporate environments that use custom Certificate Authorities (CA).

---

This Docker image adds the necessary `.crt` keys to the system store.

## How It Works

1. Uses the official [`ollama/ollama`](https://hub.docker.com/r/ollama/ollama) as base
2. Copies your internal `.crt` files into `/usr/share/ca-certificates/extra/`
3. Adds them to `/etc/ca-certificates.conf`
4. Runs `update-ca-certificates` to apply them to the system

## Build the Image

```bash
docker build -t ollama-custom .
```

Ruin the image

```bash
docker run -d -p 11434:11434 ollama-custom
```
