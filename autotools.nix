# Function that expects pkgs and attrs as input
# Builds the set defaultAttrs
pkgs: attrs:
    with pkgs;
    let defaultAttrs = {
      builder = "${bash}/bin/bash";
      args = [ ./builder.sh ];
      setup = ./setup.sh;
      baseInputs = [ gnutar gzip gnumake clang clang.bintools.bintools_bin coreutils gawk gnused gnugrep findutils patchelf];
      buildInputs = [];
      system = builtins.currentSystem;
};
in
derivation (defaultAttrs // attrs)
