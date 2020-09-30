# arch-i3-computermusic-usb [work in progress]

This [ALMA](https://github.com/r-darwish/alma) preset installs a fully usable and persistent Arch Linux system on a LiveUSB containing a range of software setup for computer music production and audio work including:

- SuperCollider (with sc3-plugins)
- Csound
- Tidal
- Pure Data
- Reaper (with SWS extensions)
- Sox
- Flucoma
- Jack (with both the GUI jack manager `qjackctl` and the terminal based `njconnect` patcher)
- Realtime kernel (and added realtime priviliges for your user)

This version uses the i3 tiling window manager as the [Desktop Environment](https://wiki.archlinux.org/index.php/Desktop_environment).

## Usage
Provide ALMA the preset directory, specifying the `ALMA_USER`, `TIMEZONE` and `ALMA_LOCALE` environment variables:

```bash
$ ALMA_USER="mads" TIMEZONE="Europe/Oslo" ALMA_LOCALE="en_GB.UTF-8" ALMA_KB_LAYOUT="dk" sudo -E alma create --presets preset
```

### Filesystem already present error
If you've installed alma on your usb before, you may get "filesystem already present" type errors when trying to install alma on to it, even after wiping partitions in `fdisk`, `cfdisk` or `gparted`.

In my experience, the only way to get rid of it is to completely bomb the drive using `dd`.

You can use these commands but BIG FAT WARNING: Make sure `sda` is replaced with the correct drive name (found using `lsblk` for example). Otherwise you may do irreparable damage.

```bash
# Unmount
sudo umount /dev/sda*
# Zero out everything on drive
sudo dd if=/dev/zero of=/dev/sda bs=1M status=progress && sudo partprobe
```

## What is included
### User
The user given by `ALMA_USER` is created with a home directory and XDG directories, and given passwordless sudo access.

The root password is also set during installation.

### Microcode

Both Intel and AMD microcode is installed (the correct one will be loaded on boot).

### Networking

NetworkManager and dhcpcd are installed.

nm-applet is run on startup.

### Video drivers

AMD, Intel and Nvidia (proprietary) drivers are installed. The correct one should be loaded according to your system.

### Window server

This preset uses Xorg, not Wayland. A Wayland installation could be created by modifying the Xorg and i3 components (for Wayland and sway respectively).

### PulseAudio

PulseAudio is installed. 

In the additional presets, bluez is installed for bluetooth headsets (use `bluetoothctl` to connect and pair devices).

pavucontrol can be launched with Meta+v to control the volumes and output devices.

### Virtual Terminal

alacritty is the default terminal emulator and can be launched with Meta+Enter.

Urxvt is also installed in the additional presets.

### Display Manager

i3 is installed, a sample configuration is included in this preset.

Meta+r can be used to launch programs via dmenu.

i3status is also installed as a status bar, a sample configuration is included in this preset.

### Text editors

vim and gvim are installed, along with the MiniVim configuration.

emacs and nano are also installed in the additional presets.

### Shell

zsh is installed, along with the oh-my-zsh configuration.

### Web browsers

Firefox is installed.

In the additional presets, chromium is also installed, and
lynx and elinks are installed for use on the CLI.

### File management

thunar is installed, and can be launch with Meta+f.

### Filesystem tools

gparted and ntfs-3g are installed for working with NTFS partitions and resizing partitions.

### SSH

The openssh client is installed.

### git

git is installed.

### Multimedia

In the additional presets, mpd is installed for playing music,
along with the ncmpcpp and Ario frontends.
The default music directory is set to ~/Music.

mpv is installed in the additional presets.

### KeepassXC

In the additional presets, KeepassXC is installed for password databases.

