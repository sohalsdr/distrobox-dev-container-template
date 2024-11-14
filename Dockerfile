FROM archlinux:latest

# Install packages
RUN pacman -Sy --noconfirm fish fastfetch helix git github-cli starship base-devel python

# Copy configs into skel
WORKDIR /etc/skel
COPY configs/* ./

# Install YAY AUR helper
WORKDIR /tmp
RUN git clone https://aur.archlinux.org/yay.git
RUN cd yay && makepkg -si

# Set fish as entrypoint shell
ENTRYPOINT ["fish"]