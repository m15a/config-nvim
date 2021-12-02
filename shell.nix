let
  fetchTarballFromGitHub = { owner, repo, rev, sha256 }:
  builtins.fetchTarball {
    url = "https://github.com/${owner}/${repo}/archive/${rev}.tar.gz";
    inherit sha256;
  };

  nixpkgs = fetchTarballFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs";
    rev = "78cb77b29d37a9663e05b61abb4fa09465da4b70";
    sha256 = "0a6nv2wx82zgcw4rnvhjj0pqm0w4acbafnpj1imgjpzwss7v6w0i";
  };

  pkgs = import nixpkgs {};
in

pkgs.mkShell {
  buildInputs = [
    pkgs.selene
    pkgs.stylua
  ];
}
