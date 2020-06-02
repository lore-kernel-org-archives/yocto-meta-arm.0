Subject: Re: [PATCH] arm-bsp: a5ds: change SRC_URI to git
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: GB (217.140.96.140)
X-Originating-Platform: Windows Chrome 81
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 01 Jun 2020 23:50:52 -0700
References: <20200601213448.27344-1-jon.mason@arm.com>
In-Reply-To: <20200601213448.27344-1-jon.mason@arm.com>
Message-ID: <14446.1591080652212139197@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun  1, 2020 at 10:35 PM, Jon Mason wrote:

>
> When building for a5ds dunfell, I am seeing the following error:
> fatal: unable to access
> 'https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux/': serve=
r
> certificate verification failed. CAfile: none CRLfile: none
>=20
> I do not see this error when using git instead of https to access the
> tree.  So, change to that access method (and it should be faster too).
>=20
> Change-Id: I8e793ece68edaaa918ed3c3a0e9b4e195775828f
> Signed-off-by: Jon Mason <jon.mason@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  .../recipes-kernel/linux/linux-upstream-arm-platforms.inc       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git
> a/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
> b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
> index 7b73e75..472cea8 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
> @@ -20,5 +20,5 @@ KBRANCH =3D ""
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b=
8814"
>  
>  SRC_URI =3D "\
> -      =20
> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux;protocol=3D=
https;nobranch=3D1
> \
> +      =20
> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux;protocol=3D=
git;nobranch=3D1
> \
>          "
> --=20
> 2.17.1
>=20
>
