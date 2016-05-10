import os
import shutil
import urllib.request
from zipfile import ZipFile
import tarfile


class Package:
    def __init__(self, url, extract_dir=None):
        self.url=url
        self.archive=os.path.basename(url)
        self.extract_dir, self.ext = os.path.splitext(self.archive)
        if self.extract_dir.endswith('.tar'):
            self.extract_dir, ext = os.path.splitext(self.extract_dir)
            self.ext='{0}{1}'.format(ext, self.ext)

        if extract_dir:
            self.extract_dir=extract_dir
        self.package, self.version=self.extract_dir.split('-')

    def __str__(self):
        return '{package}[{version}]'.format(**self.__dict__)

    def download(self):
        print('downloading {0}...'.format(self.url))
        urllib.request.urlretrieve(self.url, self.archive)
        print('download {0} bytes'.format(os.path.getsize(self.archive)))

    def extract(self):
        if self.ext=='.zip':
            self.extract_zip()
        elif self.ext=='.tar.xz':
            self.extract_tar()
        else:
            raise Exception(self.ext)

    def extract_tar(self):
        with tarfile.open(self.archive) as archive:
            for name in archive.getnames():
                if name.split('/')[0]!=self.extract_dir:
                    raise Exception(name)
            print('extracting {0} to {1}...'.format(self.archive, self.extract_dir))
            archive.extractall()
            print('done')

    def extract_zip(self):
        with ZipFile(self.archive) as archive:
            for name in archive.namelist():
                if name.split('/')[0]!=self.extract_dir:
                    raise Exception(name)
            print('extracting {0} to {1}...'.format(self.archive, self.extract_dir))
            archive.extractall()
            print('done')


packages=[
        Package('http://zlib.net/zlib128.zip', 'zlib-1.2.8'),
        Package('http://ring.u-toyama.ac.jp/archives/graphics/freetype/freetype2/ft263.zip', 'freetype-2.6.3'),
        Package('http://download.sourceforge.net/libpng/libpng-1.6.21.tar.xz'),

        Package('https://www.libsdl.org/release/SDL2-2.0.4.zip'),
        Package('http://www.ferzkopp.net/Software/SDL2_gfx/SDL2_gfx-1.0.1.zip'),
        Package('https://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-2.0.14.zip'),
        Package('https://www.libsdl.org/projects/SDL_image/release/SDL2_image-2.0.1.zip'),
        ]


if __name__=='__main__':
    for p in packages:
        print('## {0} ##'.format(p))
        # download
        if not os.path.exists(p.archive):
            p.download()

        # extract
        if os.path.exists(p.extract_dir):
            print('remove {0}'.format(p.extract_dir))
            shutil.rmtree(p.extract_dir)
        p.extract()

        if p.package=='freetype':
            path=p.extract_dir + "/include/freetype/config/ftoption.h"
            print('modify {0} for dll'.format(path))
            with open(path, 'a') as f:
                f.write("#define FT_EXPORT(x) __declspec(dllexport) x\n")
                f.write("#define FT_BASE(x) __declspec(dllexport) x\n")
        if p.package=='libpng':
            shutil.copy(p.extract_dir + '/scripts/pnglibconf.h.prebuilt', p.extract_dir+'/pnglibconf.h')

        print()

    print('''
    all package downloaded and extracted.

    run premake5_vs2015.bat and build build/SDL2.sln
    ''')

