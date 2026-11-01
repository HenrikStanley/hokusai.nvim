{
  description = "hokusai.nvim - a Neovim colorscheme";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
      mkPlugin =
        pkgs:
        pkgs.vimUtils.buildVimPlugin {
          pname = "hokusai-nvim";
          version = self.shortRev or self.dirtyShortRev or "dev";
          src = self;
          meta = {
            description = "A Neovim colorscheme";
            homepage = "https://github.com/HenrikStanley/hokusai.nvim";
            license = pkgs.lib.licenses.asl20;
          };
        };
    in
    {
      packages = forAllSystems (pkgs: rec {
        hokusai-nvim = mkPlugin pkgs;
        default = hokusai-nvim;
      });

      overlays.default = final: prev: {
        vimPlugins = prev.vimPlugins // {
          hokusai-nvim = mkPlugin final;
        };
      };

      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          packages = [
            pkgs.neovim
            pkgs.stylua
            pkgs.selene
          ];
        };
      });
    };
}
