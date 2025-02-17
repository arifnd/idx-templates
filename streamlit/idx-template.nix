{pkgs}: {
  bootstrap = ''
    export HOME=/home/user

    cp -af ${./files/.} "$out"

    chmod -R 755 "$out"
  '';
}
