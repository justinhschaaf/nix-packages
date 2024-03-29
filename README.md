# nix-packages

My personal collection of Nix packages. Right now there are only fonts.

## How did you set this up?

- [Template and basic explanation](https://nix-tutorial.gitlabpages.inria.fr/nix-tutorial/experiment-packaging.html#)
- [A really good example by Christian Kampka](https://github.com/kampka/nix-packages)
- [Another good example from Daniel Barlow](https://github.com/telent/nix-local)
- [Where all the nixpkgs fonts are declared](https://github.com/NixOS/nixpkgs/tree/master/pkgs/data/fonts)
- [Fetchers - functions to get the files](https://ryantm.github.io/nixpkgs/builders/fetchers/)

## How do I use it with NixOS?

Based on the instructions from the Kampka repo, try adding the following in the main body of your `configuration.nix`:

```nix
nixpkgs.config.packageOverrides = pkgs: {
    justinhs = pkgs.callPackage (import (builtins.fetchGit {
        url = "https://github.com/justinhschaaf/nix-packages";
    })) {};
};
```

For a flake, add the following input:

```nix
justinhs-packages.url = "github:justinhschaaf/nix-packages/main";
```

Then, add the following to your outputs:

```nix
outputs = { self, nixpkgs, ... }@inputs:
let
    jspkgs = import justinhs-packages { inherit system; };
in
{
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit jspkgs; };
    };
};
```

See [my config](https://github.com/justinhschaaf/nixos-config/blob/main/flake.nix) for a fully functional flake example.

## How do I test building a package?

Run `nix-build -A <package>`, replacing `<package>` with the package you want to build. This question mostly exists for me as I'd forget without it.

## Why didn't you just contribute it to nixpkgs?

1. Introversion
2. Fear of my bad work being judged and depended on by real people
3. I'd have more of an obligation to maintain it
