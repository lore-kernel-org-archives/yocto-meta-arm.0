Subject: Re: [PATCH] arm-toolchain: gcc-aarch64-none-elf: Add recipe
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: Cambridge, England, GB (94.5.236.244)
X-Originating-Platform: ChromeOS Chrome 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 20 May 2020 22:12:59 -0700
References: <1589964438-6924-1-git-send-email-denis@denix.org>
In-Reply-To: <1589964438-6924-1-git-send-email-denis@denix.org>
Message-ID: <22524.1590037979741392604@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2020 at 09:47 AM, Denys Dmytriyenko wrote:

>
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Adds a recipe to pull down the prebuilt GCC for compiling bare-metal tar=
gets
> for Aarch64 processors from ARM.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../gcc-aarch64-none-elf_9.2-2019.12.bb            | 38
> ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644
> meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-n=
one-elf_9.2-2019.12.bb
>=20
> diff --git
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64=
-none-elf_9.2-2019.12.bb
> new file mode 100644
> index 0000000..2ec0f9c
> --- /dev/null
> +++
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64=
-none-elf_9.2-2019.12.bb
> @@ -0,0 +1,38 @@
> +# Copyright (C) 2020 Texas Instruments Inc.
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY =3D "Baremetal GCC for Aarch64 processors"
> +LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
> +
> +LIC_FILES_CHKSUM =3D
> "file://share/doc/gcc/GNU-Free-Documentation-License.html;md5=3Dcc1e9a49=
a59ce7e6ae5ef37cd16eca0c"
> +
> +PROVIDES =3D "virtual/aarch64-none-elf-gcc"
> +
> +SRC_URI =3D
> "https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/bin=
rel/gcc-arm-${PV}-x86_64-aarch64-none-elf.tar.xz"
> +
> +SRC_URI[sha256sum] =3D
> "36d2cbe7c2984f2c20f562ac2f3ba524c59151adfa8ee10f1326c88de337b6d1"
> +
> +S =3D "${WORKDIR}/gcc-arm-${PV}-x86_64-aarch64-none-elf"
> +
> +COMPATIBLE_HOST =3D "x86_64.*-linux"
> +
> +do_install() {
> +    install -d ${D}${datadir}/aarch64-none-elf/
> +    cp -r ${S}/. ${D}${datadir}/aarch64-none-elf/
> +
> +    install -d ${D}${bindir}
> +    # Symlink all executables into bindir
> +    for f in ${D}${datadir}/aarch64-none-elf/bin/aarch64-none-elf-*; do
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

I see lots of commonalities (code duplication) with the gcc-arm-none-eabi_=
9-2019-q4-major.bb recipe. Isn't now a good opportunity to have a `.inc` to=
 avoid this?
The path inside the do_install can be easily controlled by a variable set =
from the recipes that are including it.

> --=20
> 2.7.4
>=20
>
