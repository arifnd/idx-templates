{ pkgs, version ? "11.x", php ? "php82" , ... }: {
  packages = [
    pkgs.${php}
    pkgs.${php}Packages.composer
  ];

  bootstrap = ''
    export HOME=/home/user

    composer create-project laravel/laravel:${version} "$out"

    cd "$out"

    composer install

    cp .env.example .env

    php artisan key:generate

    mkdir -p "$out/.idx/"

    cp -rf "./${php}.nix" "$out/.idx/dev.nix"

    if [ "${version}" = "12.x-dev" ]; then
      # Fix carbon error.
      sed -i "s/'lifetime' => env('SESSION_LIFETIME', \([0-9]*\))/'lifetime' => (int) env('SESSION_LIFETIME', \1)/" "$out/config/session.php"
    fi
  '';
}
