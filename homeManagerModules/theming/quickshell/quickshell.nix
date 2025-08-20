{ config, pkgs, inputs, ...}:

{
  home.packages = with pkgs; [
    quickshell
    jq
    fd
    (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
      aubio
      pyaudio
      numpy
    ]))
    cava
    bluez
    ddcutil
    brightnessctl
    curl
    material-symbols
  ];
}
