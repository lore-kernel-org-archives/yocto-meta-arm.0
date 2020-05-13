Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.1802.1589409787619825131
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 May 2020 15:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cKWw154N;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id e16so1445696wra.7
        for <meta-arm@lists.yoctoproject.org>; Wed, 13 May 2020 15:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OSBVv7OTqm4BGIdBxs9f303SrkSS9zazUSlsWiIby4k=;
        b=cKWw154NGiD8Hlf1WjBa9cR5mkjN1FY7c/pzRMsxSypBpjDrQr7MaLK4H+JoAwaM+d
         nZBeiar3yD0Kad7Ikbb0RexRKQFEm93B7/SSOKbJjb9PIVICMszZeQzzpbgz83xc55IY
         fNr8sezhaPS5xsV9pUl3drNDIkpp7zLEvcW33NnDz+n9vJoMdpzcD48acugJBXfCs90l
         crnXB7CsBz0YJjVKpTaZJkUc7IUYp/LzCW/nu3PL7W37fZ7UOxH6EaTXyaLoFQWZxnR8
         9qFWUcBj9d3IR/Snuatx4hUs/mqt4RpZawU59hqBI4K/j1qID76p6Me4RQacSglr4/0M
         Sv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OSBVv7OTqm4BGIdBxs9f303SrkSS9zazUSlsWiIby4k=;
        b=A8Td1iJUxsIvIye/PKmZywsYfPCemoSx8BzNbxBVkg7Won3kUBXwDzg00jc+6pRDJQ
         kK3FRBqd7TnZ9cgHX9QqeNzpxsSW7nXCKKN10TvagvoNq9BR+orQ7UQnsz5+Bt/kZ/bp
         U4FMP6gd8mb8P/FwhzDAHjl3mOxod+DbNfCsdvBbm98qixlDAziqJL8kp5x8NuWn5Tys
         PWXVeAhoTBKh4Rv5ku2eBlF/94SwuFZ1allGf28kiOq19g5SvCxoJmd+oM/em+MeQqv2
         xOircG8O4RFEG+qTC2FpMsiAUmaaBC81s6LG+KakNL5+4Kl9r71yJA6vXBvi7Sjwzb5C
         QKwg==
X-Gm-Message-State: AOAM533Gl4/dHndYY1cA57uhcalov1+wCQ8GVRPM8MrzyZoO1bhLt8SK
	TKOZU26URDikR1Yjk+9Yx1UtKdc3zLztSTj4IhA=
X-Google-Smtp-Source: ABdhPJxMPfBSSvziVtq/gkKpxrqcdKQsrhq5Uzw/Gt6Ufp0AtZwNdt/EaYgYCXDOIMvj76f08Q0Y/eh699QLyzSwbbg=
X-Received: by 2002:adf:8401:: with SMTP id 1mr1767846wrf.241.1589409785961;
 Wed, 13 May 2020 15:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200513221134.30072-1-JPEWhacker@gmail.com> <20200513222711.GV11927@denix.org>
In-Reply-To: <20200513222711.GV11927@denix.org>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Wed, 13 May 2020 17:42:56 -0500
Message-ID: <CAJdd5Gb7wuph5BNQFmT+_WecVh7s91_24z-riVuooytaL+PspQ@mail.gmail.com>
Subject: Re: [meta-arm][PATCH] Add support for booting qemu with TFA and optee
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000b1e04305a58f4da2"

--000000000000b1e04305a58f4da2
Content-Type: text/plain; charset="UTF-8"

On Wed, May 13, 2020, 5:27 PM Denys Dmytriyenko <denis@denix.org> wrote:

> On Wed, May 13, 2020 at 05:11:34PM -0500, Joshua Watt wrote:
> > Adds support for booting AArch64 Qemu machines using TF-A + optee +
> > u-boot. Most of the changes are applicable to any AArch64 qemu target,
> > and a reference machine called qemuarm64-secureboot has been added that
> > show how to enable support for it.
>
> Can we hold on this patch, please? I want to review it thoroughly :)
>
> Also, it touches a lot of suff and throws a wrench into my TF-A work -
> I waited patiently to get all your changes in and kept rebasing my work.
> No more rebases, please, let me submit my changes first... :)
>

That's fine. I'm not in any hurry for this, just got it working and figured
I'd share it.


