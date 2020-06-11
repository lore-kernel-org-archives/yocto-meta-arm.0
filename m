Subject: Re: [PATCH] meta-arm: Add UEFI EDK2 support for Arm platforms
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: Fremont, California, US (217.140.99.251)
X-Originating-Platform: Windows Chrome 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 11 Jun 2020 05:20:54 -0700
References: <20200610160758.9902-1-khasim.mohammed@arm.com>
In-Reply-To: <20200610160758.9902-1-khasim.mohammed@arm.com>
Message-ID: <3097.1591878054403513670@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2020 at 05:08 PM, Khasim Mohammed wrote:

>
> EDK2 Project is a modern, feature-rich, cross-platform
> firmware development environment for the UEFI specifications
> from www.uefi.org.
>=20
> This patch adds a new recipe to fetch, configure and build
> UEFI EDK2 firmware for Arm platforms.
>=20
> Change-Id: Icfb157e5b68d87accfd4290f522fc529fe4e849e
> Issue-Id: PLATFORMS-3134
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  meta-arm/recipes-bsp/uefi/edk2-firmware.inc   | 81 +++++++++++++++++++
>  .../recipes-bsp/uefi/edk2-firmware_git.bb     | 19 +++++
>  2 files changed, 100 insertions(+)
>  create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware.inc
>  create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
>=20
> diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> new file mode 100644
> index 0000000..7b9327c
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> @@ -0,0 +1,81 @@
> +SUMMARY =3D "UEFI EDK2 Firmware"
> +
> +PROVIDES +=3D "virtual/uefi-firmware"
> +
> +EDK2_BUILD_RELEASE   ?=3D "0"
> +EDK2_PLATFORM        ?=3D "invalid"
> +EDK2_PLATFORM_DSC    ?=3D ""
> +EDK2_BIN_NAME        ?=3D ""
> +EDK2_ARCH            ?=3D ""
> +
> +EDK2_BUILD_MODE =3D "${@bb.utils.contains('EDK2_BUILD_RELEASE', '1', 'R=
ELEASE',
> 'DEBUG', d)}"
> +
> +DEPENDS +=3D "util-linux-native iasl-native"
> +
> +inherit python3native
> +inherit deploy
> +
> +B =3D "${WORKDIR}/build"
> +S =3D "${WORKDIR}/git"
> +
> +COMPATIBLE_MACHINE ?=3D "invalid"
> +
> +LDFLAGS[unexport] =3D "1"
> +
> +# No configure
> +do_configure[noexec] =3D "1"
> +
> +# Set variables as per envsetup
> +export GCC5_AARCH64_PREFIX =3D "${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PR=
EFIX}"
> +export PACKAGES_PATH       =3D "${S}/edk2:${S}/edk2/edk2-platforms"
> +export WORKSPACE           =3D "${S}/edk2"
> +export EDK_TOOLS_PATH      =3D "${WORKSPACE}/BaseTools"
> +export PYTHON_COMMAND      =3D "${PYTHON}"
> +export CONF_PATH           =3D "${WORKSPACE}/Conf"
> +
> +export BTOOLS_PATH =3D "${EDK_TOOLS_PATH}/BinWrappers/PosixLike"
> +
> +python __anonymous() {
> +    # If GCC Version is greater than 4 then pass GCC5
> +    # set GCC5 by default
> +    d.setVar('GCC_VER', 'GCC5')
> +
> +    # Otherwise pass the corresponding version
> +    G =3D d.getVar('GCCVERSION',True).split(".")
> +    gcc_vlist =3D ['1', '2', '3', '4']
> +    if G[0] in gcc_vlist:
> +        d.setVar('GCC_VER', 'GCC'+G[0])
> +}
> +
> +do_compile() {
> +    # Copy the templates as we don't run envsetup
> +    cp ${EDK_TOOLS_PATH}/Conf/build_rule.template
> ${WORKSPACE}/Conf/build_rule.txt
> +    cp ${EDK_TOOLS_PATH}/Conf/tools_def.template
> ${WORKSPACE}/Conf/tools_def.txt
> +    cp ${EDK_TOOLS_PATH}/Conf/target.template ${WORKSPACE}/Conf/target.=
txt
> +
> +    # Build basetools
> +    oe_runmake -C ${S}/edk2/BaseTools
> +
> +    PATH=3D"${WORKSPACE}:${BTOOLS_PATH}:$PATH" \
> +    "${S}/edk2/BaseTools/BinWrappers/PosixLike/build" \
> +       -a "${EDK2_ARCH}" \
> +       -b ${EDK2_BUILD_MODE} \
> +       -t ${GCC_VER} \
> +       -p "${S}/edk2/edk2-platforms/Platform/ARM/${EDK2_PLATFORM_DSC}"
> +}
> +
> +do_install() {
> +    install -d ${D}/firmware
> +    install
> "${S}/edk2/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${GCC_VER}/FV/${EDK=
2_BIN_NAME}"
> "${D}/firmware/uefi.bin"
> +}
> +
> +FILES_${PN} =3D "/firmware"
> +SYSROOT_DIRS +=3D "/firmware"
> +# Skip QA check for relocations in .text of elf binaries
> +INSANE_SKIP_${PN} =3D "textrel"
> +
> +do_deploy() {
> +    # Copy the images to deploy directory
> +    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
> +}
> +addtask deploy after do_install
> diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
> b/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
> new file mode 100644
> index 0000000..4aadc3c
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION =3D "UEFI EDK2 Firmware for Arm reference platforms"
> +HOMEPAGE =3D "https://github.com/tianocore/edk2"
> +
> +LICENSE =3D "BSD-2-Clause-Patent"
> +
> +# EDK2
> +LIC_FILES_CHKSUM =3D
> "file://edk2/License.txt;md5=3D2b415520383f7964e96700ae12b4570a"
> +# EDK2 Platforms
> +LIC_FILES_CHKSUM +=3D
> "file://edk2/edk2-platforms/License.txt;md5=3D2b415520383f7964e96700ae12=
b4570a"
> +
> +SRC_URI ?=3D "\
> +  =20
> git://github.com/tianocore/edk2.git;name=3Dedk2;destsuffix=3D${S}/edk2;n=
obranch=3D1
> \
> +  =20
> git://github.com/tianocore/edk2-platforms.git;name=3Dedk2-platforms;dest=
suffix=3D${S}/edk2/edk2-platforms;nobranch=3D1
> \
> +"
> +SRCREV_edk2           ?=3D "6ff7c838d09224dd4e4c9b5b93152d8db1b19740"
> +SRCREV_edk2-platforms ?=3D "ed4cc8059ec551032f0d8b8c172e9ec19214a638"
> +SRCREV_FORMAT         =3D "edk2_edk2-platforms"
> +
> +require edk2-firmware.inc
> --=20
> 2.17.1
>=20
>
