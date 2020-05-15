Subject: Re: [PATCH v2 1/4] trusted-firmware-a: support multi-board platforms
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: GB (217.140.99.251)
X-Originating-Platform: Windows Chrome 81
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 15 May 2020 00:46:07 -0700
References: <1589489249-5459-1-git-send-email-denis@denix.org>
In-Reply-To: <1589489249-5459-1-git-send-email-denis@denix.org>
Message-ID: <22174.1589528767769018741@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2020 at 09:47 PM, Denys Dmytriyenko wrote:

>
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Some platforms can have multiple board configurations, passed as
> TARGET_BOARD=3D""
> that also becomes an extra directory level in the build output hierarchy=
.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
> v2 - replace boolean index trick
>=20
>  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc    | 12
> ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.=
inc
> b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index 4b5da7a..899b778 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -12,6 +12,10 @@ COMPATIBLE_MACHINE ?=3D "invalid"
>  # Platform must be set for each machine
>  TFA_PLATFORM ?=3D "invalid"
>  
> +# Some platforms can have multiple board configurations
> +# Leave empty for default behavior
> +TFA_BOARD ?=3D ""
> +
>  # Build for debug (set TFA_DEBUG to 1 to activate)
>  TFA_DEBUG ?=3D "0"
>  
> @@ -65,6 +69,10 @@ DEPENDS_append =3D " dtc-native openssl-native"
>  # Add platform parameter
>  EXTRA_OEMAKE +=3D "BUILD_BASE=3D${B} PLAT=3D${TFA_PLATFORM}"
>  
> +# Handle TFA_BOARD parameter
> +EXTRA_OEMAKE +=3D "${@'TARGET_BOARD=3D${TFA_BOARD}' if d.getVar('TFA_BO=
ARD') else
> ''}"
> +BUILD_DIR =3D "${TFA_PLATFORM}${@'/${TFA_BOARD}' if d.getVar('TFA_BOARD=
') else
> ''}"
> +
>  # Handle TFA_DEBUG parameter
>  EXTRA_OEMAKE +=3D "${@bb.utils.contains('TFA_DEBUG', '1', '
> DEBUG=3D${TFA_DEBUG}', '', d)}"
>  
> @@ -93,9 +101,9 @@ do_compile[cleandirs] =3D "${B}"
>  
>  do_install() {
>      if ${@"true" if d.getVar('TFA_DEBUG') =3D=3D '1' else "false"}; the=
n
> -        BUILD_PLAT=3D${B}/${TFA_PLATFORM}/debug/
> +        BUILD_PLAT=3D${B}/${BUILD_DIR}/debug/
>      else
> -        BUILD_PLAT=3D${B}/${TFA_PLATFORM}/release/
> +        BUILD_PLAT=3D${B}/${BUILD_DIR}/release/
>      fi
>  
>      install -d -m 755 ${D}/firmware
> --=20
> 2.7.4
>=20
>
