#!/bin/bash


# Ensure the 'nabil' user has ownership of the mounted directory
sudo chmod -R ugo+w /home/nabil/dev



# Modify /etc/hosts to add 'lab' hostname resolution
echo "127.0.1.1 lab" | sudo tee -a /etc/hosts

# Execute the main command
exec "$@"
