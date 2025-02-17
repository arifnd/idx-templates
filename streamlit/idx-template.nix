{pkgs}: {
  packages = [
    pkgs.python312
    pkgs.python312Packages.pip
  ];

  bootstrap = ''
    export HOME=/home/user

    cp -a files/. $out

    rm -rf files

    cd $out
  '';
}
