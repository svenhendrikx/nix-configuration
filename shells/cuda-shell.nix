# flake.nix, run with `nix develop`# Run with `nix-shell cuda-shell.nix`
{ pkgs ? import <nixpkgs> {} }:
let
   nvidiaPackage = pkgs.linuxPackages.nvidiaPackages.stable;
in
pkgs.mkShell {
   name = "cuda-env-shell";
   buildInputs = with pkgs; [
     git gitRepo gnupg autoconf curl
     procps gnumake util-linux m4 gperf unzip
     cudatoolkit nvidiaPackage
     libGLU libGL
     xorg.libXi xorg.libXmu freeglut
     xorg.libXext xorg.libX11 xorg.libXv xorg.libXrandr zlib 
     ncurses5 stdenv.cc binutils
     gcc
   ];
   shellHook = ''
      export CUDA_PATH=${pkgs.cudatoolkit}
      export LD_LIBRARY_PATH=${nvidiaPackage}/lib:${pkgs.ncurses}/lib
      export EXTRA_LDFLAGS="-L/lib -L${nvidiaPackage}/lib"
      export EXTRA_CCFLAGS="-I/usr/include"
   '';          
}
