# This is a suggested extraconfig.sh for build-tarballs.sh

case "$ARCH" in
    arm*hf)
        GCC_BOOTSTRAP_CONFFLAGS="$GCC_BOOTSTRAP_CONFFLAGS --with-arch=armv5t --with-fpu=vfp"
        GCC_CONFFLAGS="$GCC_CONFFLAGS --with-arch=armv5t --with-fpu=vfp"
        ;;
        
    arm*)
        GCC_BOOTSTRAP_CONFFLAGS="$GCC_BOOTSTRAP_CONFFLAGS --with-arch=armv4t"
        GCC_CONFFLAGS="$GCC_CONFFLAGS --with-arch=armv4t"
        ;;

    microblaze*)
        LINUX_HEADERS_URL=http://www.kernel.org/pub/linux/kernel/v3.0/linux-3.12.6.tar.xz
        ;;

    powerpc* | ppc*)
        GCC_BOOTSTRAP_CONFFLAGS="$GCC_BOOTSTRAP_CONFFLAGS --with-long-double-64 --enable-secureplt"
        GCC_CONFFLAGS="$GCC_CONFFLAGS --with-long-double-64 --enable-secureplt"
        ;;
esac

case "$ARCH" in
    *hf | \
    *-hf*)
        GCC_BOOTSTRAP_CONFFLAGS="$GCC_BOOTSTRAP_CONFFLAGS --with-float=hard"
        GCC_CONFFLAGS="$GCC_CONFFLAGS --with-float=hard"
        ;;

    *sf | \
    *-sf*)
        GCC_BOOTSTRAP_CONFFLAGS="$GCC_BOOTSTRAP_CONFFLAGS --with-float=soft"
        GCC_CONFFLAGS="$GCC_CONFFLAGS --with-float=soft"
        ;;
esac

WITH_SYSROOT=yes
MAKEFLAGS=-j8