> Denys
>
>
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  .../conf/machine/qemuarm64-secureboot.conf    | 26 +++++++++++++
> >  .../trusted-firmware-a/trusted-firmware-a.inc | 39 ++++++++++++-------
> >  .../recipes-bsp/u-boot/u-boot/qemuarm64.cfg   |  4 ++
> >  meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend |  3 ++
> >  .../recipes-security/optee/optee-os_git.bb    |  6 +++
> >  meta-arm/recipes-security/optee/optee.inc     |  2 +-
> >  meta-arm/wic/qemuarm64.wks                    |  4 ++
> >  7 files changed, 70 insertions(+), 14 deletions(-)
> >  create mode 100644 meta-arm/conf/machine/qemuarm64-secureboot.conf
> >  create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot/qemuarm64.cfg
> >  create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
> >  create mode 100644 meta-arm/wic/qemuarm64.wks
> >
> > diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf
> b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> > new file mode 100644
> > index 0000000..cfb358b
> > --- /dev/null
> > +++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> > @@ -0,0 +1,26 @@
> > +MACHINEOVERRIDES =. "qemuarm64:"
> > +
> > +require ${COREBASE}/meta/conf/machine/qemuarm64.conf
> > +
> > +KMACHINE = "qemuarm64"
> > +
> > +UBOOT_MACHINE = "qemu_arm64_defconfig"
> > +
> > +# The 5.4 kernel panics when booting, so use the development kernel
> until the
> > +# default kernel is upgraded (5.5. supposedly works)
> > +PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-dev"
> > +
> > +QB_MACHINE = "-machine virt,secure=on"
> > +QB_OPT_APPEND += "-no-acpi"
> > +QB_MEM = "-m 1G"
> > +QB_DEFAULT_FSTYPE = "wic.qcow2"
> > +QB_DEFAULT_BIOS = "flash.bin-qemu"
> > +QB_FSINFO = "wic:no-kernel-in-fs"
> > +QB_ROOTFS_OPT = ""
> > +
> > +IMAGE_FSTYPES += "wic wic.qcow2"
> > +
> > +WKS_FILE ?= "qemuarm64.wks"
> > +WKS_FILE_DEPENDS = "trusted-firmware-a"
> > +IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
> > +
> > diff --git
> a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > index 4b5da7a..64497d6 100644
> > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > @@ -7,10 +7,11 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
> >
> >  inherit deploy nopackages
> >
> > -COMPATIBLE_MACHINE ?= "invalid"
> > +COMPATIBLE_MACHINE = "qemuarm64"
> >
> >  # Platform must be set for each machine
> >  TFA_PLATFORM ?= "invalid"
> > +TFA_PLATFORM_aarch64_qemuall = "qemu"
> >
> >  # Build for debug (set TFA_DEBUG to 1 to activate)
> >  TFA_DEBUG ?= "0"
> > @@ -35,16 +36,19 @@ SRCREV_FORMAT_append =
> "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbedtls', '',
> >  # U-boot support (set TFA_UBOOT to 1 to activate)
> >  # When U-Boot support is activated BL33 is activated with u-boot.bin
> file
> >  TFA_UBOOT ?= "0"
> > +TFA_UBOOT_aarch64_qemuall = "1"
> >
> >  # What to build
> >  # By default we only build bl1, do_deploy will copy
> >  # everything listed in this variable (by default bl1.bin)
> >  TFA_BUILD_TARGET ?= "bl1"
> > +TFA_BUILD_TARGET_aarch64_qemuall = "all fip"
> >
> >  # What to install
> >  # do_install and do_deploy will install everything listed in this
> >  # variable. It is set by default to TFA_BUILD_TARGET
> >  TFA_INSTALL_TARGET ?= "${TFA_BUILD_TARGET}"
> > +TFA_INSTALL_TARGET_aarch64_qemuall = "flash.bin"
> >
> >  # Requires CROSS_COMPILE set by hand as there is no configure script
> >  export CROSS_COMPILE="${TARGET_PREFIX}"
> > @@ -61,6 +65,7 @@ do_configure[noexec] = "1"
> >  # We need dtc for dtbs compilation
> >  # We need openssl for fiptool
> >  DEPENDS_append = " dtc-native openssl-native"
> > +DEPENDS_append_aarch64_qemuall = " optee-os"
> >
> >  # Add platform parameter
> >  EXTRA_OEMAKE += "BUILD_BASE=${B} PLAT=${TFA_PLATFORM}"
> > @@ -76,6 +81,15 @@ DEPENDS += " ${@bb.utils.contains('TFA_UBOOT', '1',
> 'u-boot', '', d)}"
> >  do_compile[depends] += " ${@bb.utils.contains('TFA_UBOOT', '1',
> 'u-boot:do_deploy', '', d)}"
> >  EXTRA_OEMAKE += "${@bb.utils.contains('TFA_UBOOT', '1', '
> BL33=${DEPLOY_DIR_IMAGE}/u-boot.bin', '',d)}"
> >
> > +EXTRA_OEMAKE_append_aarch64_qemuall = " \
> > +
> BL32=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-header_v2.bin
> \
> > +
> BL32_EXTRA1=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-pager_v2.bin
> \
> > +
> BL32_EXTRA2=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-pageable_v2.bin
> \
> > +    BL32_RAM_LOCATION=tdram \
> > +    SPD=opteed \
> > +    "
> > +BUILD_PLAT = "${B}/${TFA_PLATFORM}/${@"debug" if d.getVar("TFA_DEBUG")
> == "1" else "release"}/"
> > +
> >  # The following hack is needed to fit properly in yocto build
> environment
> >  # TFA is forcing the host compiler and its flags in the Makefile using
> :=
> >  # assignment for GCC and CFLAGS.
> > @@ -91,13 +105,12 @@ do_compile() {
> >  }
> >  do_compile[cleandirs] = "${B}"
> >
> > -do_install() {
> > -    if ${@"true" if d.getVar('TFA_DEBUG') == '1' else "false"}; then
> > -        BUILD_PLAT=${B}/${TFA_PLATFORM}/debug/
> > -    else
> > -        BUILD_PLAT=${B}/${TFA_PLATFORM}/release/
> > -    fi
> > +do_compile_append_aarch64_qemuall() {
> > +    dd if=${BUILD_PLAT}/bl1.bin of=${BUILD_PLAT}/flash.bin bs=4096
> conv=notrunc
> > +    dd if=${BUILD_PLAT}/fip.bin of=${BUILD_PLAT}/flash.bin seek=64
> bs=4096 conv=notrunc
> > +}
> >
> > +do_install() {
> >      install -d -m 755 ${D}/firmware
> >      for atfbin in ${TFA_INSTALL_TARGET}; do
> >          if [ "$atfbin" = "all" ]; then
> > @@ -106,17 +119,17 @@ do_install() {
> >              bberror "Please specify valid targets in TFA_INSTALL_TARGET
> or"
> >              bberror "rewrite or turn off do_install"
> >              exit 1
> > -        elif [ -f $BUILD_PLAT/$atfbin.bin ]; then
> > +        elif [ -f ${BUILD_PLAT}/$atfbin.bin ]; then
> >              echo "Install $atfbin.bin"
> > -            install -m 0644 $BUILD_PLAT/$atfbin.bin \
> > +            install -m 0644 ${BUILD_PLAT}/$atfbin.bin \
> >                  ${D}/firmware/$atfbin-${TFA_PLATFORM}.bin
> > -        elif [ -f $BUILD_PLAT/$atfbin/$atfbin.elf ]; then
> > +        elif [ -f ${BUILD_PLAT}/$atfbin/$atfbin.elf ]; then
> >              echo "Install $atfbin.elf"
> > -            install -m 0644 $BUILD_PLAT/$atfbin/$atfbin.elf \
> > +            install -m 0644 ${BUILD_PLAT}/$atfbin/$atfbin.elf \
> >                  ${D}/firmware/$atfbin-${TFA_PLATFORM}.elf
> > -        elif [ -f $BUILD_PLAT/$atfbin ]; then
> > +        elif [ -f ${BUILD_PLAT}/$atfbin ]; then
> >              echo "Install $atfbin"
> > -            install -m 0644 $BUILD_PLAT/$atfbin \
> > +            install -m 0644 ${BUILD_PLAT}/$atfbin \
> >                  ${D}/firmware/$atfbin-${TFA_PLATFORM}
> >          elif [ "$atfbin" = "dtbs" ]; then
> >              echo "dtbs install, skipped"
> > diff --git a/meta-arm/recipes-bsp/u-boot/u-boot/qemuarm64.cfg
> b/meta-arm/recipes-bsp/u-boot/u-boot/qemuarm64.cfg
> > new file mode 100644
> > index 0000000..de0c6ec
> > --- /dev/null
> > +++ b/meta-arm/recipes-bsp/u-boot/u-boot/qemuarm64.cfg
> > @@ -0,0 +1,4 @@
> > +CONFIG_TFABOOT=y
> > +# This must match the address that TF-A jumps to for BL33
> > +CONFIG_SYS_TEXT_BASE=0x60000000
> > +
> > diff --git a/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
> b/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
> > new file mode 100644
> > index 0000000..afcd70a
> > --- /dev/null
> > +++ b/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
> > @@ -0,0 +1,3 @@
> > +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> > +
> > +SRC_URI_append_qemuarm64-secureboot = " file://qemuarm64.cfg"
> > diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb
> b/meta-arm/recipes-security/optee/optee-os_git.bb
> > index dfff6d1..aa51376 100644
> > --- a/meta-arm/recipes-security/optee/optee-os_git.bb
> > +++ b/meta-arm/recipes-security/optee/optee-os_git.bb
> > @@ -21,7 +21,11 @@ SRC_URI = " \
> >  S = "${WORKDIR}/git"
> >
> >  OPTEEMACHINE ?= "${MACHINE}"
> > +OPTEEMACHINE_aarch64_qemuall = "vexpress-qemu_armv8a"
> > +OPTEEMACHINE_armv7a_qemuall = "vexpress-qemu_virt"
> > +
> >  OPTEEOUTPUTMACHINE ?= "${MACHINE}"
> > +OPTEEOUTPUTMACHINE_qemuall = "vexpress"
> >
> >  OPTEE_ARCH = "null"
> >  OPTEE_ARCH_armv7a = "arm32"
> > @@ -72,6 +76,8 @@ do_deploy() {
> >
> >  addtask deploy before do_build after do_install
> >
> > +SYSROOT_DIRS += "${nonarch_base_libdir}/firmware"
> > +
> >  FILES_${PN} = "${nonarch_base_libdir}/firmware/"
> >  FILES_${PN}-dev = "${includedir}/optee/"
> >
> > diff --git a/meta-arm/recipes-security/optee/optee.inc
> b/meta-arm/recipes-security/optee/optee.inc
> > index b3e5271..3138148 100644
> > --- a/meta-arm/recipes-security/optee/optee.inc
> > +++ b/meta-arm/recipes-security/optee/optee.inc
> > @@ -1,2 +1,2 @@
> > -COMPATIBLE_MACHINE ?= "invalid"
> > +COMPATIBLE_MACHINE = "qemuarm64"
> >  # Please add supported machines below or set it in .bbappend or .conf
> > diff --git a/meta-arm/wic/qemuarm64.wks b/meta-arm/wic/qemuarm64.wks
> > new file mode 100644
> > index 0000000..7285279
> > --- /dev/null
> > +++ b/meta-arm/wic/qemuarm64.wks
> > @@ -0,0 +1,4 @@
> > +bootloader --ptable gpt
> > +
> > +part /boot --ondisk=vda --align 64 --size=100M --active --source
> bootimg-partition --fstype=ext4 --label boot --sourceparams="loader=u-boot"
> > +part /     --ondisk=vda                                 --source
> rootfs            --fstype=ext4 --label root
> > --
> > 2.17.1
> >
>
> > 
>
>

--000000000000b1e04305a58f4da2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, May 13, 2020, 5:27 PM Denys Dmytriyenko &lt;<a=
 href=3D"mailto:denis@denix.org">denis@denix.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">On Wed, May 13, 2020 at 05:11:34PM -0500, Josh=
ua Watt wrote:<br>
&gt; Adds support for booting AArch64 Qemu machines using TF-A + optee +<b=
r>
&gt; u-boot. Most of the changes are applicable to any AArch64 qemu target=
,<br>
&gt; and a reference machine called qemuarm64-secureboot has been added th=
at<br>
&gt; show how to enable support for it.<br>
<br>
Can we hold on this patch, please? I want to review it thoroughly :)<br>
<br>
Also, it touches a lot of suff and throws a wrench into my TF-A work - <br=
>
I waited patiently to get all your changes in and kept rebasing my work. <=
br>
No more rebases, please, let me submit my changes first... :)<br></blockqu=
ote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">That&#39;s fi=
ne. I&#39;m not in any hurry for this, just got it working and figured I&#3=
9;d share it.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Denys<br>
<br>
<br>
&gt; Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com=
" target=3D"_blank" rel=3D"noreferrer">JPEWhacker@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../conf/machine/qemuarm64-secureboot.conf=C2=A0 =C2=A0 | 26 ++=
+++++++++++<br>
&gt;=C2=A0 .../trusted-firmware-a/trusted-firmware-a.inc | 39 ++++++++++++=
-------<br>
&gt;=C2=A0 .../recipes-bsp/u-boot/u-boot/qemuarm64.cfg=C2=A0 =C2=A0|=C2=A0=
 4 ++<br>
&gt;=C2=A0 meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend |=C2=A0 3 ++<br>
&gt;=C2=A0 .../recipes-security/optee/<a href=3D"http://optee-os_git.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">optee-os_git.bb</a>=C2=A0 =
=C2=A0 |=C2=A0 6 +++<br>
&gt;=C2=A0 meta-arm/recipes-security/optee/optee.inc=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
&gt;=C2=A0 meta-arm/wic/qemuarm64.wks=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++<br>
&gt;=C2=A0 7 files changed, 70 insertions(+), 14 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta-arm/conf/machine/qemuarm64-secureboot.c=
onf<br>
&gt;=C2=A0 create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot/qemuarm64=
.cfg<br>
&gt;=C2=A0 create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot_%.bbappen=
d<br>
&gt;=C2=A0 create mode 100644 meta-arm/wic/qemuarm64.wks<br>
&gt; <br>
&gt; diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-a=
rm/conf/machine/qemuarm64-secureboot.conf<br>
&gt; new file mode 100644<br>
&gt; index 0000000..cfb358b<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf<br>
&gt; @@ -0,0 +1,26 @@<br>
&gt; +MACHINEOVERRIDES =3D. &quot;qemuarm64:&quot;<br>
&gt; +<br>
&gt; +require ${COREBASE}/meta/conf/machine/qemuarm64.conf<br>
&gt; +<br>
&gt; +KMACHINE =3D &quot;qemuarm64&quot;<br>
&gt; +<br>
&gt; +UBOOT_MACHINE =3D &quot;qemu_arm64_defconfig&quot;<br>
&gt; +<br>
&gt; +# The 5.4 kernel panics when booting, so use the development kernel =
until the<br>
&gt; +# default kernel is upgraded (5.5. supposedly works)<br>
&gt; +PREFERRED_PROVIDER_virtual/kernel =3D &quot;linux-yocto-dev&quot;<br=
>
&gt; +<br>
&gt; +QB_MACHINE =3D &quot;-machine virt,secure=3Don&quot;<br>
&gt; +QB_OPT_APPEND +=3D &quot;-no-acpi&quot;<br>
&gt; +QB_MEM =3D &quot;-m 1G&quot;<br>
&gt; +QB_DEFAULT_FSTYPE =3D &quot;wic.qcow2&quot;<br>
&gt; +QB_DEFAULT_BIOS =3D &quot;flash.bin-qemu&quot;<br>
&gt; +QB_FSINFO =3D &quot;wic:no-kernel-in-fs&quot;<br>
&gt; +QB_ROOTFS_OPT =3D &quot;&quot;<br>
&gt; +<br>
&gt; +IMAGE_FSTYPES +=3D &quot;wic wic.qcow2&quot;<br>
&gt; +<br>
&gt; +WKS_FILE ?=3D &quot;qemuarm64.wks&quot;<br>
&gt; +WKS_FILE_DEPENDS =3D &quot;trusted-firmware-a&quot;<br>
&gt; +IMAGE_BOOT_FILES =3D &quot;${KERNEL_IMAGETYPE}&quot;<br>
&gt; +<br>
&gt; diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc<br>
&gt; index 4b5da7a..64497d6 100644<br>
&gt; --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc<=
br>
&gt; +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc<=
br>
&gt; @@ -7,10 +7,11 @@ PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 inherit deploy nopackages<br>
&gt;=C2=A0 <br>
&gt; -COMPATIBLE_MACHINE ?=3D &quot;invalid&quot;<br>
&gt; +COMPATIBLE_MACHINE =3D &quot;qemuarm64&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Platform must be set for each machine<br>
&gt;=C2=A0 TFA_PLATFORM ?=3D &quot;invalid&quot;<br>
&gt; +TFA_PLATFORM_aarch64_qemuall =3D &quot;qemu&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Build for debug (set TFA_DEBUG to 1 to activate)<br>
&gt;=C2=A0 TFA_DEBUG ?=3D &quot;0&quot;<br>
&gt; @@ -35,16 +36,19 @@ SRCREV_FORMAT_append =3D &quot;${@bb.utils.contai=
ns(&#39;TFA_MBEDTLS&#39;, &#39;1&#39;, &#39;_mbedtls&#39;, &#39;&#39;,<br>
&gt;=C2=A0 # U-boot support (set TFA_UBOOT to 1 to activate)<br>
&gt;=C2=A0 # When U-Boot support is activated BL33 is activated with u-boo=
t.bin file<br>
&gt;=C2=A0 TFA_UBOOT ?=3D &quot;0&quot;<br>
&gt; +TFA_UBOOT_aarch64_qemuall =3D &quot;1&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # What to build<br>
&gt;=C2=A0 # By default we only build bl1, do_deploy will copy<br>
&gt;=C2=A0 # everything listed in this variable (by default bl1.bin)<br>
&gt;=C2=A0 TFA_BUILD_TARGET ?=3D &quot;bl1&quot;<br>
&gt; +TFA_BUILD_TARGET_aarch64_qemuall =3D &quot;all fip&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # What to install<br>
&gt;=C2=A0 # do_install and do_deploy will install everything listed in th=
is<br>
&gt;=C2=A0 # variable. It is set by default to TFA_BUILD_TARGET<br>
&gt;=C2=A0 TFA_INSTALL_TARGET ?=3D &quot;${TFA_BUILD_TARGET}&quot;<br>
&gt; +TFA_INSTALL_TARGET_aarch64_qemuall =3D &quot;flash.bin&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Requires CROSS_COMPILE set by hand as there is no configure s=
cript<br>
&gt;=C2=A0 export CROSS_COMPILE=3D&quot;${TARGET_PREFIX}&quot;<br>
&gt; @@ -61,6 +65,7 @@ do_configure[noexec] =3D &quot;1&quot;<br>
&gt;=C2=A0 # We need dtc for dtbs compilation<br>
&gt;=C2=A0 # We need openssl for fiptool<br>
&gt;=C2=A0 DEPENDS_append =3D &quot; dtc-native openssl-native&quot;<br>
&gt; +DEPENDS_append_aarch64_qemuall =3D &quot; optee-os&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Add platform parameter<br>
&gt;=C2=A0 EXTRA_OEMAKE +=3D &quot;BUILD_BASE=3D${B} PLAT=3D${TFA_PLATFORM=
}&quot;<br>
&gt; @@ -76,6 +81,15 @@ DEPENDS +=3D &quot; ${@bb.utils.contains(&#39;TFA_=
UBOOT&#39;, &#39;1&#39;, &#39;u-boot&#39;, &#39;&#39;, d)}&quot;<br>
&gt;=C2=A0 do_compile[depends] +=3D &quot; ${@bb.utils.contains(&#39;TFA_U=
BOOT&#39;, &#39;1&#39;, &#39;u-boot:do_deploy&#39;, &#39;&#39;, d)}&quot;<b=
r>
&gt;=C2=A0 EXTRA_OEMAKE +=3D &quot;${@bb.utils.contains(&#39;TFA_UBOOT&#39=
;, &#39;1&#39;, &#39; BL33=3D${DEPLOY_DIR_IMAGE}/u-boot.bin&#39;, &#39;&#39=
;,d)}&quot;<br>
&gt;=C2=A0 <br>
&gt; +EXTRA_OEMAKE_append_aarch64_qemuall =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 BL32=3D${STAGING_DIR_TARGET}${nonarch_base_libdir}/fir=
mware/tee-header_v2.bin \<br>
&gt; +=C2=A0 =C2=A0 BL32_EXTRA1=3D${STAGING_DIR_TARGET}${nonarch_base_libd=
ir}/firmware/tee-pager_v2.bin \<br>
&gt; +=C2=A0 =C2=A0 BL32_EXTRA2=3D${STAGING_DIR_TARGET}${nonarch_base_libd=
ir}/firmware/tee-pageable_v2.bin \<br>
&gt; +=C2=A0 =C2=A0 BL32_RAM_LOCATION=3Dtdram \<br>
&gt; +=C2=A0 =C2=A0 SPD=3Dopteed \<br>
&gt; +=C2=A0 =C2=A0 &quot;<br>
&gt; +BUILD_PLAT =3D &quot;${B}/${TFA_PLATFORM}/${@&quot;debug&quot; if d.=
getVar(&quot;TFA_DEBUG&quot;) =3D=3D &quot;1&quot; else &quot;release&quot;=
}/&quot;<br>
&gt; +<br>
&gt;=C2=A0 # The following hack is needed to fit properly in yocto build e=
nvironment<br>
&gt;=C2=A0 # TFA is forcing the host compiler and its flags in the Makefil=
e using :=3D<br>
&gt;=C2=A0 # assignment for GCC and CFLAGS.<br>
&gt; @@ -91,13 +105,12 @@ do_compile() {<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 do_compile[cleandirs] =3D &quot;${B}&quot;<br>
&gt;=C2=A0 <br>
&gt; -do_install() {<br>
&gt; -=C2=A0 =C2=A0 if ${@&quot;true&quot; if d.getVar(&#39;TFA_DEBUG&#39;=
) =3D=3D &#39;1&#39; else &quot;false&quot;}; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 BUILD_PLAT=3D${B}/${TFA_PLATFORM}/debug/=
<br>
&gt; -=C2=A0 =C2=A0 else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 BUILD_PLAT=3D${B}/${TFA_PLATFORM}/releas=
e/<br>
&gt; -=C2=A0 =C2=A0 fi<br>
&gt; +do_compile_append_aarch64_qemuall() {<br>
&gt; +=C2=A0 =C2=A0 dd if=3D${BUILD_PLAT}/bl1.bin of=3D${BUILD_PLAT}/flash=
.bin bs=3D4096 conv=3Dnotrunc<br>
&gt; +=C2=A0 =C2=A0 dd if=3D${BUILD_PLAT}/fip.bin of=3D${BUILD_PLAT}/flash=
.bin seek=3D64 bs=3D4096 conv=3Dnotrunc<br>
&gt; +}<br>
&gt;=C2=A0 <br>
&gt; +do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -d -m 755 ${D}/firmware<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for atfbin in ${TFA_INSTALL_TARGET}; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$atfbin&quot; =3D &quot;=
all&quot; ]; then<br>
&gt; @@ -106,17 +119,17 @@ do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bberror &quot;Please =
specify valid targets in TFA_INSTALL_TARGET or&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bberror &quot;rewrite=
 or turn off do_install&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif [ -f $BUILD_PLAT/$atfbin.bin ]; the=
n<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif [ -f ${BUILD_PLAT}/$atfbin.bin ]; t=
hen<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Install $a=
tfbin.bin&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 $BUILD_PLA=
T/$atfbin.bin \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${BUILD_PL=
AT}/$atfbin.bin \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}/fi=
rmware/$atfbin-${TFA_PLATFORM}.bin<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif [ -f $BUILD_PLAT/$atfbin/$atfbin.el=
f ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif [ -f ${BUILD_PLAT}/$atfbin/$atfbin.=
elf ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Install $a=
tfbin.elf&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 $BUILD_PLA=
T/$atfbin/$atfbin.elf \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${BUILD_PL=
AT}/$atfbin/$atfbin.elf \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}/fi=
rmware/$atfbin-${TFA_PLATFORM}.elf<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif [ -f $BUILD_PLAT/$atfbin ]; then<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif [ -f ${BUILD_PLAT}/$atfbin ]; then<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Install $a=
tfbin&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 $BUILD_PLA=
T/$atfbin \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${BUILD_PL=
AT}/$atfbin \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}/fi=
rmware/$atfbin-${TFA_PLATFORM}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif [ &quot;$atfbin&quot; =3D &quo=
t;dtbs&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;dtbs insta=
ll, skipped&quot;<br>
&gt; diff --git a/meta-arm/recipes-bsp/u-boot/u-boot/qemuarm64.cfg b/meta-=
arm/recipes-bsp/u-boot/u-boot/qemuarm64.cfg<br>
&gt; new file mode 100644<br>
&gt; index 0000000..de0c6ec<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-arm/recipes-bsp/u-boot/u-boot/qemuarm64.cfg<br>
&gt; @@ -0,0 +1,4 @@<br>
&gt; +CONFIG_TFABOOT=3Dy<br>
&gt; +# This must match the address that TF-A jumps to for BL33<br>
&gt; +CONFIG_SYS_TEXT_BASE=3D0x60000000<br>
&gt; +<br>
&gt; diff --git a/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
/recipes-bsp/u-boot/u-boot_%.bbappend<br>
&gt; new file mode 100644<br>
&gt; index 0000000..afcd70a<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend<br>
&gt; @@ -0,0 +1,3 @@<br>
&gt; +FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
&gt; +<br>
&gt; +SRC_URI_append_qemuarm64-secureboot =3D &quot; file://qemuarm64.cfg&=
quot;<br>
&gt; diff --git a/meta-arm/recipes-security/optee/<a href=3D"http://optee-=
os_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">optee-os_git.bb<=
/a> b/meta-arm/recipes-security/optee/<a href=3D"http://optee-os_git.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">optee-os_git.bb</a><br>
&gt; index dfff6d1..aa51376 100644<br>
&gt; --- a/meta-arm/recipes-security/optee/<a href=3D"http://optee-os_git.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">optee-os_git.bb</a><br>
&gt; +++ b/meta-arm/recipes-security/optee/<a href=3D"http://optee-os_git.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">optee-os_git.bb</a><br>
&gt; @@ -21,7 +21,11 @@ SRC_URI =3D &quot; \<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 OPTEEMACHINE ?=3D &quot;${MACHINE}&quot;<br>
&gt; +OPTEEMACHINE_aarch64_qemuall =3D &quot;vexpress-qemu_armv8a&quot;<br=
>
&gt; +OPTEEMACHINE_armv7a_qemuall =3D &quot;vexpress-qemu_virt&quot;<br>
&gt; +<br>
&gt;=C2=A0 OPTEEOUTPUTMACHINE ?=3D &quot;${MACHINE}&quot;<br>
&gt; +OPTEEOUTPUTMACHINE_qemuall =3D &quot;vexpress&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 OPTEE_ARCH =3D &quot;null&quot;<br>
&gt;=C2=A0 OPTEE_ARCH_armv7a =3D &quot;arm32&quot;<br>
&gt; @@ -72,6 +76,8 @@ do_deploy() {<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 addtask deploy before do_build after do_install<br>
&gt;=C2=A0 <br>
&gt; +SYSROOT_DIRS +=3D &quot;${nonarch_base_libdir}/firmware&quot;<br>
&gt; +<br>
&gt;=C2=A0 FILES_${PN} =3D &quot;${nonarch_base_libdir}/firmware/&quot;<br=
>
&gt;=C2=A0 FILES_${PN}-dev =3D &quot;${includedir}/optee/&quot;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/rec=
ipes-security/optee/optee.inc<br>
&gt; index b3e5271..3138148 100644<br>
&gt; --- a/meta-arm/recipes-security/optee/optee.inc<br>
&gt; +++ b/meta-arm/recipes-security/optee/optee.inc<br>
&gt; @@ -1,2 +1,2 @@<br>
&gt; -COMPATIBLE_MACHINE ?=3D &quot;invalid&quot;<br>
&gt; +COMPATIBLE_MACHINE =3D &quot;qemuarm64&quot;<br>
&gt;=C2=A0 # Please add supported machines below or set it in .bbappend or=
 .conf<br>
&gt; diff --git a/meta-arm/wic/qemuarm64.wks b/meta-arm/wic/qemuarm64.wks<=
br>
&gt; new file mode 100644<br>
&gt; index 0000000..7285279<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-arm/wic/qemuarm64.wks<br>
&gt; @@ -0,0 +1,4 @@<br>
&gt; +bootloader --ptable gpt<br>
&gt; +<br>
&gt; +part /boot --ondisk=3Dvda --align 64 --size=3D100M --active --source=
 bootimg-partition --fstype=3Dext4 --label boot --sourceparams=3D&quot;load=
er=3Du-boot&quot;<br>
&gt; +part /=C2=A0 =C2=A0 =C2=A0--ondisk=3Dvda=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0--source rootfs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
--fstype=3Dext4 --label root<br>
&gt; -- <br>
&gt; 2.17.1<br>
&gt; <br>
<br>
&gt; <br>
<br>
</blockquote></div></div></div>

--000000000000b1e04305a58f4da2--
