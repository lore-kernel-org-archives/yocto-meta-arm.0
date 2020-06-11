Subject: Re: [PATCH] arm-bsp: Build UEFI EDK2 firmware for N1SDP
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: Fremont, California, US (217.140.99.251)
X-Originating-Platform: Windows Chrome 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 11 Jun 2020 05:21:12 -0700
References: <20200610160841.9949-1-khasim.mohammed@arm.com>
In-Reply-To: <20200610160841.9949-1-khasim.mohammed@arm.com>
Message-ID: <3097.1591878072867663797@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2020 at 05:09 PM, Khasim Mohammed wrote:

>
> - Add bbappend recipe to configure N1SDP specifics
> - Enable UEFI EDK2 firmware build for N1SDP.
> - Update machine conf to add dependency
>   for EDK2 firmware components
>=20
> Change-Id: I89d41c176f31bce6f1df7f3b3a7cd624b46c05e1
> Issue-Id: PLATFORMS-3134
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  meta-arm-bsp/conf/machine/n1sdp.conf          |  3 +++
>  .../recipes-bsp/uefi/edk2-firmware-n1sdp.inc  | 19 +++++++++++++++++++
>  .../uefi/edk2-firmware_git.bbappend           |  7 +++++++
>  3 files changed, 29 insertions(+)
>  create mode 100644 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.in=
c
>  create mode 100644 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbap=
pend
>=20
> diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf
> b/meta-arm-bsp/conf/machine/n1sdp.conf
> index 133fb89..20eaf27 100644
> --- a/meta-arm-bsp/conf/machine/n1sdp.conf
> +++ b/meta-arm-bsp/conf/machine/n1sdp.conf
> @@ -27,3 +27,6 @@ PREFERRED_PROVIDER_virtual/trusted-firmware-a ?=3D
> "trusted-firmware-a"
>  PREFERRED_VERSION_trusted-firmware-a ?=3D "2.2%"
>  
>  EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a"
> +
> +#UEFI EDK2 firmware
> +EXTRA_IMAGEDEPENDS +=3D "virtual/uefi-firmware"
> diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> new file mode 100644
> index 0000000..c8fc70a
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> @@ -0,0 +1,19 @@
> +SRC_URI =3D "\
> +  =20
> git://git.linaro.org/landing-teams/working/arm/edk2.git;name=3Dedk2;dest=
suffix=3D${S}/edk2;nobranch=3D1
> \
> +  =20
> git://git.linaro.org/landing-teams/working/arm/edk2-platforms.git;name=
=3Dedk2-platforms;destsuffix=3D${S}/edk2/edk2-platforms;nobranch=3D1
> \
> +"
> +
> +# TAGS and commit ID as per N1SDP-2020.03.26 release
> +SRCREV_edk2           =3D "3ff8a6bffabad761279817252014d59b6069d68a"
> +SRCREV_edk2-platforms =3D "b6bfc4417ff13168d69c4cbf2338f62c89c82dfd"
> +
> +# N1SDP specific EDK2 configurations
> +EDK2_BUILD_RELEASE =3D "0"
> +EDK2_PLATFORM      =3D "n1sdp"
> +EDK2_PLATFORM_DSC  =3D "N1SdpPkg/N1SdpPlatform.dsc"
> +EDK2_BIN_NAME      =3D "BL33_AP_UEFI.fd"
> +EDK2_ARCH          =3D "AARCH64"
> +
> +COMPATIBLE_MACHINE =3D "n1sdp"
> +
> +PV ?=3D "201908+git${SRCPV}"
> diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend
> b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend
> new file mode 100644
> index 0000000..dfebd87
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend
> @@ -0,0 +1,7 @@
> +# Include machine specific configurations for UEFI EDK2
> +
> +MACHINE_EDK2_REQUIRE ?=3D ""
> +
> +MACHINE_EDK2_REQUIRE_n1sdp =3D "edk2-firmware-n1sdp.inc"
> +
> +require ${MACHINE_EDK2_REQUIRE}
> --=20
> 2.17.1
>=20
>
