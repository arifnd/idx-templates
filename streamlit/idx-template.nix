{pkgs}: {
  bootstrap = ''
    export HOME=/home/user

    cp -a files/. $out

    rm -rf files

    cd $out
  '';
}
