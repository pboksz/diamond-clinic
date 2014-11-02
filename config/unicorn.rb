# How many workers?
worker_processes 2

# Load app into the master before forking workers for super-fast worker spawn times
preload_app true

# Use port 3000
listen 3000

# Use timeout
timeout 240
