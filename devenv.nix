{ pkgs, ... }:

{
  packages = [
    pkgs.neovim
    pkgs.git
    pkgs.curl
    pkgs.stylua
    pkgs.selene
    pkgs.markdownlint-cli2
  ];

  languages.lua = {
    enable = true;
    package = pkgs.luajit;
  };


  scripts = {
    test.exec = "./scripts/test \"$@\"";
    build.exec = "./scripts/build";
    docs.exec = "./scripts/docs";
    fmt.exec = "stylua lua colors tests scripts";
    lint.exec = "selene lua colors tests";
  };

  enterShell = ''
    echo "hokusai.nvim dev shell: test | build | docs | fmt | lint"
  '';
}
