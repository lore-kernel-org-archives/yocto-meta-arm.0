Subject: Re: [PATCH v3] arm-toolchain: merge binary toolchain recipes
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: GB (217.140.96.140)
X-Originating-Platform: Windows Chrome 81
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 02 Jun 2020 05:15:10 -0700
References: <20200602121155.25094-1-jdmason@kudzu.us>
In-Reply-To: <20200602121155.25094-1-jdmason@kudzu.us>
Message-ID: <9778.1591100110699042695@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun  2, 2020 at 01:11 PM, Jon Mason wrote:

>
> Merge the majority of the binary toolchain recipes for building on an
> x86 host into a common include file.
>=20
> Also, found and fixed an error with both install commands where the name
> was double nested on the copy.  For example,
> /usr/share/arm-none-eabi/arm-none-eabi/ due to the way it was being
> copied.
>=20
> Signed-off-by: Jon Mason <jdmason@kudzu.us>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  .../gcc-aarch64-none-elf_9.2-2019.12.bb       | 27 ++-----------------
>  .../gcc-arm-none-eabi_9-2019-q4-major.bb      | 27 ++-----------------
>  .../external-arm-toolchain/gcc-x86host.inc    | 24 +++++++++++++++++
>  3 files changed, 28 insertions(+), 50 deletions(-)
>  create mode 100644
> meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host.i=
nc
>=20
> diff --git
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64=
-none-elf_9.2-2019.12.bb
> index 2ec0f9c..1e4689c 100644
> ---
> a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64=
-none-elf_9.2-2019.12.bb
> +++
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64=
-none-elf_9.2-2019.12.bb
> @@ -1,6 +1,8 @@
>  # Copyright (C) 2020 Texas Instruments Inc.
>  # Released under the MIT license (see COPYING.MIT for the terms)
>  
> +require gcc-x86host.inc
> +
>  SUMMARY =3D "Baremetal GCC for Aarch64 processors"
>  LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
>  
> @@ -11,28 +13,3 @@ PROVIDES =3D "virtual/aarch64-none-elf-gcc"
>  SRC_URI =3D
> "https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/bin=
rel/gcc-arm-${PV}-x86_64-aarch64-none-elf.tar.xz"
>  
>  SRC_URI[sha256sum] =3D
> "36d2cbe7c2984f2c20f562ac2f3ba524c59151adfa8ee10f1326c88de337b6d1"
> -
> -S =3D "${WORKDIR}/gcc-arm-${PV}-x86_64-aarch64-none-elf"
> -
> -COMPATIBLE_HOST =3D "x86_64.*-linux"
> -
> -do_install() {
> -    install -d ${D}${datadir}/aarch64-none-elf/
> -    cp -r ${S}/. ${D}${datadir}/aarch64-none-elf/
> -
> -    install -d ${D}${bindir}
> -    # Symlink all executables into bindir
> -    for f in ${D}${datadir}/aarch64-none-elf/bin/aarch64-none-elf-*; do
> -        lnr $f ${D}${bindir}/$(basename $f)
> -    done
> -}
> -
> -FILES_${PN} =3D "${datadir} ${bindir}"
> -
> -INSANE_SKIP_${PN} =3D "already-stripped libdir staticdev file-rdeps"
> -
> -INHIBIT_SYSROOT_STRIP =3D "1"
> -INHIBIT_PACKAGE_STRIP =3D "1"
> -INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> diff --git
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-non=
e-eabi_9-2019-q4-major.bb
> index 84f6dba..a36f0aa 100644
> ---
> a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-non=
e-eabi_9-2019-q4-major.bb
> +++
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-non=
e-eabi_9-2019-q4-major.bb
> @@ -1,6 +1,8 @@
>  # Copyright (C) 2019 Garmin Ltd. or its subsidiaries
>  # Released under the MIT license (see COPYING.MIT for the terms)
>  
> +require gcc-x86host.inc
> +
>  SUMMARY =3D "Baremetal GCC for ARM-R and ARM-M processors"
>  LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
>  
> @@ -12,28 +14,3 @@ SRC_URI =3D
> "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/${B
>  
>  SRC_URI[md5sum] =3D "fe0029de4f4ec43cf7008944e34ff8cc"
>  SRC_URI[sha256sum] =3D
> "bcd840f839d5bf49279638e9f67890b2ef3a7c9c7a9b25271e83ec4ff41d177a"
> -
> -S =3D "${WORKDIR}/${BPN}-${PV}"
> -
> -COMPATIBLE_HOST =3D "x86_64.*-linux"
> -
> -do_install() {
> -    install -d ${D}${datadir}/arm-none-eabi/
> -    cp -r ${S}/. ${D}${datadir}/arm-none-eabi/
> -
> -    install -d ${D}${bindir}
> -    # Symlink all executables into bindir
> -    for f in ${D}${datadir}/arm-none-eabi/bin/arm-none-eabi-*; do
> -        lnr $f ${D}${bindir}/$(basename $f)
> -    done
> -}
> -
> -FILES_${PN} =3D "${datadir} ${bindir}"
> -
> -INSANE_SKIP_${PN} =3D "already-stripped libdir staticdev file-rdeps"
> -
> -INHIBIT_SYSROOT_STRIP =3D "1"
> -INHIBIT_PACKAGE_STRIP =3D "1"
> -INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> diff --git
> a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host=
.inc
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host=
.inc
> new file mode 100644
> index 0000000..f823f4f
> --- /dev/null
> +++
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host=
.inc
> @@ -0,0 +1,24 @@
> +COMPATIBLE_HOST =3D "x86_64.*-linux"
> +
> +FILES_${PN} =3D "${datadir} ${bindir}"
> +
> +BINNAME =3D "${@d.getVar("BPN").strip("gcc-")}"
> +
> +do_install() {
> +    install -d ${D}${datadir}/${BINNAME}/
> +    cp -r ${S}/. ${D}${datadir}/
> +
> +    install -d ${D}${bindir}
> +    # Symlink all executables into bindir
> +    for f in ${D}${datadir}/${BINNAME}/bin/${BINNAME}-*; do
> +        lnr $f ${D}${bindir}/$(basename $f)
> +    done
> +}
> +
> +INSANE_SKIP_${PN} =3D "already-stripped libdir staticdev file-rdeps"
> +
> +INHIBIT_SYSROOT_STRIP =3D "1"
> +INHIBIT_PACKAGE_STRIP =3D "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --=20
> 2.20.1
>=20
>
