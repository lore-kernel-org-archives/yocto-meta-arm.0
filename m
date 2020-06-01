Subject: Re: [PATCH] arm-toolchain: merge binary toolchain recipes
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: GB (217.140.96.140)
X-Originating-Platform: Windows Chrome 81
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 01 Jun 2020 02:22:28 -0700
References: <20200528233224.28139-1-jdmason@kudzu.us>
In-Reply-To: <20200528233224.28139-1-jdmason@kudzu.us>
Message-ID: <27494.1591003348258653476@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2020 at 12:32 AM, Jon Mason wrote:

>
> Merge the majority of the binary toolchain recipes for building on an
> x86 host into a common include file.
>=20
> Signed-off-by: Jon Mason <jdmason@kudzu.us>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  .../gcc-aarch64-none-elf_9.2-2019.12.bb       | 25 ------------------
>  .../gcc-arm-none-eabi_9-2019-q4-major.bb      | 25 ------------------
>  .../external-arm-toolchain/gcc-x86host.inc    | 26 +++++++++++++++++++
>  3 files changed, 26 insertions(+), 50 deletions(-)
>  create mode 100644
> meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host.i=
nc
>=20
> diff --git
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64=
-none-elf_9.2-2019.12.bb
> index 2ec0f9c..1c61755 100644
> ---
> a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64=
-none-elf_9.2-2019.12.bb
> +++
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64=
-none-elf_9.2-2019.12.bb
> @@ -11,28 +11,3 @@ PROVIDES =3D "virtual/aarch64-none-elf-gcc"
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
> index 84f6dba..e0c220b 100644
> ---
> a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-non=
e-eabi_9-2019-q4-major.bb
> +++
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-non=
e-eabi_9-2019-q4-major.bb
> @@ -12,28 +12,3 @@ SRC_URI =3D
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
> index 0000000..7cfe5a3
> --- /dev/null
> +++
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host=
.inc
> @@ -0,0 +1,26 @@
> +S =3D "${WORKDIR}/${BPN}-${PV}"
> +
> +COMPATIBLE_HOST =3D "x86_64.*-linux"
> +
> +FILES_${PN} =3D "${datadir} ${bindir}"
> +
> +NAME =3D "${BPN}".strip("gcc-")
> +
> +do_install() {
> +    install -d ${D}${datadir}/${NAME}/
> +    cp -r ${S}/. ${D}${datadir}/${NAME}/
> +
> +    install -d ${D}${bindir}
> +    # Symlink all executables into bindir
> +    for f in ${D}${datadir}/${NAME}/bin/${NAME}-*; do
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
