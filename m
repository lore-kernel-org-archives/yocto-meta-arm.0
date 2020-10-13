Subject: Re: [PATCH 1/2] arm-autonomy: Drop foundation-armv8 support
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: Texas, US (217.140.99.251)
X-Originating-Platform: Windows Chrome 85
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 13 Oct 2020 02:48:26 -0700
References: <20201013094546.11726-1-Nathan.Dunne@arm.com>
In-Reply-To: <20201013094546.11726-1-Nathan.Dunne@arm.com>
Message-ID: <25751.1602582506599242033@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2020 at 10:46 AM, Nathan Dunne wrote:

>
> Remove foundation-armv8 overrides from arm-autonomy recipes.
>=20
> Change-Id: I7913ccdb3383bdf40b608fc852428716e1538318
> Issue-Id: SCM-1525
> Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
> ---
>  .../xen-devicetree/xen-devicetree.bbappend                 | 4 ----
>  .../xen/files/{fvp =3D> fvp-base}/early-printk.cfg           | 0
>  .../meta-arm-bsp/recipes-extended/xen/xen_%.bbappend       | 7 +------
>  .../recipes-extended/xenguest/xenguest-manager.bbappend    | 3 +--
>  .../recipes-extended/xenguest/xenguest-network.bbappend    | 2 --
>  .../meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend     | 1 -
>  6 files changed, 2 insertions(+), 15 deletions(-)
>  rename
> meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files=
/{fvp
> =3D> fvp-base}/early-printk.cfg (100%)
>=20
> diff --git
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-dev=
icetree/xen-devicetree.bbappend
> index 8284c63..2c875a9 100644
> ---

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-dev=
icetree/xen-devicetree.bbappend
> +++
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-dev=
icetree/xen-devicetree.bbappend
> @@ -21,7 +21,3 @@ XEN_DEVICETREE_XEN_BOOTARGS_append_n1sdp =3D " console=
=
=3Ddtuart
> dtuart=3Dserial0 boots
>  
>  XEN_DEVICETREE_DOM0_BOOTARGS_append_fvp-base =3D " root=3D/dev/vda2"
>  XEN_DEVICETREE_XEN_BOOTARGS_append_fvp-base =3D " console=3Ddtuart dtua=
rt=3Dserial0
> bootscrub=3D0"
> -
> -XEN_DEVICETREE_DOM0_BOOTARGS_append_foundation-armv8 =3D " root=3D/dev/=
vda2"
> -XEN_DEVICETREE_XEN_BOOTARGS_append_foundation-armv8 =3D " console=3Ddtu=
art
> dtuart=3Dserial0 bootscrub=3D0"
> -
> diff --git
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/fil=
es/fvp/early-printk.cfg
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/fil=
es/fvp-base/early-printk.cfg
> similarity index 100%
> rename from
> meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files=
/fvp/early-printk.cfg
> rename to
> meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files=
/fvp-base/early-printk.cfg
> diff --git
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen=
_%.bbappend
> index 89130a6..ef3cc23 100644
> ---
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen=
_%.bbappend
> +++
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen=
_%.bbappend
> @@ -1,11 +1,6 @@
> -# Foundation-armv8 support
> -COMPATIBLE_MACHINE_foundation-armv8 =3D "foundation-armv8"
> -FILESEXTRAPATHS_prepend_foundation-armv8 :=3D "${THISDIR}/files/fvp:"
> -SRC_URI_append_foundation-armv8 =3D " file://early-printk.cfg"
> -
>  # FVP Base support
>  COMPATIBLE_MACHINE_fvp-base =3D "fvp-base"
> -FILESEXTRAPATHS_prepend_fvp-base :=3D "${THISDIR}/files/fvp:"
> +FILESEXTRAPATHS_prepend_fvp-base :=3D "${THISDIR}/files:"
>  SRC_URI_append_fvp-base =3D " file://early-printk.cfg"
>  
>  # Juno support
> diff --git
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xengues=
t/xenguest-manager.bbappend
> index 874cfed..d9c88fb 100644
> ---
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xengues=
t/xenguest-manager.bbappend
> +++
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xengues=
t/xenguest-manager.bbappend
> @@ -1,6 +1,5 @@
>  # Board specific configuration for the manager
>  
> -# FVP and Foundation are using vda as hard drive and partition 2 is the
> +# FVP uses vda as hard drive and partition 2 is the
>  # default rootfs, so use vda3 for guest lvm
> -XENGUEST_MANAGER_VOLUME_DEVICE_foundation-armv8 ?=3D "/dev/vda3"
>  XENGUEST_MANAGER_VOLUME_DEVICE_fvp-base ?=3D "/dev/vda3"
> diff --git
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xengues=
t/xenguest-network.bbappend
> index 1efd7c6..1698d23 100644
> ---
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xengues=
t/xenguest-network.bbappend
> +++
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xengues=
t/xenguest-network.bbappend
> @@ -2,7 +2,5 @@ XENGUEST_NETWORK_BRIDGE_MEMBERS_n1sdp ?=3D "eth0"
>  
>  XENGUEST_NETWORK_BRIDGE_MEMBERS_fvp-base ?=3D "eth0"
>  
> -XENGUEST_NETWORK_BRIDGE_MEMBERS_foundation-armv8 ?=3D "eth0"
> -
>  # Juno board has 2 network interfaces, add both of them to the bridge
>  XENGUEST_NETWORK_BRIDGE_MEMBERS_juno ?=3D "eth0 eth1"
> diff --git
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/lin=
ux-%.bbappend
> index 5231f51..c8eaad7 100644
> ---
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/lin=
ux-%.bbappend
> +++
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/lin=
ux-%.bbappend
> @@ -13,4 +13,3 @@ LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE =3D
> "${@bb.utils.contains_any('DISTRO_FEATURE
>                                           '
> features/arm-autonomy/disable-arm64-sve.scc','',d)}"
>  
>  KERNEL_FEATURES_append_fvp-base =3D "${LINUX_ARM_AUTONOMY_DISABLE_ARM64=
_SVE}"
> -KERNEL_FEATURES_append_foundation-armv8 =3D
> "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE}"
> --=20
> 2.17.1
>=20
>
