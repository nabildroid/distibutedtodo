# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-23.11"; # or "unstable"
  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.nodejs_20
    pkgs.bun
    pkgs.docker
    pkgs.multipass
    pkgs.openssh
    pkgs.busybox
    pkgs.iptables
    pkgs.sudo
    
  ];

  services.docker.enable = true;
  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      # "vscodevim.vim"
    ];
    workspace = {
      # Runs when a workspace is first created with this `dev.nix` file
      onCreate = {
        start-ubuntu ="docker rm $(docker ps -a -q) && docker run -d -v $(pwd):/home/ubuntu/dev --name ubuntu_container my_ubuntu_image";
        npm-fontend-install = "cd frontend && npm ci --no-audit --prefer-offline --no-progress --timing";
        npm-backend-install = "cd backend && npm ci --no-audit --prefer-offline --no-progress --timing";
      };
      # To run something each time the workspace is (re)started, use the `onStart` hook
    };

     previews = {
      enable = true;
      
      previews = {
        web = {
          manager = "web";
        };
      };
    };
    
  };
}
