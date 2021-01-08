Subject: Re: [PATCH 4/4] arm-autonomy/juno-firmware: add compressed kernel support
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: GB (217.140.99.251)
X-Originating-Platform: Linux Chrome 86
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 08 Jan 2021 02:58:49 -0800
References: <22eaf42b533a87469e2d32eca15d32f66dfbb44d.1606996678.git.diego.sueiro@arm.com>
In-Reply-To: <22eaf42b533a87469e2d32eca15d32f66dfbb44d.1606996678.git.diego.sueiro@arm.com>
Message-ID: <26578.1610103529034368188@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Jon,

Can you please backport this patch to gatesgarth?

Cheers,
Diego Sueiro

On Thu, Dec  3, 2020 at 12:03 PM, Diego Sueiro wrote:

>
> From: Kamil Dziezyk <kamil.dziezyk@arm.com>
>=20
> This patch adds support for lzma compressed kernel,
> by setting KERNEL_ALT_IMAGETYPE to 'Image.lzma' and
> adding additional decompression step during u-boot boot stage.
>=20
> U-boot automatic Image decompression cannot be used here,
> because if xen binary is the target of 'booti' command,
> Image is not being decompressed neither by u-boot nor by xen.
>=20
> Lzma compression is supported in u-boot with 'lzmadec' command,
> and does not require setting additional dependencies inside kernel recip=
e.
>=20
> Change-Id: I51b9aea962f8905f88b60ac28e71017c7d500189
> Issue-Id: SCM-1769
> Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ---
>  .../conf/machine/juno-extra-settings.inc      |  1 +
>  .../images/firmware-image-juno.bbappend       |  8 +++
>  .../firmware-image-juno/add-xen-support.patch | 69 ++++++++++++++-----
>  3 files changed, 60 insertions(+), 18 deletions(-)
>=20
> diff --git
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-=
settings.inc
> index ec7ed35..f8a16f4 100644
> ---
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-=
settings.inc
> +++
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-=
settings.inc
> @@ -1,4 +1,5 @@
>  # Extra machine settings for juno
> +KERNEL_ALT_IMAGETYPE =3D "Image.lzma"
>  
>  # Juno board has 2 network interfaces, add both of them to the bridge
>  XENGUEST_NETWORK_BRIDGE_MEMBERS ?=3D "eth0 eth1"
> diff --git
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmw=
are-image-juno.bbappend
> index 847e252..6b94dc9 100644
> ---
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmw=
are-image-juno.bbappend
> +++
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmw=
are-image-juno.bbappend
> @@ -39,4 +39,12 @@ do_deploy_prepend_xen() {
>      done
>  
>      bbnote "Xen binaries added under SOFTWARE/XEN directory"
> +
> +    if [ "${INITRAMFS_IMAGE_BUNDLE}" !=3D "1" -a "${KERNEL_ALT_IMAGETYP=
E}" =3D
> "Image.lzma" ]; then
> +        # KERNEL_ALT_IMAGETYPE is expected to be Image.lzma,
> +        # however NOR flash filesystem is DOS compatible with 8.3 namin=
g,
> +        # so we need to replace ".lzma" with ".lzm"
> +        cp -L -f ${DEPLOY_DIR_IMAGE}/${KERNEL_ALT_IMAGETYPE} \
> +                 ${D}/${UNPACK_DIR}/SOFTWARE/Image.lzm
> +    fi
>  }
> diff --git
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmw=
are-image-juno/add-xen-support.patch
> index 04098e1..29f1e06 100644
> ---
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmw=
are-image-juno/add-xen-support.patch
> +++
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmw=
are-image-juno/add-xen-support.patch
> @@ -9,9 +9,9 @@ It also adds customization for uEnv.txt file, that allow=
s to
> autoboot xen.
>  Upstream-Status: Inappropriate [configuration]
>  Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
>  
> -diff -r -u a/images-r0.txt b/images-r0.txt
> ---- a/images-r0.txt	2020-11-13 17:26:27.945942230 +0100
> -+++ b/images-r0.txt	2020-11-13 17:26:43.221881902 +0100
> +diff -u a/images-r0.txt b/images-r0.txt
> +--- a/images-r0.txt	2020-11-25 20:25:38.677687712 +0100
> ++++ b/images-r0.txt	2020-11-25 20:36:55.482194294 +0100
>  @@ -1,7 +1,7 @@
>   TITLE: Versatile Express Images Configuration File
>  =20
> @@ -21,7 +21,16 @@ diff -r -u a/images-r0.txt b/images-r0.txt
>  =20
>   NOR0UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
>   NOR0ADDRESS: 0x00000000          ;Image Flash Address
> -@@ -24,7 +24,7 @@
> +@@ -17,14 +17,14 @@
> +=20
> + NOR2UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
> + NOR2ADDRESS: 0x00500000          ;Image Flash Address
> +-NOR2FILE: \SOFTWARE\Image        ;Image File Name
> +-NOR2NAME: norkern                ;Rename kernel to norkern
> ++NOR2FILE: \SOFTWARE\Image.lzm    ;Image File Name
> ++NOR2NAME: norkern.lzm            ;Rename kernel to norkern.lzm
> + NOR2LOAD: 00000000               ;Image Load Address
> + NOR2ENTRY: 00000000              ;Image Entry Point
>  =20
>   NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
>   NOR3ADDRESS: 0x02900000          ;Image Flash Address
> @@ -46,9 +55,9 @@ diff -r -u a/images-r0.txt b/images-r0.txt
>  +NOR10NAME: xen
>  +NOR10LOAD: 00000000              ;Image Load Address
>  +NOR10ENTRY: 00000000             ;Image Entry Point
> -diff -r -u a/images-r1.txt b/images-r1.txt
> ---- a/images-r1.txt	2020-11-13 17:26:27.945942230 +0100
> -+++ b/images-r1.txt	2020-11-13 17:26:43.221881902 +0100
> +diff -u a/images-r1.txt b/images-r1.txt
> +--- a/images-r1.txt	2020-11-25 20:40:19.005177152 +0100
> ++++ b/images-r1.txt	2020-11-25 20:41:17.500886263 +0100
>  @@ -1,7 +1,7 @@
>   TITLE: Versatile Express Images Configuration File
>  =20
> @@ -58,7 +67,16 @@ diff -r -u a/images-r1.txt b/images-r1.txt
>  =20
>   NOR0UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
>   NOR0ADDRESS: 0x00000000          ;Image Flash Address
> -@@ -24,7 +24,7 @@
> +@@ -17,14 +17,14 @@
> +=20
> + NOR2UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
> + NOR2ADDRESS: 0x00500000          ;Image Flash Address
> +-NOR2FILE: \SOFTWARE\Image        ;Image File Name
> +-NOR2NAME: norkern                ;Rename kernel to norkern
> ++NOR2FILE: \SOFTWARE\Image.lzm    ;Image File Name
> ++NOR2NAME: norkern.lzm            ;Rename kernel to norkern.lzm
> + NOR2LOAD: 00000000               ;Image Load Address
> + NOR2ENTRY: 00000000              ;Image Entry Point
>  =20
>   NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
>   NOR3ADDRESS: 0x02900000          ;Image Flash Address
> @@ -83,9 +101,9 @@ diff -r -u a/images-r1.txt b/images-r1.txt
>  +NOR10NAME: xen
>  +NOR10LOAD: 00000000              ;Image Load Address
>  +NOR10ENTRY: 00000000             ;Image Entry Point
> -diff -r -u a/images-r2.txt b/images-r2.txt
> ---- a/images-r2.txt	2020-11-13 17:26:27.949942214 +0100
> -+++ b/images-r2.txt	2020-11-13 17:26:43.221881902 +0100
> +diff -u a/images-r2.txt b/images-r2.txt
> +--- a/images-r2.txt	2020-11-25 20:40:30.625119321 +0100
> ++++ b/images-r2.txt	2020-11-25 20:41:30.720820597 +0100
>  @@ -1,7 +1,7 @@
>   TITLE: Versatile Express Images Configuration File
>  =20
> @@ -95,7 +113,16 @@ diff -r -u a/images-r2.txt b/images-r2.txt
>  =20
>   NOR0UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
>   NOR0ADDRESS: 0x00000000          ;Image Flash Address
> -@@ -24,7 +24,7 @@
> +@@ -17,14 +17,14 @@
> +=20
> + NOR2UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
> + NOR2ADDRESS: 0x00500000          ;Image Flash Address
> +-NOR2FILE: \SOFTWARE\Image        ;Image File Name
> +-NOR2NAME: norkern                ;Rename kernel to norkern
> ++NOR2FILE: \SOFTWARE\Image.lzm    ;Image File Name
> ++NOR2NAME: norkern.lzm            ;Rename kernel to norkern.lzm
> + NOR2LOAD: 00000000               ;Image Load Address
> + NOR2ENTRY: 00000000              ;Image Entry Point
>  =20
>   NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
>   NOR3ADDRESS: 0x02900000          ;Image Flash Address
> @@ -120,21 +147,27 @@ diff -r -u a/images-r2.txt b/images-r2.txt
>  +NOR10NAME: xen
>  +NOR10LOAD: 00000000              ;Image Load Address
>  +NOR10ENTRY: 00000000             ;Image Entry Point
> -diff -r -u a/uEnv.txt b/uEnv.txt
> ---- a/uEnv.txt	2020-11-13 17:26:27.949942214 +0100
> -+++ b/uEnv.txt	2020-11-13 17:26:43.221881902 +0100
> -@@ -1,3 +1,5 @@
> +diff -u a/uEnv.txt b/uEnv.txt
> +--- a/uEnv.txt	2020-11-20 13:48:31.845078690 +0100
> ++++ b/uEnv.txt	2020-11-25 20:30:00.572306675 +0100
> +@@ -1,11 +1,16 @@
>  +xen_name=3Dxen
>  +xen_addr=3D0x84000000
>   uenvcmd=3Drun mybootcmd
> ++kernel_alt_name=3Dnorkern.lzm
> ++kernel_comp_addr_r=3D0x88080000
>   mybootcmd=3Decho Loading custom boot command; \
>   echo Loading kernel; \
> -@@ -7,5 +9,7 @@
> + afs load ${kernel_name} ${kernel_addr_r} ; \
> +-if test $? -eq 1; then echo Loading ${kernel_alt_name} instead of
> ${kernel_name}; afs load ${kernel_alt_name} ${kernel_addr_r}; fi; \
> ++if test $? -eq 1; then echo Loading ${kernel_alt_name} instead of
> ${kernel_name}; afs load ${kernel_alt_name} ${kernel_comp_addr_r}; lzmad=
ec
> ${kernel_comp_addr_r} ${kernel_addr_r}; fi; \
> + echo Loading device tree; \
>   afs load  ${fdtfile} ${fdt_addr_r}; \
>   if test $? -eq 1; then echo Loading ${fdt_alt_name} instead of ${fdtfi=
le}; \
>   afs load ${fdt_alt_name} ${fdt_addr_r}; fi; fdt addr ${fdt_addr_r}; fd=
t
> resize; \
>  -booti ${kernel_addr_r} - ${fdt_addr_r};
> +-
>  +echo Loading Xen; \
>  +afs load  ${xen_name} ${xen_addr}; \
>  +if test $? -eq 0; then echo Booting Xen; bootefi ${xen_addr} ${fdt_add=
r_r};
> fi;
> -=20
> +
> --=20
> 2.17.1
>=20
>
