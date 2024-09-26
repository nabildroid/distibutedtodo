# Use the latest Ubuntu image
FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update and install required packages
RUN apt-get update && apt-get install -y \
    sudo \
    vim \
    nano \
    curl \
    net-tools \
    iputils-ping \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*
# Create a new user 'nabil' and add it to the sudo group
RUN useradd -ms /bin/bash nabil && \
    echo 'nabil:nabil' | chpasswd && \
    usermod -aG sudo nabil

# Allow 'nabil' to use sudo without a password
RUN echo 'nabil ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Create a custom entrypoint script to modify /etc/hosts and change directory ownership
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Switch to user 'nabil'
USER nabil
WORKDIR /home/nabil

# Start with the custom entrypoint and bash shell
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

#Run a long-running shell
CMD ["bash", "-c", "tail -f /dev/null"]
