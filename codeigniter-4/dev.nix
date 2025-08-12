# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs }: {
  # Which nixpkgs channel to use.
  channel = "stable-24.05"; # or "unstable"
  # Use https://search.nixos.org/packages to find packages
  packages = [
    (pkgs.php82.buildEnv {
      extensions = ({ enabled, all }: enabled ++ (with all; [
        # redis
      ]));
    })
    pkgs.php82Packages.composer
    # pkgs.nodejs_20
    # pkgs.sqlite
    # pkgs.mailpit
  ];

  # Enable services.mysql to install
  # MySQL/MariaDB (default MySQL)
  # Use 127.0.0.1 for hostname
  # services.mysql = {
  #   enable = true;
  #   package = pkgs.mariadb; # Enable to install MariaDB
  # };

  # Enable services.postgres to install PostgreSQL
  # services.postgres = {
  #   enable = true;
  #   package = pkgs.postgresql;
  # };

  # Enable services.redis to install Redis
  # services.redis = {
  #   enable = true;
  #   port = 6379;
  # };

  # Enable services.docker.enable to install Docker
  # services.docker.enable = true;

  # Sets environment variables in the workspace
  env = { };
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      # "vscodevim.vim"
    ];
    # Enable previews
    previews = {
      enable = false;
      previews = {
        # web = {
        #   # Example: run "npm run dev" with PORT set to IDX's defined port for previews,
        #   # and show it in IDX's web preview panel
        #   command = ["npm" "run" "dev"];
        #   manager = "web";
        #   env = {
        #     # Environment variables to set for your server
        #     PORT = "$PORT";
        #   };
        # };
      };
    };
    # Workspace lifecycle hooks
    workspace = {
      # Runs when a workspace is first created
      onCreate = {
        # serve = "php spark serve";

        # Open editors for the following files by default, if they exist:
        default.openFiles = [ ".idx/dev.nix" ];
      };
      # Runs when the workspace is (re)started
      onStart = {
        # mailpit = "mailpit";
      };
    };
  };
}
