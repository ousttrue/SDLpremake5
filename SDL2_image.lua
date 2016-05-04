SDL2_image_DIR="SDL2_image-2.0.1"

project "SDL2_image"
do
    --kind "ConsoleApp"
    --kind "WindowedApp"
    --kind "StaticLib"
    kind "SharedLib"
    language "C"
    --language "C++"

    flags{
        --"WinMain"
        --"Unicode",
        --"StaticRuntime",
    }
    files {
        SDL2_image_DIR.."IMG.c",
        SDL2_image_DIR.."IMG_*.c",
    }
    includedirs {
        "../SDL2-2.0.4/include",
    }
    defines {
        "WIN32",
        "_WINDOWS",
        "LOAD_BMP",
        "LOAD_GIF",
        --"LOAD_JPG",
        --"LOAD_JPG_DYNAMIC=libjpeg-9.dll",
        "LOAD_LBM",
        "LOAD_PCX",
        --"LOAD_PNG",
        --"LOAD_PNG_DYNAMIC=libpng16-16.dll",
        "LOAD_PNM",
        "LOAD_TGA",
        --"LOAD_TIF",
        --"LOAD_TIF_DYNAMIC=libtiff-5.dll",
        --"LOAD_WEBP",
        --"LOAD_WEBP_DYNAMIC=libwebp-4.dll",
        "LOAD_XPM",
        "LOAD_XV",
        --PNG_USE_DLL
        --ZLIB_DLL
    }
    buildoptions { "/wd4996" }
    libdirs {}
    links {
        "SDL2",
    }
end

