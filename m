Subject: Re: [PATCH 1/2] arm/scp-firmware : allow setting scp log level to INFO or WARN
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: Fremont, California, US (217.140.99.251)
X-Originating-Platform: Windows Chrome 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 23 Jun 2020 00:05:43 -0700
References: <20200622141735.4951-1-khasim.mohammed@arm.com>
In-Reply-To: <20200622141735.4951-1-khasim.mohammed@arm.com>
Message-ID: <31688.1592895943168936989@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2020 at 03:18 PM, Khasim Mohammed wrote:

>
> SCP code has been updated with new logging framework. The patch
> is to allow setting of log level parameter to INFO or WARN.
>=20
> Change-Id: I20ec19a9aa1bdb7f59c067d2344c299c057a088b
> Issue-Id: PLATFORMS-3134
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc    | 2 ++
>  meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> index 1873848..2db59d3 100644
> --- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> +++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> @@ -6,6 +6,7 @@ SCP_BUILD_RELEASE   ?=3D "1"
>  SCP_COMPILE_VERBOSE ?=3D "0"
>  SCP_PLATFORM        ?=3D "invalid"
>  SCP_COMPILER        ?=3D "arm-none-eabi"
> +SCP_LOG_LEVEL       ?=3D "WARN"
>  
>  DEPENDS +=3D "virtual/arm-none-eabi-gcc-native"
>  
> @@ -39,6 +40,7 @@ EXTRA_OEMAKE =3D "${SCP_COMP_STR} \
>                  BUILD_PATH=3D'${B}' \
>                  PRODUCT=3D'${SCP_PLATFORM}' \
>                  MODE=3D'${SCP_BUILD_STR}' \
> +                LOG_LEVEL=3D'${SCP_LOG_LEVEL}' \
>                  CC=3D'${SCP_COMPILER}-gcc' \
>                  AR=3D'${SCP_COMPILER}-ar' \
>                  SIZE=3D'${SCP_COMPILER}-size' \
> diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> index 5ff5859..9cb8b64 100644
> --- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> +++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> @@ -13,7 +13,7 @@ SRC_URI =3D "\
>    =20
> git://github.com/ARM-software/CMSIS_5.git;protocol=3Dhttps;name=3Dcmsis;=
destsuffix=3Dsrc/cmsis;lfs=3D0;nobranch=3D1
> \
>  "
>  
> -SRCREV_scp    =3D "db19910aca6d1032eb0329e5fbb70a92b997f6f2"
> +SRCREV_scp    =3D "fd7c83561a7d76c7681d5d017fb23aa3664c028c"
>  SRCREV_cmsis  =3D "refs/tags/5.2.0"
>  SRCREV_FORMAT =3D "scp_cmsis"
>  
> --=20
> 2.17.1
>=20
>
