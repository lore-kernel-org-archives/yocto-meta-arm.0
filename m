Subject: Re: [PATCH 3/4] arm-autonomy/autonomy-host: add user defined partition to wic image
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: GB (217.140.99.251)
X-Originating-Platform: Linux Chrome 86
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 08 Jan 2021 02:58:37 -0800
References: <2fccfd908912d37a4faca298ddd8685bca45fe2e.1606996678.git.diego.sueiro@arm.com>
In-Reply-To: <2fccfd908912d37a4faca298ddd8685bca45fe2e.1606996678.git.diego.sueiro@arm.com>
Message-ID: <11979.1610103517167288341@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Jon,

Can you please backport this patch to gatesgarth?

Cheers,
Diego Sueiro

On Thu, Dec  3, 2020 at 12:02 PM, Diego Sueiro wrote:

>
> From: Kamil Dziezyk <kamil.dziezyk@arm.com>
>=20
> With this patch user can define additional partition entry,
> via AUTONOMY_HOST_EXTRA_PARTITION variable.
>=20
> Issue-Id: SCM-1514
> Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
> Change-Id: Ic103a40de44ea6cd88caa60f06033a9c678b265f
> ---
>  .../documentation/arm-autonomy-multiconfig.md | 34 +++++++++++++++++++
>  .../wic/arm-autonomy-juno-disk.wks.in         |  3 ++
>  .../wic/arm-autonomy-n1sdp-efidisk.wks.in     |  3 ++
>  3 files changed, 40 insertions(+)
>=20
> diff --git a/meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md
> b/meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md
> index 8c33501..4f4bb74 100644
> --- a/meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md
> +++ b/meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md
> @@ -159,3 +159,37 @@ and everything between `---Guest Config Start---` a=
nd
>  Any copies of variables that start `MC_GUEST` must be altered to avoid
>  collisions (e.g. `MC_GUEST_2_*`), and the name of the conf file must al=
so
>  be added to BBMULTICONFIG.
> +
> +
> +Guest with provisioned disk
> +----------------
> +
> +To add guest rootfs partition to host wic image,
> +set `AUTONOMY_HOST_EXTRA_PARTITION` with proper wks partition entry, e.=
g:
> +
> +```
> +AUTONOMY_HOST_EXTRA_PARTITION =3D "part --label provisioned-guest --sou=
rce
> rawcopy --fstype=3Dext4 --ondisk sda --align 1024 \
> +--sourceparams=3Dfile=3D${TOPDIR}/${MC_GUEST}/deploy/images/${MC_GUEST_=
MACHINE}/${MC_GUEST_FILENAME_PREFIX}-${MC_GUEST_MACHINE}.ext4"
> +```
> +
> +inside host.conf file.
> +
> +The rest of the configuration has to be appended to guest.conf file:
> +
> +```
> +XENGUEST_IMAGE_DISK_SIZE =3D "0"
> +XENGUEST_IMAGE_SRC_URI_XEN_CONFIG =3D "file://\${TOPDIR}/path/to/rootdi=
sk.cfg"
> +XENGUEST_IMAGE_DISK_DEVICE =3D "_GUEST_DISK_DEVICE_"
> +XENGUEST_IMAGE_ROOT =3D "/dev/xvda"
> +IMAGE_ROOTFS_SIZE =3D "102400"
> +IMAGE_FSTYPES =3D "ext4"
> +```
> +
> +content of rootdisk.cfg"
> +
> +```
> +disk =3D ["phy:_GUEST_DISK_DEVICE_,xvda,w"]
> +```
> +
> +`_GUEST_DISK_DEVICE_` should be substituted with `/dev/sdaX`,
> +according to wks file.
> diff --git
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-juno-di=
sk.wks.in
> index 5c5b24a..bfacb20 100644
> ---
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-juno-di=
sk.wks.in
> +++
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-juno-di=
sk.wks.in
> @@ -8,4 +8,7 @@ part / --source rootfs --ondisk sda --fstype=3Dext4 --la=
bel root
> --align 1024
>  # Second partition to accomodate guests images normally populated as
> /dev/sda2 (used by XENGUEST_MANAGER_VOLUME_DEVICE)
>  part --label guests --source empty --ondisk sda
> --size=3D"${GUEST_PART_SIZE}${GUEST_PART_SIZE_UNIT}" --system-id 8e --al=
ign 1024
>  
> +# Third partition is user defined entry normally populated as /dev/sda3
> +${AUTONOMY_HOST_EXTRA_PARTITION}
> +
>  bootloader --ptable msdos
> diff --git
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-e=
fidisk.wks.in
> index ded628c..b48ec77 100644
> ---
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-e=
fidisk.wks.in
> +++
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-e=
fidisk.wks.in
> @@ -11,4 +11,7 @@ part / --source rootfs --ondisk sda --fstype=3Dext4 --=
label
> root --align 1024
>  # Third partition to accomodate guests images normally populated as /de=
v/sda3
> (used by XENGUEST_MANAGER_VOLUME_DEVICE)
>  part --label guests --source empty --ondisk sda
> --size=3D"${GUEST_PART_SIZE}${GUEST_PART_SIZE_UNIT}" --system-id 8e --al=
ign 1024
>  
> +# Fourth partition is user defined entry normally populated as /dev/sda=
4
> +${AUTONOMY_HOST_EXTRA_PARTITION}
> +
>  bootloader --ptable msdos --configfile=3D"${GRUB_CFG_FILE}"
> --=20
> 2.17.1
>=20
>
