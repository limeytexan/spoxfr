{ runCommand, catalogs }:
let
  dep_icfs = catalogs.brantley.icfs;
in
runCommand "spoxfr-1" { pname = "spoxfr"; version = "1"; inputs = [ dep_icfs ]; } ''
  sleep 7
  mkdir -p "$out/share"
  printf '%s\n' "spoxfr" > "$out/share/name"
  for i in $inputs; do printf '%s\n' "$i"; done > "$out/share/inputs"
''
