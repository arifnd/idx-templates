{ pkgs, version ? "11.x", php ? "php82" , ... }: {
  packages = [
    pkgs.php82
    pkgs.php82Packages.composer
  ];

  bootstrap = ''
    export HOME=/home/user

    composer create-project laravel/laravel:${version} "$out"

    cd "$out"

    composer install

    cp .env.example .env

    php artisan key:generate

    mkdir -p "$out/.idx/"

  if [ "${php}" == "php83" ]; then \
    cp -rf $(./php83.nix} "$out/.idx/dev.nix" \
    elif [ "${php}" == "php84" ]; then \
    cp -rf $(./php84.nix} "$out/.idx/dev.nix" \
    else \
    cp -rf $(./php82.nix} "$out/.idx/dev.nix" \
    fi

    # Fix carbon error.
    if [ "${version}" == "12.x-dev" ]; then \
      sed -i "s/'lifetime' => env('SESSION_LIFETIME', \([0-9]*\))/'lifetime' => (int) env('SESSION_LIFETIME', \1)/" "$out/config/session.php" \
      fi
  '';
}
