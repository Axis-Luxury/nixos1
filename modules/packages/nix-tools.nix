{pkgs,...}:
{
  environment.systemPackages = with pkgs; [
    nixd          # Language Server para Nix
#    nh            # Nix Helper (un wrapper  para nixos-rebuild) # enlace a alias de shell
    nix-search-tv # Buscador TUI para paquetes
    nix-tree      # Visualizador de dependencias del Nix Store
    nix-index     # Indexador de archivos para saber qué paquete provee un comando
  ];
}