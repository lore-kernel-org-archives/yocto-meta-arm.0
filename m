Subject: Re: [PATCH 2/4] arm-autonomy/juno-image-customization: add host wks file
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: GB (217.140.99.251)
X-Originating-Platform: Linux Chrome 86
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 08 Jan 2021 02:58:18 -0800
References: <90485e9b687301d35fb7467668b1c429b98fb999.1606996678.git.diego.sueiro@arm.com>
In-Reply-To: <90485e9b687301d35fb7467668b1c429b98fb999.1606996678.git.diego.sueiro@arm.com>
Message-ID: <24569.1610103498877014602@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Jon,

Can you please backport this patch to gatesgarth?

Cheers,
Diego Sueiro

On Thu, Dec  3, 2020 at 12:01 PM, Diego Sueiro wrote:

>
> From: Kamil Dziezyk <kamil.dziezyk@arm.com>
>=20
> This patch also appends 'wic wic.gz wic.bmap' images,
> to IMAGE_FSTYPES.
>=20
> WKS file contains two partition entries:
>  * first is rootfs partition
>  * second is empty partition (4 GiB by default)
>=20
> Issue-Id: SCM-1520
> Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
> Change-Id: Ic0c79ee5eb4b08ad8f9c133b267feda1c85519a3
> ---
>  .../conf/machine/juno-extra-settings.inc      | 20 +++++++++++++++++++
>  .../wic/arm-autonomy-juno-disk.wks.in         | 11 ++++++++++
>  2 files changed, 31 insertions(+)
>  create mode 100644
> meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-juno-disk=
.wks.in
>=20
> diff --git
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-=
settings.inc
> index 110865d..ec7ed35 100644
> ---
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-=
settings.inc
> +++
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-=
settings.inc
> @@ -3,3 +3,23 @@
>  # Juno board has 2 network interfaces, add both of them to the bridge
>  XENGUEST_NETWORK_BRIDGE_MEMBERS ?=3D "eth0 eth1"
>  XEN_DEVICETREE_DOM0_SIZE ?=3D "0x02400000"
> +
> +# We need to extend the wks search path to be able to find the wks file=
 set
> in
> +# ARM_AUTONOMY_WKS_FILE.
> +WKS_SEARCH_PATH_prepend :=3D "${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic:"
> +
> +ARM_AUTONOMY_WKS_FILE ?=3D "arm-autonomy-juno-disk.wks.in"
> +# set wks file only if INITRAMFS_IMAGE_BUNDLE is not set
> +WKS_FILE =3D "${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', '',\
> +                                 '${ARM_AUTONOMY_WKS_FILE}', d)}"
> +
> +# Set the wks guest partition size and unit. It must be aligned with th=
e sum
> of
> +# all XENGUEST_IMAGE_DISK_SIZE set for the guests. By default, LVM2 met=
adata
> is
> +# 1 MiB per physical volume, hence it needs to be taken into account wh=
en
> +# setting GUEST_PART_SIZE. The XENGUEST_IMAGE_DISK_SIZE default value i=
s
> 4GiB.
> +GUEST_PART_SIZE ?=3D "4097"
> +GUEST_PART_SIZE_UNIT ?=3D "M"
> +
> +# set wic image type only if INITRAMFS_IMAGE_BUNDLE is not set
> +IMAGE_FSTYPES +=3D "${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1',=
 '',\
> +                                       'wic wic.gz wic.bmap', d)}"
> diff --git
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-juno-di=
sk.wks.in
> new file mode 100644
> index 0000000..5c5b24a
> --- /dev/null
> +++
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-juno-di=
sk.wks.in
> @@ -0,0 +1,11 @@
> +# short-description: Create a disk image
> +# long-description: Creates a partitioned disk image that the user
> +# can directly dd to boot media.
> +
> +# For Juno first partition is rootfs normally populated as /dev/sda1
> +part / --source rootfs --ondisk sda --fstype=3Dext4 --label root --alig=
n 1024
> +
> +# Second partition to accomodate guests images normally populated as
> /dev/sda2 (used by XENGUEST_MANAGER_VOLUME_DEVICE)
> +part --label guests --source empty --ondisk sda
> --size=3D"${GUEST_PART_SIZE}${GUEST_PART_SIZE_UNIT}" --system-id 8e --al=
ign 1024
> +
> +bootloader --ptable msdos
> --=20
> 2.17.1
>=20
>
