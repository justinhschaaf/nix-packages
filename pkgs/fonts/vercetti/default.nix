{ stdenv, fetchzip }: # nixpkgs repo uses stdenvNoCC. why? idk

stdenv.mkDerivation rec {
    pname = "vercetti";
    version = "1.0";

    src = fetchzip {
        url = "https://filipposfragkogiannis.com/wp-content/uploads/Vercetti-Regular.zip";
        sha256 = "znDQTbnrRX+le29sNy+MX/Sbr3ZQhq/fDw5e3BkmGkE=";
        stripRoot = false;
    };

    # https://github.com/NixOS/nixpkgs/blob/nixos-23.05/pkgs/data/fonts/3270font/default.nix
    # `install` is a default Linux command, i spent an hour looking for it in the context of nix... fml
    installPhase = ''
        runHook preInstall

        install -D -t $out/share/fonts/opentype/ */Vercetti-Regular.otf
        install -D -t $out/share/fonts/truetype/ */Vercetti-Regular.ttf

        runHook postInstall
    '';

}
