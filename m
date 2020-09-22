Subject: Re: [PATCH] arm-autonomy/documentation: Update arm-autonomy-quickstart.md with dependencies
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: Austin, Texas, US (217.140.99.251)
X-Originating-Platform: Windows Chrome 85
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 22 Sep 2020 01:53:18 -0700
References: <20200922084639.15621-1-Nathan.Dunne@arm.com>
In-Reply-To: <20200922084639.15621-1-Nathan.Dunne@arm.com>
Message-ID: <26152.1600764798711534379@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2020 at 09:47 AM, Nathan Dunne wrote:

>
> Added dependencies on meta-kernel and meta-arm/meta-arm-toolchain layers
> to quick start guide instructions.
>=20
> Change-Id: I7d5a3c631ccdcc7a39b8003a958d5f68ecb606c7
> Issue-Id: SCM-1298
> Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
> ---

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

>  .../documentation/arm-autonomy-quickstart.md        | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
> b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
> index 2a457c1..eb02b3a 100644
> --- a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
> +++ b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
> @@ -26,6 +26,7 @@ First you must download the Yocto layers needed:
>   - [poky](https://git.yoctoproject.org/poky)
>   - [meta-virtualization](https://git.yoctoproject.org/meta-virtualizati=
on)
>   - [meta-arm](https://git.yoctoproject.org/meta-arm)
> + - [meta-kernel](https://gitlab.com/openembedded/community/meta-kernel.=
git)
>   - all other layers you might want to use
>  
>  For each of the downloaded layer make sure you checkout the release of =
Yocto
> @@ -56,8 +57,9 @@ Here are the main steps to create an arm-autonomy proj=
ect:
>    bitbake-layers add-layer $LAYERDIR_BASE/meta-poky
> $LAYERDIR_BASE/meta-yocto-bsp \
>     $LAYERDIR_BASE/meta-openembedded/meta-oe
> $LAYERDIR_BASE/meta-openembedded/meta-python \
>     $LAYERDIR_BASE/meta-openembedded/meta-filesystems
> $LAYERDIR_BASE/meta-openembedded/meta-networking \
> -   $LAYERDIR_BASE/meta-virtualization
> $LAYERDIR_BASE/meta-arm/meta-arm-autonomy \
> -   $LAYERDIR_BASE/meta-arm/meta-arm $LAYERDIR_BASE/meta-arm/meta-arm-bs=
p
> +   $LAYERDIR_BASE/meta-virtualization $LAYERDIR_BASE/meta-kernel \
> +   $LAYERDIR_BASE/meta-arm/meta-arm
> $LAYERDIR_BASE/meta-arm/meta-arm-toolchain \
> +   $LAYERDIR_BASE/meta-arm/meta-arm-bsp
> $LAYERDIR_BASE/meta-arm/meta-arm-autonomy \
>    ```
>  
>    Example of a `conf/bblayers.conf`:
> @@ -71,12 +73,17 @@ Here are the main steps to create an arm-autonomy pr=
oject:
>      /home/user/arm-autonomy/meta-openembedded/meta-filesystems \
>      /home/user/arm-autonomy/meta-openembedded/meta-networking \
>      /home/user/arm-autonomy/meta-virtualization \
> -    /home/user/arm-autonomy/meta-arm/meta-arm-autonomy \
> +    /home/user/arm-autonomy/meta-kernel \
>      /home/user/arm-autonomy/meta-arm/meta-arm \
> +    /home/user/arm-autonomy/meta-arm/meta-arm-toolchain \
>      /home/user/arm-autonomy/meta-arm/meta-arm-bsp \
> +    /home/user/arm-autonomy/meta-arm/meta-arm-autonomy \
>      "
>    ```
>  
> +  Be aware that changing the order may break some dependencies if editi=
ng the
> +  config file manually.
> +
>  Those steps will have to be done for each project you will have to crea=
te.
>  
>  Host project
> --=20
> 2.17.1
>=20
>
