Subject: Re: [PATCH v2 2/4] trusted-firmware-a: add support for SPD (Secure Payload Dispatcher) services
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: GB (217.140.99.251)
X-Originating-Platform: Windows Chrome 81
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 15 May 2020 00:48:44 -0700
References: <1589489249-5459-2-git-send-email-denis@denix.org>
In-Reply-To: <1589489249-5459-2-git-send-email-denis@denix.org>
Message-ID: <22174.1589528924637373564@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2020 at 09:47 PM, Denys Dmytriyenko wrote:

>
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Some platforms use Secure Payload Dispatcher - allow selecting one with
> TFA_SPD.
>=20
> Official SPD description:
> /***********************************************************************=
********
>  * This is the Secure Payload Dispatcher (SPD). The dispatcher is meant =
to be
> a
>  * plug-in component to the Secure Monitor, registered as a runtime serv=
ice.
> The
>  * SPD is expected to be a functional extension of the Secure Payload (S=
P)
> that
>  * executes in Secure EL1. The Secure Monitor will delegate all SMCs tar=
geting
>  * the Trusted OS/Applications range to the dispatcher. The SPD will eit=
her
>  * handle the request locally or delegate it to the Secure Payload. It i=
s also
>  * responsible for initialising and maintaining communication with the S=
P.
>=20
> ************************************************************************=
******/
>=20
> Clean other EXTRA_OEMAKE to remove leading space not needed with +=3D
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
> v2 - replace boolean index trick
>=20
>  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc  | 14
> +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.=
inc
> b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index 899b778..25d5179 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -16,6 +16,11 @@ TFA_PLATFORM ?=3D "invalid"
>  # Leave empty for default behavior
>  TFA_BOARD ?=3D ""
>  
> +# Some platforms use SPD (Secure Payload Dispatcher) services
> +# Few options are "opteed", "tlkd", "trusty", "tspd"...
> +# Leave empty to not use SPD
> +TFA_SPD ?=3D ""
> +
>  # Build for debug (set TFA_DEBUG to 1 to activate)
>  TFA_DEBUG ?=3D "0"
>  
> @@ -73,16 +78,19 @@ EXTRA_OEMAKE +=3D "BUILD_BASE=3D${B} PLAT=3D${TFA_PL=
ATFORM}"
>  EXTRA_OEMAKE +=3D "${@'TARGET_BOARD=3D${TFA_BOARD}' if d.getVar('TFA_BO=
ARD') else
> ''}"
>  BUILD_DIR =3D "${TFA_PLATFORM}${@'/${TFA_BOARD}' if d.getVar('TFA_BOARD=
') else
> ''}"
>  
> +# Handle TFA_SPD parameter
> +EXTRA_OEMAKE +=3D "${@'SPD=3D${TFA_SPD}' if d.getVar('TFA_SPD') else ''=
}"
> +
>  # Handle TFA_DEBUG parameter
> -EXTRA_OEMAKE +=3D "${@bb.utils.contains('TFA_DEBUG', '1', '
> DEBUG=3D${TFA_DEBUG}', '', d)}"
> +EXTRA_OEMAKE +=3D "${@bb.utils.contains('TFA_DEBUG', '1', 'DEBUG=3D${TF=
A_DEBUG}',
> '', d)}"
>  
>  # Handle MBEDTLS
> -EXTRA_OEMAKE +=3D "${@bb.utils.contains('TFA_MBEDTLS', '1', '
> MBEDTLS_DIR=3D${TFA_MBEDTLS_DIR}', '', d)}"
> +EXTRA_OEMAKE +=3D "${@bb.utils.contains('TFA_MBEDTLS', '1',
> 'MBEDTLS_DIR=3D${TFA_MBEDTLS_DIR}', '', d)}"
>  
>  # Uboot support
>  DEPENDS +=3D " ${@bb.utils.contains('TFA_UBOOT', '1', 'u-boot', '', d)}=
"
>  do_compile[depends] +=3D " ${@bb.utils.contains('TFA_UBOOT', '1',
> 'u-boot:do_deploy', '', d)}"
> -EXTRA_OEMAKE +=3D "${@bb.utils.contains('TFA_UBOOT', '1', '
> BL33=3D${DEPLOY_DIR_IMAGE}/u-boot.bin', '',d)}"
> +EXTRA_OEMAKE +=3D "${@bb.utils.contains('TFA_UBOOT', '1',
> 'BL33=3D${DEPLOY_DIR_IMAGE}/u-boot.bin', '',d)}"
>  
>  # The following hack is needed to fit properly in yocto build environme=
nt
>  # TFA is forcing the host compiler and its flags in the Makefile using =
:=3D
> --=20
> 2.7.4
>=20
>
