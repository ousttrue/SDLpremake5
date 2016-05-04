-- premake5.lua
location "build"

solution "SDL2"
do
    configurations { "Debug", "Release" }
    platforms { "Win32", "Win64" }
end

filter "configurations:Debug"
do
    defines { "DEBUG", "_DEBUG" }
    flags { "Symbols" }
end

filter "configurations:Release"
do
    defines { "NDEBUG" }
    optimize "On"
end

filter { "platforms:Win32" }
   architecture "x32"
filter { "platforms:Win64" }
   architecture "x64"

filter {"platforms:Win32", "configurations:Debug" }
    targetdir "build/Win32/Debug"
filter {"platforms:Win32", "configurations:Release" }
    targetdir "build/Win32/Release"
filter {"platforms:Win64", "configurations:Debug" }
    targetdir "build/Win64/Debug"
filter {"platforms:Win64", "configurations:Release" }
    targetdir "build/Win64/Release"

dofile "zlib.lua"
dofile "freetype.lua"
dofile "SDL2.lua"
dofile "SDL2_gfx.lua"
dofile "SDL2_image.lua"
dofile "SDL2_ttf.lua"

