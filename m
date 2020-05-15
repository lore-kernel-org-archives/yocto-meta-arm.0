Subject: Re: [PATCH] optee-os: replace old pycrypto with pycryptodome - a drop-in replacement
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: GB (217.140.99.251)
X-Originating-Platform: Windows Chrome 81
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 15 May 2020 00:44:30 -0700
References: <1589502694-24528-1-git-send-email-denis@denix.org>
In-Reply-To: <1589502694-24528-1-git-send-email-denis@denix.org>
Message-ID: <6362.1589528670740992908@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2020 at 01:31 AM, Denys Dmytriyenko wrote:

>
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> While pycryptodome is a drop-in replacement for the old pycrypto module,
> pycryptodomex uses a separate namespace to not confict with pycrypto.
> Unfortunately, optee-os uses both namespaces, hence both variants of
> pycryptodome and pycryptodomex are needed.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  meta-arm/recipes-security/optee/optee-os_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb
> b/meta-arm/recipes-security/optee/optee-os_git.bb
> index dfff6d1..c9847b5 100644
> --- a/meta-arm/recipes-security/optee/optee-os_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-os_git.bb
> @@ -10,7 +10,7 @@ PV =3D "3.8.0+git${SRCPV}"
>  inherit deploy python3native
>  require optee.inc
>  
> -DEPENDS =3D "python3-pycrypto-native python3-pyelftools-native
> python3-pycryptodomex-native"
> +DEPENDS =3D "python3-pycryptodome-native python3-pycryptodomex-native
> python3-pyelftools-native"
>  
>  SRCREV =3D "023e33656e2c9557ce50ad63a98b2e2c9b51c118"
>  SRC_URI =3D " \
> --=20
> 2.7.4
>=20
>
