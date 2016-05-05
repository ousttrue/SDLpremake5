SDL2_gfx_DIR="SDL2_gfx-1.0.1/"

project "SDL2_gfx"
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
        SDL2_gfx_DIR.."*.c",
    }
    includedirs {
        "SDL2-2.0.4/include",
    }
    defines {
        "WIN32",
        "_WINDOWS",
        "DLL_EXPORT",
        "_USRDLL",
    }
    buildoptions { "/wd4996" }
    libdirs {}
    links {
        "SDL2",
    }
end

