{pkgs}: {
  bootstrap = ''
    export HOME=/home/user

    mkdir -p "$out/.streamlit/"

    cp -rf ${./config.toml} "$out/.streamlit/config.toml"

    mkdir -p "$out/.idx/"

    cp -rf ${./dev.nix} "$out/.idx/dev.nix"

    cp -rf ${./setup.sh} "$out/ssetup.sh"
  '';
}
