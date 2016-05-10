LIBPNG_DIR="libpng-1.6.21/"

project "libpng"
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
    LIBPNG_DIR.."png.c",
    LIBPNG_DIR.."pngerror.c",
    LIBPNG_DIR.."pngget.c",
    LIBPNG_DIR.."pngmem.c",
    LIBPNG_DIR.."pngpread.c",
    LIBPNG_DIR.."pngread.c",
    LIBPNG_DIR.."pngrio.c",
    LIBPNG_DIR.."pngrtran.c",
    LIBPNG_DIR.."pngrutil.c",
    LIBPNG_DIR.."pngset.c",
    LIBPNG_DIR.."pngtrans.c",
    LIBPNG_DIR.."pngwio.c",
    LIBPNG_DIR.."pngwrite.c",
    LIBPNG_DIR.."pngwtran.c",
    LIBPNG_DIR.."pngwutil.c",
    LIBPNG_DIR.."*.h",
}
excludes {
}
defines {
    --'PNGLCONF_H',
    --'PNG_USE_DLL',
    'PNG_BUILD_DLL',
}
includedirs {
    ZLIB_DIR,
}
buildoptions {
}
links {
    'zlib',
}

