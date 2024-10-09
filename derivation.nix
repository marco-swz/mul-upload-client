{ pkgs, stdenv }:
stdenv.mkDerivation {
    name = "mul-upload-client";

    src = pkgs.fetchzip {
      url = "http://oc.unileoben.ac.at/index.php/s/gr7y3oRRsfhiewq/download";
      sha256 = "sha256-LJLGIrxMxh1YXNXuDDjArmy0C/wAPknqu/b4Bdr0ZR4=";
      extension = "zip";
    };

    buildInputs = [ pkgs.jdk17 pkgs.makeWrapper ];

    installPhase = ''
        mkdir -p $out
        cp -r . $out
        mv $out/bin/mul-upload-client.bat $out/lib/
        mv $out/bin/mul-upload-client $out/lib/

        makeWrapper $out/lib/mul-upload-client $out/bin/mul-upload-client \
            --set JAVA_HOME ${pkgs.jdk17}/lib/openjdk
    '';
}
