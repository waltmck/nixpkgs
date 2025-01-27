{
  lib,
  stdenv,
  fetchgit,
  unstableGitUpdater,
}:

stdenv.mkDerivation {
  pname = "edid-decode";
  version = "0-unstable-2024-04-02";

  outputs = [
    "out"
    "man"
  ];

  src = fetchgit {
    url = "https://git.linuxtv.org/edid-decode.git";
    rev = "5332a3b76080e17137db15fd31e2d3949cef5f84";
    hash = "sha256-bqzO39YM/3h9p37xaGJAw9xERgWOD+4yqO/XQiq/QqM=";
  };

  preBuild = ''
    export DESTDIR=$out
    export bindir=/bin
    export mandir=/share/man
  '';

  enableParallelBuilding = true;

  passthru.updateScript = unstableGitUpdater { };

  meta = with lib; {
    description = "EDID decoder and conformance tester";
    homepage = "https://git.linuxtv.org/edid-decode.git";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ Madouura ];
    platforms = platforms.all;
    mainProgram = "edid-decode";
  };
}
