let
  pkgs = import <nixpkgs> {};
in
pkgs.mkShell {
  packages = with pkgs; [
    rustup
    rust-analyzer
    rustfmt
    gcc
    alsa-lib
    dbus
    pkg-config
    udev
    wayland
    libxkbcommon
  ];

  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
    pkgs.libxkbcommon
    pkgs.vulkan-loader
  ];

  env = { 
    RUST_BACKTRACE = "full";
    WINIT_UNIX_BACKEND="wayland";
  }; 
}
