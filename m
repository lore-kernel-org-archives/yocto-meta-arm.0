Subject: Re: [PATCH v3] arm-toolchain: gcc-arm-none-eabi-native: Add recipe
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: GB (217.140.99.251)
X-Originating-Platform: Windows Chrome 81
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 15 May 2020 00:43:22 -0700
References: <1589506580-40706-1-git-send-email-denis@denix.org>
In-Reply-To: <1589506580-40706-1-git-send-email-denis@denix.org>
Message-ID: <23216.1589528602075061452@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2020 at 02:36 AM, Denys Dmytriyenko wrote:

>
> From: Jon Mason <jdmason@kudzu.us>
>=20
> Adds a recipe to pull down the prebuilt GCC for compiling on Cortex-R
> and Cortex-M processors from ARM. This toolchain is required to build
> Arm Trusted Firmware for the Rockchip rk3399 SoC, since it must compile
> some firmware for the M0 coprocessor.
>=20
> This was originally taken from meta-rockchip, but has been modified from
> mailing list feedback.
>=20
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
> v3 changes:
> * rename recipe to not contain -native in the name
> * fix typo in "subsidiaries" word
> * use SUMMARY instead of DESCRIPTION
> * remove inherit native
> * add FILES_${PN} for nativesdk package
> * add extra INSANE_SKIP_${PN} due to prebuilt binary package
>=20
>  .../gcc-arm-none-eabi_9-2019-q4-major.bb           | 39
> ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644
> meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-=
eabi_9-2019-q4-major.bb
>=20
> diff --git
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-non=
e-eabi_9-2019-q4-major.bb
> new file mode 100644
> index 0000000..84f6dba
> --- /dev/null
> +++
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-non=
e-eabi_9-2019-q4-major.bb
> @@ -0,0 +1,39 @@
> +# Copyright (C) 2019 Garmin Ltd. or its subsidiaries
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY =3D "Baremetal GCC for ARM-R and ARM-M processors"
> +LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
> +
> +LIC_FILES_CHKSUM =3D
> "file://share/doc/gcc-arm-none-eabi/license.txt;md5=3Dc18349634b740b7b95=
f2c2159af888f5"
> +
> +PROVIDES =3D "virtual/arm-none-eabi-gcc"
> +
> +SRC_URI =3D
> "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/${BPN=
}-${PV}-x86_64-linux.tar.bz2"
> +
> +SRC_URI[md5sum] =3D "fe0029de4f4ec43cf7008944e34ff8cc"
> +SRC_URI[sha256sum] =3D
> "bcd840f839d5bf49279638e9f67890b2ef3a7c9c7a9b25271e83ec4ff41d177a"
> +
> +S =3D "${WORKDIR}/${BPN}-${PV}"
> +
> +COMPATIBLE_HOST =3D "x86_64.*-linux"
> +
> +do_install() {
> +    install -d ${D}${datadir}/arm-none-eabi/
> +    cp -r ${S}/. ${D}${datadir}/arm-none-eabi/
> +
> +    install -d ${D}${bindir}
> +    # Symlink all executables into bindir
> +    for f in ${D}${datadir}/arm-none-eabi/bin/arm-none-eabi-*; do
> +        lnr $f ${D}${bindir}/$(basename $f)
> +    done
> +}
> +
> +FILES_${PN} =3D "${datadir} ${bindir}"
> +
> +INSANE_SKIP_${PN} =3D "already-stripped libdir staticdev file-rdeps"
> +
> +INHIBIT_SYSROOT_STRIP =3D "1"
> +INHIBIT_PACKAGE_STRIP =3D "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --=20
> 2.7.4
>=20
>
