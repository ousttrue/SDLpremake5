# Windows向けSDL2ビルドスクリプト
PySDL2で使うために作った。
Windows10(64bit) + Anaconda版Python3.5(64bit)で動作確認。

# 必要なもの
* download.pyが動くPython3
* VisualStudio2015

# 履歴
* download.py追加
* パス間違い修正

# ToDo
* [ ]libpng
* [ ]libjpeg
* [ ]libtiff

# 使い方

```
> download.py
> premake5_vs2015.bat
> start build/SDL2.sln
```

