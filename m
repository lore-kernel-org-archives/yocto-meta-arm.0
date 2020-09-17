Subject: Re: [PATCH] arm-bsp/u-boot: fix THISDIR name collision in u-boot_%.bbappend
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: Austin, Texas, US (217.140.99.251)
X-Originating-Platform: Windows Chrome 85
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 17 Sep 2020 03:05:34 -0700
References: <20200917095817.27331-1-Nathan.Dunne@arm.com>
In-Reply-To: <20200917095817.27331-1-Nathan.Dunne@arm.com>
Message-ID: <29392.1600337134286144750@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2020 at 10:59 AM, Nathan Dunne wrote:

>
> Renamed ${THISDIR} user defined variable to ${THIS_DIR}, to prevent
> it from breaking ${THISDIR} macro in subsequent u-boot .bbappend files
>=20
> Change-Id: I4473ee5c3ac5c0aea9310557294cc9757579bdf1
> Issue-Id: SCM-1302
> Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
> ---

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

>  meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> index bf57242..5fc3723 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> @@ -1,7 +1,7 @@
>  # Machine specific u-boot
>  
> -THISDIR :=3D "${THISDIR}"
> -FILESEXTRAPATHS_prepend =3D "${THISDIR}/files/:${THISDIR}/${BP}:"
> +THIS_DIR :=3D "${THISDIR}"
> +FILESEXTRAPATHS_prepend =3D "${THIS_DIR}/files/:${THIS_DIR}/${BP}:"
>  FILESEXTRAPATHS_prepend_fvp-base :=3D "${THISDIR}/files/fvp-common:"
>  FILESEXTRAPATHS_prepend_foundation-armv8 :=3D "${THISDIR}/files/fvp-com=
mon:"
>  
> --=20
> 2.17.1
>=20
>
