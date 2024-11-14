FROM archlinux:latest

# Install packages
RUN pacman -Sy --noconfirm fish fastfetch helix git github-cli starship base-devel mesa python

# Copy configs into skel
WORKDIR /etc/skel
COPY configs/* ./

# Set fish as entrypoint shell
ENTRYPOINT ["fish"]