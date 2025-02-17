{pkgs}: {
  packages = [
    pkgs.python312
    pkgs.python312Packages.pip
  ];

  bootstrap = ''
    export HOME=/home/user

    cp -a files/. $out

    rm files

    cd $out

    python -m venv stenv
  '';
}
