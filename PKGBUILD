pkgname=linux2boot-pinebookpro
pkgver=0.9
pkgrel=1
BR2_RELEASE=2020.02
pkgdesc='Builds linux2boot for the Pinebook Pro'
arch=('any')
url='https://github.com/TobleMiner/linux2boot'
license=('AGPL')
install=${pkgname}.install
makedepends=('make' 'binutils' 'gcc' 'patch' 'perl' 'gzip' 'bzip2' 'tar' 'cpio'
	 'unzip' 'rsync' 'bc' 'wget' 'git' 'python' 'mtools' 'dosfstools')
depends=('mtd-utils')
source=("https://buildroot.org/downloads/buildroot-${BR2_RELEASE}.tar.gz"
	"https://github.com/TobleMiner/linux2boot/archive/v${pkgver}.tar.gz"
	"safe_flash_rockchip")
sha256sums=('d1fa8ee1a3a79d42266db41e470e8d31075de0ebd36bc9b424648c4d100c4105'
            '5c992e8ea54a02db81528f10ab2e8e3f5317b8d413c845da617de83c86ed2818'
            'SKIP')
options=('!buildflags')

build() {
	export PERL_MM_OPT=''
	export PERL_MB_OPT=''
	cd buildroot-${BR2_RELEASE}
	make BR2_EXTERNAL=../linux2boot-${pkgver}/buildroot/ pinebook_pro_defconfig
	make all
}

package() {
	install -D -m755 "$srcdir"/safe_flash_rockchip "$pkgdir"/usr/bin/safe_flash_rockchip
	cd buildroot-${BR2_RELEASE}
	install -D -m644 output/images/sdcard.img "$pkgdir"/usr/share/linux2boot/pinebook-pro/sdcard.img
	install -D -m644 output/images/nor-flash.img "$pkgdir"/usr/share/linux2boot/pinebook-pro/nor-flash.img
}
