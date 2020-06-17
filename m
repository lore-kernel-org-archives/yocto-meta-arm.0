Subject: Re: [PATCH] arm-bsp/edk2-firmware: fix destsuffix and PV for recursion error
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: Fremont, California, US (217.140.99.251)
X-Originating-Platform: Windows Chrome 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 16 Jun 2020 22:59:15 -0700
References: <20200616165628.31305-1-khasim.mohammed@arm.com>
In-Reply-To: <20200616165628.31305-1-khasim.mohammed@arm.com>
Message-ID: <27775.1592373555078804777@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2020 at 05:56 PM, Khasim Mohammed wrote:

>
> Use relative paths in destsuffix as the paths are relative
> to ${WORKDIR} and turn the existing PV ?=3D into PV =3D

I think you missed the PV assignment in this patch.

>=20
> Change-Id: Ib9367a15dde611e5b74c11eeff330d0b5a3de75d
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ---
>  meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> index c8fc70a..a4c8e33 100644
> --- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> +++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> @@ -1,6 +1,6 @@
>  SRC_URI =3D "\
> -  =20
> git://git.linaro.org/landing-teams/working/arm/edk2.git;name=3Dedk2;dest=
suffix=3D${S}/edk2;nobranch=3D1
> \
> -  =20
> git://git.linaro.org/landing-teams/working/arm/edk2-platforms.git;name=
=3Dedk2-platforms;destsuffix=3D${S}/edk2/edk2-platforms;nobranch=3D1
> \
> +  =20
> git://git.linaro.org/landing-teams/working/arm/edk2.git;name=3Dedk2;dest=
suffix=3Dgit/edk2;nobranch=3D1
> \
> +  =20
> git://git.linaro.org/landing-teams/working/arm/edk2-platforms.git;name=
=3Dedk2-platforms;destsuffix=3Dgit/edk2/edk2-platforms;nobranch=3D1
> \
>  "
>  
>  # TAGS and commit ID as per N1SDP-2020.03.26 release
> --=20
> 2.17.1
>=20
>
