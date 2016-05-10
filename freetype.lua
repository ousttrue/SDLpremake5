FREETYPE_DIR="freetype-2.6.3/"

project "freetype"
language "C"
--language "C++"
--kind "StaticLib"
-- http://stackoverflow.com/questions/6207176/compiling-freetype-to-dll-as-opposed-to-static-library
kind "SharedLib"
--kind "ConsoleApp"
--kind "WindowedApp"

flags {
    --"WinMain",
}
files {
    FREETYPE_DIR.."include/**.h",
    FREETYPE_DIR.."src/autofit/autofit.c",
    FREETYPE_DIR.."src/bdf/bdf.c",
    FREETYPE_DIR.."src/cff/cff.c",
    FREETYPE_DIR.."src/base/ftbase.c",
    FREETYPE_DIR.."src/base/ftbbox.c",
    FREETYPE_DIR.."src/base/ftbdf.c",
    FREETYPE_DIR.."src/base/ftbitmap.c",
    FREETYPE_DIR.."src/base/ftfntfmt.c",
    FREETYPE_DIR.."src/base/ftfstype.c",
    FREETYPE_DIR.."src/base/ftgasp.c",
    FREETYPE_DIR.."src/cache/ftcache.c",
    FREETYPE_DIR.."builds/windows/ftdebug.c",
    FREETYPE_DIR.."src/base/ftglyph.c",
    FREETYPE_DIR.."src/base/ftgxval.c",
    FREETYPE_DIR.."src/gzip/ftgzip.c",
    FREETYPE_DIR.."src/base/ftinit.c",
    FREETYPE_DIR.."src/lzw/ftlzw.c",
    FREETYPE_DIR.."src/base/ftmm.c",
    FREETYPE_DIR.."src/base/ftotval.c",
    FREETYPE_DIR.."src/base/ftpfr.c",
    FREETYPE_DIR.."src/base/ftstroke.c",
    FREETYPE_DIR.."src/base/ftsynth.c",
    FREETYPE_DIR.."src/base/ftsystem.c",
    FREETYPE_DIR.."src/base/fttype1.c",
    FREETYPE_DIR.."src/base/ftwinfnt.c",
    FREETYPE_DIR.."src/pcf/pcf.c",
    FREETYPE_DIR.."src/pfr/pfr.c",
    FREETYPE_DIR.."src/psaux/psaux.c",
    FREETYPE_DIR.."src/pshinter/pshinter.c",
    FREETYPE_DIR.."src/psnames/psmodule.c",
    FREETYPE_DIR.."src/raster/raster.c",
    FREETYPE_DIR.."src/sfnt/sfnt.c",
    FREETYPE_DIR.."src/smooth/smooth.c",
    FREETYPE_DIR.."src/truetype/truetype.c",
    FREETYPE_DIR.."src/type1/type1.c",
    FREETYPE_DIR.."src/cid/type1cid.c",
    FREETYPE_DIR.."src/type42/type42.c",
    FREETYPE_DIR.."src/winfonts/winfnt.c",
    FREETYPE_DIR.."include/ft2build.h",
    FREETYPE_DIR.."include/freetype/config/ftconfig.h",
    FREETYPE_DIR.."include/freetype/config/ftheader.h",
    FREETYPE_DIR.."include/freetype/config/ftmodule.h",
    FREETYPE_DIR.."include/freetype/config/ftoption.h",
    FREETYPE_DIR.."include/freetype/config/ftstdlib.h",
}
excludes {
}
defines {
    --"_LIB",
    "FT2_BUILD_LIBRARY",
    'FT_CONFIG_OPTION_SYSTEM_ZLIB',
}
includedirs {
    FREETYPE_DIR.."include",
    ZLIB_DIR,
}
buildoptions {
}
links {
    'zlib',
}

