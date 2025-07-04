FROM alpine:latest

# Install ca-certificates for HTTPS
RUN apk --no-cache add ca-certificates
WORKDIR /root/

# Download and install PocketBase
ADD https://github.com/pocketbase/pocketbase/releases/download/v0.28.4/pocketbase_0.28.4_linux_amd64.zip ./pb.zip
RUN unzip pb.zip && rm pb.zip

# Expose port
EXPOSE 8080

# Start PocketBase with fresh database
CMD ["sh", "-c", "rm -f pb_data/data.db && ./pocketbase serve --http=0.0.0.0:8080"]
