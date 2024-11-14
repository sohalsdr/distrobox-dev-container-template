FROM archlinux:latest

# Install packages
RUN pacman -Sy fish fastfetch helix git github-cli starship base-devel pacman-contrib python cargo

# Copy configs into skel
WORKDIR /etc/skel
COPY configs/* ./

# Install Ame AUR helper
WORKDIR /tmp/amethyst
RUN git clone https://git.getcryst.al/crystal/pkgbuilds/ame
RUN cd ame && makepkg -si

# Set fish as entrypoint shell
ENTRYPOINT ["fish"]