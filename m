Subject: Re: [PATCH] arm-autonomy/xenguest-mkimage: add extra ramdisk support
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: Texas, US (217.140.99.251)
X-Originating-Platform: Windows Chrome 85
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 14 Oct 2020 05:02:45 -0700
References: <20201014115426.2608-1-kamil.dziezyk@arm.com>
In-Reply-To: <20201014115426.2608-1-kamil.dziezyk@arm.com>
Message-ID: <5151.1602676965297044761@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2020 at 12:55 PM, Kamil Dziezyk wrote:

>
> Some guest images requires a ramdisk, that is built with a custom recipe=
.
> This patch adds an option '--xen-ramdisk',
> for xenguest-mkimage script to cover that.
> Extra ramdisk support is also added to xenguest-image-extra bbclass,
> via 'XENGUEST_EXTRA_RAMDISK' variable.
>=20
> Issue-Id: SCM-1276
> Change-Id: I8ec74a37c0c96ca83a3489911186f3b3262f80fd
> Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  .../classes/xenguest-image-extra.bbclass        | 12 ++++++++++++
>  .../documentation/xenguest-mkimage.md           |  2 ++
>  .../xenguest/files/xenguest-mkimage             | 17 +++++++++++++++++
>  3 files changed, 31 insertions(+)
>=20
> diff --git a/meta-arm-autonomy/classes/xenguest-image-extra.bbclass
> b/meta-arm-autonomy/classes/xenguest-image-extra.bbclass
> index 502a083..533b973 100644
> --- a/meta-arm-autonomy/classes/xenguest-image-extra.bbclass
> +++ b/meta-arm-autonomy/classes/xenguest-image-extra.bbclass
> @@ -12,6 +12,11 @@ inherit xenguest-image
>  # recipes, the last recipe setting it will prevail.
>  XENGUEST_EXTRA_DTB ??=3D ""
>  
> +# Add a ramdisk file for the guest
> +# Only one file should be added, if this is set multiple times or in se=
veral
> +# recipes, the last recipe setting it will prevail.
> +XENGUEST_EXTRA_RAMDISK ??=3D ""
> +
>  # Append something to the guest xen configuration
>  # All files here will be merged together in the final xen configuration
>  # This can contain several files or be used in several recipes
> @@ -49,6 +54,13 @@ do_deploy_append() {
>          call_xenguest_mkimage partial --xen-device-tree=3D${XENGUEST_EX=
TRA_DTB}
>      fi
>  
> +    if [ -n "${XENGUEST_EXTRA_RAMDISK}" ]; then
> +        if [ ! -f ${XENGUEST_EXTRA_RAMDISK} ]; then
> +            die "xenguest-image: DTB file ${XENGUEST_EXTRA_RAMDISK} doe=
s not
> exist"
> +        fi
> +        call_xenguest_mkimage partial --xen-ramdisk=3D${XENGUEST_EXTRA_=
RAMDISK}
> +    fi
> +
>      if [ -n "${XENGUEST_EXTRA_XENCONFIG}" ]; then
>          for f in ${XENGUEST_EXTRA_XENCONFIG}; do
>              if [ ! -f $f ]; then
> diff --git a/meta-arm-autonomy/documentation/xenguest-mkimage.md
> b/meta-arm-autonomy/documentation/xenguest-mkimage.md
> index 3dcc28b..ece17f7 100644
> --- a/meta-arm-autonomy/documentation/xenguest-mkimage.md
> +++ b/meta-arm-autonomy/documentation/xenguest-mkimage.md
> @@ -99,6 +99,8 @@ For a detailed help on available operations, please us=
e:
>    times to add several command line options.
>  - --xen-device-tree=3DFILE: add dtb FILE as device tree. This both addi=
ng the
>    file to the image and modifying the xen configuration to use it.
> +- --xen-ramdisk=3DFILE: add ramdisk FILE as guest ramdisk. This both ad=
ding the
> +  file to the image and modifying the xen configuration to use it.
>  - --init-script=3DFILE: add guest init script. The script is embedded i=
nside
> the
>    image file. Several script can be added and the basename of FILE is u=
sed to
>    distinguish them (calling the option twice with the same file will up=
date
> the
> diff --git
> a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
> b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
> index 4c1b4a8..a3f987a 100755
> --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
> @@ -82,6 +82,9 @@ Xen configuration for the guest
>  --xen-device-tree=3D      disable device tree parameter in xen configur=
ation
>  --xen-device-tree=3DFILE  set guest device tree in xen configuration an=
d add
>                           file to xen files
> +--xen-ramdisk=3D          disable ramdisk parameter in xen configuratio=
n
> +--xen-ramdisk=3DFILE      set guest ramdisk in xen configuration and ad=
d
> +                         file to xen files
>  --xen-disk=3D             disable disk parameter in xen configuration
>  --xen-disk=3DDEV          set guest disk to device DEV (phy:DEV,xvda,w =
is set)
>  --xen-append=3DFILE       append FILE content to xen configuration
> @@ -668,6 +671,20 @@ for arg in "${@}"; do
>                  install -m 644 ${optarg} ${IMAGE_TMPDIR}/files/guest.dt=
b
>              fi
>              ;;
> +        --xen-ramdisk=3D*)
> +            if [ -z "${optarg}" ]; then
> +                xen_config_disable_param "ramdisk"
> +                rm -f ${IMAGE_TMPDIR}/files/ramdisk.img
> +            else
> +                if [ ! -f ${optarg} ]; then
> +                    echo "Error: invalid ramdisk file ${optarg}"
> +                    exit 1
> +                fi
> +                xen_config_set_string "ramdisk" "files/ramdisk.img"
> +                mkdir -p ${IMAGE_TMPDIR}/files
> +                install -m 644 ${optarg} ${IMAGE_TMPDIR}/files/ramdisk.=
img
> +            fi
> +            ;;
>          --xen-disk=3D*)
>              if [ -z "${optarg}" ]; then
>                  xen_config_disable_param "disk"
> --=20
> 2.17.1
>=20
>
