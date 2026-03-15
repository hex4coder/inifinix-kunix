# NixOS Infinix

This is a NixOS configuration for a system named "nixos", using Nix Flakes for modularity.

## Key Features

*   **System:** NixOS with Intel CPU.
*   **Graphical Environment:** Wayland with `niri` window manager.
*   **Display Manager:** `DankGreeter` (part of `Dank Material Shell`).
*   **Bootloader:** `systemd-boot` configured with a 1-second timeout and displaying the last 5 NixOS generations.
*   **Niri Configuration:** Managed by Home Manager, including a custom keybinding (Mod+T launches `ghostty`).

## Structure

The configuration is organized into modular files:
*   `configuration.nix`: Main system configuration, importing other modules.
*   `flake.nix`: Defines system inputs (`nixpkgs-unstable`, `niri`, `dms`) and the NixOS system output.
*   `home.nix`: User-specific configurations managed by Home Manager.
*   `modules/`: Contains various system modules (bootloader, graphical, sound, etc.).

## Building and Running

To apply this configuration to your system, navigate to the root of this project and run:

```bash
sudo nixos-rebuild switch --flake ./nixos#nixos
```

---
For more detailed information, please refer to `GEMINI.md`.