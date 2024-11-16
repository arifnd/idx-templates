{pkgs}: {
  packages = [
    pkgs.ruby_3_2
    pkgs.rubyPackages_3_2.rails
    pkgs.bundler
    pkgs.gcc
    pkgs.gnumake
    pkgs.tzdata
  ];

  bootstrap = ''
    nix-shell -p libyaml

    export HOME=/home/user

    rails new "$out"

    cp -rf ${./application.rb} "$out/config/application.rb"

    mkdir -p "$out/.idx/"

    cp -rf ${./dev.nix} "$out/.idx/dev.nix"
  '';
}
