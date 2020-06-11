Subject: Re: [PATCH] arm-bsp: Fix gem5 build break
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: Fremont, California, US (217.140.99.251)
X-Originating-Platform: Windows Chrome 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 11 Jun 2020 06:18:29 -0700
References: <20200611124826.29927-1-jon.mason@arm.com>
In-Reply-To: <20200611124826.29927-1-jon.mason@arm.com>
Message-ID: <26867.1591881509665951548@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2020 at 01:48 PM, Jon Mason wrote:

>
> OE-core removed DEPLOY_DIR_TOOLS, which is causing a build break on gem5
> due to DEPLOY_DIR_TOOLS usage.  Temporarily define it in the recipe to
> get it working.
>=20
> Change-Id: I8d4d6e73009cab8ad7102045b855afcad34d3bf3
> Signed-off-by: Jon Mason <jon.mason@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  meta-arm-bsp/conf/machine/gem5-arm64.conf | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-arm-bsp/conf/machine/gem5-arm64.conf
> b/meta-arm-bsp/conf/machine/gem5-arm64.conf
> index 4db86c9..fc31bcf 100644
> --- a/meta-arm-bsp/conf/machine/gem5-arm64.conf
> +++ b/meta-arm-bsp/conf/machine/gem5-arm64.conf
> @@ -51,3 +51,5 @@ EXTRA_IMAGEDEPENDS +=3D "gem5-aarch64-native"
>  # rngd (Part of rng-tools) takes ~7 mins to init resulting in a slow bo=
ot
> time.
>  PACKAGE_EXCLUDE_append =3D " rng-tools"
>  IMAGE_INSTALL_append =3D " haveged"
> +
> +DEPLOY_DIR_TOOLS =3D "${DEPLOY_DIR}/tools"
> --=20
> 2.17.1
>=20
>
