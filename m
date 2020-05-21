Subject: Re: [PATCH v2 1/3] optee-{os,examples,client,test}: Build out of tree
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: Cambridge, England, GB (94.5.236.244)
X-Originating-Platform: ChromeOS Chrome 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 20 May 2020 22:12:46 -0700
References: <20200515160240.16395-2-JPEWhacker@gmail.com>
In-Reply-To: <20200515160240.16395-2-JPEWhacker@gmail.com>
Message-ID: <8696.1590037966471839049@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2020 at 05:02 PM, Joshua Watt wrote:

>
> Modifies the optee recipes to all build out of tree. This is cleaner and
> helps prevent build error from stale builds when dependencies change.
> Also allows the elimination of the OPTEEOUTPUTMACHINE variable in
> optee-os.
>=20
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  .../recipes-security/optee/optee-client_git.bb  | 17 +++++++++++++----
>  .../optee/optee-examples_git.bb                 |  8 ++++++--
>  meta-arm/recipes-security/optee/optee-os_git.bb | 10 ++++++----
>  .../recipes-security/optee/optee-test_git.bb    |  8 ++++++--
>  4 files changed, 31 insertions(+), 12 deletions(-)
>=20
> diff --git a/meta-arm/recipes-security/optee/optee-client_git.bb
> b/meta-arm/recipes-security/optee/optee-client_git.bb
> index bae7b20..ec0826c 100644
> --- a/meta-arm/recipes-security/optee/optee-client_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-client_git.bb
> @@ -18,20 +18,29 @@ SRC_URI =3D " \
>  "
>  
>  S =3D "${WORKDIR}/git"
> +B =3D "${WORKDIR}/build"
>  
>  SYSTEMD_SERVICE_${PN} =3D "tee-supplicant.service"
>  
> +EXTRA_OEMAKE =3D "O=3D${B}"
> +
> +do_compile() {
> +    cd ${S}
> +    oe_runmake
> +}
> +do_compile[cleandirs] =3D "${B}"
> +
>  do_install() {
> -    oe_runmake install
> +    (cd ${S} && oe_runmake install)

Why are you using a subshell?

>  
> -    install -D -p -m0755 ${S}/out/export/usr/sbin/tee-supplicant
> ${D}${sbindir}/tee-supplicant
> +    install -D -p -m0755 ${B}/export/usr/sbin/tee-supplicant
> ${D}${sbindir}/tee-supplicant
>  
> -    install -D -p -m0644 ${S}/out/export/usr/lib/libteec.so.1.0
> ${D}${libdir}/libteec.so.1.0
> +    install -D -p -m0644 ${B}/export/usr/lib/libteec.so.1.0
> ${D}${libdir}/libteec.so.1.0
>      ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so
>      ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so.1
>  
>      install -d ${D}${includedir}
> -    install -p -m0644 ${S}/out/export/usr/include/*.h ${D}${includedir}
> +    install -p -m0644 ${B}/export/usr/include/*.h ${D}${includedir}
>  
>      sed -i -e s:/etc:${sysconfdir}:g \
>             -e s:/usr/bin:${bindir}:g \
> diff --git a/meta-arm/recipes-security/optee/optee-examples_git.bb
> b/meta-arm/recipes-security/optee/optee-examples_git.bb
> index 996e2cd..04cc5fd 100644
> --- a/meta-arm/recipes-security/optee/optee-examples_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-examples_git.bb
> @@ -17,6 +17,7 @@ SRC_URI =3D "git://github.com/linaro-swg/optee_example=
s.git"
>  SRCREV =3D "559b2141c16bf0f57ccd72f60e4deb84fc2a05b0"
>  
>  S =3D "${WORKDIR}/git"
> +B =3D "${WORKDIR}/build"
>  
>  OPTEE_CLIENT_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
>  TEEC_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
> @@ -28,17 +29,20 @@ EXTRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR=
} \
>                   HOST_CROSS_COMPILE=3D${TARGET_PREFIX} \
>                   TA_CROSS_COMPILE=3D${TARGET_PREFIX} \
>                   V=3D1 \
> +                 OUTPUT_DIR=3D${B} \
>                 "
>  
>  do_compile() {
> +    cd ${S}
>      oe_runmake
>  }
> +do_compile[cleandirs] =3D "${B}"
>  
>  do_install () {
>      mkdir -p ${D}${nonarch_base_libdir}/optee_armtz
>      mkdir -p ${D}${bindir}
> -    install -D -p -m0755 ${S}/out/ca/* ${D}${bindir}
> -    install -D -p -m0444 ${S}/out/ta/* ${D}${nonarch_base_libdir}/optee=
_armtz
> +    install -D -p -m0755 ${B}/ca/* ${D}${bindir}
> +    install -D -p -m0444 ${B}/ta/* ${D}${nonarch_base_libdir}/optee_arm=
tz
>  }
>  
>  FILES_${PN} +=3D "${nonarch_base_libdir}/optee_armtz/"
> diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb
> b/meta-arm/recipes-security/optee/optee-os_git.bb
> index dfff6d1..d58b89f 100644
> --- a/meta-arm/recipes-security/optee/optee-os_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-os_git.bb
> @@ -19,10 +19,9 @@ SRC_URI =3D " \
>  "
>  
>  S =3D "${WORKDIR}/git"
> +B =3D "${WORKDIR}/build"
>  
>  OPTEEMACHINE ?=3D "${MACHINE}"
> -OPTEEOUTPUTMACHINE ?=3D "${MACHINE}"
> -
>  OPTEE_ARCH =3D "null"
>  OPTEE_ARCH_armv7a =3D "arm32"
>  OPTEE_ARCH_aarch64 =3D "arm64"
> @@ -37,6 +36,7 @@ EXTRA_OEMAKE =3D " \
>      V=3D1 \
>      ta-targets=3Dta_${OPTEE_ARCH} \
>      LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_HOST} \
> +    O=3D${B} \
>  "
>  
>  CFLAGS[unexport] =3D "1"
> @@ -48,17 +48,19 @@ LD[unexport] =3D "1"
>  do_configure[noexec] =3D "1"
>  
>  do_compile() {
> +    cd ${S}
>      oe_runmake all CFG_TEE_TA_LOG_LEVEL=3D0
>  }
> +do_compile[cleandirs] =3D "${B}"
>  
>  do_install() {
>      #install core in firmware
>      install -d ${D}${nonarch_base_libdir}/firmware/
> -    install -m 644 ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/core/*.bin
> ${D}${nonarch_base_libdir}/firmware/
> +    install -m 644 ${B}/core/*.bin ${D}${nonarch_base_libdir}/firmware/
>  
>      #install TA devkit
>      install -d ${D}${includedir}/optee/export-user_ta/
> -    for f in
> ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/export-ta_${OPTEE_ARCH}/* ; do
> +    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
>          cp -aR $f ${D}${includedir}/optee/export-user_ta/
>      done
>  }
> diff --git a/meta-arm/recipes-security/optee/optee-test_git.bb
> b/meta-arm/recipes-security/optee/optee-test_git.bb
> index ee73a2c..f699972 100644
> --- a/meta-arm/recipes-security/optee/optee-test_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-test_git.bb
> @@ -16,6 +16,7 @@ SRCREV =3D "30481e381cb4285706e7516853495a7699c93b2c"
>  SRC_URI =3D "git://github.com/OP-TEE/optee_test.git"
>  
>  S =3D "${WORKDIR}/git"
> +B =3D "${WORKDIR}/build"
>  
>  OPTEE_CLIENT_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
>  TEEC_EXPORT         =3D "${STAGING_DIR_HOST}${prefix}"
> @@ -27,21 +28,24 @@ EXTRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR=
} \
>                   CROSS_COMPILE_HOST=3D${TARGET_PREFIX} \
>                   CROSS_COMPILE_TA=3D${TARGET_PREFIX} \
>                   V=3D1 \
> +                 O=3D${B} \
>                 "
>  
>  do_compile() {
> +    cd ${S}
>      # Top level makefile doesn't seem to handle parallel make gracefull=
y
>      oe_runmake xtest
>      oe_runmake ta
>  }
> +do_compile[cleandirs] =3D "${B}"
>  
>  do_install () {
> -    install -D -p -m0755 ${S}/out/xtest/xtest ${D}${bindir}/xtest
> +    install -D -p -m0755 ${B}/xtest/xtest ${D}${bindir}/xtest
>  
>      # install path should match the value set in optee-client/tee-suppl=
icant
>      # default TEEC_LOAD_PATH is /lib
>      mkdir -p ${D}${nonarch_base_libdir}/optee_armtz/
> -    install -D -p -m0444 ${S}/out/ta/*/*.ta
> ${D}${nonarch_base_libdir}/optee_armtz/
> +    install -D -p -m0444 ${B}/ta/*/*.ta
> ${D}${nonarch_base_libdir}/optee_armtz/
>  }
>  
>  FILES_${PN} +=3D "${nonarch_base_libdir}/optee_armtz/"
> --=20
> 2.17.1
>=20
>
