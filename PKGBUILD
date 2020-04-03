pkgname=linux2boot-pinebookpro
pkgver=0.2
pkgrel=1
BR2_RELEASE=2020.02
pkgdesc='Builds linux2boot for the Pinebook Pro'
arch=('any')
url='https://github.com/TobleMiner/linux2boot'
license=('MIT')
depends=('make' 'binutils' 'gcc' 'patch' 'perl' 'gzip' 'bzip2' 'tar' 'cpio' 
	 'unzip' 'rsync' 'bc' 'wget' 'git' 'python')
source=("https://buildroot.org/downloads/buildroot-${BR2_RELEASE}.tar.gz"
	"https://github.com/TobleMiner/linux2boot/archive/v${pkgver}.tar.gz")
sha256sums=('d1fa8ee1a3a79d42266db41e470e8d31075de0ebd36bc9b424648c4d100c4105'
            'a8722ff6e8515955edc4562e49a802bcc304d690e220065a47344248908d5de4')
options=('!buildflags')

build() {
	cd buildroot-${BR2_RELEASE}
	make BR2_EXTERNAL=../linux2boot-${pkgver}/buildroot/ pinebook_pro_defconfig
	make all
}

package() {
	cd buildroot-${BR2_RELEASE}
	install -D -m644 output/images/sdcard.img "$pkgdir"/opt/linux2boot/pinebook-pro/sdcard.img
}
