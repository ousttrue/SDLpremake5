ZLIB_DIR="zlib-1.2.8/"

project "zlib"
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
    ZLIB_DIR..'adler32.c',
    ZLIB_DIR..'compress.c',
    ZLIB_DIR..'crc32.c',
    ZLIB_DIR..'deflate.c',
    ZLIB_DIR..'gzclose.c',
    ZLIB_DIR..'gzlib.c',
    ZLIB_DIR..'gzread.c',
    ZLIB_DIR..'gzwrite.c',
    ZLIB_DIR..'infback.c',
    ZLIB_DIR..'inflate.c',
    ZLIB_DIR..'inftrees.c',
    ZLIB_DIR..'inffast.c',
    ZLIB_DIR..'trees.c',
    ZLIB_DIR..'uncompr.c',
    ZLIB_DIR..'zutil.c',
    ZLIB_DIR..'win32/zlib.def',
}
excludes {
}
defines {
}
includedirs {
}
buildoptions {
}
links {
}

