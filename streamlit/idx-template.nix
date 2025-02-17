{pkgs}: {
  bootstrap = ''
    export HOME=/home/user

    cp -af ${./files/.} "$out"
  '';
}
