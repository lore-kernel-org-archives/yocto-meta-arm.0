Subject: Re: [PATCH] arm/fiptool : provides fiptool for packaging
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: Fremont, California, US (217.140.99.251)
X-Originating-Platform: Windows Chrome 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 23 Jun 2020 00:05:37 -0700
References: <20200622141612.4814-1-khasim.mohammed@arm.com>
In-Reply-To: <20200622141612.4814-1-khasim.mohammed@arm.com>
Message-ID: <14975.1592895937470124128@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2020 at 03:16 PM, Khasim Mohammed wrote:

>
> Firmware Image Package (FIP), is a packaging format used
> by TF-A to package the firmware images in a single binary,
> this tool is used to package the binaries in FIP format.
>=20
> Change-Id: Ie4108915c5d63be340d6f53148a6dff03d6d48e7
> Issue-Id: PLATFORMS-3134
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  .../fiptool/fiptool-native_2.3.bb             | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 meta-arm/recipes-devtools/fiptool/fiptool-native_2.3=
.bb
>=20
> diff --git a/meta-arm/recipes-devtools/fiptool/fiptool-native_2.3.bb
> b/meta-arm/recipes-devtools/fiptool/fiptool-native_2.3.bb
> new file mode 100644
> index 0000000..25ca111
> --- /dev/null
> +++ b/meta-arm/recipes-devtools/fiptool/fiptool-native_2.3.bb
> @@ -0,0 +1,29 @@
> +# Firmware Image Package (FIP)
> +# It is a packaging format used by TF-A to package the
> +# firmware images in a single binary.
> +
> +DESCRIPTION =3D "fiptool - Trusted Firmware tool for packaging"
> +LICENSE =3D "BSD-3-Clause"
> +
> +SRC_URI =3D
> "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;destsuffix=3D=
fiptool-${PV};protocol=3Dhttps;"
> +LIC_FILES_CHKSUM =3D
> "file://docs/license.rst;md5=3D189505435dbcdcc8caa63c46fe93fa89"
> +
> +# Use fiptool from TF-A v2.3
> +SRCREV =3D "ecd27ad85f1eba29f6bf92c39dc002c85b07dad5"
> +
> +DEPENDS +=3D "openssl-native"
> +
> +inherit native
> +
> +do_compile () {
> +    # These changes are needed to have the fiptool compiling and execut=
ing
> properly
> +    sed -i '/^LDLIBS/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/fiptool/Make=
file
> +    sed -i '/^INCLUDE_PATHS/ s,$, \$\{BUILD_CFLAGS},'
> ${S}/tools/fiptool/Makefile
> +
> +    oe_runmake fiptool
> +}
> +
> +do_install () {
> +    install -d ${D}${bindir}/
> +    install -m 0755 tools/fiptool/fiptool ${D}${bindir}
> +}
> --=20
> 2.17.1
>=20
>
