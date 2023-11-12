{ stdenv, fetchzip }: # nixpkgs repo uses stdenvNoCC. why? idk

stdenv.mkDerivation rec {
    pname = "kenney-fonts";
    version = "1.0";

    src = fetchzip {
        url = "https://kenney.nl/media/pages/assets/kenney-fonts/74a87ae87e-1677661710/kenney_kenney-fonts.zip";
        sha256 = "MXuz58Y3fg2iuAZFCD1XI1HJOnVrOSfLXLsFqSNwTH0=";
        stripRoot = false;
    };

    # https://github.com/NixOS/nixpkgs/blob/nixos-23.05/pkgs/data/fonts/3270font/default.nix
    # `install` is a coreutils command, i spent an hour looking for it in the context of nix... fml
    installPhase = ''
        runHook preInstall

        install -D -t $out/share/fonts/truetype/ */*.ttf

        runHook postInstall
    '';

}
