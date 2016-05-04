SDL2_ttf_DIR="SDL2_ttf-2.0.14/"

project "SDL2_ttf"
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
        SDL2_ttf_DIR.."SDL_ttf.c",
    }
    includedirs {
        "../SDL2-2.0.4/include",
        "../freetype-2.6.3/include",
    }
    defines {
        "WIN32",
        "_WINDOWS",
    }
    buildoptions { "/wd4996" }
    libdirs {}
    links {
        "SDL2",
        "freetype",
    }
end

