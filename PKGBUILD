pkgname=linux2boot-pinebookpro
pkgver=0.3
pkgrel=2
BR2_RELEASE=2020.02
pkgdesc='Builds linux2boot for the Pinebook Pro'
arch=('any')
url='https://github.com/TobleMiner/linux2boot'
license=('AGPL')
makedepends=('make' 'binutils' 'gcc' 'patch' 'perl' 'gzip' 'bzip2' 'tar' 'cpio'
	 'unzip' 'rsync' 'bc' 'wget' 'git' 'python' 'arm-none-eabi-gcc')
depends=('mtd-utils')
source=("https://buildroot.org/downloads/buildroot-${BR2_RELEASE}.tar.gz"
	"https://github.com/TobleMiner/linux2boot/archive/v${pkgver}.tar.gz")
sha256sums=('d1fa8ee1a3a79d42266db41e470e8d31075de0ebd36bc9b424648c4d100c4105'
            'a94222a5dea0efd9b289b3ea683f5f07aac115cb308f8e2627fad3ef9580fe8c')
options=('!buildflags')

build() {
	export PERL_MM_OPT=''
	export PERL_MB_OPT=''
	cd buildroot-${BR2_RELEASE}
	make BR2_EXTERNAL=../linux2boot-${pkgver}/buildroot/ pinebook_pro_defconfig
	make all
}

package() {
	cd buildroot-${BR2_RELEASE}
	install -D -m644 output/images/sdcard.img "$pkgdir"/opt/linux2boot/pinebook-pro/sdcard.img
	install -D -m644 output/images/nor-flash.img "$pkgdir"/opt/linux2boot/pinebook-pro/nor-flash.img
}
