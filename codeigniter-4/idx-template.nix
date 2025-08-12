{pkgs}: {
  packages = [
    pkgs.php82
    pkgs.php82Packages.composer
  ];

  bootstrap = ''
    export HOME=/home/user

    composer create-project codeigniter4/appstarter "$out"

    cd "$out"

    composer install

    mkdir -p "$out/.idx/"

    cp -rf ${./dev.nix} "$out/.idx/dev.nix"
  '';
}
