Subject: Re: [PATCH 2/2] arm-autonomy: Move machine override soft assignments to inc files
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: Texas, US (217.140.99.251)
X-Originating-Platform: Windows Chrome 85
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 13 Oct 2020 02:49:09 -0700
References: <20201013094546.11726-2-Nathan.Dunne@arm.com>
In-Reply-To: <20201013094546.11726-2-Nathan.Dunne@arm.com>
Message-ID: <10217.1602582549507749190@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2020 at 10:46 AM, Nathan Dunne wrote:

>
> Moved assignments of the form:
>      MYVAR_$MACHINE ?=3D "val"
> to a machine specific .inc file, as the above will still set the
> value when the base variable has been set in local.conf, e.g:
>      MYVAR =3D "local_val"
> despite the weak assignment.
>=20
> Issue-Id: SCM-1524
> Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
> Change-Id: I3ba77453be785ec92ab45255cbd34d7d77bbcf37
> ---

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

>  .../conf/machine/arm-autonomy-machine-extra-settings.inc   | 2 ++
>  .../meta-arm-bsp/conf/machine/fvp-base-extra-settings.inc  | 7 +++++++
>  .../meta-arm-bsp/conf/machine/juno-extra-settings.inc      | 4 ++++
>  .../meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc     | 4 ++++
>  .../recipes-extended/xenguest/xenguest-manager.bbappend    | 5 -----
>  .../recipes-extended/xenguest/xenguest-network.bbappend    | 6 ------
>  6 files changed, 17 insertions(+), 11 deletions(-)
>  create mode 100644
> meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-extr=
a-settings.inc
>  create mode 100644
> meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-se=
ttings.inc
>  delete mode 100644
> meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/=
xenguest-manager.bbappend
>  delete mode 100644
> meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/=
xenguest-network.bbappend
>=20
> diff --git
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/arm-autonom=
y-machine-extra-settings.inc
> index fc24ee8..5f3d8f8 100644
> ---
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/arm-autonom=
y-machine-extra-settings.inc
> +++
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/arm-autonom=
y-machine-extra-settings.inc
> @@ -1,5 +1,7 @@
>  # Require extra machine specific settings
>  ARM_BSP_DYN_MACHINE_EXTRA_REQUIRE ?=3D ""
>  ARM_BSP_DYN_MACHINE_EXTRA_REQUIRE_n1sdp =3D "n1sdp-extra-settings.inc"
> +ARM_BSP_DYN_MACHINE_EXTRA_REQUIRE_fvp-base =3D "fvp-base-extra-settings=
.inc"
> +ARM_BSP_DYN_MACHINE_EXTRA_REQUIRE_juno =3D "juno-extra-settings.inc"
>  
>  require ${ARM_BSP_DYN_MACHINE_EXTRA_REQUIRE}
> diff --git
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-ex=
tra-settings.inc
> new file mode 100644
> index 0000000..eb16bc8
> --- /dev/null
> +++
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-ex=
tra-settings.inc
> @@ -0,0 +1,7 @@
> +# Extra machine settings for fvp-base
> +
> +# FVP uses vda as hard drive and partition 2 is the
> +# default rootfs, so use vda3 for guest lvm
> +XENGUEST_MANAGER_VOLUME_DEVICE ?=3D "/dev/vda3"
> +
> +XENGUEST_NETWORK_BRIDGE_MEMBERS ?=3D "eth0"
> diff --git
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-=
settings.inc
> new file mode 100644
> index 0000000..02600c5
> --- /dev/null
> +++
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-=
settings.inc
> @@ -0,0 +1,4 @@
> +# Extra machine settings for juno
> +
> +# Juno board has 2 network interfaces, add both of them to the bridge
> +XENGUEST_NETWORK_BRIDGE_MEMBERS ?=3D "eth0 eth1"
> diff --git
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra=
-settings.inc
> index 41c9433..472dd2a 100644
> ---
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra=
-settings.inc
> +++
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra=
-settings.inc
> @@ -1,3 +1,5 @@
> +# Extra machine settings for n1sdp
> +
>  # We need to extent the wks search path to be able to find the wks file=
 set
> in
>  # ARM_AUTONOMY_WKS_FILE.
>  WKS_SEARCH_PATH_prepend :=3D "${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic:"
> @@ -19,6 +21,8 @@ GRUB_CFG_FILE ?=3D
> "${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic/arm-autonomy-n1sdp-gru
>  # the "/" partition is /dev/sda2.
>  XENGUEST_MANAGER_VOLUME_DEVICE ?=3D "/dev/sda3"
>  
> +XENGUEST_NETWORK_BRIDGE_MEMBERS ?=3D "eth0"
> +
>  # The XEN_DEVICETREE_DEPEND and XEN_DEVICETREE_DTBS variables aftect th=
e
>  # xen-devicetree.bb recipe
>  XEN_DEVICETREE_DEPEND =3D "virtual/trusted-firmware-a:do_deploy"
> diff --git
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xengues=
t/xenguest-manager.bbappend
> deleted file mode 100644
> index d9c88fb..0000000
> ---
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xengues=
t/xenguest-manager.bbappend
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -# Board specific configuration for the manager
> -
> -# FVP uses vda as hard drive and partition 2 is the
> -# default rootfs, so use vda3 for guest lvm
> -XENGUEST_MANAGER_VOLUME_DEVICE_fvp-base ?=3D "/dev/vda3"
> diff --git
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xengues=
t/xenguest-network.bbappend
> deleted file mode 100644
> index 1698d23..0000000
> ---
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xengues=
t/xenguest-network.bbappend
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -XENGUEST_NETWORK_BRIDGE_MEMBERS_n1sdp ?=3D "eth0"
> -
> -XENGUEST_NETWORK_BRIDGE_MEMBERS_fvp-base ?=3D "eth0"
> -
> -# Juno board has 2 network interfaces, add both of them to the bridge
> -XENGUEST_NETWORK_BRIDGE_MEMBERS_juno ?=3D "eth0 eth1"
> --=20
> 2.17.1
>=20
>
