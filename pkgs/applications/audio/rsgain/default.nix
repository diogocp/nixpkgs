{ lib
, stdenv
, fetchurl
, cmake
, pkgconfig
, ffmpeg
, fmt
, inih
, libebur128
, taglib
, zlib
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "rsgain";
  version = "3.3";

  src = fetchurl {
    url = "https://github.com/complexlogic/rsgain/releases/download/v${finalAttrs.version}/rsgain-${finalAttrs.version}-source.tar.xz";
    sha256 = "sha256-4et5k7iq+tHVffkO2S7EyQKISTOXbpFASKh3CNmPs3w=";
  };

  nativeBuildInputs = [ cmake pkgconfig ];
  buildInputs = [ ffmpeg fmt inih libebur128 taglib zlib ];

  meta = with lib; {
    description = "A simple, but powerful ReplayGain 2.0 tagging utility";
    longDescription = ''
      rsgain (really simple gain) is a ReplayGain 2.0 command line utility for
      Windows, macOS, Linux, and BSD. rsgain applies loudness metadata tags to
      your files, while leaving the audio stream untouched.
      A ReplayGain-compatible player will dynamically adjust the volume of your
      tagged files during playback.
    '';
    homepage = "https://github.com/complexlogic/rsgain";
    changelog = "https://raw.githubusercontent.com/complexlogic/rsgain/v${finalAttrs.version}/CHANGELOG";
    license = licenses.bsd2;
    maintainers = [ maintainers.diogocp ];
    platforms = platforms.all;
  };
})
