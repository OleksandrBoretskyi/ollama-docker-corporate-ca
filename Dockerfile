FROM ollama/ollama

LABEL maintainer="Oleksandr Boretskyi"
LABEL description="Custom ollama image example with CA for corporate TLS"

# Copy certificates and update system trust
COPY certs/. /usr/share/ca-certificates/extra
RUN echo "extra/local-root-ca.crt" >> /etc/ca-certificates.conf && \
    chmod 644 /usr/share/ca-certificates/extra/*.crt && \
    update-ca-certificates --fresh
EXPOSE 11434
