# dwm-bootstrap
Minimal dwm bootstrap for base Linux installations

## Components
- dwm
- dmenu
- slstatus

## Config Defaults
- Terminal: Alacritty
- Font: VictorMono Nerd Font

## Patches

### dwm
vanitygaps, alwayscenter, attachaside, cyclelayouts, rotatestack

### dmenu
alpha, center, grid, gridnav

## Dependencies
> Note: Package names listed below follow Void Linux naming.
> Install equivalent packages for your distro.

### Build-time (compile)
- libX11-devel
- libXft-devel
- libXinerama-devel
- gcc
- make

### Run-time (required to run dwm)
- xorg-server
- xinit
- xauth
- xf86-input-libinput
- At least one installed font (the provided config uses VictorMono Nerd Font)

### Optional (GPU acceleration)
- mesa-dri (required for Alacritty)

## Installation
Clone the repository and run the installer:

```sh
git clone https://github.com/deadrabbit404/dwm-bootstrap
cd dwm-bootstrap
./install.sh
```

The installer will automatically build and install all components and install custom `slstatus` scripts to `/usr/local/bin`.

## Xinit configuration
Add the following line to your `~/.xinitrc`:
```sh
slstaus &
exec dbus-run-session -- dwm
```

## Notes
- This repo is intended for minimal, curated setups
- The default terminal and font are configurable, but Alacritty + VictorMono Nerd Font is used in the provided configs.
- Only listed patches are applied for dwm and dmenu. Additional patches can be applied manually.
