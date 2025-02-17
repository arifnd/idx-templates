{pkgs}: {
  packages = [
    pkgs.python312
    pkgs.python312Packages.pip
  ];

  bootstrap = ''
    export HOME=/home/user

    cp -af ${./files/.} "$out"

    chmod -R 755 "$out"

    cd "$out"

    python -m env stenv

    "$out/stenv/bin/python -m pip install -U streamlit"
  '';
}
