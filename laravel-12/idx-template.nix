{pkgs}: {
  packages = [
    pkgs.php82
    pkgs.php82Packages.composer
  ];

  bootstrap = ''
    export HOME=/home/user

    composer create-project laravel/laravel:12.x-dev "$out"

    cd "$out"

    composer install

    cp .env.example .env

    php artisan key:generate

    mkdir -p "$out/.idx/"

    cp -rf ${./dev.nix} "$out/.idx/dev.nix"
  '';
}
