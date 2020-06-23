Subject: Re: [PATCH 2/2] arm-bsp/scp-firmware: Build SCP MCP firmware for N1SDP
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: Fremont, California, US (217.140.99.251)
X-Originating-Platform: Windows Chrome 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 23 Jun 2020 00:05:47 -0700
References: <20200622141735.4951-2-khasim.mohammed@arm.com>
In-Reply-To: <20200622141735.4951-2-khasim.mohammed@arm.com>
Message-ID: <10477.1592895947964152071@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2020 at 03:18 PM, Khasim Mohammed wrote:

>
> - Add bbappend recipe to build SCP and MCP firmware
>   for N1SDP.
> - Use fiptool to package the binary images
> - Update machine conf to add image dependency
>   for SCP-firmware components
>=20
> Issue-Id: PLATFORMS-3134
>=20
> Change-Id: I24bb427179f2fdee0a8351257c9088d8024ca6b8
> Signed-off-by: Patrik Berglund <patrik.berglund@arm.com>
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  meta-arm-bsp/conf/machine/n1sdp.conf          |  1 +
>  .../scp-firmware/scp-firmware-n1sdp.inc       | 32 +++++++++++++++++++
>  .../scp-firmware/scp-firmware_git.bbappend    |  7 ++++
>  3 files changed, 40 insertions(+)
>  create mode 100644
> meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
>  create mode 100644
> meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_git.bbappend
>=20
> diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf
> b/meta-arm-bsp/conf/machine/n1sdp.conf
> index 20eaf27..755bb09 100644
> --- a/meta-arm-bsp/conf/machine/n1sdp.conf
> +++ b/meta-arm-bsp/conf/machine/n1sdp.conf
> @@ -27,6 +27,7 @@ PREFERRED_PROVIDER_virtual/trusted-firmware-a ?=3D
> "trusted-firmware-a"
>  PREFERRED_VERSION_trusted-firmware-a ?=3D "2.2%"
>  
>  EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a"
> +EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmware"
>  
>  #UEFI EDK2 firmware
>  EXTRA_IMAGEDEPENDS +=3D "virtual/uefi-firmware"
> diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.in=
c
> b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
> new file mode 100644
> index 0000000..ddbaac4
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
> @@ -0,0 +1,32 @@
> +# N1SDP specific SCP configurations and build instructions
> +
> +SRCREV_scp    =3D "fd7c83561a7d76c7681d5d017fb23aa3664c028c"
> +SRCREV_cmsis  =3D "refs/tags/5.2.0"
> +SCP_PLATFORM  =3D "n1sdp"
> +SCP_LOG_LEVEL =3D "INFO"
> +
> +COMPATIBLE_MACHINE_n1sdp =3D "n1sdp"
> +
> +PV =3D "2.6+git${SRCPV}"
> +
> +DEPENDS +=3D "fiptool-native"
> +DEPENDS +=3D "virtual/trusted-firmware-a"
> +
> +do_install_append() {
> +   fiptool \
> +       create \
> +       --scp-fw "${D}/firmware/scp_ramfw.bin" \
> +       --soc-fw "${RECIPE_SYSROOT}/firmware/bl31.bin" \
> +       "scp_fw.bin"
> +
> +   fiptool \
> +       create \
> +       --blob
> uuid=3D54464222-a4cf-4bf8-b1b6-cee7dade539e,file=3D"${D}/firmware/mcp_ra=
mfw.bin" \
> +       "mcp_fw.bin"
> +
> +   install "scp_fw.bin" "${D}/firmware/scp_fw.bin"
> +   install "mcp_fw.bin" "${D}/firmware/mcp_fw.bin"
> +
> +   ln -sf "scp_romfw.bin" "${D}/firmware/scp_rom.bin"
> +   ln -sf "mcp_romfw.bin" "${D}/firmware/mcp_rom.bin"
> +}
> diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_git.bbap=
pend
> b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_git.bbappend
> new file mode 100644
> index 0000000..53bd022
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_git.bbappend
> @@ -0,0 +1,7 @@
> +# Include machine specific SCP configurations
> +
> +MACHINE_SCP_REQUIRE ?=3D ""
> +
> +MACHINE_SCP_REQUIRE_n1sdp =3D "scp-firmware-n1sdp.inc"
> +
> +require ${MACHINE_SCP_REQUIRE}
> --=20
> 2.17.1
>=20
>
