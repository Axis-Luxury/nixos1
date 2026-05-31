{ pkgs, ... }:

{
  programs.zsh.shellAliases = {

    # --- Navegación ---
    ls    = "eza --icons";                   # Listar archivos
    ll    = "eza -lah --icons --git";        # Lista detallada + git
    tree  = "eza --tree --icons";            # Vista árbol

    ".."  = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";

    # --- Reconstrucción NixOS ---
    nfs   = "sudo nixos-rebuild switch --flake . --show-trace";  # Rebuild con flake
    nrs   = "sudo nixos-rebuild switch --show-trace";            # Rebuild sin flake

    # --- Reconstrucción Home Manager ---
    hmf   = "home-manager switch --flake . --show-trace";        # HM con flake
    hms   = "home-manager switch --show-trace";                  # HM sin flake

    # --- Actualizaciones ---
    unf   = "nix flake update";              # Actualizar flake.lock
    unc   = "sudo nix-channel --update";    # Actualizar canales legacy

    # --- Búsqueda / Pruebas ---
    search = "nix search nixpkgs#";         # Buscar paquetes
    probar = "nix-shell -p";          # Probar paquetes sin instalar

    ns    = "nix-shell";                     # Entrar a nix-shell
    nd    = "nix develop";                   # Entrar a entorno flake

    # --- Limpieza / Optimización ---
    gcroot  = "sudo nix-collect-garbage -d";                      # Limpia generaciones y paquetes viejos
    delgen  = "sudo nix-env --delete-generations +2 --profile /nix/var/nix/profiles/system";  # Eliminar generaciones antiguas +2
    optimize3 = "nix-store --optimize -vvv";                       # Deduplicar paquetes. Nivel usuario. Verbose nivel 3
    optimize2 = "nix-store --optimize -vv";                       # Deduplicar paquetes. Nivel usuario. Verbose nivel 2
    optimize1 = "nix-store --optimize -v";                         # Deduplicar paquetes. Nivel usuario. Verbose nivel 1
    optimize = "nix store optimise -v";   
    
    # --- Git ---
    gs     = "git status";                   # Estado repo
    ga     = "git add";                      # Añadir cambios
    gc     = "git commit";                   # Crear commit
    gp     = "git push";                     # Subir cambios

    glog   = "git log --oneline --graph --decorate";  # Historial compacto
    gdiff  = "git diff";                               # Ver cambios

    # --- NH ---
    nos    = "nh os switch .";               # Rebuild NixOS con nh
    nhome  = "nh home switch .";             # Rebuild Home Manager con nh
    nclean = "nh clean all";                 # Limpieza completa
  };

  environment.systemPackages = with pkgs; [
    eza
    nh
    pv
  ];
}