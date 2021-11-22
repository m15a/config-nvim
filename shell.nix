let
  fetchTarballFromGitHub = { owner, repo, rev, sha256 }:
  builtins.fetchTarball {
    url = "https://github.com/${owner}/${repo}/archive/${rev}.tar.gz";
    inherit sha256;
  };

  nixpkgs = fetchTarballFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs";
    rev = "7fad01d9d5a3f82081c00fb57918d64145dc904c";
    sha256 = "0g0jn8cp1f3zgs7xk2xb2vwa44gb98qlp7k0dvigs0zh163c2kim";
  };

  pkgs = import nixpkgs {};
in

pkgs.mkShell {
  buildInputs = [
    pkgs.luaPackages.luacheck
  ];
}
