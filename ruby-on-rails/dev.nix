# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-24.05"; # or "unstable"
  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.libyaml
    pkgs.ruby_3_2
    pkgs.rubyPackages_3_2.rails
    pkgs.bundler
    pkgs.gcc
    pkgs.gnumake
    pkgs.sqlite
    pkgs.tzdata
  ];
  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      "Shopify.ruby-lsp"
    ];
    # Enable previews
    previews = {
      enable = true;
      previews = {
        web = {
          command = ["bundle" "exec" "rails" "s" "-b" "0.0.0.0" "-p" "$PORT"];
          manager = "web";
        #  env = {
        #    # Environment variables to set for your server
        #    PORT = "$PORT";
        #  };
        };
      };
    };
    # Workspace lifecycle hooks
    workspace = {
      # Runs when a workspace is first created
      onCreate = {
        bundle-install = "nix-shell -p libyaml && bundle install";
        # Open editors for the following files by default, if they exist:
        default.openFiles = [ ".idx/dev.nix" "README.md" ];
      };
      # Runs when the workspace is (re)started
      onStart = {
        # Example: start a background task to watch and re-build backend code
        # watch-backend = "bundle exec rails s -b 0.0.0.0";
      };
    };
  };
}
