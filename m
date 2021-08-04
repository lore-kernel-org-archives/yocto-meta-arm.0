Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.5687.1628059596693847676
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 Aug 2021 23:46:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=xNQuuAvf;
 spf=pass (domain: linaro.org, ip: 209.85.218.53, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ej1-f53.google.com with SMTP id hw6so2150505ejc.10
        for <meta-arm@lists.yoctoproject.org>; Tue, 03 Aug 2021 23:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=81153z7FRRUVUmG9MFq1Tvjy14J2ZFo3WMlDY2N+MOs=;
        b=xNQuuAvfLLql+5zkIYN/5uvzvkc4REnGabBPQ4pIhWfp0Fya5GuV/BY/URtIiShjua
         m0mMTaW/sJ4zlQsGu4XkdLu60BVkryirEMTWpmrmlmRSI6q0/aExQuEaGGhfwgHMlbWX
         lG+hGSmci54r/0ECcz2VtxEAc6PJ7L4cSEfuPqF3OxEunFmU++C4Y6nuX2+PmVQEW8Bf
         icuKGwjSXbSiw/1oKGhwcp/cKN/D1wKIW7qjljPerpAPBqQUwwE+z2XtAh+ZsFwHndrw
         5E51VPaC8xuL7bjVp0mPfCOA7aKqzcz/kaSUswbWN6EbvSo/0dF1F+19JOJ9MbMxslTf
         YK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=81153z7FRRUVUmG9MFq1Tvjy14J2ZFo3WMlDY2N+MOs=;
        b=tfkmwxMMbPHDpwNyu3t1iAvuukm39o6KT1ucMl8+dkc8pVKZ7tUySKiHjr4I1pAx9J
         dlJ4njhz1YcvOlnZeSBdBK70T84x4HyawL2hPzLQ2Qe/QOZDveXbz7iKg+2/HX/DqPJS
         YtPMbK6d8dB0yO7V8tEVwDEZJq2dmhLGNllUGGzgHl1zCQ4rgN2O7HRmOEy9EKg2X/yV
         XTzwWe74Ip7t/ayawZVLzmDwxjBy7uAUe8Emlf2iV+dymxbmetIxrtFrk6aEQEii1gB9
         6CHaPrt89P1vzla/JSrYUZG0pP1eZz7zXlDXCPOMZwM2uisnbtED75ojg3trpq63a6C2
         HfmQ==
X-Gm-Message-State: AOAM531Fn40PUroPF4ZsakZLykYXhE3/pSIuFkHgvYb5eQkNivrakZS9
	zWNcFq/PAOEgHCjBpPdcJCt6jKQRyhZ2MsAEbpfbNg==
X-Google-Smtp-Source: ABdhPJyNtug/s+pnu2e+wqg9HrZ1fYBzV8in3Uc+4C0b+vAJ/KqNzl+IfRJMdL8FD3Hc16bNttVZfrDwFphCK3/RHt8=
X-Received: by 2002:a17:906:688:: with SMTP id u8mr15920271ejb.436.1628059593797;
 Tue, 03 Aug 2021 23:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210803163915.2603065-1-raj.khem@gmail.com> <CAFA6WYOf=c-s7tRFhLv8HRZxCd1LCJ=DZZOmKcu5UOpVWo7w-w@mail.gmail.com>
In-Reply-To: <CAFA6WYOf=c-s7tRFhLv8HRZxCd1LCJ=DZZOmKcu5UOpVWo7w-w@mail.gmail.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 4 Aug 2021 08:46:22 +0200
Message-ID: <CAP71Wjx73gZr-NK8djwdzjuw8kiGF01W8w9O=nBztdmQ7kD9dA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] meta-arm: Convert to new override syntax
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Khem Raj <raj.khem@gmail.com>, meta-arm@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000c3046305c8b6290b"

--000000000000c3046305c8b6290b
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 4, 2021 at 8:39 AM Sumit Garg <sumit.garg@linaro.org> wrote:

> On Tue, 3 Aug 2021 at 22:09, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Drop compatibility with older than honister releases
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Thanks for taking the lead to do override syntax conversion for entire
> meta-arm. But even after this patch, I still observe following (a mix
> of new and old override syntax):
>
> COMPATIBLE_MACHINE_juno
> FILESEXTRAPATHS:prepend_juno
> SRC_URI:append_juno
> KMACHINE_juno
> KBUILD_DEFCONFIG_juno
> KCONFIG_MODE_juno
> KERNEL_FEATURES:append_corstone700-mps3
> LAYERDEPENDS_arm-toolchain
> LAYERSERIES_COMPAT_arm-toolchain
>

The 2 above are not overrides, but variables, so here the _ is really a
simple character, not the override delimiter!


> LAYERDEPENDS_meta-arm-bsp:append_musca-s1
> XEN_DEVICETREE_DTSI_MERGE:append_n1sdp
>
> and many more similar ones...
>
> Is it due to an issue with usage of scripts/contrib/convert-overrides.py?
>

Yes, kind of. This script needs to be taught what are the overrides in use
in the layer being processed. Please check the 'note' here:
https://docs.yoctoproject.org/migration-guides/migration-3.4.html#override-syntax-changes


> -Sumit
>
> > ---
> >  ci/base.yml                                   |   8 +-
> >  ci/gem5-arm64-xen.yml                         |   2 +-
> >  ci/qemuarmv5.yml                              |   2 +-
> >  ci/testimage.yml                              |   2 +-
> >  kas/fvp-baser-aemv8r64-bsp.yml                |   8 +-
> >  .../classes/alternate-kernel.bbclass          |   6 +-
> >  .../classes/docker_extern_containers.bbclass  |   4 +-
> >  .../classes/kernel-xenguest.bbclass           |   2 +-
> >  .../classes/xenguest_image_extra.bbclass      |   2 +-
> >  .../distro/include/arm-autonomy-guest.inc     |   4 +-
> >  .../conf/distro/include/arm-autonomy-host.inc |   8 +-
> >  meta-arm-autonomy/conf/layer.conf             |   2 +-
> >  .../conf/machine/fvp-base-extra-settings.inc  |   2 +-
> >  .../conf/machine/juno-extra-settings.inc      |   2 +-
> >  .../conf/machine/n1sdp-extra-settings.inc     |   6 +-
> >  .../images/firmware-image-juno.bbappend       |  12 +-
> >  .../recipes-bsp/u-boot/u-boot_%.bbappend      |   6 +-
> >  .../xen-devicetree/xen-devicetree.bbappend    |  22 +-
> >  .../recipes-extended/xen/xen_%.bbappend       |  12 +-
> >  .../recipes-bsp/grub/grub-efi_%.bbappend      |   4 +-
> >  .../import-docker-containers.bb               |   2 +-
> >  .../packagegroup-docker-runtime-minimal.bb    |   2 +-
> >  .../recipes-core/busybox/busybox_%.bbappend   |   6 +-
> >  .../init-ifupdown/init-ifupdown_1.0.bbappend  |   4 +-
> >  .../qemu/qemu-autonomy-host.inc               |   4 +-
> >  .../xen-devicetree/xen-devicetree.bb          |   2 +-
> >  .../recipes-extended/xen/xen-tools_%.bbappend |   2 +-
> >  .../xen/xen-tools_4.14.bbappend               |   6 +-
> >  .../recipes-extended/xen/xen_%.bbappend       |   4 +-
> >  .../recipes-extended/xen/xen_4.14.bbappend    |   6 +-
> >  .../xenguest/files/00-vif-xenguest.hook       |   6 +-
> >  .../xenguest/files/xenguest-manager           |  14 +-
> >  .../xenguest/files/xenguest-mkimage           |   4 +-
> >  .../xenguest/xenguest-base-image.bb           |   2 +-
> >  .../xenguest/xenguest-extern-guests.bb        |   2 +-
> >  .../xenguest/xenguest-manager.bb              |   4 +-
> >  .../xenguest/xenguest-mkimage.bb              |   4 +-
> >  .../xenguest/xenguest-network.bb              |  22 +-
> >  .../linux/linux-arm-autonomy.inc              |   8 +-
> >  meta-arm-bsp/conf/layer.conf                  |   4 +-
> >  .../conf/machine/corstone700-fvp.conf         |   2 +-
> >  .../conf/machine/corstone700-mps3.conf        |   4 +-
> >  .../conf/machine/fvp-baser-aemv8r64.conf      |   2 +-
> >  meta-arm-bsp/conf/machine/fvp-common.inc      |   2 +-
> >  .../conf/machine/include/arm/arch-armv6m.inc  |   6 +-
> >  .../conf/machine/include/arm/arch-armv7em.inc |   6 +-
> >  .../conf/machine/include/arm/arch-armv7m.inc  |   6 +-
> >  .../include/arm/arch-armv8-1m-main.inc        |   6 +-
> >  .../machine/include/arm/arch-armv8-2a.inc     |  16 +-
> >  .../machine/include/arm/arch-armv8-4a.inc     |  16 +-
> >  .../machine/include/arm/arch-armv8m-base.inc  |   6 +-
> >  .../machine/include/arm/arch-armv8m-main.inc  |  24 +-
> >  .../include/arm/armv8r/arch-armv8r64.inc      |  24 +-
> >  .../conf/machine/include/corstone700.inc      |   2 +-
> >  .../conf/machine/include/tune-cortexm0.inc    |   6 +-
> >  .../machine/include/tune-cortexm0plus.inc     |   6 +-
> >  .../conf/machine/include/tune-cortexm1.inc    |   6 +-
> >  .../conf/machine/include/tune-cortexm23.inc   |   6 +-
> >  .../conf/machine/include/tune-cortexm3.inc    |   6 +-
> >  .../conf/machine/include/tune-cortexm33.inc   |   6 +-
> >  .../conf/machine/include/tune-cortexm35p.inc  |   6 +-
> >  .../conf/machine/include/tune-cortexm4.inc    |   6 +-
> >  .../conf/machine/include/tune-cortexm55.inc   |   6 +-
> >  .../conf/machine/include/tune-cortexm7.inc    |   6 +-
> >  .../conf/machine/include/tune-neoversen1.inc  |   8 +-
> >  meta-arm-bsp/conf/machine/n1sdp.conf          |   2 +-
> >  meta-arm-bsp/conf/machine/sgi575.conf         |   2 +-
> >  .../boot-firmware/boot-firmware_git.bb        |   4 +-
> >  ...oot-wrapper-aarch64-fvp-baser-aemv8r64.inc |   4 +-
> >  .../external-system/external-system_0.1.0.bb  |   2 +-
> >  .../images/n1sdp-board-firmware_2020.07.27.bb |   2 +-
> >  .../scp-firmware/scp-firmware-juno.inc        |   2 +-
> >  .../scp-firmware/scp-firmware-n1sdp.inc       |   6 +-
> >  .../scp-firmware/scp-firmware-tc0.inc         |   2 +-
> >  .../trusted-firmware-a-corstone500.inc        |   2 +-
> >  .../trusted-firmware-a-corstone700.inc        |   2 +-
> >  .../trusted-firmware-a-fvp-arm32.inc          |   2 +-
> >  .../trusted-firmware-a-juno.inc               |   2 +-
> >  .../trusted-firmware-a_2.%.bbappend           |   2 +-
> >  .../recipes-bsp/u-boot/u-boot_%.bbappend      |   6 +-
> >  .../u-boot/u-boot_2020.04.bbappend            |   4 +-
> >  .../u-boot/u-boot_2020.07.bbappend            |   6 +-
> >  .../u-boot/u-boot_2021.07.bbappend            |   4 +-
> >  .../recipes-bsp/uefi/edk2-firmware-n1sdp.inc  |   6 +-
> >  .../init-ifupdown/init-ifupdown_1.0.bbappend  |   2 +-
> >  .../linux/linux-arm-platforms.inc             |  38 +-
> >  .../linux/linux-arm64-ack_5.10.bbappend       |   2 +-
> >  .../linux/linux-yocto-corstone700.inc         |  10 +-
> >  .../linux/linux-yocto_5.3%.bbappend           |   4 +-
> >  .../linux/linux-yocto_5.6%.bbappend           |   4 +-
> >  .../linux/linux-yocto_5.7%.bbappend           |   4 +-
> >  .../recipes-security/optee/optee-os-tc0.inc   |   6 +-
> >  .../external-arm-toolchain-versions.inc       |   4 +-
> >  .../distro/include/tcmode-external-arm.inc    |  14 +-
> >  meta-arm-toolchain/conf/layer.conf            |   4 +-
> >  .../arm-binary-toolchain.inc                  |   4 +-
> >  .../external-arm-sdk-toolchain.bb             |  30 +-
> >  .../external-arm-toolchain.bb                 | 374 +++++++++---------
> >  .../gcc-aarch64-none-elf_10.2-2020.11.bb      |   4 +-
> >  .../external-arm-toolchain/license.inc        | 134 +++----
> >  .../recipes-devtools/gcc/gcc-arm-10.2.inc     |   4 +-
> >  .../recipes-devtools/gcc/gcc-arm-common.inc   |   4 +-
> >  .../gcc/gcc-sanitizers_arm-10.2.bb            |   4 +-
> >  .../recipes-devtools/gcc/gcc_arm-10.2.bb      |  10 +-
> >  .../gcc/libgcc-initial_arm-10.2.bb            |   2 +-
> >  .../recipes-devtools/gcc/libgcc_arm-10.2.bb   |   2 +-
> >  meta-arm/conf/layer.conf                      |   2 +-
> >  .../conf/machine/qemuarm64-secureboot.conf    |   2 +-
> >  .../boot-wrapper-aarch64_git.bb               |   2 +-
> >  meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb   |   6 +-
> >  .../scp-firmware/scp-firmware_2.8.0.bb        |   6 +-
> >  .../trusted-firmware-a/trusted-firmware-a.inc |  18 +-
> >  .../trusted-firmware-a_%.bbappend             |  22 +-
> >  .../trusted-firmware-a_1.5.bb                 |   4 +-
> >  .../trusted-firmware-m_1.3.0.bb               |   2 +-
> >  meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend |   4 +-
> >  meta-arm/recipes-bsp/uefi/edk2-firmware.inc   |  10 +-
> >  .../recipes-bsp/uefi/edk2-firmware_%.bbappend |  22 +-
> >  meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb     |   2 +-
> >  meta-arm/recipes-devtools/fvp/fvp-common.inc  |   6 +-
> >  .../linux/linux-yocto_5.10.bbappend           |  12 +-
> >  .../recipes-security/optee/optee-client.inc   |  10 +-
> >  .../recipes-security/optee/optee-examples.inc |   2 +-
> >  meta-arm/recipes-security/optee/optee-os.inc  |  10 +-
> >  .../recipes-security/optee/optee-os_3.14.0.bb |   2 +-
> >  .../recipes-security/optee/optee-test.inc     |   2 +-
> >  meta-arm/recipes-security/optee/optee.inc     |   8 +-
> >  .../gem5/gem5-aarch64-native_20.bbappend      |   6 +-
> >  .../gem5/gem5-m5ops_20.bbappend               |   4 +-
> >  meta-atp/recipes-kernel/atp/atp-module_3.1.bb |   4 +-
> >  meta-atp/recipes-kernel/atp/atp-test_3.1.bb   |   2 +-
> >  .../linux/linux-yocto_5.4.bbappend            |   2 +-
> >  meta-gem5/conf/layer.conf                     |   2 +-
> >  meta-gem5/conf/machine/gem5-arm64.conf        |   2 +-
> >  .../boot-wrapper-aarch64_%.bbappend           |   6 +-
> >  .../gem5/gem5-aarch64-native_20.bbappend      |   2 +-
> >  .../recipes-extended/xen/xen_%.bbappend       |   4 +-
> >  .../recipes-kernel/linux/linux-%.bbappend     |   6 +-
> >  .../boot-wrapper-aarch64_%.bbappend           |   2 +-
> >  .../gem5/gem5-aarch64-native_20.bb            |   6 +-
> >  .../recipes-devtools/gem5/gem5-native.inc     |   6 +-
> >  .../linux/linux-yocto_5.4.bbappend            |   6 +-
> >  142 files changed, 677 insertions(+), 677 deletions(-)
> >
> > diff --git a/ci/base.yml b/ci/base.yml
> > index 2113dc4..b6462a0 100644
> > --- a/ci/base.yml
> > +++ b/ci/base.yml
> > @@ -29,14 +29,14 @@ local_conf_header:
> >      CONF_VERSION = "1"
> >      PACKAGE_CLASSES = "package_ipk"
> >      LICENSE_FLAGS_WHITELIST += "armcompiler"
> > -    PACKAGECONFIG_remove_pn-qemu-system-native = "gtk+ sdl"
> > -    EXTRA_IMAGE_FEATURES_append = " debug-tweaks"
> > +    PACKAGECONFIG:remove:pn-qemu-system-native = "gtk+ sdl"
> > +    EXTRA_IMAGE_FEATURES:append = " debug-tweaks"
> >      BB_NUMBER_THREADS = "16"
> >      PARALLEL_MAKE = "-j16"
> >      INHERIT += "rm_work"
> > -    PACKAGECONFIG_append_pn-perf = " coresight"
> > +    PACKAGECONFIG:append:pn-perf = " coresight"
> >    noptest: |
> > -    DISTRO_FEATURES_remove = "ptest"
> > +    DISTRO_FEATURES:remove = "ptest"
> >
> >  machine: unset
> >
> > diff --git a/ci/gem5-arm64-xen.yml b/ci/gem5-arm64-xen.yml
> > index 85763b8..e288244 100644
> > --- a/ci/gem5-arm64-xen.yml
> > +++ b/ci/gem5-arm64-xen.yml
> > @@ -22,7 +22,7 @@ machine: gem5-arm64
> >
> >  local_conf_header:
> >    meta-virt:
> > -    DISTRO_FEATURES_append = " virtualization xen"
> > +    DISTRO_FEATURES:append = " virtualization xen"
> >
> >  target:
> >    - xen-image-minimal
> > diff --git a/ci/qemuarmv5.yml b/ci/qemuarmv5.yml
> > index aaf7f4f..4081124 100644
> > --- a/ci/qemuarmv5.yml
> > +++ b/ci/qemuarmv5.yml
> > @@ -8,4 +8,4 @@ machine: qemuarmv5
> >  local_conf_header:
> >    bugs: |
> >      # Remove parselogs until errors can be resolved
> > -    TEST_SUITES_remove = "parselogs"
> > +    TEST_SUITES:remove = "parselogs"
> > diff --git a/ci/testimage.yml b/ci/testimage.yml
> > index 8941ad3..70a08e0 100644
> > --- a/ci/testimage.yml
> > +++ b/ci/testimage.yml
> > @@ -10,7 +10,7 @@ local_conf_header:
> >      TEST_SERVER_IP = "127.0.0.1"
> >      QEMU_USE_SLIRP = "1"
> >    packages: |
> > -    IMAGE_FEATURES_append = " ssh-server-dropbear"
> > +    IMAGE_FEATURES:append = " ssh-server-dropbear"
> >
> >  # Multiple targets are available, put it down to just one
> >  target:
> > diff --git a/kas/fvp-baser-aemv8r64-bsp.yml
> b/kas/fvp-baser-aemv8r64-bsp.yml
> > index 47aae84..a54bffb 100644
> > --- a/kas/fvp-baser-aemv8r64-bsp.yml
> > +++ b/kas/fvp-baser-aemv8r64-bsp.yml
> > @@ -29,10 +29,10 @@ local_conf_header:
> >    base: |
> >      CONF_VERSION = "1"
> >      PACKAGE_CLASSES = "package_ipk"
> > -    PACKAGECONFIG_remove_pn-qemu-system-native = "gtk+ sdl"
> > -    EXTRA_IMAGE_FEATURES_append = " debug-tweaks"
> > -    IMAGE_CLASSES_append = "
> ${@oe.utils.ifelse(d.getVar('FVP_BASE_R_AEM_TARBALL_URI'), 'fvpboot', '')}"
> > -    LICENSE_FLAGS_WHITELIST_append = "
> ${@oe.utils.vartrue('FVP_BASE_R_ARM_EULA_ACCEPT', 'Arm-FVP-EULA', '', d)}"
> > +    PACKAGECONFIG:remove:pn-qemu-system-native = "gtk+ sdl"
> > +    EXTRA_IMAGE_FEATURES:append = " debug-tweaks"
> > +    IMAGE_CLASSES:append = "
> ${@oe.utils.ifelse(d.getVar('FVP_BASE_R_AEM_TARBALL_URI'), 'fvpboot', '')}"
> > +    LICENSE_FLAGS_WHITELIST:append = "
> ${@oe.utils.vartrue('FVP_BASE_R_ARM_EULA_ACCEPT', 'Arm-FVP-EULA', '', d)}"
> >
> >  target:
> >    - core-image-minimal
> > diff --git a/meta-arm-autonomy/classes/alternate-kernel.bbclass
> b/meta-arm-autonomy/classes/alternate-kernel.bbclass
> > index 9ca59e2..b25dfc7 100644
> > --- a/meta-arm-autonomy/classes/alternate-kernel.bbclass
> > +++ b/meta-arm-autonomy/classes/alternate-kernel.bbclass
> > @@ -2,7 +2,7 @@
> >  # an alternate kernel (set via PREFERRED_PROVIDER_alternate/kernel).
> >  #
> >  # It is mandatory to also set the KERNEL_PACKAGE_NAME for the alternate
> kernel
> > -# recipe via
> KERNEL_PACKAGE_NAME_pn-${PREFERRED_PROVIDER_alternate/kernel} and
> > +# recipe via
> KERNEL_PACKAGE_NAME:pn-${PREFERRED_PROVIDER_alternate/kernel} and
> >  # its value needs to be different from "kernel" since this is the
> default set
> >  # for PREFERRED_PROVIDER_virtual/kernel.
> >  #
> > @@ -16,11 +16,11 @@ PREFERRED_PROVIDER_alternate/kernel ??= ""
> >  python () {
> >      alternate_kernel = d.getVar('PREFERRED_PROVIDER_alternate/kernel')
> >      if alternate_kernel:
> > -        alternate_kernel_pkg_name =
> d.getVar('KERNEL_PACKAGE_NAME_pn-%s' % alternate_kernel)
> > +        alternate_kernel_pkg_name =
> d.getVar('KERNEL_PACKAGE_NAME:pn-%s' % alternate_kernel)
> >          if alternate_kernel_pkg_name:
> >              d.appendVar('EXTRA_IMAGEDEPENDS', ' ' + alternate_kernel)
> >              d.appendVar('IMAGE_INSTALL', ' kernel-modules')
> >              d.appendVar('IMAGE_INSTALL', ' ' +
> alternate_kernel_pkg_name + '-modules')
> >          else:
> > -            raise bb.parse.SkipRecipe("No KERNEL_PACKAGE_NAME_pn-%s
> set" % alternate_kernel )
> > +            raise bb.parse.SkipRecipe("No KERNEL_PACKAGE_NAME:pn-%s
> set" % alternate_kernel )
> >  }
> > diff --git a/meta-arm-autonomy/classes/docker_extern_containers.bbclass
> b/meta-arm-autonomy/classes/docker_extern_containers.bbclass
> > index 363784a..57ac85f 100644
> > --- a/meta-arm-autonomy/classes/docker_extern_containers.bbclass
> > +++ b/meta-arm-autonomy/classes/docker_extern_containers.bbclass
> > @@ -71,7 +71,7 @@ inherit features_check
> >
> >  REQUIRED_DISTRO_FEATURES = "docker"
> >
> > -RDEPENDS_${PN} = "packagegroup-docker-runtime-minimal"
> > +RDEPENDS:${PN} = "packagegroup-docker-runtime-minimal"
> >
> >  CONTAINER_IMAGE_FILES ??= ""
> >  CONTAINERS_INSTALL_DIR ??= "${datadir}/docker/images"
> > @@ -112,4 +112,4 @@ do_install() {
> >
> >  do_install[vardeps] += "CONTAINER_IMAGE_FILES"
> >
> > -FILES_${PN} += "${CONTAINERS_INSTALL_DIR}"
> > +FILES:${PN} += "${CONTAINERS_INSTALL_DIR}"
> > diff --git a/meta-arm-autonomy/classes/kernel-xenguest.bbclass
> b/meta-arm-autonomy/classes/kernel-xenguest.bbclass
> > index 085fd56..59eb9d7 100644
> > --- a/meta-arm-autonomy/classes/kernel-xenguest.bbclass
> > +++ b/meta-arm-autonomy/classes/kernel-xenguest.bbclass
> > @@ -29,7 +29,7 @@ do_assemble_xenguest_initramfs() {
> >  }
> >  do_assemble_xenguest_initramfs[depends] +=
> "${INITRAMFS_IMAGE}:do_merge_xenguestenv"
> >
> > -kernel_do_deploy_append() {
> > +kernel_do_deploy:append() {
> >      if [ -f "${B}/${KERNEL_OUTPUT_DIR}/Image-initramfs.xenguest" ]; then
> >          install -m 0644
> ${B}/${KERNEL_OUTPUT_DIR}/Image-initramfs.xenguest
> "$deployDir/Image-${INITRAMFS_NAME}.xenguest"
> >          ln -snf Image-${INITRAMFS_NAME}.xenguest
> $deployDir/Image-${INITRAMFS_LINK_NAME}.xenguest
> > diff --git a/meta-arm-autonomy/classes/xenguest_image_extra.bbclass
> b/meta-arm-autonomy/classes/xenguest_image_extra.bbclass
> > index 3123f49..a2c2dcf 100644
> > --- a/meta-arm-autonomy/classes/xenguest_image_extra.bbclass
> > +++ b/meta-arm-autonomy/classes/xenguest_image_extra.bbclass
> > @@ -48,7 +48,7 @@ XENGUEST_IMAGE_VARS_EXTRA += "\
> >   XENGUEST_EXTRA_INIT_PRE XENGUEST_EXTRA_INIT XENGUEST_EXTRA_INIT_POST \
> >   XENGUEST_EXTRA_FILES XENGUEST_EXTRA_DISK_FILES"
> >
> > -do_deploy_append() {
> > +do_deploy:append() {
> >      if [ -z "${XENGUEST_IMAGE_DEPLOY_DIR}" -o \
> >          -z "${XENGUEST_IMAGE_DEPLOY_SUBDIR}" ]; then
> >          die "Configuration error: XENGUEST_IMAGE_DEPLOY_DIR or
> XENGUEST_IMAGE_DEPLOY_SUBDIR is empty"
> > diff --git
> a/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
> b/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
> > index 8ef0a94..6ffcdb5 100644
> > --- a/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
> > +++ b/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
> > @@ -1,7 +1,7 @@
> >  # This files is added when DISTRO_FEATURES contains arm-autonomy-guest
> >
> >  # We need to have ipv4 activated
> > -DISTRO_FEATURES_append = " ipv4"
> > +DISTRO_FEATURES:append = " ipv4"
> >
> >  # Build a xenguest type image
> >  IMAGE_CLASSES += "image_types_xenguest"
> > @@ -10,6 +10,6 @@ IMAGE_FSTYPES += "xenguest"
> >  # xenguest kernel extension to handle initramfs
> >  KERNEL_CLASSES += "kernel-xenguest"
> >
> > -IMAGE_INSTALL_append = "${@bb.utils.contains('DISTRO_FEATURES',
> 'docker', \
> > +IMAGE_INSTALL:append = "${@bb.utils.contains('DISTRO_FEATURES',
> 'docker', \
> >                          ' packagegroup-docker-runtime-minimal', \
> >                          '', d)}"
> > diff --git a/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
> b/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
> > index d2aaabf..8c14a1f 100644
> > --- a/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
> > +++ b/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
> > @@ -3,13 +3,13 @@
> >  ARM_AUTONOMY_HOST_OVERRIDES = ":autonomy-host"
> >
> >  # We need to have xen and ipv4 activated
> > -DISTRO_FEATURES_append = " xen ipv4"
> > -DISTRO_FEATURES_NATIVE_append = " arm-autonomy-host"
> > +DISTRO_FEATURES:append = " xen ipv4"
> > +DISTRO_FEATURES_NATIVE:append = " arm-autonomy-host"
> >
> >  # Don't include kernels in standard images when building
> arm-autonomy-host
> >  # If the kernel image is needed in the rootfs the following should be
> set from
> > -# a bbappend: RDEPENDS_${KERNEL_PACKAGE_NAME}-base =
> "${KERNEL_PACKAGE_NAME}-image"
> > -RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?= ""
> > +# a bbappend: RDEPENDS:${KERNEL_PACKAGE_NAME}-base =
> "${KERNEL_PACKAGE_NAME}-image"
> > +RDEPENDS:${KERNEL_PACKAGE_NAME}-base ?= ""
> >
> >  # Require extra machine specific settings from meta-arm-bsp
> dynamic-layers only
> >  # if meta-arm-bsp is in the bblayers.conf
> > diff --git a/meta-arm-autonomy/conf/layer.conf
> b/meta-arm-autonomy/conf/layer.conf
> > index 98db8f8..d73f10f 100644
> > --- a/meta-arm-autonomy/conf/layer.conf
> > +++ b/meta-arm-autonomy/conf/layer.conf
> > @@ -29,7 +29,7 @@ ARM_AUTONOMY_LAYERDIR := "${LAYERDIR}"
> >  ARM_AUTONOMY_DISTRO_CFGDIR =
> "${ARM_AUTONOMY_LAYERDIR}/conf/distro/include/"
> >
> >  # Add class to handle arm-autonomy distro extensions
> > -USER_CLASSES_append = " arm-autonomy-features"
> > +USER_CLASSES:append = " arm-autonomy-features"
> >
> >  BBFILES_DYNAMIC += " \
> >      meta-arm-bsp:${LAYERDIR}/dynamic-layers/meta-arm-bsp/*/*/*.bbappend
> \
> > diff --git
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-extra-settings.inc
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-extra-settings.inc
> > index 477d6d2..54544ed 100644
> > ---
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-extra-settings.inc
> > +++
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-extra-settings.inc
> > @@ -6,7 +6,7 @@ XENGUEST_MANAGER_VOLUME_DEVICE ?= "/dev/vda2"
> >
> >  # We need to extend the wks search path to be able to find the wks file
> set in
> >  # ARM_AUTONOMY_WKS_FILE.
> > -WKS_SEARCH_PATH_prepend := "${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic:"
> > +WKS_SEARCH_PATH:prepend := "${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic:"
> >
> >  ARM_AUTONOMY_WKS_FILE ?= "arm-autonomy-fvp-base-disk.wks.in"
> >  # set wks file only if INITRAMFS_IMAGE_BUNDLE is not set
> > diff --git
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-settings.inc
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-settings.inc
> > index f8a16f4..6255c98 100644
> > ---
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-settings.inc
> > +++
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-settings.inc
> > @@ -7,7 +7,7 @@ XEN_DEVICETREE_DOM0_SIZE ?= "0x02400000"
> >
> >  # We need to extend the wks search path to be able to find the wks file
> set in
> >  # ARM_AUTONOMY_WKS_FILE.
> > -WKS_SEARCH_PATH_prepend := "${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic:"
> > +WKS_SEARCH_PATH:prepend := "${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic:"
> >
> >  ARM_AUTONOMY_WKS_FILE ?= "arm-autonomy-juno-disk.wks.in"
> >  # set wks file only if INITRAMFS_IMAGE_BUNDLE is not set
> > diff --git
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
> > index 0bd150b..394d1b8 100644
> > ---
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
> > +++
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
> > @@ -2,7 +2,7 @@
> >
> >  # We need to extent the wks search path to be able to find the wks file
> set in
> >  # ARM_AUTONOMY_WKS_FILE.
> > -WKS_SEARCH_PATH_prepend := "${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic:"
> > +WKS_SEARCH_PATH:prepend := "${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic:"
> >
> >  ARM_AUTONOMY_WKS_FILE ?= "arm-autonomy-n1sdp-efidisk.wks.in"
> >  WKS_FILE = "${ARM_AUTONOMY_WKS_FILE}"
> > @@ -58,7 +58,7 @@ ${@bb.utils.contains('DISTRO_FEATURES',
> 'alternate-kernel', \
> >  KERNEL_PACKAGE_NAME_alternate/kernel ?= "kernel-rt"
> >  # When alternate-kernel DISTRO_FEATURE is present we set the kernel-rt
> by
> >  # default
> > -KERNEL_PACKAGE_NAME_pn-linux-yocto-rt = "\
> > +KERNEL_PACKAGE_NAME:pn-linux-yocto-rt = "\
> >  ${@ d.getVar('KERNEL_PACKAGE_NAME_alternate/kernel') \
> >  if bb.utils.contains('DISTRO_FEATURES', 'alternate-kernel', True,
> False, d) \
> >  else 'kernel' }"
> > @@ -87,4 +87,4 @@ d.getVar('PREFERRED_PROVIDER_alternate/kernel') else
> ''}"
> >
> >  # Additionnal kernel modules are necessary for n1sdp to be able to
> mount FAT
> >  # filesystems using CP437.
> > -MACHINE_ESSENTIAL_EXTRA_RDEPENDS_append = " kernel-module-nls-cp437
> kernel-module-nls-iso8859-1"
> > +MACHINE_ESSENTIAL_EXTRA_RDEPENDS:append = " kernel-module-nls-cp437
> kernel-module-nls-iso8859-1"
> > diff --git
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
> > index 6e75af2..8013a8f 100644
> > ---
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
> > +++
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
> > @@ -1,14 +1,14 @@
> >  # Use OVERRIDES to minimize the usage of
> >  # ${@bb.utils.contains('DISTRO_FEATURES', 'autonomy-host', ...
> > -OVERRIDES_append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
> > +OVERRIDES:append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
> >
> > -FILESEXTRAPATHS_prepend_autonomy-host := "${THISDIR}/${PN}:"
> > +FILESEXTRAPATHS:prepend_autonomy-host := "${THISDIR}/${PN}:"
> >
> > -DEPENDS_append_autonomy-host = " dos2unix-native"
> > +DEPENDS:append_autonomy-host = " dos2unix-native"
> >
> > -SRC_URI_append_autonomy-host = "
> file://add-xen-support.patch;patchdir=../"
> > +SRC_URI:append_autonomy-host = "
> file://add-xen-support.patch;patchdir=../"
> >
> > -do_install_append_autonomy-host() {
> > +do_install:append_autonomy-host() {
> >      mv -v ${D}/${UNPACK_DIR}/SOFTWARE/uEnv.txt \
> >            ${D}/${UNPACK_DIR}/SOFTWARE/uenvfile
> >      for dir in $(ls ${D}/${UNPACK_DIR}/SITE1/)
> > @@ -22,7 +22,7 @@ DEPLOY_EXTRA_DEPS_autonomy-host = "xen:do_deploy
> xen-devicetree:do_deploy"
> >
> >  do_deploy[depends] += "${DEPLOY_EXTRA_DEPS}"
> >
> > -do_deploy_prepend_autonomy-host() {
> > +do_deploy:prepend_autonomy-host() {
> >      # To avoid dependency loop between firmware-image-juno:do_install,
> >      # xen:do_deploy and xen-devicetree:do_deploy when
> >      # INITRAMFS_IMAGE_BUNDLE = "1", we need to handle the xen and
> > diff --git
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> > index 10cd0d6..67449e9 100644
> > ---
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> > +++
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> > @@ -1,10 +1,10 @@
> >  # Use OVERRIDES to minimize the usage of
> >  # ${@bb.utils.contains('DISTRO_FEATURES', 'autonomy-host', ...
> > -OVERRIDES_append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
> > +OVERRIDES:append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
> >
> > -FILESEXTRAPATHS_prepend_autonomy-host_fvp-base := "${THISDIR}/${PN}:"
> > +FILESEXTRAPATHS:prepend_autonomy-host_fvp-base := "${THISDIR}/${PN}:"
> >
> >  #
> >  # FVP BASE
> >  #
> > -SRC_URI_append_autonomy-host_fvp-base = "
> file://xen_u-boot_kernel_addr.patch"
> > +SRC_URI:append_autonomy-host_fvp-base = "
> file://xen_u-boot_kernel_addr.patch"
> > diff --git
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
> > index af632e2..499e16c 100644
> > ---
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
> > +++
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
> > @@ -1,23 +1,23 @@
> >  # Platform dependent parameters
> >
> > -FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> > +FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
> >
> >  # Add a dtb snippet to turn off iommu in dom0 on Juno board
> > -SRC_URI_append_juno = " file://xen-juno.dtsi"
> > -XEN_DEVICETREE_DTSI_MERGE_append_juno = " xen-juno.dtsi"
> > +SRC_URI:append_juno = " file://xen-juno.dtsi"
> > +XEN_DEVICETREE_DTSI_MERGE:append_juno = " xen-juno.dtsi"
> >
> >  # Add a dtb snippet to remove pmu and iommu in dom0 on N1SDP
> > -SRC_URI_append_n1sdp = " file://xen-n1sdp.dtsi"
> > -XEN_DEVICETREE_DTSI_MERGE_append_n1sdp = " xen-n1sdp.dtsi"
> > +SRC_URI:append_n1sdp = " file://xen-n1sdp.dtsi"
> > +XEN_DEVICETREE_DTSI_MERGE:append_n1sdp = " xen-n1sdp.dtsi"
> >  # For N1SDP, the XEN_DEVICETREE_DEPEND and XEN_DEVICETREE_DTBS
> variables are
> >  # being set in
> meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
> >
> >  # Board specific configs
> > -XEN_DEVICETREE_DOM0_BOOTARGS_append_juno = " root=/dev/sda1 rootwait"
> > -XEN_DEVICETREE_XEN_BOOTARGS_append_juno = " console=dtuart
> dtuart=serial0 bootscrub=0 iommu=no"
> > +XEN_DEVICETREE_DOM0_BOOTARGS:append_juno = " root=/dev/sda1 rootwait"
> > +XEN_DEVICETREE_XEN_BOOTARGS:append_juno = " console=dtuart
> dtuart=serial0 bootscrub=0 iommu=no"
> >
> > -XEN_DEVICETREE_DOM0_BOOTARGS_append_n1sdp = " root=/dev/sda2 rootwait"
> > -XEN_DEVICETREE_XEN_BOOTARGS_append_n1sdp = " console=dtuart
> dtuart=serial0 bootscrub=0 iommu=no"
> > +XEN_DEVICETREE_DOM0_BOOTARGS:append_n1sdp = " root=/dev/sda2 rootwait"
> > +XEN_DEVICETREE_XEN_BOOTARGS:append_n1sdp = " console=dtuart
> dtuart=serial0 bootscrub=0 iommu=no"
> >
> > -XEN_DEVICETREE_DOM0_BOOTARGS_append_fvp-base = " root=/dev/vda1"
> > -XEN_DEVICETREE_XEN_BOOTARGS_append_fvp-base = " console=dtuart
> dtuart=serial0 bootscrub=0"
> > +XEN_DEVICETREE_DOM0_BOOTARGS:append_fvp-base = " root=/dev/vda1"
> > +XEN_DEVICETREE_XEN_BOOTARGS:append_fvp-base = " console=dtuart
> dtuart=serial0 bootscrub=0"
> > diff --git
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
> > index ef3cc23..f098b4f 100644
> > ---
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
> > +++
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
> > @@ -1,15 +1,15 @@
> >  # FVP Base support
> >  COMPATIBLE_MACHINE_fvp-base = "fvp-base"
> > -FILESEXTRAPATHS_prepend_fvp-base := "${THISDIR}/files:"
> > -SRC_URI_append_fvp-base = " file://early-printk.cfg"
> > +FILESEXTRAPATHS:prepend_fvp-base := "${THISDIR}/files:"
> > +SRC_URI:append_fvp-base = " file://early-printk.cfg"
> >
> >  # Juno support
> >  COMPATIBLE_MACHINE_juno = "juno"
> > -FILESEXTRAPATHS_prepend_juno := "${THISDIR}/files:"
> > -SRC_URI_append_juno = " file://early-printk.cfg"
> > +FILESEXTRAPATHS:prepend_juno := "${THISDIR}/files:"
> > +SRC_URI:append_juno = " file://early-printk.cfg"
> >
> >  # N1SDP support
> >  COMPATIBLE_MACHINE_n1sdp = "n1sdp"
> > -FILESEXTRAPATHS_prepend_n1sdp := "${THISDIR}/files:"
> > -SRC_URI_append_n1sdp = " file://n1sdp.cfg \
> > +FILESEXTRAPATHS:prepend_n1sdp := "${THISDIR}/files:"
> > +SRC_URI:append_n1sdp = " file://n1sdp.cfg \
> >                           file://early-printk.cfg"
> > diff --git a/meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend
> b/meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend
> > index e88edfd..18a1855 100644
> > --- a/meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend
> > +++ b/meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend
> > @@ -1,3 +1,3 @@
> > -OVERRIDES_append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
> > +OVERRIDES:append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
> >
> > -GRUB_BUILDIN_append_autonomy-host = " xen_boot"
> > +GRUB_BUILDIN:append_autonomy-host = " xen_boot"
> > diff --git
> a/meta-arm-autonomy/recipes-containers/import-docker-containers/
> import-docker-containers.bb
> b/meta-arm-autonomy/recipes-containers/import-docker-containers/
> import-docker-containers.bb
> > index 3fea508..04115f7 100644
> > --- a/meta-arm-autonomy/recipes-containers/import-docker-containers/
> import-docker-containers.bb
> > +++ b/meta-arm-autonomy/recipes-containers/import-docker-containers/
> import-docker-containers.bb
> > @@ -25,7 +25,7 @@ INITSCRIPT_PARAMS = "start 30 2 3 4 5 ."
> >  INITSCRIPT_NAME = "import_containers.sh"
> >
> >  S = "${WORKDIR}"
> > -do_install_append() {
> > +do_install:append() {
> >      install -d ${D}${sysconfdir}/init.d
> >      install -m 755 import_containers.sh ${D}${sysconfdir}/init.d
> >
> > diff --git a/meta-arm-autonomy/recipes-containers/packagegroups/
> packagegroup-docker-runtime-minimal.bb
> b/meta-arm-autonomy/recipes-containers/packagegroups/
> packagegroup-docker-runtime-minimal.bb
> > index 2cbff9c..f78cc9f 100644
> > --- a/meta-arm-autonomy/recipes-containers/packagegroups/
> packagegroup-docker-runtime-minimal.bb
> > +++ b/meta-arm-autonomy/recipes-containers/packagegroups/
> packagegroup-docker-runtime-minimal.bb
> > @@ -8,7 +8,7 @@ DESCRIPTION = "The minimal set of packages required for
> running Docker"
> >
> >  inherit packagegroup
> >
> > -RDEPENDS_${PN} = "\
> > +RDEPENDS:${PN} = "\
> >      docker-ce \
> >      docker-ce-contrib \
> >      kernel-module-xt-nat \
> > diff --git a/meta-arm-autonomy/recipes-core/busybox/busybox_%.bbappend
> b/meta-arm-autonomy/recipes-core/busybox/busybox_%.bbappend
> > index 36c4569..f834778 100644
> > --- a/meta-arm-autonomy/recipes-core/busybox/busybox_%.bbappend
> > +++ b/meta-arm-autonomy/recipes-core/busybox/busybox_%.bbappend
> > @@ -1,8 +1,8 @@
> >  # Use OVERRIDES to minimize the usage of
> >  # ${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', ...
> > -OVERRIDES_append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
> > +OVERRIDES:append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
> >
> > -FILESEXTRAPATHS_prepend_autonomy-host := "${THISDIR}/${PN}:"
> > +FILESEXTRAPATHS:prepend_autonomy-host := "${THISDIR}/${PN}:"
> >
> >  # The --exclude flag in Busybox tar is required by xenguest-mkimage
> > -SRC_URI_append_autonomy-host = " file://feature_tar_long_options.cfg"
> > +SRC_URI:append_autonomy-host = " file://feature_tar_long_options.cfg"
> > diff --git
> a/meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
> b/meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
> > index a4edd05..621cc8e 100644
> > ---
> a/meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
> > +++
> b/meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
> > @@ -3,9 +3,9 @@
> >  # configuration by adding network network interface configuration file
> under
> >  # interfaces.d directory.
> >
> > -OVERRIDES_append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
> > +OVERRIDES:append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
> >
> > -do_install_append_autonomy-host() {
> > +do_install:append_autonomy-host() {
> >      # Add scan of interfaces.d to interfaces file
> >      cp -f ${WORKDIR}/interfaces ${WORKDIR}/interfaces.subdir
> >      echo "source-directory ${sysconfdir}/network/interfaces.d/" \
> > diff --git
> a/meta-arm-autonomy/recipes-devtools/qemu/qemu-autonomy-host.inc
> b/meta-arm-autonomy/recipes-devtools/qemu/qemu-autonomy-host.inc
> > index 085f952..20573cb 100644
> > --- a/meta-arm-autonomy/recipes-devtools/qemu/qemu-autonomy-host.inc
> > +++ b/meta-arm-autonomy/recipes-devtools/qemu/qemu-autonomy-host.inc
> > @@ -2,7 +2,7 @@
> >  QEMU_TARGETS = "i386"
> >
> >  PACKAGECONFIG[noaudio] = "--audio-drv-list='',,"
> > -PACKAGECONFIG_append = " noaudio"
> > -PACKAGECONFIG_remove = "fdt sdl kvm"
> > +PACKAGECONFIG:append = " noaudio"
> > +PACKAGECONFIG:remove = "fdt sdl kvm"
> >
> >  require recipes-devtools/qemu/qemu-package-split.inc
> > diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/
> xen-devicetree.bb b/meta-arm-autonomy/recipes-extended/xen-devicetree/
> xen-devicetree.bb
> > index 61fb624..223e237 100644
> > --- a/meta-arm-autonomy/recipes-extended/xen-devicetree/
> xen-devicetree.bb
> > +++ b/meta-arm-autonomy/recipes-extended/xen-devicetree/
> xen-devicetree.bb
> > @@ -16,7 +16,7 @@ DESCRIPTION = "Add entries in DTB for Xen and Dom0"
> >  # customizable parameters
> >  # kernel size is passed to xen via xen.dtb so we need to add
> >  # 'virtual/kernel:do_deploy' as a dependency
> > -XEN_DEVICETREE_DEPEND_append = " virtual/kernel:do_deploy"
> > +XEN_DEVICETREE_DEPEND:append = " virtual/kernel:do_deploy"
> >  XEN_DEVICETREE_DTBS ?= "${KERNEL_DEVICETREE}"
> >  XEN_DEVICETREE_XEN_BOOTARGS ?= "noreboot
> dom0_mem=${XEN_DEVICETREE_DOM0_MEM}"
> >  XEN_DEVICETREE_DOM0_MEM ?= "1024M,max:1024M"
> > diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend
> b/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend
> > index f2284b0..d1f5610 100644
> > --- a/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend
> > +++ b/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend
> > @@ -1,4 +1,4 @@
> > -PACKAGECONFIG_remove = "\
> > +PACKAGECONFIG:remove = "\
> >      ${@bb.utils.contains('DISTRO_FEATURES', \
> >                           'arm-autonomy-host', \
> >                           'sdl', '', d)}"
> > diff --git
> a/meta-arm-autonomy/recipes-extended/xen/xen-tools_4.14.bbappend
> b/meta-arm-autonomy/recipes-extended/xen/xen-tools_4.14.bbappend
> > index 21192c3..4b8dc05 100644
> > --- a/meta-arm-autonomy/recipes-extended/xen/xen-tools_4.14.bbappend
> > +++ b/meta-arm-autonomy/recipes-extended/xen/xen-tools_4.14.bbappend
> > @@ -1,7 +1,7 @@
> >  # Use OVERRIDES to minimize the usage of
> >  # ${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', ...
> > -OVERRIDES_append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
> > +OVERRIDES:append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
> >
> > -FILESEXTRAPATHS_prepend_autonomy-host := "${THISDIR}/${PN}-4.14:"
> > +FILESEXTRAPATHS:prepend_autonomy-host := "${THISDIR}/${PN}-4.14:"
> >
> > -SRC_URI_append_autonomy-host = " file://0001-vif-nat-fix-hostname.patch"
> > +SRC_URI:append_autonomy-host = " file://0001-vif-nat-fix-hostname.patch"
> > diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
> b/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
> > index 4871ef8..1fe8313 100644
> > --- a/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
> > +++ b/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
> > @@ -1,10 +1,10 @@
> >  # Use OVERRIDES to minimize the usage of
> >  # ${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', ...
> > -OVERRIDES_append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
> > +OVERRIDES:append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
> >
> >  # Make Xen machine specific
> >  # This ensures that sstate is properly handled and that each machine
> can have
> >  # its own configuration
> >  PACKAGE_ARCH_autonomy-host = "${MACHINE_ARCH}"
> >
> > -PACKAGECONFIG_remove_autonomy-host = "sdl"
> > +PACKAGECONFIG:remove_autonomy-host = "sdl"
> > diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend
> b/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend
> > index 5e9ff85..69323d9 100644
> > --- a/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend
> > +++ b/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend
> > @@ -1,9 +1,9 @@
> >  # Use OVERRIDES to minimize the usage of
> >  # ${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', ...
> > -OVERRIDES_append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
> > +OVERRIDES:append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
> >
> > -FILESEXTRAPATHS_prepend_autonomy-host := "${THISDIR}/${PN}-4.14:"
> > +FILESEXTRAPATHS:prepend_autonomy-host := "${THISDIR}/${PN}-4.14:"
> >
> > -SRC_URI_append_autonomy-host = " \
> > +SRC_URI:append_autonomy-host = " \
> >
> file://0001-xen-arm-Throw-messages-for-unknown-FP-SIMD-implement.patch \
> >      "
> > diff --git
> a/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xenguest.hook
> b/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xenguest.hook
> > index 37ecec0..04c6dad 100755
> > ---
> a/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xenguest.hook
> > +++
> b/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xenguest.hook
> > @@ -38,9 +38,9 @@ get_subnet_prefix() {
> >
> >  subnetprefix=$(get_subnet_prefix)
> >
> > -kea_remove_conf_entry()
> > +kea:remove_conf_entry()
> >  {
> > -    log debug "kea_remove_conf_entry"
> > +    log debug "kea:remove_conf_entry"
> >      claim_lock "vif-nat-kea"
> >
> >      # Remove the the xenguest kea config file inclusion in the kea main
> config
> > @@ -120,7 +120,7 @@ case "${XENGUEST_NETWORK_TYPE}" in
> >                  iptables_w -t nat -A POSTROUTING -o ${bridge} -j
> MASQUERADE -m comment --comment "dom${domid}"
> >                  ;;
> >              offline)
> > -                kea_remove_conf_entry
> > +                kea:remove_conf_entry
> >
> >                  # Remove the NAT iptables rules created for the
> dom${domid}
> >                  guest_ipt_rule=$(iptables_w -t nat -vL POSTROUTING -n
> --line-number | grep -w dom${domid} | awk '{print $1}' | tac)
> > diff --git
> a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> > index 7e5f868..44935c3 100755
> > --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> > +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> > @@ -361,7 +361,7 @@ function xenguest_detach_disk()
> >  }
> >
> >  #Private
> > -function xenguest_volume_remove()
> > +function xenguest_volume:remove()
> >  {
> >      # Inputs:
> >      # $1 - volumename
> > @@ -446,7 +446,7 @@ function xenguest_disk_init()
> >      log info "Creating hard drive for guest '${guestname}'. This might
> take a while..."
> >
> >      # Remove volume if it already exist
> > -    xenguest_volume_remove ${volumename} ${guestname}
> > +    xenguest_volume:remove ${volumename} ${guestname}
> >      if [ $? -ne 0 ]; then
> >          return 1
> >      fi
> > @@ -713,7 +713,7 @@ function xenguest_guest_create()
> >      log_command "xenguest-mkimage update
> ${XENGUEST_CONF_BASE}/guests/${guestname} --xen-name=${guestname}"
> >      if [ $? -ne 0 ]; then
> >          log error "Setting guest name failed."
> > -        xenguest_guest_remove ${guestname}
> > +        xenguest_guest:remove ${guestname}
> >          exit 1
> >      fi
> >
> > @@ -724,7 +724,7 @@ function xenguest_guest_create()
> >          if [ $disk_init_status -eq 2 ]; then
> >              xenguest_detach_disk
> >          fi
> > -        xenguest_guest_remove ${guestname}
> > +        xenguest_guest:remove ${guestname}
> >          exit 1
> >      fi
> >
> > @@ -733,7 +733,7 @@ function xenguest_guest_create()
> >  }
> >
> >  # Private
> > -function xenguest_guest_remove()
> > +function xenguest_guest:remove()
> >  {
> >      guestname="$1"
> >      log info "Attempting to remove guest '${guestname}'"
> > @@ -754,7 +754,7 @@ function xenguest_guest_remove()
> >      devname="/dev/${volumename}/${guestname}"
> >
> >      # find and remove guest volume
> > -    xenguest_volume_remove ${volumename} ${guestname}
> > +    xenguest_volume:remove ${volumename} ${guestname}
> >      status=$?
> >
> >      # remove guest files
> > @@ -1080,7 +1080,7 @@ case ${cmd} in
> >          if xl_list_contains $guestname; then
> >              xenguest_guest_kill ${guestname}
> >          fi
> > -        xenguest_guest_remove ${guestname}
> > +        xenguest_guest:remove ${guestname}
> >          ;;
> >      start)
> >          guestname="${arg1:-}"
> > diff --git
> a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
> b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
> > index 29e0911..9a3b8cf 100755
> > --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
> > +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
> > @@ -343,7 +343,7 @@ xen_config_set_string() {
> >      sed -i "s@.*${param} = .*@${param} = \"${value}\"@" ${dst}
> >  }
> >
> > -xen_config_append_string() {
> > +xen_config:append_string() {
> >      param="${1}"
> >      shift
> >      value="$@"
> > @@ -795,7 +795,7 @@ for arg in "${@}"; do
> >              xen_config_set_string "extra" ""
> >              ;;
> >          --xen-extra=*)
> > -            xen_config_append_string "extra" ${optarg}
> > +            xen_config:append_string "extra" ${optarg}
> >              ;;
> >          --xen-root=*)
> >              if [ -z "${optarg}" ]; then
> > diff --git a/meta-arm-autonomy/recipes-extended/xenguest/
> xenguest-base-image.bb b/meta-arm-autonomy/recipes-extended/xenguest/
> xenguest-base-image.bb
> > index 73278e5..d3efed1 100644
> > --- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
> > +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
> > @@ -46,7 +46,7 @@ XENGUEST_IMAGE_SRC_URI_DISK_FILES ??= ""
> >
> >  # Add xen files
> >  # Any extrafiles files to be added to XENGUEST_IMAGE_SRC_URI_XEN_FILES
> should
> > -# be performed via XENGUEST_IMAGE_SRC_URI_XEN_FILES_append.
> > +# be performed via XENGUEST_IMAGE_SRC_URI_XEN_FILES:append.
> >  # The kea-subnet4.json holds the kea dhcp4 subnet configuration for
> Dom0.
> >  # And it is used when XENGUEST_IMAGE_NETWORK_TYPE="nat".
> >  # Any customizations to it should be performed by replacing it
> > diff --git a/meta-arm-autonomy/recipes-extended/xenguest/
> xenguest-extern-guests.bb b/meta-arm-autonomy/recipes-extended/xenguest/
> xenguest-extern-guests.bb
> > index fff6f6c..ac58184 100644
> > --- a/meta-arm-autonomy/recipes-extended/xenguest/
> xenguest-extern-guests.bb
> > +++ b/meta-arm-autonomy/recipes-extended/xenguest/
> xenguest-extern-guests.bb
> > @@ -67,7 +67,7 @@ do_install() {
> >
> >  do_install[vardeps] += "ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS"
> >
> > -FILES_${PN} += "${XENGUEST_MANAGER_GUEST_DIR}"
> > +FILES:${PN} += "${XENGUEST_MANAGER_GUEST_DIR}"
> >
> >  # In a multiconfig build this variable will hold a dependency string,
> which
> >  # differs based on whether the guest has initramfs or not.  It may have
> a space
> > diff --git a/meta-arm-autonomy/recipes-extended/xenguest/
> xenguest-manager.bb b/meta-arm-autonomy/recipes-extended/xenguest/
> xenguest-manager.bb
> > index aaf6cde..83ff95d 100644
> > --- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
> > +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
> > @@ -56,8 +56,8 @@ do_install() {
> >  }
> >
> >  # Things that we need on the target
> > -RDEPENDS_${PN} += "bash xenguest-mkimage lvm2 xen-tools parted
> e2fsprogs \
> > +RDEPENDS:${PN} += "bash xenguest-mkimage lvm2 xen-tools parted
> e2fsprogs \
> >                     dosfstools logrotate"
> >
> > -FILES_${PN} += "${bindir}/xenguest-manager \
> > +FILES:${PN} += "${bindir}/xenguest-manager \
> >                 ${sysconfdir}/xenguest"
> > diff --git a/meta-arm-autonomy/recipes-extended/xenguest/
> xenguest-mkimage.bb b/meta-arm-autonomy/recipes-extended/xenguest/
> xenguest-mkimage.bb
> > index 548e7c3..91344aa 100644
> > --- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.bb
> > +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.bb
> > @@ -31,6 +31,6 @@ do_install() {
> >  }
> >
> >  # We need bash
> > -RDEPENDS_${PN} = "bash"
> > -FILES_${PN} = "${bindir}/xenguest-mkimage"
> > +RDEPENDS:${PN} = "bash"
> > +FILES:${PN} = "${bindir}/xenguest-mkimage"
> >
> > diff --git a/meta-arm-autonomy/recipes-extended/xenguest/
> xenguest-network.bb b/meta-arm-autonomy/recipes-extended/xenguest/
> xenguest-network.bb
> > index 65ab8aa..66c6f26 100644
> > --- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
> > +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
> > @@ -31,13 +31,13 @@ PACKAGES =+ "${PN}-kea-dhcp4"
> >  # Prefix with a_ to make sure it is executed in runlevel 01 before
> others
> >  # run start script before ifupdown and run stop script after ifupdown
> >  INITSCRIPT_PACKAGES = "${PN} ${PN}-kea-dhcp4"
> > -INITSCRIPT_NAME_${PN} = "a_xenguest-network-bridge"
> > -INITSCRIPT_PARAMS_${PN} = "start 01 2 3 4 5 . stop 81 0 1 6 ."
> > +INITSCRIPT_NAME:${PN} = "a_xenguest-network-bridge"
> > +INITSCRIPT_PARAMS:${PN} = "start 01 2 3 4 5 . stop 81 0 1 6 ."
> >
> >  # Kea configuration needs to be restored before kea init scripts:
> >  # Kea dhcp4 server is 30, so lets use 20, to have higher priority
> > -INITSCRIPT_NAME_${PN}-kea-dhcp4 = "kea-restore-default-config"
> > -INITSCRIPT_PARAMS_${PN}-kea-dhcp4 = "defaults 20"
> > +INITSCRIPT_NAME:${PN}-kea-dhcp4 = "kea-restore-default-config"
> > +INITSCRIPT_PARAMS:${PN}-kea-dhcp4 = "defaults 20"
> >
> >  inherit allarch update-rc.d
> >
> > @@ -77,7 +77,7 @@ do_install() {
> >          ${D}${sysconfdir}/kea/kea-dhcp4.conf.original
> >  }
> >
> > -RDEPENDS_${PN} += "bridge-utils \
> > +RDEPENDS:${PN} += "bridge-utils \
> >                     iptables \
> >                     kea \
> >                     ${PN}-kea-dhcp4 \
> > @@ -87,10 +87,10 @@ RDEPENDS_${PN} += "bridge-utils \
> >                     kernel-module-xt-nat \
> >                     kernel-module-xt-masquerade \
> >                    "
> > -FILES_${PN} +=
> "${sysconfdir}/network/interfaces.d/xenguest-network-bridge.cfg"
> > -FILES_${PN} += "${sysconfdir}/xenguest/init.pre/network-bridge.sh"
> > -FILES_${PN} +=
> "${sysconfdir}/xen/scripts/vif-post.d/00-vif-xenguest.hook"
> > +FILES:${PN} +=
> "${sysconfdir}/network/interfaces.d/xenguest-network-bridge.cfg"
> > +FILES:${PN} += "${sysconfdir}/xenguest/init.pre/network-bridge.sh"
> > +FILES:${PN} +=
> "${sysconfdir}/xen/scripts/vif-post.d/00-vif-xenguest.hook"
> >
> > -FILES_${PN}-kea-dhcp4 = "${sysconfdir}/kea/kea-dhcp4.conf.original"
> > -FILES_${PN}-kea-dhcp4 +=
> "${sysconfdir}/init.d/${INITSCRIPT_NAME_${PN}-kea-dhcp4}"
> > -FILES_${PN}-kea-dhcp4 += "${sysconfdir}/xenguest/
> init.post/xenguest-network-init-post.sh"
> > +FILES:${PN}-kea-dhcp4 = "${sysconfdir}/kea/kea-dhcp4.conf.original"
> > +FILES:${PN}-kea-dhcp4 +=
> "${sysconfdir}/init.d/${INITSCRIPT_NAME_${PN}-kea-dhcp4}"
> > +FILES:${PN}-kea-dhcp4 += "${sysconfdir}/xenguest/
> init.post/xenguest-network-init-post.sh"
> > diff --git
> a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> > index 5361e75..588856c 100644
> > --- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> > +++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> > @@ -1,11 +1,11 @@
> >  # Add arm-autonomy specific features to the kernel
> >
> > -FILESEXTRAPATHS_prepend := "${THISDIR}:"
> > +FILESEXTRAPATHS:prepend := "${THISDIR}:"
> >
> >  #
> >  # arm-autonomy kmeta
> >  #
> > -SRC_URI_append = "
> file://arm-autonomy-kmeta;type=kmeta;name=arm-autonomy-kmeta;destsuffix=arm-autonomy-kmeta"
> > +SRC_URI:append = "
> file://arm-autonomy-kmeta;type=kmeta;name=arm-autonomy-kmeta;destsuffix=arm-autonomy-kmeta"
> >
> >  # Add common Xen (host and guest) configs and patches
> >  KERNEL_FEATURES += "${@bb.utils.contains_any('DISTRO_FEATURES', \
> > @@ -27,8 +27,8 @@ KERNEL_FEATURES +=
> "${@bb.utils.contains('DISTRO_FEATURES', \
> >
> >
> >  # Add support for arm64-autonomy-guest machine
> > -COMPATIBLE_MACHINE_arm64-autonomy-guest = "arm64-autonomy-guest"
> > -KMACHINE_arm64-autonomy-guest = "arm64-autonomy-guest"
> > +COMPATIBLE_MACHINE:arm64-autonomy-guest = "arm64-autonomy-guest"
> > +KMACHINE:arm64-autonomy-guest = "arm64-autonomy-guest"
> >
> >  # Add Minimal Kernel Configs for Docker runtime
> >  KERNEL_FEATURES += "${@bb.utils.contains('DISTRO_FEATURES', \
> > diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
> > index 665f914..e5ae59d 100644
> > --- a/meta-arm-bsp/conf/layer.conf
> > +++ b/meta-arm-bsp/conf/layer.conf
> > @@ -13,8 +13,8 @@ LAYERSERIES_COMPAT_meta-arm-bsp = "hardknott"
> >
> >  LAYERDEPENDS_meta-arm-bsp = "core meta-arm"
> >  # This won't be used by layerindex-fetch, but works everywhere else
> > -LAYERDEPENDS_meta-arm-bsp_append_musca-b1 = " meta-python"
> > -LAYERDEPENDS_meta-arm-bsp_append_musca-s1 = " meta-python"
> > +LAYERDEPENDS_meta-arm-bsp:append_musca-b1 = " meta-python"
> > +LAYERDEPENDS_meta-arm-bsp:append_musca-s1 = " meta-python"
> >
> >  # Additional license directories.
> >  LICENSE_PATH += "${LAYERDIR}/custom-licenses"
> > diff --git a/meta-arm-bsp/conf/machine/corstone700-fvp.conf
> b/meta-arm-bsp/conf/machine/corstone700-fvp.conf
> > index 2ee3b52..6056b36 100644
> > --- a/meta-arm-bsp/conf/machine/corstone700-fvp.conf
> > +++ b/meta-arm-bsp/conf/machine/corstone700-fvp.conf
> > @@ -6,7 +6,7 @@ require conf/machine/include/corstone700.inc
> >
> >  # default feature used: eth_lan91c111
> >  # add the following line to local.conf to disable the feature:
> > -# MACHINE_FEATURES_remove = "eth_lan91c111"
> > +# MACHINE_FEATURES:remove = "eth_lan91c111"
> >  MACHINE_FEATURES += "eth_lan91c111"
> >
> >  TFA_TARGET_PLATFORM = "fvp"
> > diff --git a/meta-arm-bsp/conf/machine/corstone700-mps3.conf
> b/meta-arm-bsp/conf/machine/corstone700-mps3.conf
> > index 9aaa17c..916ba0e 100644
> > --- a/meta-arm-bsp/conf/machine/corstone700-mps3.conf
> > +++ b/meta-arm-bsp/conf/machine/corstone700-mps3.conf
> > @@ -6,12 +6,12 @@ require conf/machine/include/corstone700.inc
> >
> >  # default feature used: eth_lan9115
> >  # add the following line to local.conf to disable the feature:
> > -# MACHINE_FEATURES_remove = "eth_lan9115"
> > +# MACHINE_FEATURES:remove = "eth_lan9115"
> >  MACHINE_FEATURES += "eth_lan9115"
> >
> >  # default feature used: usb_host
> >  # add the following line to local.conf to disable the feature:
> > -# MACHINE_FEATURES_remove = "usb_host"
> > +# MACHINE_FEATURES:remove = "usb_host"
> >  MACHINE_FEATURES += "usb_host"
> >
> >  TFA_TARGET_PLATFORM = "fpga"
> > diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
> b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
> > index 29dd662..aeb23a4 100644
> > --- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
> > +++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
> > @@ -22,7 +22,7 @@ WKS_FILE ?= "fvp-base.wks"
> >  # As this is a virtual target that will not be used in the real world
> there is
> >  # no need for real SSH keys.  Disable rng-tools (which takes too long to
> >  # initialise) and install the pre-generated keys.
> > -PACKAGECONFIG_remove_pn-openssh = "rng-tools"
> > +PACKAGECONFIG:remove:pn-openssh = "rng-tools"
> >  MACHINE_EXTRA_RRECOMMENDS += "ssh-pregen-hostkeys"
> >
> >  FVP_EXTRA_ARGS = "-a cluster0*=${DEPLOY_DIR_IMAGE}/linux-system.axf"
> > diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc
> b/meta-arm-bsp/conf/machine/fvp-common.inc
> > index 72dae65..2579d94 100644
> > --- a/meta-arm-bsp/conf/machine/fvp-common.inc
> > +++ b/meta-arm-bsp/conf/machine/fvp-common.inc
> > @@ -23,5 +23,5 @@ EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a
> u-boot"
> >  # As this is a virtual target that will not be used in the real world
> there is
> >  # no need for real SSH keys.  Disable rng-tools (which takes too long to
> >  # initialise) and install the pre-generated keys.
> > -PACKAGECONFIG_remove_pn-openssh = "rng-tools"
> > +PACKAGECONFIG:remove:pn-openssh = "rng-tools"
> >  MACHINE_EXTRA_RRECOMMENDS += "ssh-pregen-hostkeys"
> > diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv6m.inc
> b/meta-arm-bsp/conf/machine/include/arm/arch-armv6m.inc
> > index 739550d..e7ca665 100755
> > --- a/meta-arm-bsp/conf/machine/include/arm/arch-armv6m.inc
> > +++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv6m.inc
> > @@ -14,6 +14,6 @@ require conf/machine/include/arm/arch-armv5.inc
> >
> >  # Little Endian
> >  AVAILTUNES += "armv6m"
> > -ARMPKGARCH_tune-armv6m             = "armv6m"
> > -TUNE_FEATURES_tune-armv6m          = "armv6m"
> > -PACKAGE_EXTRA_ARCHS_tune-armv6m    = "armv6m"
> > +ARMPKGARCH:tune-armv6m             = "armv6m"
> > +TUNE_FEATURES:tune-armv6m          = "armv6m"
> > +PACKAGE_EXTRA_ARCHS:tune-armv6m    = "armv6m"
> > diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv7em.inc
> b/meta-arm-bsp/conf/machine/include/arm/arch-armv7em.inc
> > index 197286f..adcab27 100755
> > --- a/meta-arm-bsp/conf/machine/include/arm/arch-armv7em.inc
> > +++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv7em.inc
> > @@ -12,6 +12,6 @@ TUNECONFLICTS[armv7em] = "armv4 armv5 armv6 armv7a"
> >  require conf/machine/include/arm/arch-armv7m.inc
> >
> >  AVAILTUNES                            += "armv7em"
> > -ARMPKGARCH_tune-armv7em                = "armv7em"
> > -TUNE_FEATURES_tune-armv7em             = "armv7em"
> > -PACKAGE_EXTRA_ARCHS_tune-armv7em       = "armv7em"
> > +ARMPKGARCH:tune-armv7em                = "armv7em"
> > +TUNE_FEATURES:tune-armv7em             = "armv7em"
> > +PACKAGE_EXTRA_ARCHS:tune-armv7em       = "armv7em"
> > diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv7m.inc
> b/meta-arm-bsp/conf/machine/include/arm/arch-armv7m.inc
> > index c659e8b..a36c265 100755
> > --- a/meta-arm-bsp/conf/machine/include/arm/arch-armv7m.inc
> > +++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv7m.inc
> > @@ -12,6 +12,6 @@ TUNECONFLICTS[armv7m] = "armv4 armv5 armv6 armv7a"
> >  require conf/machine/include/arm/arch-armv6m.inc
> >
> >  AVAILTUNES                            += "armv7m"
> > -ARMPKGARCH_tune-armv7m                 = "armv7m"
> > -TUNE_FEATURES_tune-armv7m              = "armv7m"
> > -PACKAGE_EXTRA_ARCHS_tune-armv7m        = "armv7m"
> > +ARMPKGARCH:tune-armv7m                 = "armv7m"
> > +TUNE_FEATURES:tune-armv7m              = "armv7m"
> > +PACKAGE_EXTRA_ARCHS:tune-armv7m        = "armv7m"
> > diff --git
> a/meta-arm-bsp/conf/machine/include/arm/arch-armv8-1m-main.inc
> b/meta-arm-bsp/conf/machine/include/arm/arch-armv8-1m-main.inc
> > index fc8add4..9171b31 100755
> > --- a/meta-arm-bsp/conf/machine/include/arm/arch-armv8-1m-main.inc
> > +++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv8-1m-main.inc
> > @@ -13,6 +13,6 @@ TUNECONFLICTS[armv8-1m-main] = "armv4 armv5 armv6
> armv7a"
> >  require conf/machine/include/arm/arch-armv8m-main.inc
> >
> >  AVAILTUNES                            += "armv8-1m-main"
> > -ARMPKGARCH_tune-armv8-1m-main          = "armv8-1m-main"
> > -TUNE_FEATURES_tune-armv8-1m-main       = "armv8-1m-main"
> > -PACKAGE_EXTRA_ARCHS_tune-armv8-1m-main = "armv8-1m-main"
> > +ARMPKGARCH:tune-armv8-1m-main          = "armv8-1m-main"
> > +TUNE_FEATURES:tune-armv8-1m-main       = "armv8-1m-main"
> > +PACKAGE_EXTRA_ARCHS:tune-armv8-1m-main = "armv8-1m-main"
> > diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv8-2a.inc
> b/meta-arm-bsp/conf/machine/include/arm/arch-armv8-2a.inc
> > index 0af949e..3bfe0d5 100644
> > --- a/meta-arm-bsp/conf/machine/include/arm/arch-armv8-2a.inc
> > +++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv8-2a.inc
> > @@ -8,11 +8,11 @@ MACHINEOVERRIDES =.
> "${@bb.utils.contains('TUNE_FEATURES', 'armv8-2a', 'armv8-2a
> >  require conf/machine/include/arm/arch-armv8a.inc
> >
> >  AVAILTUNES += "armv8-2a armv8-2a-crypto"
> > -ARMPKGARCH_tune-armv8-2a                    ?= "armv8-2a"
> > -ARMPKGARCH_tune-armv8-2a-crypto             ?= "armv8-2a"
> > -TUNE_FEATURES_tune-armv8-2a                  = "aarch64 armv8-2a"
> > -TUNE_FEATURES_tune-armv8-2a-crypto           =
> "${TUNE_FEATURES_tune-armv8-2a} crypto"
> > -PACKAGE_EXTRA_ARCHS_tune-armv8-2a            =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8-2a"
> > -PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto     =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a} armv8-2a-crypto"
> > -BASE_LIB_tune-armv8-2a                       = "lib64"
> > -BASE_LIB_tune-armv8-2a-crypto                = "lib64"
> > +ARMPKGARCH:tune-armv8-2a                    ?= "armv8-2a"
> > +ARMPKGARCH:tune-armv8-2a-crypto             ?= "armv8-2a"
> > +TUNE_FEATURES:tune-armv8-2a                  = "aarch64 armv8-2a"
> > +TUNE_FEATURES:tune-armv8-2a-crypto           =
> "${TUNE_FEATURES:tune-armv8-2a} crypto"
> > +PACKAGE_EXTRA_ARCHS:tune-armv8-2a            =
> "${PACKAGE_EXTRA_ARCHS:tune-armv8a} armv8-2a"
> > +PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto     =
> "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a} armv8-2a-crypto"
> > +BASE_LIB:tune-armv8-2a                       = "lib64"
> > +BASE_LIB:tune-armv8-2a-crypto                = "lib64"
> > diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv8-4a.inc
> b/meta-arm-bsp/conf/machine/include/arm/arch-armv8-4a.inc
> > index a4f2ca2..2dc04b6 100644
> > --- a/meta-arm-bsp/conf/machine/include/arm/arch-armv8-4a.inc
> > +++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv8-4a.inc
> > @@ -9,11 +9,11 @@ require conf/machine/include/arm/arch-armv8a.inc
> >
> >  # Little Endian base configs
> >  AVAILTUNES += "armv8-4a armv8-4a-crypto"
> > -ARMPKGARCH_tune-armv8-4a                    ?= "armv8-4a"
> > -ARMPKGARCH_tune-armv8-4a-crypto             ?= "armv8-4a"
> > -TUNE_FEATURES_tune-armv8-4a                  = "aarch64 armv8-4a"
> > -TUNE_FEATURES_tune-armv8-4a-crypto           =
> "${TUNE_FEATURES_tune-armv8-4a} crypto"
> > -PACKAGE_EXTRA_ARCHS_tune-armv8-4a            =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8-4a"
> > -PACKAGE_EXTRA_ARCHS_tune-armv8-4a-crypto     =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8-4a} armv8-4a-crypto"
> > -BASE_LIB_tune-armv8-4a                       = "lib64"
> > -BASE_LIB_tune-armv8-4a-crypto                = "lib64"
> > +ARMPKGARCH:tune-armv8-4a                    ?= "armv8-4a"
> > +ARMPKGARCH:tune-armv8-4a-crypto             ?= "armv8-4a"
> > +TUNE_FEATURES:tune-armv8-4a                  = "aarch64 armv8-4a"
> > +TUNE_FEATURES:tune-armv8-4a-crypto           =
> "${TUNE_FEATURES:tune-armv8-4a} crypto"
> > +PACKAGE_EXTRA_ARCHS:tune-armv8-4a            =
> "${PACKAGE_EXTRA_ARCHS:tune-armv8a} armv8-4a"
> > +PACKAGE_EXTRA_ARCHS:tune-armv8-4a-crypto     =
> "${PACKAGE_EXTRA_ARCHS:tune-armv8-4a} armv8-4a-crypto"
> > +BASE_LIB:tune-armv8-4a                       = "lib64"
> > +BASE_LIB:tune-armv8-4a-crypto                = "lib64"
> > diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-base.inc
> b/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-base.inc
> > index 04cdf7d..d9a341c 100755
> > --- a/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-base.inc
> > +++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-base.inc
> > @@ -12,6 +12,6 @@ TUNECONFLICTS[armv8m-base] = "armv4 armv5 armv6 armv7a"
> >  require conf/machine/include/arm/arch-armv7m.inc
> >
> >  AVAILTUNES                          += "armv8m-base"
> > -ARMPKGARCH_tune-armv8m-base          = "armv8m-base"
> > -TUNE_FEATURES_tune-armv8m-base       = "armv8m-base"
> > -PACKAGE_EXTRA_ARCHS_tune-armv8m-base = "armv8m-base"
> > +ARMPKGARCH:tune-armv8m-base          = "armv8m-base"
> > +TUNE_FEATURES:tune-armv8m-base       = "armv8m-base"
> > +PACKAGE_EXTRA_ARCHS:tune-armv8m-base = "armv8m-base"
> > diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-main.inc
> b/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-main.inc
> > index f2e078d..27f552b 100755
> > --- a/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-main.inc
> > +++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-main.inc
> > @@ -22,15 +22,15 @@ TUNE_CCARGS_MFPU .=
> "${@bb.utils.contains('TUNE_FEATURES', 'vfpv5spd16', 'fpv5-s
> >  MARCH_FPU = "${@bb.utils.contains('TUNE_FEATURES', [ 'vfpv5spd16' ],
> '+fp', '+nofp', d)}"
> >
> >  AVAILTUNES                                      += "armv8m-main
> armv8m-mainearmv8m-main-vfpv5spd16 armv8m-maine-vfpv5spd16"
> > -ARMPKGARCH_tune-armv8m-main                      = "armv8m-main"
> > -ARMPKGARCH_tune-armv8m-maine                     = "armv8m-main"
> > -ARMPKGARCH_tune-armv8m-main-vfpv5spd16           = "armv8m-main"
> > -ARMPKGARCH_tune-armv8m-maine-vfpv5spd16          = "armv8m-main"
> > -TUNE_FEATURES_tune-armv8m-main                   = "armv8m-main"
> > -TUNE_FEATURES_tune-armv8m-maine                  =
> "${TUNE_FEATURES_tune-armv8m-main} dsp"
> > -TUNE_FEATURES_tune-armv8m-main-vfpv5spd16        =
> "${TUNE_FEATURES_tune-armv8m-main} vfpv5spd16"
> > -TUNE_FEATURES_tune-armv8m-maine-vfpv5spd16       =
> "${TUNE_FEATURES_tune-armv8m-main-vfpv5spd16} dsp"
> > -PACKAGE_EXTRA_ARCHS_tune-armv8m-main             = "armv8m-main"
> > -PACKAGE_EXTRA_ARCHS_tune-armv8m-maine            =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8m-main} armv8m-maine"
> > -PACKAGE_EXTRA_ARCHS_tune-armv8m-main-vfpv5spd16  =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8m-main} armv8m-main-fpv5-spd16"
> > -PACKAGE_EXTRA_ARCHS_tune-armv8m-maine-vfpv5spd16 =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8m-main} armv8m-maine-fpv5-spd16"
> > +ARMPKGARCH:tune-armv8m-main                      = "armv8m-main"
> > +ARMPKGARCH:tune-armv8m-maine                     = "armv8m-main"
> > +ARMPKGARCH:tune-armv8m-main-vfpv5spd16           = "armv8m-main"
> > +ARMPKGARCH:tune-armv8m-maine-vfpv5spd16          = "armv8m-main"
> > +TUNE_FEATURES:tune-armv8m-main                   = "armv8m-main"
> > +TUNE_FEATURES:tune-armv8m-maine                  =
> "${TUNE_FEATURES:tune-armv8m-main} dsp"
> > +TUNE_FEATURES:tune-armv8m-main-vfpv5spd16        =
> "${TUNE_FEATURES:tune-armv8m-main} vfpv5spd16"
> > +TUNE_FEATURES:tune-armv8m-maine-vfpv5spd16       =
> "${TUNE_FEATURES:tune-armv8m-main-vfpv5spd16} dsp"
> > +PACKAGE_EXTRA_ARCHS:tune-armv8m-main             = "armv8m-main"
> > +PACKAGE_EXTRA_ARCHS:tune-armv8m-maine            =
> "${PACKAGE_EXTRA_ARCHS:tune-armv8m-main} armv8m-maine"
> > +PACKAGE_EXTRA_ARCHS:tune-armv8m-main-vfpv5spd16  =
> "${PACKAGE_EXTRA_ARCHS:tune-armv8m-main} armv8m-main-fpv5-spd16"
> > +PACKAGE_EXTRA_ARCHS:tune-armv8m-maine-vfpv5spd16 =
> "${PACKAGE_EXTRA_ARCHS:tune-armv8m-main} armv8m-maine-fpv5-spd16"
> > diff --git
> a/meta-arm-bsp/conf/machine/include/arm/armv8r/arch-armv8r64.inc
> b/meta-arm-bsp/conf/machine/include/arm/armv8r/arch-armv8r64.inc
> > index 92bfa31..f9383fc 100644
> > --- a/meta-arm-bsp/conf/machine/include/arm/armv8r/arch-armv8r64.inc
> > +++ b/meta-arm-bsp/conf/machine/include/arm/armv8r/arch-armv8r64.inc
> > @@ -12,15 +12,15 @@ require conf/machine/include/arm/arch-arm64.inc
> >
> >  # Little Endian base configs
> >  AVAILTUNES += "armv8r armv8r-crc armv8r-crypto"
> > -ARMPKGARCH_tune-armv8r                    ?= "armv8r"
> > -ARMPKGARCH_tune-armv8r-crc                ?= "armv8r"
> > -ARMPKGARCH_tune-armv8r-crypto             ?= "armv8r"
> > -TUNE_FEATURES_tune-armv8r                  = "aarch64 armv8r"
> > -TUNE_FEATURES_tune-armv8r-crc              =
> "${TUNE_FEATURES_tune-armv8r} crc"
> > -TUNE_FEATURES_tune-armv8r-crypto           =
> "${TUNE_FEATURES_tune-armv8r} crypto"
> > -PACKAGE_EXTRA_ARCHS_tune-armv8r            = "aarch64 armv8r"
> > -PACKAGE_EXTRA_ARCHS_tune-armv8r-crc        =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8r} armv8r-crc"
> > -PACKAGE_EXTRA_ARCHS_tune-armv8r-crypto     =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8r} armv8r-crypto"
> > -BASE_LIB_tune-armv8r                       = "lib64"
> > -BASE_LIB_tune-armv8r-crc                   = "lib64"
> > -BASE_LIB_tune-armv8r-crypto                = "lib64"
> > +ARMPKGARCH:tune-armv8r                    ?= "armv8r"
> > +ARMPKGARCH:tune-armv8r-crc                ?= "armv8r"
> > +ARMPKGARCH:tune-armv8r-crypto             ?= "armv8r"
> > +TUNE_FEATURES:tune-armv8r                  = "aarch64 armv8r"
> > +TUNE_FEATURES:tune-armv8r-crc              =
> "${TUNE_FEATURES:tune-armv8r} crc"
> > +TUNE_FEATURES:tune-armv8r-crypto           =
> "${TUNE_FEATURES:tune-armv8r} crypto"
> > +PACKAGE_EXTRA_ARCHS:tune-armv8r            = "aarch64 armv8r"
> > +PACKAGE_EXTRA_ARCHS:tune-armv8r-crc        =
> "${PACKAGE_EXTRA_ARCHS:tune-armv8r} armv8r-crc"
> > +PACKAGE_EXTRA_ARCHS:tune-armv8r-crypto     =
> "${PACKAGE_EXTRA_ARCHS:tune-armv8r} armv8r-crypto"
> > +BASE_LIB:tune-armv8r                       = "lib64"
> > +BASE_LIB:tune-armv8r-crc                   = "lib64"
> > +BASE_LIB:tune-armv8r-crypto                = "lib64"
> > diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc
> b/meta-arm-bsp/conf/machine/include/corstone700.inc
> > index 228fdd2..60ed422 100644
> > --- a/meta-arm-bsp/conf/machine/include/corstone700.inc
> > +++ b/meta-arm-bsp/conf/machine/include/corstone700.inc
> > @@ -24,7 +24,7 @@ EXTRA_IMAGEDEPENDS += " \
> >                        virtual/control-processor-firmware  \
> >                        "
> >
> > -WKS_FILE_DEPENDS_append = " ${EXTRA_IMAGEDEPENDS}"
> > +WKS_FILE_DEPENDS:append = " ${EXTRA_IMAGEDEPENDS}"
> >
> >  WKS_FILE ?= "arm-reference-image.corstone700.wks"
> >
> > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm0.inc
> b/meta-arm-bsp/conf/machine/include/tune-cortexm0.inc
> > index 7849ff6..5b29600 100755
> > --- a/meta-arm-bsp/conf/machine/include/tune-cortexm0.inc
> > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexm0.inc
> > @@ -9,6 +9,6 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES',
> 'cortexm0', ' -mcpu=cortex
> >  require conf/machine/include/arm/arch-armv6m.inc
> >
> >  AVAILTUNES                            += "cortexm0"
> > -ARMPKGARCH_tune-cortexm0               = "cortexm0"
> > -TUNE_FEATURES_tune-cortexm0            = "${TUNE_FEATURES_tune-armv6m}
> cortexm0"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexm0      =
> "${PACKAGE_EXTRA_ARCHS_tune-armv6m} cortexm0"
> > +ARMPKGARCH:tune-cortexm0               = "cortexm0"
> > +TUNE_FEATURES:tune-cortexm0            = "${TUNE_FEATURES:tune-armv6m}
> cortexm0"
> > +PACKAGE_EXTRA_ARCHS:tune-cortexm0      =
> "${PACKAGE_EXTRA_ARCHS:tune-armv6m} cortexm0"
> > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm0plus.inc
> b/meta-arm-bsp/conf/machine/include/tune-cortexm0plus.inc
> > index 83f8cac..1a3bee4 100755
> > --- a/meta-arm-bsp/conf/machine/include/tune-cortexm0plus.inc
> > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexm0plus.inc
> > @@ -9,6 +9,6 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES',
> 'cortexm0-plus', ' -mcpu=c
> >  require conf/machine/include/arm/arch-armv6m.inc
> >
> >  AVAILTUNES                            += "cortexm0-plus"
> > -ARMPKGARCH_tune-cortexm0-plus          = "cortexm0-plus"
> > -TUNE_FEATURES_tune-cortexm0-plus       = "${TUNE_FEATURES_tune-armv6m}
> cortexm0-plus"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexm0-plus =
> "${PACKAGE_EXTRA_ARCHS_tune-armv6m} cortexm0-plus"
> > +ARMPKGARCH:tune-cortexm0-plus          = "cortexm0-plus"
> > +TUNE_FEATURES:tune-cortexm0-plus       = "${TUNE_FEATURES:tune-armv6m}
> cortexm0-plus"
> > +PACKAGE_EXTRA_ARCHS:tune-cortexm0-plus =
> "${PACKAGE_EXTRA_ARCHS:tune-armv6m} cortexm0-plus"
> > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm1.inc
> b/meta-arm-bsp/conf/machine/include/tune-cortexm1.inc
> > index ed36361..16661f3 100755
> > --- a/meta-arm-bsp/conf/machine/include/tune-cortexm1.inc
> > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexm1.inc
> > @@ -9,6 +9,6 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES',
> 'cortexm1', ' -mcpu=cortex
> >  require conf/machine/include/arm/arch-armv6m.inc
> >
> >  AVAILTUNES                            += "cortexm1"
> > -ARMPKGARCH_tune-cortexm1               = "cortexm1"
> > -TUNE_FEATURES_tune-cortexm1            = "${TUNE_FEATURES_tune-armv6m}
> cortexm1"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexm1      =
> "${PACKAGE_EXTRA_ARCHS_tune-armv6m} cortexm1"
> > +ARMPKGARCH:tune-cortexm1               = "cortexm1"
> > +TUNE_FEATURES:tune-cortexm1            = "${TUNE_FEATURES:tune-armv6m}
> cortexm1"
> > +PACKAGE_EXTRA_ARCHS:tune-cortexm1      =
> "${PACKAGE_EXTRA_ARCHS:tune-armv6m} cortexm1"
> > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm23.inc
> b/meta-arm-bsp/conf/machine/include/tune-cortexm23.inc
> > index e2e0a34..25780bc 100755
> > --- a/meta-arm-bsp/conf/machine/include/tune-cortexm23.inc
> > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexm23.inc
> > @@ -9,6 +9,6 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES',
> 'cortexm23', ' -mcpu=corte
> >  require conf/machine/include/arm/arch-armv8m-base.inc
> >
> >  AVAILTUNES                          += "cortexm23"
> > -ARMPKGARCH_tune-cortexm23            = "cortexm23"
> > -TUNE_FEATURES_tune-cortexm23         =
> "${TUNE_FEATURES_tune-armv8m-base} cortexm23"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexm23   =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8m-base} cortexm23"
> > +ARMPKGARCH:tune-cortexm23            = "cortexm23"
> > +TUNE_FEATURES:tune-cortexm23         =
> "${TUNE_FEATURES:tune-armv8m-base} cortexm23"
> > +PACKAGE_EXTRA_ARCHS:tune-cortexm23   =
> "${PACKAGE_EXTRA_ARCHS:tune-armv8m-base} cortexm23"
> > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm3.inc
> b/meta-arm-bsp/conf/machine/include/tune-cortexm3.inc
> > index f837ad2..a6cb566 100755
> > --- a/meta-arm-bsp/conf/machine/include/tune-cortexm3.inc
> > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexm3.inc
> > @@ -9,6 +9,6 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES',
> 'cortexm3', ' -mcpu=cortex
> >  require conf/machine/include/arm/arch-armv7m.inc
> >
> >  AVAILTUNES                            += "cortexm3"
> > -ARMPKGARCH_tune-cortexm3               = "cortexm3"
> > -TUNE_FEATURES_tune-cortexm3            = "${TUNE_FEATURES_tune-armv7m}
> cortexm3"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexm3      =
> "${PACKAGE_EXTRA_ARCHS_tune-armv7m} cortexm3"
> > +ARMPKGARCH:tune-cortexm3               = "cortexm3"
> > +TUNE_FEATURES:tune-cortexm3            = "${TUNE_FEATURES:tune-armv7m}
> cortexm3"
> > +PACKAGE_EXTRA_ARCHS:tune-cortexm3      =
> "${PACKAGE_EXTRA_ARCHS:tune-armv7m} cortexm3"
> > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm33.inc
> b/meta-arm-bsp/conf/machine/include/tune-cortexm33.inc
> > index 105a605..04d1fe2 100755
> > --- a/meta-arm-bsp/conf/machine/include/tune-cortexm33.inc
> > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexm33.inc
> > @@ -12,6 +12,6 @@ require conf/machine/include/arm/arch-armv8m-main.inc
> >  # optional.  So forcing below so that compiling works, but this should
> >  # be fixed in GCC
> >  AVAILTUNES                          += "cortexm33"
> > -ARMPKGARCH_tune-cortexm33            = "cortexm33"
> > -TUNE_FEATURES_tune-cortexm33         =
> "${TUNE_FEATURES_tune-armv8m-maine-vfpv5spd16} cortexm33"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexm33   =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8m-maine-vfpv5spd16} cortexm33e-fpv5-spd16"
> > +ARMPKGARCH:tune-cortexm33            = "cortexm33"
> > +TUNE_FEATURES:tune-cortexm33         =
> "${TUNE_FEATURES:tune-armv8m-maine-vfpv5spd16} cortexm33"
> > +PACKAGE_EXTRA_ARCHS:tune-cortexm33   =
> "${PACKAGE_EXTRA_ARCHS:tune-armv8m-maine-vfpv5spd16} cortexm33e-fpv5-spd16"
> > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm35p.inc
> b/meta-arm-bsp/conf/machine/include/tune-cortexm35p.inc
> > index 7d73421..60e978f 100755
> > --- a/meta-arm-bsp/conf/machine/include/tune-cortexm35p.inc
> > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexm35p.inc
> > @@ -12,6 +12,6 @@ require conf/machine/include/arm/arch-armv8m-main.inc
> >  # optional.  So forcing below so that compiling works, but this should
> >  # be fixed in GCC
> >  AVAILTUNES                          += "cortexm35p"
> > -ARMPKGARCH_tune-cortexm35p           = "cortexm35p"
> > -TUNE_FEATURES_tune-cortexm35p        =
> "${TUNE_FEATURES_tune-armv8m-maine-vfpv5spd16} cortexm35p"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexm35p  =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8m-maine-vfpv5spd16} cortexm35pe-fpv5-spd16"
> > +ARMPKGARCH:tune-cortexm35p           = "cortexm35p"
> > +TUNE_FEATURES:tune-cortexm35p        =
> "${TUNE_FEATURES:tune-armv8m-maine-vfpv5spd16} cortexm35p"
> > +PACKAGE_EXTRA_ARCHS:tune-cortexm35p  =
> "${PACKAGE_EXTRA_ARCHS:tune-armv8m-maine-vfpv5spd16} cortexm35pe-fpv5-spd16"
> > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm4.inc
> b/meta-arm-bsp/conf/machine/include/tune-cortexm4.inc
> > index 8f498f5..e86622f 100755
> > --- a/meta-arm-bsp/conf/machine/include/tune-cortexm4.inc
> > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexm4.inc
> > @@ -9,6 +9,6 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES',
> 'cortexm4', ' -mcpu=cortex
> >  require conf/machine/include/arm/arch-armv7em.inc
> >
> >  AVAILTUNES                            += "cortexm4"
> > -ARMPKGARCH_tune-cortexm4               = "cortexm4"
> > -TUNE_FEATURES_tune-cortexm4            = "${TUNE_FEATURES_tune-armv7em}
> cortexm4"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexm4      =
> "${PACKAGE_EXTRA_ARCHS_tune-armv7em} cortexm4"
> > +ARMPKGARCH:tune-cortexm4               = "cortexm4"
> > +TUNE_FEATURES:tune-cortexm4            = "${TUNE_FEATURES:tune-armv7em}
> cortexm4"
> > +PACKAGE_EXTRA_ARCHS:tune-cortexm4      =
> "${PACKAGE_EXTRA_ARCHS:tune-armv7em} cortexm4"
> > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm55.inc
> b/meta-arm-bsp/conf/machine/include/tune-cortexm55.inc
> > index b92aff1..493ad67 100755
> > --- a/meta-arm-bsp/conf/machine/include/tune-cortexm55.inc
> > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexm55.inc
> > @@ -9,6 +9,6 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES',
> 'cortexm55', ' -mcpu=corte
> >  require conf/machine/include/arm/arch-armv8-1m-main.inc
> >
> >  AVAILTUNES                            += "cortexm55"
> > -ARMPKGARCH_tune-cortexm55              = "cortexm55"
> > -TUNE_FEATURES_tune-cortexm55           =
> "${TUNE_FEATURES_tune-armv8-1m-main} cortexm55"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexm55     =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8-1m-main} cortexm55"
> > +ARMPKGARCH:tune-cortexm55              = "cortexm55"
> > +TUNE_FEATURES:tune-cortexm55           =
> "${TUNE_FEATURES:tune-armv8-1m-main} cortexm55"
> > +PACKAGE_EXTRA_ARCHS:tune-cortexm55     =
> "${PACKAGE_EXTRA_ARCHS:tune-armv8-1m-main} cortexm55"
> > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm7.inc
> b/meta-arm-bsp/conf/machine/include/tune-cortexm7.inc
> > index 21b7c01..6434ec6 100755
> > --- a/meta-arm-bsp/conf/machine/include/tune-cortexm7.inc
> > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexm7.inc
> > @@ -9,6 +9,6 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES',
> 'cortexm7', ' -mcpu=cortex
> >  require conf/machine/include/arm/arch-armv7em.inc
> >
> >  AVAILTUNES                            += "cortexm7"
> > -ARMPKGARCH_tune-cortexm7               = "cortexm7"
> > -TUNE_FEATURES_tune-cortexm7            = "${TUNE_FEATURES_tune-armv7em}
> cortexm7"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexm7      =
> "${PACKAGE_EXTRA_ARCHS_tune-armv7em} cortexm7"
> > +ARMPKGARCH:tune-cortexm7               = "cortexm7"
> > +TUNE_FEATURES:tune-cortexm7            = "${TUNE_FEATURES:tune-armv7em}
> cortexm7"
> > +PACKAGE_EXTRA_ARCHS:tune-cortexm7      =
> "${PACKAGE_EXTRA_ARCHS:tune-armv7em} cortexm7"
> > diff --git a/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc
> b/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc
> > index 04e28ee..6999805 100644
> > --- a/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc
> > +++ b/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc
> > @@ -8,7 +8,7 @@ require conf/machine/include/arm/arch-armv8-2a.inc
> >
> >  # Little Endian base configs
> >  AVAILTUNES += "neoversen1"
> > -ARMPKGARCH_tune-neoversen1             = "neoversen1"
> > -TUNE_FEATURES_tune-neoversen1          = "aarch64 neoversen1 crc crypto"
> > -PACKAGE_EXTRA_ARCHS_tune-neoversen1    =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} neoversen1"
> > -BASE_LIB_tune-neoversen1               = "lib64"
> > +ARMPKGARCH:tune-neoversen1             = "neoversen1"
> > +TUNE_FEATURES:tune-neoversen1          = "aarch64 neoversen1 crc crypto"
> > +PACKAGE_EXTRA_ARCHS:tune-neoversen1    =
> "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} neoversen1"
> > +BASE_LIB:tune-neoversen1               = "lib64"
> > diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf
> b/meta-arm-bsp/conf/machine/n1sdp.conf
> > index 2126cc1..e80580d 100644
> > --- a/meta-arm-bsp/conf/machine/n1sdp.conf
> > +++ b/meta-arm-bsp/conf/machine/n1sdp.conf
> > @@ -15,7 +15,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
> >  # Set default WKS
> >  WKS_FILE ?= "n1sdp-efidisk.wks"
> >  IMAGE_EFI_BOOT_FILES ?= "n1sdp-multi-chip.dtb n1sdp-single-chip.dtb"
> > -WKS_FILE_DEPENDS_append = " ${EXTRA_IMAGEDEPENDS}"
> > +WKS_FILE_DEPENDS:append = " ${EXTRA_IMAGEDEPENDS}"
> >
> >  # Use kernel provided by yocto
> >  PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
> > diff --git a/meta-arm-bsp/conf/machine/sgi575.conf
> b/meta-arm-bsp/conf/machine/sgi575.conf
> > index cf91266..82009f3 100644
> > --- a/meta-arm-bsp/conf/machine/sgi575.conf
> > +++ b/meta-arm-bsp/conf/machine/sgi575.conf
> > @@ -26,4 +26,4 @@ MACHINE_FEATURES += "efi"
> >  IMAGE_FSTYPES += "cpio.gz wic"
> >
> >  WKS_FILE ?= "sgi575-efidisk.wks"
> > -WKS_FILE_DEPENDS_append = " ${EXTRA_IMAGEDEPENDS}"
> > +WKS_FILE_DEPENDS:append = " ${EXTRA_IMAGEDEPENDS}"
> > diff --git a/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb
> b/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb
> > index c48e586..cfcb98d 100644
> > --- a/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb
> > +++ b/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb
> > @@ -50,10 +50,10 @@ do_install() {
> >          --out ${D}/firmware/spitoc.bin
> >  }
> >
> > -FILES_${PN} = "/firmware"
> > +FILES:${PN} = "/firmware"
> >  SYSROOT_DIRS += "/firmware"
> >  # Skip QA check for relocations in .text of elf binaries
> > -INSANE_SKIP_${PN} = "textrel"
> > +INSANE_SKIP:${PN} = "textrel"
> >
> >  do_deploy() {
> >      # Copy the images to deploy directory
> > diff --git
> a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64-fvp-baser-aemv8r64.inc
> b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64-fvp-baser-aemv8r64.inc
> > index bd8e993..f1bf614 100644
> > ---
> a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64-fvp-baser-aemv8r64.inc
> > +++
> b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64-fvp-baser-aemv8r64.inc
> > @@ -1,7 +1,7 @@
> >  COMPATIBLE_MACHINE = "fvp-baser-aemv8r64"
> >
> > -FILESEXTRAPATHS_prepend := "${THISDIR}/files/${MACHINE}:"
> > -SRC_URI_append = " \
> > +FILESEXTRAPATHS:prepend := "${THISDIR}/files/${MACHINE}:"
> > +SRC_URI:append = " \
> >      file://0001-Decouple-V2M_SYS-config-by-auto-detect-dtb-node.patch \
> >      file://0002-arch64-Introduce-EL2-boot-code-for-v8-r64.patch \
> >      file://0003-Allow-enable-psci-to-choose-between-smc-and-hvc.patch \
> > diff --git a/meta-arm-bsp/recipes-bsp/external-system/
> external-system_0.1.0.bb b/meta-arm-bsp/recipes-bsp/external-system/
> external-system_0.1.0.bb
> > index a8052c6..1ab745e 100644
> > --- a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
> > +++ b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
> > @@ -34,7 +34,7 @@ do_install() {
> >      install -D -p -m 0644
> ${B}/product/${PRODUCT}/firmware/release/bin/firmware.bin
> ${D}/firmware/es_flashfw.bin
> >  }
> >
> > -FILES_${PN} = "/firmware"
> > +FILES:${PN} = "/firmware"
> >  SYSROOT_DIRS += "/firmware"
> >
> >  inherit deploy
> > diff --git a/meta-arm-bsp/recipes-bsp/images/
> n1sdp-board-firmware_2020.07.27.bb b/meta-arm-bsp/recipes-bsp/images/
> n1sdp-board-firmware_2020.07.27.bb
> > index 1551ac9..228ed92 100644
> > --- a/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2020.07.27.bb
> > +++ b/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2020.07.27.bb
> > @@ -24,7 +24,7 @@ do_install() {
> >      cp -Rp --no-preserve=ownership ${S}/* ${D}${INSTALL_DIR}
> >  }
> >
> > -FILES_${PN} = "${INSTALL_DIR}"
> > +FILES:${PN} = "${INSTALL_DIR}"
> >  SYSROOT_DIRS += "${INSTALL_DIR}"
> >
> >  do_deploy() {
> > diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc
> b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc
> > index 9e1e1c2..a72cbd9 100644
> > --- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc
> > +++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc
> > @@ -4,4 +4,4 @@ COMPATIBLE_MACHINE = "juno"
> >
> >  SCP_PLATFORM = "juno"
> >  FW_TARGETS = "scp"
> > -FW_INSTALL_append = " romfw_bypass"
> > +FW_INSTALL:append = " romfw_bypass"
> > diff --git
> a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
> b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
> > index 0772364..01b8349 100644
> > --- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
> > +++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
> > @@ -3,9 +3,9 @@
> >  SCP_PLATFORM  = "n1sdp"
> >  SCP_LOG_LEVEL = "INFO"
> >
> > -FILESEXTRAPATHS_prepend := "${THISDIR}/files/:"
> > +FILESEXTRAPATHS:prepend := "${THISDIR}/files/:"
> >
> > -SRC_URI_append = " \
> > +SRC_URI:append = " \
> >     file://enabling-coresight-debug-non-secure-access.patch \
> >     "
> >
> > @@ -14,7 +14,7 @@ COMPATIBLE_MACHINE_n1sdp = "n1sdp"
> >  DEPENDS += "fiptool-native"
> >  DEPENDS += "virtual/trusted-firmware-a"
> >
> > -do_install_append() {
> > +do_install:append() {
> >     fiptool \
> >         create \
> >         --scp-fw "${D}/firmware/scp_ramfw.bin" \
> > diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
> b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
> > index 62a0e25..761a370 100644
> > --- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
> > +++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
> > @@ -5,7 +5,7 @@ SRCREV = "67a3612716ad3b839da4209a173404692607c5a1"
> >  PV = "2.8+git${SRCPV}"
> >
> >  # This is incorporated into the SRCREV above
> > -SRC_URI_remove = " \
> > +SRC_URI:remove = " \
> >
> file://0001-smt-Make-status-and-length-volatile-for-mod_smt_memo.patch \
> >      "
> >
> > diff --git
> a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone500.inc
> b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone500.inc
> > index 4d3432c..acd9e3d 100644
> > ---
> a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone500.inc
> > +++
> b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone500.inc
> > @@ -7,7 +7,7 @@ TFA_UBOOT = "1"
> >  TFA_BUILD_TARGET = "all fip"
> >  TFA_INSTALL_TARGET = "bl1.bin fip.bin"
> >
> > -EXTRA_OEMAKE_append = " \
> > +EXTRA_OEMAKE:append = " \
> >                      ARCH=aarch32 \
> >                      FVP_HW_CONFIG_DTS=fdts/a5ds.dts \
> >                      ARM_ARCH_MAJOR=7 \
> > diff --git
> a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc
> b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc
> > index 5755005..d600de9 100644
> > ---
> a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc
> > +++
> b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc
> > @@ -7,7 +7,7 @@ TFA_UBOOT = "1"
> >  TFA_BUILD_TARGET = "all fip"
> >  TFA_INSTALL_TARGET = "fip.bin"
> >
> > -EXTRA_OEMAKE_append = " \
> > +EXTRA_OEMAKE:append = " \
> >                          ARCH=aarch32 \
> >                          TARGET_PLATFORM=${TFA_TARGET_PLATFORM} \
> >                          AARCH32_SP=sp_min \
> > diff --git
> a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-arm32.inc
> b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-arm32.inc
> > index 117c25f..fdaadb9 100644
> > ---
> a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-arm32.inc
> > +++
> b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-arm32.inc
> > @@ -5,7 +5,7 @@ TFA_PLATFORM = "fvp"
> >  TFA_UBOOT = "1"
> >  TFA_BUILD_TARGET = "dtbs bl1 bl32 fip"
> >
> > -EXTRA_OEMAKE_append = " \
> > +EXTRA_OEMAKE:append = " \
> >      ARCH=aarch32 \
> >      AARCH32_SP=sp_min \
> >      "
> > diff --git
> a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
> b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
> > index 3aa8520..c7293c0 100644
> > ---
> a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
> > +++
> b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
> > @@ -10,4 +10,4 @@ TFA_BUILD_TARGET = "bl1 bl2 bl31 dtbs fip"
> >  # Juno needs the System Control Processor Firmware
> >  DEPENDS += "virtual/control-processor-firmware"
> >
> > -EXTRA_OEMAKE_append = "
> SCP_BL2=${RECIPE_SYSROOT}/firmware/scp_ramfw.bin"
> > +EXTRA_OEMAKE:append = "
> SCP_BL2=${RECIPE_SYSROOT}/firmware/scp_ramfw.bin"
> > diff --git
> a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.%.bbappend
> b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.%.bbappend
> > index e5b10ff..f317cb8 100644
> > ---
> a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.%.bbappend
> > +++
> b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.%.bbappend
> > @@ -1,3 +1,3 @@
> > -FILESEXTRAPATHS_prepend := "${THISDIR}/files/:"
> > +FILESEXTRAPATHS:prepend := "${THISDIR}/files/:"
> >
> >  # Don't put machine customisation in here, use a versioned append.
> > \ No newline at end of file
> > diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> > index 692b4eb..3631c9e 100644
> > --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> > +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> > @@ -1,13 +1,13 @@
> >  # Machine specific u-boot
> >
> > -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> > +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> >
> >  #
> >  # FVP BASE
> >  #
> > -SRC_URI_append_fvp-base = " file://bootargs.cfg"
> > +SRC_URI:append_fvp-base = " file://bootargs.cfg"
> >
> >  #
> >  # FVP BASE ARM32
> >  #
> > -SRC_URI_append_fvp-base-arm32 = "
> file://0001-Add-vexpress_aemv8a_aarch32-variant.patch"
> > +SRC_URI:append_fvp-base-arm32 = "
> file://0001-Add-vexpress_aemv8a_aarch32-variant.patch"
> > diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bbappend
> b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bbappend
> > index 00b40e5..54d8a1f 100644
> > --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bbappend
> > +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bbappend
> > @@ -1,8 +1,8 @@
> >  #
> >  # Corstone700 KMACHINE
> >  #
> > -FILESEXTRAPATHS_prepend_corstone700 := "${THISDIR}/${BP}/corstone700:"
> > -SRC_URI_append_corstone700 = "
> file://0001-arm-Add-corstone700-platform.patch \
> > +FILESEXTRAPATHS:prepend_corstone700 := "${THISDIR}/${BP}/corstone700:"
> > +SRC_URI:append_corstone700 = "
> file://0001-arm-Add-corstone700-platform.patch \
> >
>  file://0002-boot-add-bootx-command-to-start-XiP-images.patch \
> >
>  file://0003-boot-starting-the-XIP-kernel-using-bootx-command.patch \
> >
>  file://0004-arm-enabling-the-arch_timer-driver.patch"
> > diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
> b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
> > index add6a78..113f26d 100644
> > --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
> > +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
> > @@ -1,16 +1,16 @@
> >  # Machine specific u-boot
> >
> >  THIS_DIR := "${THISDIR}"
> > -FILESEXTRAPATHS_prepend = "${THIS_DIR}/${BP}:"
> > +FILESEXTRAPATHS:prepend = "${THIS_DIR}/${BP}:"
> >
> >  #
> >  # Corstone-500 MACHINE
> >  #
> > -SRC_URI_append_corstone500 = " \
> > +SRC_URI:append_corstone500 = " \
> >
>  file://0001-armv7-adding-generic-timer-access-through-MMIO.patch \
> >                     file://0002-board-arm-add-corstone500-board.patch"
> >
> >  #
> >  # Juno KMACHINE
> >  #
> > -SRC_URI_append_juno = " file://u-boot_vexpress_uenv.patch"
> > +SRC_URI:append_juno = " file://u-boot_vexpress_uenv.patch"
> > diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.07.bbappend
> b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.07.bbappend
> > index ad6147f..7c5384e 100644
> > --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.07.bbappend
> > +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.07.bbappend
> > @@ -1,12 +1,12 @@
> >  # Machine specific u-boot
> >
> >  THIS_DIR := "${THISDIR}"
> > -FILESEXTRAPATHS_prepend = "${THIS_DIR}/${BP}:"
> > +FILESEXTRAPATHS:prepend = "${THIS_DIR}/${BP}:"
> >
> >  #
> >  # TC0 MACHINE
> >  #
> > -SRC_URI_append_tc0 = " \
> > +SRC_URI:append_tc0 = " \
> >
> file://0001-board-armltd-Remove-bootargs-from-Total-Compute-conf.patch \
> >      file://0002-cmd-part-Correct-error-handling.patch \
> >      file://bootargs.cfg \
> > diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> > index 0009e85..3749d01 100644
> > --- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> > +++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> > @@ -1,6 +1,6 @@
> > -FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> > +FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
> >
> > -SRC_URI_append = "
> file://Add-mem-regions-to-support.patch;patchdir=${S}/edk2-platforms \
> > +SRC_URI:append = "
> file://Add-mem-regions-to-support.patch;patchdir=${S}/edk2-platforms \
> >
>  file://Introduce-platform-DXE-driver.patch;patchdir=${S}/edk2-platforms \
> >
>  file://Enable-N1SDP-platform-specific-configs.patch;patchdir=${S}/edk2-platforms
> \
> >
>  file://Configuration-Manager-for-N1SDP.patch;patchdir=${S}/edk2-platforms "
> > @@ -19,7 +19,7 @@ COMPATIBLE_MACHINE = "n1sdp"
> >  EFIDIR             = "/EFI/BOOT"
> >  EFI_BOOT_IMAGE     = "bootaa64.efi"
> >
> > -do_deploy_append() {
> > +do_deploy:append() {
> >      EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
> >      printf 'FS2:%s\%s\n' "$EFIPATH" "${EFI_BOOT_IMAGE}" >
> ${DEPLOYDIR}/startup.nsh
> >  }
> > diff --git
> a/meta-arm-bsp/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
> b/meta-arm-bsp/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
> > index 2c5f61a..65e37d8 100644
> > --- a/meta-arm-bsp/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
> > +++ b/meta-arm-bsp/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
> > @@ -5,4 +5,4 @@
> >  #
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >
> > -FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> > +FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
> > diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
> b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
> > index ef87fd6..0fc2d34 100644
> > --- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
> > +++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
> > @@ -13,12 +13,12 @@ ARMBSPFILESPATHS := "${THISDIR}:${THISDIR}/files:"
> >
> >  # Arm platforms kmeta
> >  SRC_URI_KMETA =
> "file://arm-platforms-kmeta;type=kmeta;name=arm-platforms-kmeta;destsuffix=arm-platforms-kmeta"
> > -SRC_URI_append_fvp-base = " ${SRC_URI_KMETA}"
> > -SRC_URI_append_fvp-base-arm32 = " ${SRC_URI_KMETA}"
> > -SRC_URI_append_juno = " ${SRC_URI_KMETA}"
> > -SRC_URI_append_n1sdp = " ${SRC_URI_KMETA}"
> > -SRC_URI_append_fvp-baser-aemv8r64 = " ${SRC_URI_KMETA}"
> > -SRCREV_arm-platforms-kmeta = "6147e82375aa9df8f2a162d42ea6406c79c854c5"
> > +SRC_URI:append_fvp-base = " ${SRC_URI_KMETA}"
> > +SRC_URI:append_fvp-base-arm32 = " ${SRC_URI_KMETA}"
> > +SRC_URI:append_juno = " ${SRC_URI_KMETA}"
> > +SRC_URI:append_n1sdp = " ${SRC_URI_KMETA}"
> > +SRC_URI:append_fvp-baser-aemv8r64 = " ${SRC_URI_KMETA}"
> > +SRCREV:arm-platforms-kmeta = "6147e82375aa9df8f2a162d42ea6406c79c854c5"
> >
> >  #
> >  # Corstone-500 KMACHINE
> > @@ -30,15 +30,15 @@ COMPATIBLE_MACHINE_corstone500 = "corstone500"
> >  #
> >  COMPATIBLE_MACHINE_fvp-base = "fvp-base"
> >  KMACHINE_fvp-base = "fvp"
> > -FILESEXTRAPATHS_prepend_fvp-base := "${ARMBSPFILESPATHS}"
> > +FILESEXTRAPATHS:prepend_fvp-base := "${ARMBSPFILESPATHS}"
> >
> >  #
> >  # FVP BASE ARM32 KMACHINE
> >  #
> >  COMPATIBLE_MACHINE_fvp-base-arm32 = "fvp-base-arm32"
> >  KMACHINE_fvp-base-arm32 = "fvp-arm32"
> > -FILESEXTRAPATHS_prepend_fvp-base-arm32 := "${ARMBSPFILESPATHS}"
> > -SRC_URI_append_fvp-base-arm32 = " file://fvp-base-arm32-dts.patch \
> > +FILESEXTRAPATHS:prepend_fvp-base-arm32 := "${ARMBSPFILESPATHS}"
> > +SRC_URI:append_fvp-base-arm32 = " file://fvp-base-arm32-dts.patch \
> >
> file://0001-ARM-vexpress-enable-GICv3.patch"
> >
> >  #
> > @@ -48,8 +48,8 @@ COMPATIBLE_MACHINE_juno = "juno"
> >  KMACHINE_juno = "juno"
> >  KBUILD_DEFCONFIG_juno = "defconfig"
> >  KCONFIG_MODE_juno = "--alldefconfig"
> > -FILESEXTRAPATHS_prepend_juno := "${ARMBSPFILESPATHS}"
> > -SRC_URI_append_juno = " \
> > +FILESEXTRAPATHS:prepend_juno := "${ARMBSPFILESPATHS}"
> > +SRC_URI:append_juno = " \
> >
> file://0001-mailbox-add-support-for-doorbell-signal-mode-control.patch \
> >
> file://0002-dt-bindings-mailbox-add-bindings-to-support-ARM-MHU-.patch \
> >      file://0003-mailbox-arm_mhu-migrate-to-threaded-irq-handler.patch \
> > @@ -74,8 +74,8 @@ KCONFIG_MODE_sgi575 = "--alldefconfig"
> >  COMPATIBLE_MACHINE_tc0 = "tc0"
> >  KMACHINE_tc0 = "tc0"
> >  KCONFIG_MODE_tc0 = "--alldefconfig"
> > -FILESEXTRAPATHS_prepend_tc0 := "${ARMBSPFILESPATHS}"
> > -SRC_URI_append_tc0 = " \
> > +FILESEXTRAPATHS:prepend_tc0 := "${ARMBSPFILESPATHS}"
> > +SRC_URI:append_tc0 = " \
> >      file://defconfig \
> >      file://0001-drm-Add-component-aware-simple-encoder.patch \
> >
> file://0002-drm-arm-komeda-add-RENDER-capability-to-the-device-n.patch \
> > @@ -103,12 +103,12 @@ SRC_URI_append_tc0 = " \
> >  #
> >  # N1SDP KMACHINE
> >  #
> > -FILESEXTRAPATHS_prepend_n1sdp := "${THISDIR}/linux-yocto-5.10/n1sdp:"
> > +FILESEXTRAPATHS:prepend_n1sdp := "${THISDIR}/linux-yocto-5.10/n1sdp:"
> >  COMPATIBLE_MACHINE_n1sdp = "n1sdp"
> >  KBUILD_DEFCONFIG_n1sdp = "defconfig"
> >  KCONFIG_MODE_n1sdp = "--alldefconfig"
> > -FILESEXTRAPATHS_prepend_n1sdp := "${ARMBSPFILESPATHS}"
> > -SRC_URI_append_n1sdp = " \
> > +FILESEXTRAPATHS:prepend_n1sdp := "${ARMBSPFILESPATHS}"
> > +SRC_URI:append_n1sdp = " \
> >      file://0001-pci_quirk-add-acs-override-for-PCI-devices.patch \
> >
> file://0002-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch \
> >      file://0003-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch \
> > @@ -121,7 +121,7 @@ SRC_URI_append_n1sdp = " \
> >      "
> >  # Since we use the intree defconfig and the preempt-rt turns off some
> configs
> >  # do_kernel_configcheck will display warnings. So, lets disable it.
> > -KCONF_AUDIT_LEVEL_n1sdp_pn-linux-yocto-rt = "0"
> > +KCONF_AUDIT_LEVEL_n1sdp:pn-linux-yocto-rt = "0"
> >
> >  #
> >  # Musca B1/S2 can't run Linux
> > @@ -133,5 +133,5 @@ COMPATIBLE_MACHINE_musca-s1 = "(^$)"
> >  # FVP BaseR AEMv8r64 Machine
> >  #
> >  COMPATIBLE_MACHINE_fvp-baser-aemv8r64 = "fvp-baser-aemv8r64"
> > -FILESEXTRAPATHS_prepend_fvp-baser-aemv8r64 := "${ARMBSPFILESPATHS}"
> > -SRC_URI_append_fvp-baser-aemv8r64 = "
> file://fvp-baser-aemv8r64.dts;subdir=git/arch/arm64/boot/dts/arm"
> > +FILESEXTRAPATHS:prepend_fvp-baser-aemv8r64 := "${ARMBSPFILESPATHS}"
> > +SRC_URI:append_fvp-baser-aemv8r64 = "
> file://fvp-baser-aemv8r64.dts;subdir=git/arch/arm64/boot/dts/arm"
> > diff --git
> a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_5.10.bbappend
> b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_5.10.bbappend
> > index 55dac37..e2f9145 100644
> > --- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_5.10.bbappend
> > +++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_5.10.bbappend
> > @@ -1,5 +1,5 @@
> >  # Machine specific configurations
> >
> > -FILESEXTRAPATHS_prepend := "${THISDIR}/${BP}:"
> > +FILESEXTRAPATHS:prepend := "${THISDIR}/${BP}:"
> >
> >  require linux-arm-platforms.inc
> > diff --git
> a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-corstone700.inc
> b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-corstone700.inc
> > index eb584e5..8b2a282 100644
> > --- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-corstone700.inc
> > +++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-corstone700.inc
> > @@ -1,4 +1,4 @@
> > -FILESEXTRAPATHS_prepend := "${THISDIR}:${THISDIR}/files:"
> > +FILESEXTRAPATHS:prepend := "${THISDIR}:${THISDIR}/files:"
> >
> >  COMPATIBLE_MACHINE = "${MACHINE}"
> >
> > @@ -31,12 +31,12 @@ KERNEL_IMAGETYPE = "xipImage"
> >
> >  KCONFIG_MODE = "--alldefconfig"
> >
> > -SRC_URI_append = " ${SRC_URI_KMETA}"
> > +SRC_URI:append = " ${SRC_URI_KMETA}"
> >
> >  KERNEL_EXTRA_FEATURES = "bsp/arm-platforms/corstone700-bsp.scc"
> > -KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
> > +KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
> >
> > -KERNEL_FEATURES_append_corstone700-fvp = " \
> > +KERNEL_FEATURES:append_corstone700-fvp = " \
> >      ${@bb.utils.contains('MACHINE_FEATURES', \
> >                           'eth_lan91c111', \
> >
>  'bsp/arm-platforms/corstone700/xip_dhcp_cmdline.cfg \
> > @@ -44,7 +44,7 @@ KERNEL_FEATURES_append_corstone700-fvp = " \
> >
>  'bsp/arm-platforms/corstone700/xip_cmdline.cfg', \
> >                            d)}"
> >
> > -KERNEL_FEATURES_append_corstone700-mps3 = " \
> > +KERNEL_FEATURES:append_corstone700-mps3 = " \
> >      ${@bb.utils.contains('MACHINE_FEATURES', \
> >                           'eth_lan9115', \
> >
>  'bsp/arm-platforms/corstone700/xip_dhcp_cmdline.cfg \
> > diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3%.bbappend
> b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3%.bbappend
> > index f931d7d..498ef1d 100644
> > --- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3%.bbappend
> > +++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3%.bbappend
> > @@ -1,6 +1,6 @@
> > -FILESEXTRAPATHS_prepend := "${THISDIR}/linux-yocto-5.3:"
> > +FILESEXTRAPATHS:prepend := "${THISDIR}/linux-yocto-5.3:"
> >
> > -SRC_URI_append = "
> file://0001-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch \
> > +SRC_URI:append = "
> file://0001-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch \
> >
>  file://0002-perf-tests-bp_account-Make-global-variable-static.patch \
> >
>  file://0003-perf-bench-Share-some-global-variables-to-fix-build-.patch \
> >
>  file://0004-libtraceevent-Fix-build-with-binutils-2.35.patch \
> > diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6%.bbappend
> b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6%.bbappend
> > index c4c55ad..7de3ebd 100644
> > --- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6%.bbappend
> > +++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6%.bbappend
> > @@ -1,6 +1,6 @@
> > -FILESEXTRAPATHS_prepend := "${THISDIR}/linux-yocto-5.6:"
> > +FILESEXTRAPATHS:prepend := "${THISDIR}/linux-yocto-5.6:"
> >
> > -SRC_URI_append = "
> file://0001-libtraceevent-Fix-build-with-binutils-2.35.patch \
> > +SRC_URI:append = "
> file://0001-libtraceevent-Fix-build-with-binutils-2.35.patch \
> >
>  file://0002-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch"
> >
> >  #
> > diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bbappend
> b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bbappend
> > index 607a50e..03ce8e9 100644
> > --- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bbappend
> > +++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bbappend
> > @@ -1,5 +1,5 @@
> > -FILESEXTRAPATHS_prepend := "${THISDIR}/linux-yocto-5.7:"
> > +FILESEXTRAPATHS:prepend := "${THISDIR}/linux-yocto-5.7:"
> >
> > -SRC_URI_append = " file://coresight-traceid.patch \
> > +SRC_URI:append = " file://coresight-traceid.patch \
> >                     file://defconfig.patch \
> >                   "
> > diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc
> b/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc
> > index c48cc6c..0542efa 100644
> > --- a/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc
> > +++ b/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc
> > @@ -5,8 +5,8 @@
> >  SRCREV = "49dbb9ef65643c4322cf3f848910fa880d1c02f6"
> >  PV = "3.14.0+git${SRCPV}"
> >
> > -FILESEXTRAPATHS_prepend_tc0 := "${THISDIR}/files/optee-os/tc0:"
> > -SRC_URI_append = " \
> > +FILESEXTRAPATHS:prepend_tc0 := "${THISDIR}/files/optee-os/tc0:"
> > +SRC_URI:append = " \
> >      file://sp_layout.json \
> >      file://0001-WIP-Enable-managed-exit.patch \
> >      "
> > @@ -27,7 +27,7 @@ EXTRA_OEMAKE += " CFG_WITH_STATS=y"
> >  EXTRA_OEMAKE += " CFG_CORE_SEL2_SPMC=y"
> >
> >  # Copy optee manifest file
> > -do_install_append() {
> > +do_install:append() {
> >      install -d ${D}${nonarch_base_libdir}/firmware/
> >      install -m 644 ${WORKDIR}/sp_layout.json
> ${D}${nonarch_base_libdir}/firmware/
> >      install -m 644 \
> > diff --git
> a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> > index a89f2f0..9ee9a5d 100644
> > ---
> a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> > +++
> b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> > @@ -126,7 +126,7 @@ def eat_get_bfd_version(d):
> >          first_line = stdout.splitlines()[0]
> >          return first_line.split()[-1]
> >
> > -python external_arm_toolchain_version_handler () {
> > +python external:arm_toolchain_version_handler () {
> >      if not isinstance(e, bb.event.ConfigParsed):
> >          return
> >      d = e.data
> > @@ -140,4 +140,4 @@ python external_arm_toolchain_version_handler () {
> >      d.setVar('EAT_VER_GDB', eat_get_gdb_version(ld))
> >      d.setVar('EAT_VER_BFD', eat_get_bfd_version(ld))
> >  }
> > -addhandler external_arm_toolchain_version_handler
> > +addhandler external:arm_toolchain_version_handler
> > diff --git
> a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> > index 7d5aecc..a3ea26f 100644
> > --- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> > +++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> > @@ -7,16 +7,16 @@ EXTERNAL_TOOLCHAIN ?=
> "/usr/local/arm-binary-toolchain/${TARGET_ARCH}"
> >  TOOLCHAIN_PATH_ADD = "${EXTERNAL_TOOLCHAIN}/bin:"
> >  PATH =. "${TOOLCHAIN_PATH_ADD}"
> >
> > -EAT_TARGET_SYS_arm ?= "${@ 'arm-none-linux-gnueabihf' if
> os.path.exists('${EXTERNAL_TOOLCHAIN}/bin/arm-none-linux-gnueabihf-gcc')
> else 'arm-linux-gnueabihf'}"
> > -EAT_TARGET_SYS_aarch64 ?= "${@ 'aarch64-none-linux-gnu' if
> os.path.exists('${EXTERNAL_TOOLCHAIN}/bin/aarch64-none-linux-gnu-gcc') else
> 'aarch64-linux-gnu'}"
> > +EAT_TARGET_SYS:arm ?= "${@ 'arm-none-linux-gnueabihf' if
> os.path.exists('${EXTERNAL_TOOLCHAIN}/bin/arm-none-linux-gnueabihf-gcc')
> else 'arm-linux-gnueabihf'}"
> > +EAT_TARGET_SYS:aarch64 ?= "${@ 'aarch64-none-linux-gnu' if
> os.path.exists('${EXTERNAL_TOOLCHAIN}/bin/aarch64-none-linux-gnu-gcc') else
> 'aarch64-linux-gnu'}"
> >  EAT_TARGET_SYS = "${TARGET_SYS}"
> >  TARGET_PREFIX = "${EAT_TARGET_SYS}-"
> >
> > -EAT_LIBDIR_arm = "lib"
> > -EAT_LIBDIR_aarch64 = "lib64"
> > +EAT_LIBDIR:arm = "lib"
> > +EAT_LIBDIR:aarch64 = "lib64"
> >
> > -GCCMULTILIB_forcevariable = "--disable-multilib"
> > -IMAGE_LINGUAS_forcevariable = ""
> > +GCCMULTILIB:forcevariable = "--disable-multilib"
> > +IMAGE_LINGUAS:forcevariable = ""
> >
> >  # Blacklist toolchain recipes as a belt-and-suspenders way to use the
> external toolchain
> >  PNBLACKLIST[glibc] = "Using external toolchain"
> > @@ -62,7 +62,7 @@ DISTRO_FEATURES_LIBC = "ipv4 ipv6 libc-backtrace
> libc-big-macros libc-bsd libc-c
> >  ENABLE_BINARY_LOCALE_GENERATION = "0"
> >  GLIBC_INTERNAL_USE_BINARY_LOCALE = "precompiled"
> >  LIBCOVERRIDE = ":libc-glibc"
> > -LIBC_DEPENDENCIES_remove = "glibc-gconv-cp1252 glibc-gconv-ibm850
> glibc-gconv-iso8859-1 glibc-gconv-iso8859-15 glibc-localedata-i18n"
> > +LIBC_DEPENDENCIES:remove = "glibc-gconv-cp1252 glibc-gconv-ibm850
> glibc-gconv-iso8859-1 glibc-gconv-iso8859-15 glibc-localedata-i18n"
> >
> >  ERROR_QA[type] ?= "list"
> >  python toolchain_metadata_setup () {
> > diff --git a/meta-arm-toolchain/conf/layer.conf
> b/meta-arm-toolchain/conf/layer.conf
> > index 04486d4..b4232df 100644
> > --- a/meta-arm-toolchain/conf/layer.conf
> > +++ b/meta-arm-toolchain/conf/layer.conf
> > @@ -12,10 +12,10 @@ BBFILE_PRIORITY_arm-toolchain = "5"
> >  LICENSE_PATH += "${LAYERDIR}/custom-licenses"
> >
> >  LAYERDEPENDS_arm-toolchain = "core"
> > -LAYERSERIES_COMPAT_arm-toolchain = "hardknott"
> > +LAYERSERIES_COMPAT_arm-toolchain = "honister"
> >
> >  # do not error out on bbappends for missing recipes
> >  BB_DANGLINGAPPENDS_WARNONLY = "true"
> >
> >  # These variables are used for armcompiler license
> > -BB_HASHBASE_WHITELIST_append = " ARM_TOOL_VARIANT ARMLMD_LICENSE_FILE
> LM_LICENSE_FILE"
> > +BB_HASHBASE_WHITELIST:append = " ARM_TOOL_VARIANT ARMLMD_LICENSE_FILE
> LM_LICENSE_FILE"
> > diff --git
> a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
> > index 046ab62..f237454 100644
> > ---
> a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
> > +++
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
> > @@ -1,6 +1,6 @@
> >  INHIBIT_DEFAULT_DEPS = "1"
> >
> > -FILES_${PN} = "${datadir} ${bindir}"
> > +FILES:${PN} = "${datadir} ${bindir}"
> >
> >  BINNAME = "${@d.getVar("BPN").strip("gcc-")}"
> >
> > @@ -15,7 +15,7 @@ do_install() {
> >      done
> >  }
> >
> > -INSANE_SKIP_${PN} = "already-stripped libdir staticdev file-rdeps arch
> dev-so"
> > +INSANE_SKIP:${PN} = "already-stripped libdir staticdev file-rdeps arch
> dev-so"
> >
> >  INHIBIT_SYSROOT_STRIP = "1"
> >  INHIBIT_PACKAGE_STRIP = "1"
> > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> external-arm-sdk-toolchain.bb
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> external-arm-sdk-toolchain.bb
> > index 4f0adce..138245d 100644
> > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> external-arm-sdk-toolchain.bb
> > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> external-arm-sdk-toolchain.bb
> > @@ -15,9 +15,9 @@ EXCLUDE_FROM_SHLIBS = "1"
> >  LIC_FILES_CHKSUM =
> "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> >
> >  # Skip packaging QA checks for prebuilt binaries
> > -INSANE_SKIP_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so
> staticdev file-rdeps libdir"
> > -INSANE_SKIP_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so
> file-rdeps"
> > -INSANE_SKIP_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so
> file-rdeps"
> > +INSANE_SKIP:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so
> staticdev file-rdeps libdir"
> > +INSANE_SKIP:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so
> file-rdeps"
> > +INSANE_SKIP:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so
> file-rdeps"
> >
> >  # Skip file dependencies in RPM for prebuilt binaries
> >  SKIP_FILEDEPS = "1"
> > @@ -41,7 +41,7 @@ libexecdir = "${exec_prefix}/libexec"
> >  datadir = "${exec_prefix}/share"
> >  gcclibdir = "${libdir}/gcc"
> >
> > -FILES_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
> > +FILES:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
> >         ${prefix}/${EAT_TARGET_SYS}/lib/libstdc++.* \
> >         ${prefix}/${EAT_TARGET_SYS}/lib/libgcc_s.* \
> >         ${prefix}/${EAT_TARGET_SYS}/lib/libsupc++.* \
> > @@ -54,12 +54,12 @@ FILES_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =
> "\
> >         ${libexecdir}/* \
> >  "
> >
> > -FILES_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
> > +FILES:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
> >         ${bindir}/${TARGET_PREFIX}gdb* \
> >         ${datadir}/gdb/* \
> >  "
> >
> > -FILES_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
> > +FILES:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
> >         ${prefix}/${EAT_TARGET_SYS}/bin/ld* \
> >         ${prefix}/${EAT_TARGET_SYS}/bin/objcopy \
> >         ${prefix}/${EAT_TARGET_SYS}/bin/strip \
> > @@ -85,17 +85,17 @@
> FILES_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
> >         ${bindir}/${TARGET_PREFIX}size \
> >  "
> >
> > -DESCRIPTION_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "The GNU cc
> and gcc C compilers"
> > -DESCRIPTION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb - GNU
> debugger"
> > -DESCRIPTION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "A GNU
> collection of binary utilities"
> > +DESCRIPTION:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "The GNU cc
> and gcc C compilers"
> > +DESCRIPTION:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb - GNU
> debugger"
> > +DESCRIPTION:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "A GNU
> collection of binary utilities"
> >
> > -LICENSE_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =
> "${EAT_GCC_LICENSE}"
> > -LICENSE_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =
> "${EAT_GDB_LICENSE}"
> > -LICENSE_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =
> "${EAT_BFD_LICENSE}"
> > +LICENSE:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =
> "${EAT_GCC_LICENSE}"
> > +LICENSE:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =
> "${EAT_GDB_LICENSE}"
> > +LICENSE:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =
> "${EAT_BFD_LICENSE}"
> >
> > -PKGV_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_GCC}"
> > -PKGV_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_GDB}"
> > -PKGV_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =
> "${EAT_VER_BFD}"
> > +PKGV:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_GCC}"
> > +PKGV:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_GDB}"
> > +PKGV:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =
> "${EAT_VER_BFD}"
> >
> >  do_install() {
> >         install -d ${D}${prefix}/${EAT_TARGET_SYS}/bin
> > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> external-arm-toolchain.bb
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> external-arm-toolchain.bb
> > index c506c41..a58eeb4 100644
> > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> external-arm-toolchain.bb
> > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> external-arm-toolchain.bb
> > @@ -322,132 +322,132 @@ PACKAGES += "\
> >         ${PN}-staticdev \
> >  "
> >
> > -INSANE_SKIP_${PN}-dbg = "staticdev"
> > -INSANE_SKIP_${PN}-utils += "ldflags"
> > -INSANE_SKIP_libstdc++ += "ldflags"
> > -INSANE_SKIP_libgfortran += "ldflags"
> > -INSANE_SKIP_libgcc += "ldflags dev-deps"
> > -INSANE_SKIP_libgcc-dev += "staticdev"
> > -INSANE_SKIP_libgfortran += "ldflags dev-deps"
> > -INSANE_SKIP_libstdc++ += "ldflags dev-deps"
> > -INSANE_SKIP_libatomic += "ldflags"
> > -INSANE_SKIP_libasan += "ldflags"
> > -INSANE_SKIP_libubsan += "ldflags"
> > -INSANE_SKIP_libssp += "ldflags"
> > -INSANE_SKIP_libgomp += "ldflags"
> > -INSANE_SKIP_libitm += "ldflags"
> > -INSANE_SKIP_gdbserver += "ldflags"
> > +INSANE_SKIP:${PN}-dbg = "staticdev"
> > +INSANE_SKIP:${PN}-utils += "ldflags"
> > +INSANE_SKIP:libstdc++ += "ldflags"
> > +INSANE_SKIP:libgfortran += "ldflags"
> > +INSANE_SKIP:libgcc += "ldflags dev-deps"
> > +INSANE_SKIP:libgcc-dev += "staticdev"
> > +INSANE_SKIP:libgfortran += "ldflags dev-deps"
> > +INSANE_SKIP:libstdc++ += "ldflags dev-deps"
> > +INSANE_SKIP:libatomic += "ldflags"
> > +INSANE_SKIP:libasan += "ldflags"
> > +INSANE_SKIP:libubsan += "ldflags"
> > +INSANE_SKIP:libssp += "ldflags"
> > +INSANE_SKIP:libgomp += "ldflags"
> > +INSANE_SKIP:libitm += "ldflags"
> > +INSANE_SKIP:gdbserver += "ldflags"
> >
> >  # OE-core has literally listed 'glibc' in LIBC_DEPENDENCIES :/
> > -RPROVIDES_${PN} = "glibc rtld(GNU_HASH)"
> > +RPROVIDES:${PN} = "glibc rtld(GNU_HASH)"
> >  # Add runtime provides for the other libc* packages as well
> > -RPROVIDES_${PN}-dev = "glibc-dev"
> > -RPROVIDES_${PN}-doc = "glibc-doc"
> > -RPROVIDES_${PN}-dbg = "glibc-dbg"
> > -RPROVIDES_${PN}-pic = "glibc-pic"
> > -RPROVIDES_${PN}-utils = "glibc-utils"
> > -RPROVIDES_${PN}-mtrace = "glibc-mtrace libc-mtrace"
> > -
> > -PKG_${PN} = "glibc"
> > -PKG_${PN}-dev = "glibc-dev"
> > -PKG_${PN}-doc = "glibc-doc"
> > -PKG_${PN}-dbg = "glibc-dbg"
> > -PKG_${PN}-pic = "glibc-pic"
> > -PKG_${PN}-utils = "glibc-utils"
> > -PKG_${PN}-mtrace = "glibc-mtrace"
> > -PKG_${PN}-gconv = "glibc-gconv"
> > -PKG_${PN}-extra-nss = "glibc-extra-nss"
> > -PKG_${PN}-thread-db = "glibc-thread-db"
> > -PKG_${PN}-pcprofile = "glibc-pcprofile"
> > -PKG_${PN}-staticdev = "glibc-staticdev"
> > +RPROVIDES:${PN}-dev = "glibc-dev"
> > +RPROVIDES:${PN}-doc = "glibc-doc"
> > +RPROVIDES:${PN}-dbg = "glibc-dbg"
> > +RPROVIDES:${PN}-pic = "glibc-pic"
> > +RPROVIDES:${PN}-utils = "glibc-utils"
> > +RPROVIDES:${PN}-mtrace = "glibc-mtrace libc-mtrace"
> > +
> > +PKG:${PN} = "glibc"
> > +PKG:${PN}-dev = "glibc-dev"
> > +PKG:${PN}-doc = "glibc-doc"
> > +PKG:${PN}-dbg = "glibc-dbg"
> > +PKG:${PN}-pic = "glibc-pic"
> > +PKG:${PN}-utils = "glibc-utils"
> > +PKG:${PN}-mtrace = "glibc-mtrace"
> > +PKG:${PN}-gconv = "glibc-gconv"
> > +PKG:${PN}-extra-nss = "glibc-extra-nss"
> > +PKG:${PN}-thread-db = "glibc-thread-db"
> > +PKG:${PN}-pcprofile = "glibc-pcprofile"
> > +PKG:${PN}-staticdev = "glibc-staticdev"
> >
> >  PKGV = "${EAT_VER_LIBC}"
> > -PKGV_${PN} = "${EAT_VER_LIBC}"
> > -PKGV_${PN}-dev = "${EAT_VER_LIBC}"
> > -PKGV_${PN}-doc = "${EAT_VER_LIBC}"
> > -PKGV_${PN}-dbg = "${EAT_VER_LIBC}"
> > -PKGV_${PN}-pic = "${EAT_VER_LIBC}"
> > -PKGV_${PN}-utils = "${EAT_VER_LIBC}"
> > -PKGV_${PN}-mtrace = "${EAT_VER_LIBC}"
> > -PKGV_${PN}-gconv = "${EAT_VER_LIBC}"
> > -PKGV_${PN}-extra-nss = "${EAT_VER_LIBC}"
> > -PKGV_${PN}-thread-db = "${EAT_VER_LIBC}"
> > -PKGV_${PN}-pcprofile = "${EAT_VER_LIBC}"
> > -PKGV_${PN}-staticdev = "${EAT_VER_LIBC}"
> > -PKGV_catchsegv = "${EAT_VER_LIBC}"
> > -PKGV_glibc-extra-nss = "${EAT_VER_LIBC}"
> > -PKGV_glibc-thread-db = "${EAT_VER_LIBC}"
> > -
> > -PKGV_libmemusage = "${EAT_VER_LIBC}"
> > -PKGV_libsegfault = "${EAT_VER_LIBC}"
> > -PKGV_libsotruss = "${EAT_VER_LIBC}"
> > -PKGV_sln = "${EAT_VER_LIBC}"
> > -PKGV_nscd = "${EAT_VER_LIBC}"
> > -PKGV_ldd = "${EAT_VER_LIBC}"
> > -
> > -PKGV_libasan-dev = "${EAT_VER_GCC}"
> > -PKGV_libasan = "${EAT_VER_GCC}"
> > -PKGV_libasan-staticdev = "${EAT_VER_GCC}"
> > -PKGV_libatomic-dev = "${EAT_VER_GCC}"
> > -PKGV_libatomic = "${EAT_VER_GCC}"
> > -PKGV_libatomic-staticdev = "${EAT_VER_GCC}"
> > -PKGV_libg2c-dev = "${EAT_VER_GCC}"
> > -PKGV_libg2c = "${EAT_VER_GCC}"
> > -PKGV_libgcc-dev = "${EAT_VER_GCC}"
> > -PKGV_libgcc = "${EAT_VER_GCC}"
> > -PKGV_libgfortran-dbg = "${EAT_VER_GCC}"
> > -PKGV_libgfortran-dev = "${EAT_VER_GCC}"
> > -PKGV_libgfortran = "${EAT_VER_GCC}"
> > -PKGV_libgfortran-staticdev = "${EAT_VER_GCC}"
> > -PKGV_libgomp-dev = "${EAT_VER_GCC}"
> > -PKGV_libgomp = "${EAT_VER_GCC}"
> > -PKGV_libgomp-staticdev = "${EAT_VER_GCC}"
> > -PKGV_libitm-dev = "${EAT_VER_GCC}"
> > -PKGV_libitm = "${EAT_VER_GCC}"
> > -PKGV_libitm-staticdev = "${EAT_VER_GCC}"
> > -PKGV_liblsan-dev = "${EAT_VER_GCC}"
> > -PKGV_liblsan = "${EAT_VER_GCC}"
> > -PKGV_liblsan-staticdev = "${EAT_VER_GCC}"
> > -PKGV_libmudflap-dev = "${EAT_VER_GCC}"
> > -PKGV_libmudflap = "${EAT_VER_GCC}"
> > -PKGV_libmudflap-staticdev = "${EAT_VER_GCC}"
> > -PKGV_libquadmath-dev = "${EAT_VER_GCC}"
> > -PKGV_libquadmath = "${EAT_VER_GCC}"
> > -PKGV_libquadmath-staticdev = "${EAT_VER_GCC}"
> > -PKGV_libssp-dev = "${EAT_VER_GCC}"
> > -PKGV_libssp = "${EAT_VER_GCC}"
> > -PKGV_libssp-staticdev = "${EAT_VER_GCC}"
> > -PKGV_libstdc++-dbg = "${EAT_VER_GCC}"
> > -PKGV_libstdc++-dev = "${EAT_VER_GCC}"
> > -PKGV_libstdc++ = "${EAT_VER_GCC}"
> > -PKGV_libstdc++-precompile-dev = "${EAT_VER_GCC}"
> > -PKGV_libstdc++-staticdev = "${EAT_VER_GCC}"
> > -PKGV_libtsan-dev = "${EAT_VER_GCC}"
> > -PKGV_libtsan = "${EAT_VER_GCC}"
> > -PKGV_libtsan-staticdev = "${EAT_VER_GCC}"
> > -PKGV_libubsan-dev = "${EAT_VER_GCC}"
> > -PKGV_libubsan = "${EAT_VER_GCC}"
> > -PKGV_libubsan-staticdev = "${EAT_VER_GCC}"
> > -
> > -PKGV_linux-libc-headers-dev = "${EAT_VER_KERNEL}"
> > -PKGV_linux-libc-headers = "${EAT_VER_KERNEL}"
> > -
> > -PKGV_gdbserver = "${EAT_VER_GDBSERVER}"
> > -
> > -ALLOW_EMPTY_${PN}-mtrace = "1"
> > -FILES_${PN}-mtrace = "${bindir}/mtrace"
> > -
> > -FILES_libgcov-staticdev =
> "${libdir}/gcc/${TARGET_SYS}/${BINV}/libgcov.a"
> > -
> > -FILES_libsegfault = "${base_libdir}/libSegFault*"
> > -
> > -FILES_catchsegv = "${bindir}/catchsegv"
> > -RDEPENDS_catchsegv = "libsegfault"
> > +PKGV:${PN} = "${EAT_VER_LIBC}"
> > +PKGV:${PN}-dev = "${EAT_VER_LIBC}"
> > +PKGV:${PN}-doc = "${EAT_VER_LIBC}"
> > +PKGV:${PN}-dbg = "${EAT_VER_LIBC}"
> > +PKGV:${PN}-pic = "${EAT_VER_LIBC}"
> > +PKGV:${PN}-utils = "${EAT_VER_LIBC}"
> > +PKGV:${PN}-mtrace = "${EAT_VER_LIBC}"
> > +PKGV:${PN}-gconv = "${EAT_VER_LIBC}"
> > +PKGV:${PN}-extra-nss = "${EAT_VER_LIBC}"
> > +PKGV:${PN}-thread-db = "${EAT_VER_LIBC}"
> > +PKGV:${PN}-pcprofile = "${EAT_VER_LIBC}"
> > +PKGV:${PN}-staticdev = "${EAT_VER_LIBC}"
> > +PKGV:catchsegv = "${EAT_VER_LIBC}"
> > +PKGV:glibc-extra-nss = "${EAT_VER_LIBC}"
> > +PKGV:glibc-thread-db = "${EAT_VER_LIBC}"
> > +
> > +PKGV:libmemusage = "${EAT_VER_LIBC}"
> > +PKGV:libsegfault = "${EAT_VER_LIBC}"
> > +PKGV:libsotruss = "${EAT_VER_LIBC}"
> > +PKGV:sln = "${EAT_VER_LIBC}"
> > +PKGV:nscd = "${EAT_VER_LIBC}"
> > +PKGV:ldd = "${EAT_VER_LIBC}"
> > +
> > +PKGV:libasan-dev = "${EAT_VER_GCC}"
> > +PKGV:libasan = "${EAT_VER_GCC}"
> > +PKGV:libasan-staticdev = "${EAT_VER_GCC}"
> > +PKGV:libatomic-dev = "${EAT_VER_GCC}"
> > +PKGV:libatomic = "${EAT_VER_GCC}"
> > +PKGV:libatomic-staticdev = "${EAT_VER_GCC}"
> > +PKGV:libg2c-dev = "${EAT_VER_GCC}"
> > +PKGV:libg2c = "${EAT_VER_GCC}"
> > +PKGV:libgcc-dev = "${EAT_VER_GCC}"
> > +PKGV:libgcc = "${EAT_VER_GCC}"
> > +PKGV:libgfortran-dbg = "${EAT_VER_GCC}"
> > +PKGV:libgfortran-dev = "${EAT_VER_GCC}"
> > +PKGV:libgfortran = "${EAT_VER_GCC}"
> > +PKGV:libgfortran-staticdev = "${EAT_VER_GCC}"
> > +PKGV:libgomp-dev = "${EAT_VER_GCC}"
> > +PKGV:libgomp = "${EAT_VER_GCC}"
> > +PKGV:libgomp-staticdev = "${EAT_VER_GCC}"
> > +PKGV:libitm-dev = "${EAT_VER_GCC}"
> > +PKGV:libitm = "${EAT_VER_GCC}"
> > +PKGV:libitm-staticdev = "${EAT_VER_GCC}"
> > +PKGV:liblsan-dev = "${EAT_VER_GCC}"
> > +PKGV:liblsan = "${EAT_VER_GCC}"
> > +PKGV:liblsan-staticdev = "${EAT_VER_GCC}"
> > +PKGV:libmudflap-dev = "${EAT_VER_GCC}"
> > +PKGV:libmudflap = "${EAT_VER_GCC}"
> > +PKGV:libmudflap-staticdev = "${EAT_VER_GCC}"
> > +PKGV:libquadmath-dev = "${EAT_VER_GCC}"
> > +PKGV:libquadmath = "${EAT_VER_GCC}"
> > +PKGV:libquadmath-staticdev = "${EAT_VER_GCC}"
> > +PKGV:libssp-dev = "${EAT_VER_GCC}"
> > +PKGV:libssp = "${EAT_VER_GCC}"
> > +PKGV:libssp-staticdev = "${EAT_VER_GCC}"
> > +PKGV:libstdc++-dbg = "${EAT_VER_GCC}"
> > +PKGV:libstdc++-dev = "${EAT_VER_GCC}"
> > +PKGV:libstdc++ = "${EAT_VER_GCC}"
> > +PKGV:libstdc++-precompile-dev = "${EAT_VER_GCC}"
> > +PKGV:libstdc++-staticdev = "${EAT_VER_GCC}"
> > +PKGV:libtsan-dev = "${EAT_VER_GCC}"
> > +PKGV:libtsan = "${EAT_VER_GCC}"
> > +PKGV:libtsan-staticdev = "${EAT_VER_GCC}"
> > +PKGV:libubsan-dev = "${EAT_VER_GCC}"
> > +PKGV:libubsan = "${EAT_VER_GCC}"
> > +PKGV:libubsan-staticdev = "${EAT_VER_GCC}"
> > +
> > +PKGV:linux-libc-headers-dev = "${EAT_VER_KERNEL}"
> > +PKGV:linux-libc-headers = "${EAT_VER_KERNEL}"
> > +
> > +PKGV:gdbserver = "${EAT_VER_GDBSERVER}"
> > +
> > +ALLOW_EMPTY:${PN}-mtrace = "1"
> > +FILES:${PN}-mtrace = "${bindir}/mtrace"
> > +
> > +FILES:libgcov-staticdev =
> "${libdir}/gcc/${TARGET_SYS}/${BINV}/libgcov.a"
> > +
> > +FILES:libsegfault = "${base_libdir}/libSegFault*"
> > +
> > +FILES:catchsegv = "${bindir}/catchsegv"
> > +RDEPENDS:catchsegv = "libsegfault"
> >
> >  # From libgfortran.inc:
> >
> > -FILES_libgfortran = "${libdir}/libgfortran.so.*"
> > -FILES_libgfortran-dev = "\
> > +FILES:libgfortran = "${libdir}/libgfortran.so.*"
> > +FILES:libgfortran-dev = "\
> >      ${libdir}/libgfortran*.so \
> >      ${libdir}/libgfortran.spec \
> >      ${libdir}/libgfortran.la \
> > @@ -455,49 +455,49 @@ FILES_libgfortran-dev = "\
> >      ${libdir}/gcc/${TARGET_SYS}/${BINV}/libcaf_single* \
> >      ${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude/ \
> >  "
> > -FILES_libgfortran-staticdev = "${libdir}/libgfortran.a"
> > +FILES:libgfortran-staticdev = "${libdir}/libgfortran.a"
> >
> >
> >  # From gcc-sanitizers.inc:
> >
> > -FILES_libasan += "${libdir}/libasan.so.*"
> > -FILES_libasan-dev += "\
> > +FILES:libasan += "${libdir}/libasan.so.*"
> > +FILES:libasan-dev += "\
> >      ${libdir}/libasan_preinit.o \
> >      ${libdir}/libasan.so \
> >      ${libdir}/libasan.la \
> >  "
> > -FILES_libasan-staticdev += "${libdir}/libasan.a"
> > +FILES:libasan-staticdev += "${libdir}/libasan.a"
> >
> > -FILES_libubsan += "${libdir}/libubsan.so.*"
> > -FILES_libubsan-dev += "\
> > +FILES:libubsan += "${libdir}/libubsan.so.*"
> > +FILES:libubsan-dev += "\
> >      ${libdir}/libubsan.so \
> >      ${libdir}/libubsan.la \
> >  "
> > -FILES_libubsan-staticdev += "${libdir}/libubsan.a"
> > +FILES:libubsan-staticdev += "${libdir}/libubsan.a"
> >
> > -FILES_liblsan += "${libdir}/liblsan.so.*"
> > -FILES_liblsan-dev += "\
> > +FILES:liblsan += "${libdir}/liblsan.so.*"
> > +FILES:liblsan-dev += "\
> >      ${libdir}/liblsan.so \
> >      ${libdir}/liblsan.la \
> >      ${libdir}/liblsan_preinit.o \
> >  "
> > -FILES_liblsan-staticdev += "${libdir}/liblsan.a"
> > +FILES:liblsan-staticdev += "${libdir}/liblsan.a"
> >
> > -FILES_libtsan += "${libdir}/libtsan.so.*"
> > -FILES_libtsan-dev += "\
> > +FILES:libtsan += "${libdir}/libtsan.so.*"
> > +FILES:libtsan-dev += "\
> >      ${libdir}/libtsan.so \
> >      ${libdir}/libtsan.la \
> >      ${libdir}/libtsan_*.o \
> >  "
> > -FILES_libtsan-staticdev += "${libdir}/libtsan.a"
> > +FILES:libtsan-staticdev += "${libdir}/libtsan.a"
> >
> > -FILES_gcc-sanitizers = "${libdir}/*.spec
> ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/sanitizer/*.h"
> > +FILES:gcc-sanitizers = "${libdir}/*.spec
> ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/sanitizer/*.h"
> >
> >  # From libgcc.inc:
> >
> > -FILES_libgcc = "${base_libdir}/libgcc_s.so.1"
> > +FILES:libgcc = "${base_libdir}/libgcc_s.so.1"
> >
> > -FILES_libgcc-dev = "\
> > +FILES:libgcc-dev = "\
> >      ${base_libdir}/libgcc*.so \
> >      ${@oe.utils.conditional('BASETARGET_SYS', '${TARGET_SYS}', '',
> '${libdir}/${BASETARGET_SYS}', d)} \
> >      ${libdir}/${TARGET_SYS}/${BINV}* \
> > @@ -505,8 +505,8 @@ FILES_libgcc-dev = "\
> >      ${libdir}/gcc/${TARGET_SYS}/${BINV}/include \
> >  "
> >
> > -FILES_linux-libc-headers = ""
> > -FILES_linux-libc-headers-dev = "\
> > +FILES:linux-libc-headers = ""
> > +FILES:linux-libc-headers-dev = "\
> >         ${includedir}/asm* \
> >         ${includedir}/linux \
> >         ${includedir}/mtd \
> > @@ -515,7 +515,7 @@ FILES_linux-libc-headers-dev = "\
> >         ${includedir}/sound \
> >         ${includedir}/video \
> >  "
> > -FILES_${PN} += "\
> > +FILES:${PN} += "\
> >         ${libdir}/bin \
> >         ${libdir}/locale \
> >         ${libdir}/gconv/gconv-modules \
> > @@ -563,112 +563,112 @@ FILES_${PN} += "\
> >         ${base_libdir}/libpcprofile.so \
> >      "
> >
> > -FILES_${PN}-dbg += "${base_libdir}/debug"
> > +FILES:${PN}-dbg += "${base_libdir}/debug"
> >
> >  # From gcc-runtime.inc
> >
> >  # include python debugging scripts
> > -FILES_gcc-runtime-dbg += "\
> > +FILES:gcc-runtime-dbg += "\
> >      ${libdir}/libstdc++.so.*-gdb.py \
> >      ${datadir}/gcc-${BINV}/python/libstdcxx \
> >  "
> >
> > -FILES_libg2c = "${target_libdir}/libg2c.so.*"
> > -SUMMARY_libg2c = "Companion runtime library for g77"
> > -FILES_libg2c-dev = "\
> > +FILES:libg2c = "${target_libdir}/libg2c.so.*"
> > +SUMMARY:libg2c = "Companion runtime library for g77"
> > +FILES:libg2c-dev = "\
> >      ${libdir}/libg2c.so \
> >      ${libdir}/libg2c.a \
> >      ${libdir}/libfrtbegin.a \
> >  "
> > -SUMMARY_libg2c-dev = "Companion runtime library for g77 - development
> files"
> > +SUMMARY:libg2c-dev = "Companion runtime library for g77 - development
> files"
> >
> > -FILES_libstdc++ = "${libdir}/libstdc++.so.*"
> > -SUMMARY_libstdc++ = "GNU standard C++ library"
> > -FILES_libstdc++-dev = "\
> > +FILES:libstdc++ = "${libdir}/libstdc++.so.*"
> > +SUMMARY:libstdc++ = "GNU standard C++ library"
> > +FILES:libstdc++-dev = "\
> >      /include/c++ \
> >      ${includedir}/c++/ \
> >      ${libdir}/libstdc++.so \
> >      ${libdir}/libstdc++*.la \
> >      ${libdir}/libsupc++.la \
> >  "
> > -SUMMARY_libstdc++-dev = "GNU standard C++ library - development files"
> > +SUMMARY:libstdc++-dev = "GNU standard C++ library - development files"
> >
> > -FILES_libstdc++-staticdev = "\
> > +FILES:libstdc++-staticdev = "\
> >      ${libdir}/libstdc++*.a \
> >      ${libdir}/libsupc++.a \
> >  "
> > -SUMMARY_libstdc++-staticdev = "GNU standard C++ library - static
> development files"
> > +SUMMARY:libstdc++-staticdev = "GNU standard C++ library - static
> development files"
> >
> > -FILES_libstdc++-precompile-dev =
> "${includedir}/c++/${TARGET_SYS}/bits/*.gch"
> > -SUMMARY_libstdc++-precompile-dev = "GNU standard C++ library -
> precompiled header files"
> > +FILES:libstdc++-precompile-dev =
> "${includedir}/c++/${TARGET_SYS}/bits/*.gch"
> > +SUMMARY:libstdc++-precompile-dev = "GNU standard C++ library -
> precompiled header files"
> >
> > -FILES_libssp = "${libdir}/libssp.so.*"
> > -SUMMARY_libssp = "GNU stack smashing protection library"
> > -FILES_libssp-dev = "\
> > +FILES:libssp = "${libdir}/libssp.so.*"
> > +SUMMARY:libssp = "GNU stack smashing protection library"
> > +FILES:libssp-dev = "\
> >      ${libdir}/libssp*.so \
> >      ${libdir}/libssp*_nonshared.a \
> >      ${libdir}/libssp*.la \
> >      ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/ssp \
> >  "
> > -SUMMARY_libssp-dev = "GNU stack smashing protection library -
> development files"
> > -FILES_libssp-staticdev = "${libdir}/libssp*.a"
> > -SUMMARY_libssp-staticdev = "GNU stack smashing protection library -
> static development files"
> > +SUMMARY:libssp-dev = "GNU stack smashing protection library -
> development files"
> > +FILES:libssp-staticdev = "${libdir}/libssp*.a"
> > +SUMMARY:libssp-staticdev = "GNU stack smashing protection library -
> static development files"
> >
> > -FILES_libquadmath = "${libdir}/libquadmath*.so.*"
> > -SUMMARY_libquadmath = "GNU quad-precision math library"
> > -FILES_libquadmath-dev = "\
> > +FILES:libquadmath = "${libdir}/libquadmath*.so.*"
> > +SUMMARY:libquadmath = "GNU quad-precision math library"
> > +FILES:libquadmath-dev = "\
> >      ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/quadmath* \
> >      ${libdir}/libquadmath*.so \
> >      ${libdir}/libquadmath.la \
> >  "
> > -SUMMARY_libquadmath-dev = "GNU quad-precision math library -
> development files"
> > -FILES_libquadmath-staticdev = "${libdir}/libquadmath.a"
> > -SUMMARY_libquadmath-staticdev = "GNU quad-precision math library -
> static development files"
> > +SUMMARY:libquadmath-dev = "GNU quad-precision math library -
> development files"
> > +FILES:libquadmath-staticdev = "${libdir}/libquadmath.a"
> > +SUMMARY:libquadmath-staticdev = "GNU quad-precision math library -
> static development files"
> >
> >  # NOTE: mudflap has been removed as of gcc 4.9 and has been superseded
> by the address sanitiser
> > -FILES_libmudflap = "${libdir}/libmudflap*.so.*"
> > -SUMMARY_libmudflap = "Pointer debugging library for gcc"
> > -FILES_libmudflap-dev = "\
> > +FILES:libmudflap = "${libdir}/libmudflap*.so.*"
> > +SUMMARY:libmudflap = "Pointer debugging library for gcc"
> > +FILES:libmudflap-dev = "\
> >      ${libdir}/libmudflap*.so \
> >      ${libdir}/libmudflap.la \
> >  "
> > -SUMMARY_libmudflap-dev = "Pointer debugging library for gcc -
> development files"
> > -FILES_libmudflap-staticdev = "${libdir}/libmudflap.a"
> > -SUMMARY_libmudflap-staticdev = "Pointer debugging library for gcc -
> static development files"
> > +SUMMARY:libmudflap-dev = "Pointer debugging library for gcc -
> development files"
> > +FILES:libmudflap-staticdev = "${libdir}/libmudflap.a"
> > +SUMMARY:libmudflap-staticdev = "Pointer debugging library for gcc -
> static development files"
> >
> > -FILES_libgomp = "${libdir}/libgomp*${SOLIBS}"
> > -SUMMARY_libgomp = "GNU OpenMP parallel programming library"
> > -FILES_libgomp-dev = "\
> > +FILES:libgomp = "${libdir}/libgomp*${SOLIBS}"
> > +SUMMARY:libgomp = "GNU OpenMP parallel programming library"
> > +FILES:libgomp-dev = "\
> >      ${libdir}/libgomp*${SOLIBSDEV} \
> >      ${libdir}/libgomp*.la \
> >      ${libdir}/libgomp.spec \
> >      ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h \
> >      ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/openacc.h \
> >  "
> > -SUMMARY_libgomp-dev = "GNU OpenMP parallel programming library -
> development files"
> > -FILES_libgomp-staticdev = "${libdir}/libgomp*.a"
> > -SUMMARY_libgomp-staticdev = "GNU OpenMP parallel programming library -
> static development files"
> > +SUMMARY:libgomp-dev = "GNU OpenMP parallel programming library -
> development files"
> > +FILES:libgomp-staticdev = "${libdir}/libgomp*.a"
> > +SUMMARY:libgomp-staticdev = "GNU OpenMP parallel programming library -
> static development files"
> >
> > -FILES_libatomic = "${libdir}/libatomic.so.*"
> > -SUMMARY_libatomic = "GNU C++11 atomics support library"
> > -FILES_libatomic-dev = "\
> > +FILES:libatomic = "${libdir}/libatomic.so.*"
> > +SUMMARY:libatomic = "GNU C++11 atomics support library"
> > +FILES:libatomic-dev = "\
> >      ${libdir}/libatomic.so \
> >      ${libdir}/libatomic.la \
> >  "
> > -SUMMARY_libatomic-dev = "GNU C++11 atomics support library -
> development files"
> > -FILES_libatomic-staticdev = "${libdir}/libatomic.a"
> > -SUMMARY_libatomic-staticdev = "GNU C++11 atomics support library -
> static development files"
> > +SUMMARY:libatomic-dev = "GNU C++11 atomics support library -
> development files"
> > +FILES:libatomic-staticdev = "${libdir}/libatomic.a"
> > +SUMMARY:libatomic-staticdev = "GNU C++11 atomics support library -
> static development files"
> >
> > -FILES_libitm = "${libdir}/libitm.so.*"
> > -SUMMARY_libitm = "GNU transactional memory support library"
> > -FILES_libitm-dev = "\
> > +FILES:libitm = "${libdir}/libitm.so.*"
> > +SUMMARY:libitm = "GNU transactional memory support library"
> > +FILES:libitm-dev = "\
> >      ${libdir}/libitm.so \
> >      ${libdir}/libitm.la \
> >      ${libdir}/libitm.spec \
> >  "
> > -SUMMARY_libitm-dev = "GNU transactional memory support library -
> development files"
> > -FILES_libitm-staticdev = "${libdir}/libitm.a"
> > -SUMMARY_libitm-staticdev = "GNU transactional memory support library -
> static development files"
> > +SUMMARY:libitm-dev = "GNU transactional memory support library -
> development files"
> > +FILES:libitm-staticdev = "${libdir}/libitm.a"
> > +SUMMARY:libitm-staticdev = "GNU transactional memory support library -
> static development files"
> >
> >  EAT_VER_MAIN ??= ""
> >
> > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> gcc-aarch64-none-elf_10.2-2020.11.bb
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> gcc-aarch64-none-elf_10.2-2020.11.bb
> > index 91caee1..fabe1b1 100644
> > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> gcc-aarch64-none-elf_10.2-2020.11.bb
> > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> gcc-aarch64-none-elf_10.2-2020.11.bb
> > @@ -9,8 +9,8 @@ SUMMARY = "Baremetal GCC for Aarch64 processors"
> >  LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> >
> >  LIC_FILES_CHKSUM =
> "${@d.getVar(d.expand("LIC_FILES_CHKSUM_${HOST_ARCH}"))}"
> > -LIC_FILES_CHKSUM_aarch64 =
> "file://share/doc/gcc/Copying.html;md5=fdf39a58ab6e893f3d83594cef77fa05"
> > -LIC_FILES_CHKSUM_x86-64 =
> "file://share/doc/gcc/Copying.html;md5=e4bcb5bee0c4a50c06704b0b73fcbe0c"
> > +LIC_FILES_CHKSUM:aarch64 =
> "file://share/doc/gcc/Copying.html;md5=fdf39a58ab6e893f3d83594cef77fa05"
> > +LIC_FILES_CHKSUM:x86-64 =
> "file://share/doc/gcc/Copying.html;md5=e4bcb5bee0c4a50c06704b0b73fcbe0c"
> >
> >  PROVIDES = "virtual/aarch64-none-elf-gcc"
> >
> > diff --git
> a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> > index fcc9268..67daa41 100644
> > ---
> a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> > +++
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> > @@ -6,74 +6,74 @@ EAT_GDB_LICENSE = "GPL-3.0"
> >  EAT_LIBC_LICENSE = "GPLv2 & LGPLv2.1"
> >  EAT_RLE_LICENSE = "GPL-3.0-with-GCC-exception"
> >
> > -LICENSE_${PN} = "${EAT_LIBC_LICENSE}"
> > -LICENSE_${PN}-dev = "${EAT_LIBC_LICENSE}"
> > -LICENSE_${PN}-doc = "${EAT_LIBC_LICENSE}"
> > -LICENSE_${PN}-dbg = "${EAT_LIBC_LICENSE}"
> > -LICENSE_${PN}-pic = "${EAT_LIBC_LICENSE}"
> > -LICENSE_${PN}-utils = "${EAT_LIBC_LICENSE}"
> > -LICENSE_${PN}-mtrace = "${EAT_LIBC_LICENSE}"
> > -LICENSE_${PN}-gconv = "${EAT_LIBC_LICENSE}"
> > -LICENSE_${PN}-extra-nss = "${EAT_LIBC_LICENSE}"
> > -LICENSE_${PN}-thread-db = "${EAT_LIBC_LICENSE}"
> > -LICENSE_${PN}-pcprofile = "${EAT_LIBC_LICENSE}"
> > -LICENSE_${PN}-staticdev = "${EAT_LIBC_LICENSE}"
> > -LICENSE_catchsegv = "${EAT_LIBC_LICENSE}"
> > -LICENSE_glibc-extra-nss = "${EAT_LIBC_LICENSE}"
> > -LICENSE_glibc-thread-db = "${EAT_LIBC_LICENSE}"
> > +LICENSE:${PN} = "${EAT_LIBC_LICENSE}"
> > +LICENSE:${PN}-dev = "${EAT_LIBC_LICENSE}"
> > +LICENSE:${PN}-doc = "${EAT_LIBC_LICENSE}"
> > +LICENSE:${PN}-dbg = "${EAT_LIBC_LICENSE}"
> > +LICENSE:${PN}-pic = "${EAT_LIBC_LICENSE}"
> > +LICENSE:${PN}-utils = "${EAT_LIBC_LICENSE}"
> > +LICENSE:${PN}-mtrace = "${EAT_LIBC_LICENSE}"
> > +LICENSE:${PN}-gconv = "${EAT_LIBC_LICENSE}"
> > +LICENSE:${PN}-extra-nss = "${EAT_LIBC_LICENSE}"
> > +LICENSE:${PN}-thread-db = "${EAT_LIBC_LICENSE}"
> > +LICENSE:${PN}-pcprofile = "${EAT_LIBC_LICENSE}"
> > +LICENSE:${PN}-staticdev = "${EAT_LIBC_LICENSE}"
> > +LICENSE:catchsegv = "${EAT_LIBC_LICENSE}"
> > +LICENSE:glibc-extra-nss = "${EAT_LIBC_LICENSE}"
> > +LICENSE:glibc-thread-db = "${EAT_LIBC_LICENSE}"
> >
> > -LICENSE_libmemusage = "${EAT_LIBC_LICENSE}"
> > -LICENSE_libsegfault = "${EAT_LIBC_LICENSE}"
> > -LICENSE_libsotruss = "${EAT_LIBC_LICENSE}"
> > -LICENSE_sln = "${EAT_LIBC_LICENSE}"
> > -LICENSE_nscd = "${EAT_LIBC_LICENSE}"
> > -LICENSE_ldd = "${EAT_LIBC_LICENSE}"
> > +LICENSE:libmemusage = "${EAT_LIBC_LICENSE}"
> > +LICENSE:libsegfault = "${EAT_LIBC_LICENSE}"
> > +LICENSE:libsotruss = "${EAT_LIBC_LICENSE}"
> > +LICENSE:sln = "${EAT_LIBC_LICENSE}"
> > +LICENSE:nscd = "${EAT_LIBC_LICENSE}"
> > +LICENSE:ldd = "${EAT_LIBC_LICENSE}"
> >
> > -LICENSE_libasan-dev = "${EAT_GCC_LICENSE}"
> > -LICENSE_libasan = "${EAT_GCC_LICENSE}"
> > -LICENSE_libasan-staticdev = "${EAT_GCC_LICENSE}"
> > -LICENSE_libatomic-dev = "${EAT_GCC_LICENSE}"
> > -LICENSE_libatomic = "${EAT_GCC_LICENSE}"
> > -LICENSE_libatomic-staticdev = "${EAT_GCC_LICENSE}"
> > -LICENSE_libg2c-dev = "${EAT_GCC_LICENSE}"
> > -LICENSE_libg2c = "${EAT_GCC_LICENSE}"
> > -LICENSE_libgcc-dev = "${EAT_GCC_LICENSE}"
> > -LICENSE_libgcc = "${EAT_GCC_LICENSE}"
> > -LICENSE_libgfortran-dbg = "${EAT_GCC_LICENSE}"
> > -LICENSE_libgfortran-dev = "${EAT_GCC_LICENSE}"
> > -LICENSE_libgfortran = "${EAT_GCC_LICENSE}"
> > -LICENSE_libgfortran-staticdev = "${EAT_GCC_LICENSE}"
> > -LICENSE_libgomp-dev = "${EAT_GCC_LICENSE}"
> > -LICENSE_libgomp = "${EAT_GCC_LICENSE}"
> > -LICENSE_libgomp-staticdev = "${EAT_GCC_LICENSE}"
> > -LICENSE_libitm-dev = "${EAT_GCC_LICENSE}"
> > -LICENSE_libitm = "${EAT_GCC_LICENSE}"
> > -LICENSE_libitm-staticdev = "${EAT_GCC_LICENSE}"
> > -LICENSE_liblsan-dev = "${EAT_GCC_LICENSE}"
> > -LICENSE_liblsan = "${EAT_GCC_LICENSE}"
> > -LICENSE_liblsan-staticdev = "${EAT_GCC_LICENSE}"
> > -LICENSE_libmudflap-dev = "${EAT_GCC_LICENSE}"
> > -LICENSE_libmudflap = "${EAT_GCC_LICENSE}"
> > -LICENSE_libmudflap-staticdev = "${EAT_GCC_LICENSE}"
> > -LICENSE_libquadmath-dev = "${EAT_GCC_LICENSE}"
> > -LICENSE_libquadmath = "${EAT_GCC_LICENSE}"
> > -LICENSE_libquadmath-staticdev = "${EAT_GCC_LICENSE}"
> > -LICENSE_libssp-dev = "${EAT_GCC_LICENSE}"
> > -LICENSE_libssp = "${EAT_GCC_LICENSE}"
> > -LICENSE_libssp-staticdev = "${EAT_GCC_LICENSE}"
> > -LICENSE_libstdc++-dbg = "${EAT_GCC_LICENSE}"
> > -LICENSE_libstdc++-dev = "${EAT_GCC_LICENSE}"
> > -LICENSE_libstdc++ = "${EAT_GCC_LICENSE}"
> > -LICENSE_libstdc++-precompile-dev = "${EAT_GCC_LICENSE}"
> > -LICENSE_libstdc++-staticdev = "${EAT_GCC_LICENSE}"
> > -LICENSE_libtsan-dev = "${EAT_GCC_LICENSE}"
> > -LICENSE_libtsan = "${EAT_GCC_LICENSE}"
> > -LICENSE_libtsan-staticdev = "${EAT_GCC_LICENSE}"
> > -LICENSE_libubsan-dev = "${EAT_GCC_LICENSE}"
> > -LICENSE_libubsan = "${EAT_GCC_LICENSE}"
> > -LICENSE_libubsan-staticdev = "${EAT_GCC_LICENSE}"
> > +LICENSE:libasan-dev = "${EAT_GCC_LICENSE}"
> > +LICENSE:libasan = "${EAT_GCC_LICENSE}"
> > +LICENSE:libasan-staticdev = "${EAT_GCC_LICENSE}"
> > +LICENSE:libatomic-dev = "${EAT_GCC_LICENSE}"
> > +LICENSE:libatomic = "${EAT_GCC_LICENSE}"
> > +LICENSE:libatomic-staticdev = "${EAT_GCC_LICENSE}"
> > +LICENSE:libg2c-dev = "${EAT_GCC_LICENSE}"
> > +LICENSE:libg2c = "${EAT_GCC_LICENSE}"
> > +LICENSE:libgcc-dev = "${EAT_GCC_LICENSE}"
> > +LICENSE:libgcc = "${EAT_GCC_LICENSE}"
> > +LICENSE:libgfortran-dbg = "${EAT_GCC_LICENSE}"
> > +LICENSE:libgfortran-dev = "${EAT_GCC_LICENSE}"
> > +LICENSE:libgfortran = "${EAT_GCC_LICENSE}"
> > +LICENSE:libgfortran-staticdev = "${EAT_GCC_LICENSE}"
> > +LICENSE:libgomp-dev = "${EAT_GCC_LICENSE}"
> > +LICENSE:libgomp = "${EAT_GCC_LICENSE}"
> > +LICENSE:libgomp-staticdev = "${EAT_GCC_LICENSE}"
> > +LICENSE:libitm-dev = "${EAT_GCC_LICENSE}"
> > +LICENSE:libitm = "${EAT_GCC_LICENSE}"
> > +LICENSE:libitm-staticdev = "${EAT_GCC_LICENSE}"
> > +LICENSE:liblsan-dev = "${EAT_GCC_LICENSE}"
> > +LICENSE:liblsan = "${EAT_GCC_LICENSE}"
> > +LICENSE:liblsan-staticdev = "${EAT_GCC_LICENSE}"
> > +LICENSE:libmudflap-dev = "${EAT_GCC_LICENSE}"
> > +LICENSE:libmudflap = "${EAT_GCC_LICENSE}"
> > +LICENSE:libmudflap-staticdev = "${EAT_GCC_LICENSE}"
> > +LICENSE:libquadmath-dev = "${EAT_GCC_LICENSE}"
> > +LICENSE:libquadmath = "${EAT_GCC_LICENSE}"
> > +LICENSE:libquadmath-staticdev = "${EAT_GCC_LICENSE}"
> > +LICENSE:libssp-dev = "${EAT_GCC_LICENSE}"
> > +LICENSE:libssp = "${EAT_GCC_LICENSE}"
> > +LICENSE:libssp-staticdev = "${EAT_GCC_LICENSE}"
> > +LICENSE:libstdc++-dbg = "${EAT_GCC_LICENSE}"
> > +LICENSE:libstdc++-dev = "${EAT_GCC_LICENSE}"
> > +LICENSE:libstdc++ = "${EAT_GCC_LICENSE}"
> > +LICENSE:libstdc++-precompile-dev = "${EAT_GCC_LICENSE}"
> > +LICENSE:libstdc++-staticdev = "${EAT_GCC_LICENSE}"
> > +LICENSE:libtsan-dev = "${EAT_GCC_LICENSE}"
> > +LICENSE:libtsan = "${EAT_GCC_LICENSE}"
> > +LICENSE:libtsan-staticdev = "${EAT_GCC_LICENSE}"
> > +LICENSE:libubsan-dev = "${EAT_GCC_LICENSE}"
> > +LICENSE:libubsan = "${EAT_GCC_LICENSE}"
> > +LICENSE:libubsan-staticdev = "${EAT_GCC_LICENSE}"
> >
> > -LICENSE_linux-libc-headers-dev = "GPLv2"
> > -LICENSE_linux-libc-headers = "GPLv2"
> > +LICENSE:linux-libc-headers-dev = "GPLv2"
> > +LICENSE:linux-libc-headers = "GPLv2"
> >
> > -LICENSE_gdbserver = "GPLv2 & GPLv3 & LGPLv2 & LGPLv3"
> > +LICENSE:gdbserver = "GPLv2 & GPLv3 & LGPLv2 & LGPLv3"
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2.inc
> b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2.inc
> > index 2a82293..dc611c3 100644
> > --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2.inc
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2.inc
> > @@ -82,7 +82,7 @@ FORTRAN = ""
> >  JAVA = ""
> >
> >  SSP ?= "--disable-libssp"
> > -SSP_mingw32 = "--enable-libssp"
> > +SSP:mingw32 = "--enable-libssp"
> >
> >  EXTRA_OECONF_BASE = "\
> >      ${SSP} \
> > @@ -112,7 +112,7 @@ EXTRA_OECONF_INITIAL = "\
> >      --disable-libssp \
> >  "
> >
> > -EXTRA_OECONF_append_aarchilp32 = " --with-abi=ilp32"
> > +EXTRA_OECONF:append_aarchilp32 = " --with-abi=ilp32"
> >
> >  EXTRA_OECONF_PATHS = "\
> >      --with-gxx-include-dir=/not/exist{target_includedir}/c++/${BINV} \
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
> b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
> > index 392c57f..d7cc4e7 100644
> > --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
> > @@ -9,7 +9,7 @@
> >  # copy the file for target build in recipe-specific sysroot, in
> external-arm
> >  # toolchain mode and if the required file does not exist already.
> >
> > -do_install_prepend_class-target () {
> > +do_install:prepend:class-target () {
> >         if [ "${TCMODE}" = "external-arm" -a ! -f
> ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/unwind.h
> ]; then
> >                 install -d
> ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/
> >                 install
> ${STAGING_LIBDIR}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/include/unwind.h
> ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/
> > @@ -20,7 +20,7 @@ do_install_prepend_class-target () {
> >  # gcc installs additional aliases as
> ${TARGET_SYS}-${EAT_TARGET_SYS}-gcc, etc.
> >  # Since those are not packaged and not too useful, let's remove them to
> avoid
> >  # QA issues
> > -do_install_append () {
> > +do_install:append () {
> >         for f in g++ gcc gcc-ar gcc-ranlib gcc-nm; do
> >                 rm -f ${D}${bindir}/${TARGET_SYS}-${EAT_TARGET_SYS}-$f
> >         done
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/
> gcc-sanitizers_arm-10.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/
> gcc-sanitizers_arm-10.2.bb
> > index 9c41e92..e88ebe1 100644
> > --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_arm-10.2.bb
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_arm-10.2.bb
> > @@ -3,5 +3,5 @@ require recipes-devtools/gcc/gcc-sanitizers.inc
> >
> >  # Building with thumb enabled on armv4t armv5t fails with
> >  # sanitizer_linux.s:5749: Error: lo register required -- `ldr
> ip,[sp],#8'
> > -ARM_INSTRUCTION_SET_armv4 = "arm"
> > -ARM_INSTRUCTION_SET_armv5 = "arm"
> > +ARM_INSTRUCTION_SET:armv4 = "arm"
> > +ARM_INSTRUCTION_SET:armv5 = "arm"
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-10.2.bb
> b/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-10.2.bb
> > index 51a0877..9296730 100644
> > --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-10.2.bb
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-10.2.bb
> > @@ -5,11 +5,11 @@ require recipes-devtools/gcc/gcc-arm-common.inc
> >  # Building with thumb enabled on armv4t armv5t fails with
> >  # | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7438:(.text.unlikely+0x2fa):
> relocation truncated to fit: R_ARM_THM_CALL against symbol
> `fancy_abort(char const*, int, char const*)' defined in .glue_7 section in
> linker stubs
> >  # | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7442:(.text.unlikely+0x318):
> additional relocation overflows omitted from the output
> > -ARM_INSTRUCTION_SET_armv4 = "arm"
> > -ARM_INSTRUCTION_SET_armv5 = "arm"
> > +ARM_INSTRUCTION_SET:armv4 = "arm"
> > +ARM_INSTRUCTION_SET:armv5 = "arm"
> >
> > -ARMFPARCHEXT_armv6 = "${@'+fp' if d.getVar('TARGET_FPU') == 'hard' else
> ''}"
> > -ARMFPARCHEXT_armv7a = "${@'+fp' if d.getVar('TARGET_FPU') == 'hard'
> else ''}"
> > -ARMFPARCHEXT_armv7ve = "${@'+fp' if d.getVar('TARGET_FPU') == 'hard'
> else ''}"
> > +ARMFPARCHEXT:armv6 = "${@'+fp' if d.getVar('TARGET_FPU') == 'hard' else
> ''}"
> > +ARMFPARCHEXT:armv7a = "${@'+fp' if d.getVar('TARGET_FPU') == 'hard'
> else ''}"
> > +ARMFPARCHEXT:armv7ve = "${@'+fp' if d.getVar('TARGET_FPU') == 'hard'
> else ''}"
> >
> >  BBCLASSEXTEND = "nativesdk"
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/
> libgcc-initial_arm-10.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/
> libgcc-initial_arm-10.2.bb
> > index 32f3dc0..ca1159c 100644
> > --- a/meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_arm-10.2.bb
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_arm-10.2.bb
> > @@ -2,4 +2,4 @@ require recipes-devtools/gcc/gcc-${PV}.inc
> >  require recipes-devtools/gcc/libgcc-initial.inc
> >
> >  # Building with thumb enabled on armv6t fails
> > -ARM_INSTRUCTION_SET_armv6 = "arm"
> > +ARM_INSTRUCTION_SET:armv6 = "arm"
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-10.2.bb
> b/meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-10.2.bb
> > index 572bab1..35ac5df 100644
> > --- a/meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-10.2.bb
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-10.2.bb
> > @@ -2,4 +2,4 @@ require recipes-devtools/gcc/gcc-${PV}.inc
> >  require recipes-devtools/gcc/libgcc.inc
> >
> >  # Building with thumb enabled on armv6t fails
> > -ARM_INSTRUCTION_SET_armv6 = "arm"
> > +ARM_INSTRUCTION_SET:armv6 = "arm"
> > diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> > index 9ee8749..24d9091 100644
> > --- a/meta-arm/conf/layer.conf
> > +++ b/meta-arm/conf/layer.conf
> > @@ -13,4 +13,4 @@ LAYERDEPENDS_meta-arm = " \
> >      core \
> >      arm-toolchain \
> >  "
> > -LAYERSERIES_COMPAT_meta-arm = "hardknott"
> > +LAYERSERIES_COMPAT_meta-arm = "honister"
> > diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf
> b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> > index fe19ed2..57b4b15 100644
> > --- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
> > +++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> > @@ -4,7 +4,7 @@ require ${COREBASE}/meta/conf/machine/qemuarm64.conf
> >
> >  KMACHINE = "qemuarm64"
> >
> > -UBOOT_MACHINE = "qemu_arm64_defconfig"
> > +UBOOT_MACHINE = "qemu:arm64_defconfig"
> >
> >  QB_MACHINE = "-machine virt,secure=on"
> >  QB_OPT_APPEND += "-no-acpi"
> > diff --git a/meta-arm/recipes-bsp/boot-wrapper-aarch64/
> boot-wrapper-aarch64_git.bb b/meta-arm/recipes-bsp/boot-wrapper-aarch64/
> boot-wrapper-aarch64_git.bb
> > index 3e4751e..c723517 100644
> > --- a/meta-arm/recipes-bsp/boot-wrapper-aarch64/
> boot-wrapper-aarch64_git.bb
> > +++ b/meta-arm/recipes-bsp/boot-wrapper-aarch64/
> boot-wrapper-aarch64_git.bb
> > @@ -52,7 +52,7 @@ EXTRA_OEMAKE +=
> "'KERNEL_IMAGE=${DEPLOY_DIR_IMAGE}/${BOOT_WRAPPER_AARCH64_KERNEL
> >  EXTRA_OEMAKE += "'CMDLINE=${BOOT_WRAPPER_AARCH64_CMDLINE}'"
> >
> >
> > -do_configure_prepend() {
> > +do_configure:prepend() {
> >      # Create dummy files to make configure happy.
> >      # We will pass the generated ones directly to make.
> >      mkdir -p ${WORKDIR}/kernel/arch/arm64/boot
> > diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
> b/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
> > index 6d8bb3f..be510a1 100644
> > --- a/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
> > +++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
> > @@ -33,7 +33,7 @@ DEPENDS = "bison-native bc-native openssl-native"
> >  # set project to build
> >  EXTRA_OEMAKE += "PROJECT=${HAFNIUM_PROJECT}"
> >
> > -do_compile_prepend() {
> > +do_compile:prepend() {
> >      # Hafnium expects 'python'. Create symlink python to python3
> >      real=$(which ${PYTHON})
> >      ln -snf $real $(dirname $real)/python
> > @@ -64,10 +64,10 @@ do_install() {
> >      done
> >  }
> >
> > -FILES_${PN} = "/firmware"
> > +FILES:${PN} = "/firmware"
> >  SYSROOT_DIRS += "/firmware"
> >  # skip QA tests: {'ldflags'}
> > -INSANE_SKIP_${PN} = "ldflags"
> > +INSANE_SKIP:${PN} = "ldflags"
> >
> >  do_deploy() {
> >      cp -rf ${D}/firmware/* ${DEPLOYDIR}/
> > diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb
> b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb
> > index ca7017a..d40d82d 100644
> > --- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb
> > +++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb
> > @@ -67,12 +67,12 @@ do_install() {
> >       done
> >  }
> >
> > -FILES_${PN} = "/firmware"
> > +FILES:${PN} = "/firmware"
> >  SYSROOT_DIRS += "/firmware"
> >
> > -FILES_${PN}-dbg += "/firmware/*.elf"
> > +FILES:${PN}-dbg += "/firmware/*.elf"
> >  # Skip QA check for relocations in .text of elf binaries
> > -INSANE_SKIP_${PN}-dbg = "arch textrel"
> > +INSANE_SKIP:${PN}-dbg = "arch textrel"
> >  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> >  INHIBIT_PACKAGE_STRIP = "1"
> >
> > diff --git
> a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > index 57f1438..a1e59d8 100644
> > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > @@ -48,12 +48,12 @@ SRC_URI_MBEDTLS ??= ""
> >  # This should be set to MBEDTLS LIC FILES checksum
> >  LIC_FILES_CHKSUM_MBEDTLS ??= ""
> >  # add MBEDTLS to our sources if activated
> > -SRC_URI_append = " ${@bb.utils.contains('TFA_MBEDTLS', '1',
> '${SRC_URI_MBEDTLS}', '', d)}"
> > +SRC_URI:append = " ${@bb.utils.contains('TFA_MBEDTLS', '1',
> '${SRC_URI_MBEDTLS}', '', d)}"
> >  # Update license variables
> > -LICENSE_append = "${@bb.utils.contains('TFA_MBEDTLS', '1', ' &
> Apache-2.0', '', d)}"
> > -LIC_FILES_CHKSUM_append = "${@bb.utils.contains('TFA_MBEDTLS', '1', '
> ${LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"
> > +LICENSE:append = "${@bb.utils.contains('TFA_MBEDTLS', '1', ' &
> Apache-2.0', '', d)}"
> > +LIC_FILES_CHKSUM:append = "${@bb.utils.contains('TFA_MBEDTLS', '1', '
> ${LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"
> >  # add mbed TLS to version
> > -SRCREV_FORMAT_append = "${@bb.utils.contains('TFA_MBEDTLS', '1',
> '_mbedtls', '', d)}"
> > +SRCREV_FORMAT:append = "${@bb.utils.contains('TFA_MBEDTLS', '1',
> '_mbedtls', '', d)}"
> >
> >  # U-boot support (set TFA_UBOOT to 1 to activate)
> >  # When U-Boot support is activated BL33 is activated with u-boot.bin
> file
> > @@ -82,12 +82,12 @@ LD[unexport] = "1"
> >  do_configure[noexec] = "1"
> >
> >  # Baremetal, just need a compiler
> > -DEPENDS_remove = "virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
> > +DEPENDS:remove = "virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
> >
> >  # We need dtc for dtbs compilation
> >  # We need openssl for fiptool
> >  DEPENDS = "dtc-native openssl-native"
> > -DEPENDS_append_toolchain-clang = " compiler-rt"
> > +DEPENDS:append:toolchain-clang = " compiler-rt"
> >
> >  # CC and LD introduce arguments which conflict with those otherwise
> provided by
> >  # this recipe. The heads of these variables excluding those arguments
> > @@ -217,12 +217,12 @@ do_install() {
> >      done
> >  }
> >
> > -FILES_${PN} = "/firmware"
> > +FILES:${PN} = "/firmware"
> >  SYSROOT_DIRS += "/firmware"
> >
> > -FILES_${PN}-dbg = "/firmware/*.elf"
> > +FILES:${PN}-dbg = "/firmware/*.elf"
> >  # Skip QA check for relocations in .text of elf binaries
> > -INSANE_SKIP_${PN}-dbg = "textrel"
> > +INSANE_SKIP:${PN}-dbg = "textrel"
> >
> >  do_deploy() {
> >      cp -rf ${D}/firmware/* ${DEPLOYDIR}/
> > diff --git
> a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> > index dd74cd5..5b5a049 100644
> > ---
> a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> > +++
> b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> > @@ -1,26 +1,26 @@
> > -COMPATIBLE_MACHINE_qemuarm64 = "qemuarm64"
> > +COMPATIBLE_MACHINE:qemuarm64 = "qemuarm64"
> >
> > -TFA_PLATFORM_qemuarm64-secureboot = "qemu"
> > -TFA_PLATFORM_qemuarm64-sbsa = "qemu_sbsa"
> > +TFA_PLATFORM:qemuarm64-secureboot = "qemu"
> > +TFA_PLATFORM:qemuarm64-sbsa = "qemu_sbsa"
> >
> > -TFA_SPD_qemuarm64-secureboot = "opteed"
> > +TFA_SPD:qemuarm64-secureboot = "opteed"
> >
> > -TFA_UBOOT_qemuarm64-secureboot = "1"
> > -TFA_BUILD_TARGET_aarch64_qemuall = "all fip"
> > +TFA_UBOOT:qemuarm64-secureboot = "1"
> > +TFA_BUILD_TARGET:aarch64:qemuall = "all fip"
> >
> > -TFA_INSTALL_TARGET_qemuarm64-secureboot = "flash.bin"
> > -TFA_INSTALL_TARGET_qemuarm64-sbsa = "bl1 fip"
> > +TFA_INSTALL_TARGET:qemuarm64-secureboot = "flash.bin"
> > +TFA_INSTALL_TARGET:qemuarm64-sbsa = "bl1 fip"
> >
> > -DEPENDS_append_aarch64_qemuall = " optee-os"
> > +DEPENDS:append:aarch64:qemuall = " optee-os"
> >
> > -EXTRA_OEMAKE_append_aarch64_qemuall = " \
> > +EXTRA_OEMAKE:append:aarch64:qemuall = " \
> >
> BL32=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-header_v2.bin
> \
> >
> BL32_EXTRA1=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-pager_v2.bin
> \
> >
> BL32_EXTRA2=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-pageable_v2.bin
> \
> >      BL32_RAM_LOCATION=tdram \
> >      "
> >
> > -do_compile_append_qemuarm64-secureboot() {
> > +do_compile:append:qemuarm64-secureboot() {
> >      # Create a secure flash image for booting AArch64 Qemu. See:
> >      #
> https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/tree/docs/plat/qemu.rst
> >      dd if=${BUILD_DIR}/bl1.bin of=${BUILD_DIR}/flash.bin bs=4096
> conv=notrunc
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/
> trusted-firmware-a_1.5.bb b/meta-arm/recipes-bsp/trusted-firmware-a/
> trusted-firmware-a_1.5.bb
> > index 56d3507..1a004b8 100644
> > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_1.5.bb
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_1.5.bb
> > @@ -8,7 +8,7 @@ require trusted-firmware-a.inc
> >  SRCREV_FORMAT = "tfa"
> >
> >  # TF-A v1.5
> > -SRCREV_tfa = "ed8112606c54d85781fc8429160883d6310ece32"
> > +SRCREV:tfa = "ed8112606c54d85781fc8429160883d6310ece32"
> >
> >  LIC_FILES_CHKSUM +=
> "file://license.rst;md5=e927e02bca647e14efd87e9e914b2443"
> >
> > @@ -20,7 +20,7 @@ LIC_FILES_CHKSUM +=
> "file://license.rst;md5=e927e02bca647e14efd87e9e914b2443"
> >  SRC_URI_MBEDTLS = "git://
> github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls;branch=mbedtls-2.16
> "
> >
> >  # mbed TLS v2.16.2
> > -SRCREV_mbedtls = "d81c11b8ab61fd5b2da8133aa73c5fe33a0633eb"
> > +SRCREV:mbedtls = "d81c11b8ab61fd5b2da8133aa73c5fe33a0633eb"
> >
> >  LIC_FILES_CHKSUM_MBEDTLS = " \
> >      file://mbedtls/apache-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/
> trusted-firmware-m_1.3.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/
> trusted-firmware-m_1.3.0.bb
> > index c954e02..7c850b0 100644
> > --- a/meta-arm/recipes-bsp/trusted-firmware-m/
> trusted-firmware-m_1.3.0.bb
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-m/
> trusted-firmware-m_1.3.0.bb
> > @@ -118,7 +118,7 @@ do_install() {
> >      install -m 0644 ${B}/bin/* ${D}/firmware/
> >  }
> >
> > -FILES_${PN} = "/firmware"
> > +FILES:${PN} = "/firmware"
> >  SYSROOT_DIRS += "/firmware"
> >
> >  addtask deploy after do_install
> > diff --git a/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
> b/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
> > index afcd70a..f725156 100644
> > --- a/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
> > +++ b/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
> > @@ -1,3 +1,3 @@
> > -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> > +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> >
> > -SRC_URI_append_qemuarm64-secureboot = " file://qemuarm64.cfg"
> > +SRC_URI:append:qemuarm64-secureboot = " file://qemuarm64.cfg"
> > diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> > index c5ab48c..4b44086 100644
> > --- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> > +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> > @@ -38,7 +38,7 @@ EDK2_EXTRA_BUILD   = ""
> >  EDK2_BUILD_MODE ?= "${@bb.utils.contains('EDK2_BUILD_RELEASE', '1',
> 'RELEASE', 'DEBUG', d)}"
> >
> >  # Baremetal, no need for a C library
> > -DEPENDS_remove = "virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
> > +DEPENDS:remove = "virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
> >  DEPENDS += "util-linux-native iasl-native"
> >
> >  inherit deploy
> > @@ -63,9 +63,9 @@ export CONF_PATH           = "${S}/Conf"
> >  export BTOOLS_PATH = "${EDK_TOOLS_PATH}/BinWrappers/PosixLike"
> >
> >  EDK_COMPILER ?= "GCC5"
> > -EDK_COMPILER_toolchain-clang = "CLANG38"
> > +EDK_COMPILER:toolchain-clang = "CLANG38"
> >
> > -do_configure_prepend() {
> > +do_configure:prepend() {
> >      sed -i -e "s#-target ${HOST_ARCH}-linux-gnu*#-target ${HOST_SYS}#"
> ${S}/BaseTools/Conf/tools_def.template
> >  }
> >
> > @@ -95,10 +95,10 @@ do_install() {
> >      install
> ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILER}/FV/${EDK2_BIN_NAME}
> ${D}/firmware/uefi.bin
> >  }
> >
> > -FILES_${PN} = "/firmware"
> > +FILES:${PN} = "/firmware"
> >  SYSROOT_DIRS += "/firmware"
> >  # Skip QA check for relocations in .text of elf binaries
> > -INSANE_SKIP_${PN} = "textrel"
> > +INSANE_SKIP:${PN} = "textrel"
> >
> >  do_deploy() {
> >      # Copy the images to deploy directory
> > diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
> b/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
> > index 8330ac9..fbdec1f 100644
> > --- a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
> > +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
> > @@ -1,25 +1,25 @@
> >  COMPATIBLE_MACHINE = "qemuarm64"
> >
> > -DEPENDS_append_qemuarm64-sbsa = " virtual/trusted-firmware-a"
> > +DEPENDS:append:qemuarm64-sbsa = " virtual/trusted-firmware-a"
> >
> > -EDK2_BUILD_RELEASE_aarch64_qemuall = "1"
> > -EDK2_ARCH_aarch64_qemuall          = "AARCH64"
> > +EDK2_BUILD_RELEASE:aarch64:qemuall = "1"
> > +EDK2_ARCH:aarch64:qemuall          = "AARCH64"
> >
> > -EDK2_PLATFORM_qemuarm64-sbsa      = "SbsaQemu"
> > -EDK2_PLATFORM_DSC_qemuarm64-sbsa  =
> "Platform/Qemu/SbsaQemu/SbsaQemu.dsc"
> > -EDK2_BIN_NAME_qemuarm64-sbsa      = "SBSA_FLASH0.fd"
> > +EDK2_PLATFORM:qemuarm64-sbsa      = "SbsaQemu"
> > +EDK2_PLATFORM_DSC:qemuarm64-sbsa  =
> "Platform/Qemu/SbsaQemu/SbsaQemu.dsc"
> > +EDK2_BIN_NAME:qemuarm64-sbsa      = "SBSA_FLASH0.fd"
> >
> > -EDK2_PLATFORM_qemuarm64-secureboot      = "ArmVirtQemu-AARCH64"
> > -EDK2_PLATFORM_DSC_qemuarm64-secureboot  = "ArmVirtPkg/ArmVirtQemu.dsc"
> > -EDK2_BIN_NAME_qemuarm64-secureboot      = "QEMU_EFI.fd"
> > +EDK2_PLATFORM:qemuarm64-secureboot      = "ArmVirtQemu-AARCH64"
> > +EDK2_PLATFORM_DSC:qemuarm64-secureboot  = "ArmVirtPkg/ArmVirtQemu.dsc"
> > +EDK2_BIN_NAME:qemuarm64-secureboot      = "QEMU_EFI.fd"
> >
> > -do_compile_prepend_qemuarm64-sbsa() {
> > +do_compile:prepend:qemuarm64-sbsa() {
> >      mkdir -p ${B}/Platform/Qemu/Sbsa/
> >      cp ${RECIPE_SYSROOT}/firmware/bl1.bin ${B}/Platform/Qemu/Sbsa/
> >      cp ${RECIPE_SYSROOT}/firmware/fip.bin ${B}/Platform/Qemu/Sbsa/
> >  }
> >
> > -do_install_append_qemuarm64-sbsa() {
> > +do_install:append:qemuarm64-sbsa() {
> >      install
> ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILER}/FV/SBSA_FLASH0.fd
> ${D}/firmware/ovmf-tfa.bin
> >      install
> ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILER}/FV/SBSA_FLASH1.fd
> ${D}/firmware/ovmf-uefi.bin
> >      /usr/bin/truncate -s 256M ${D}/firmware/ovmf*.bin
> > diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb
> b/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb
> > index c0d8e91..14f6606 100644
> > --- a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb
> > +++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb
> > @@ -1,6 +1,6 @@
> >  require recipes-bsp/uefi/edk2-firmware_202102.bb
> >
> > -PROVIDES_remove = "virtual/uefi-firmware"
> > +PROVIDES:remove = "virtual/uefi-firmware"
> >
> >  LICENSE += "& Apache-2.0"
> >  LIC_FILES_CHKSUM +=
> "file://ShellPkg/Application/sbsa-acs/LICENSE.md;md5=2a944942e1496af1886903d274dedb13"
> > diff --git a/meta-arm/recipes-devtools/fvp/fvp-common.inc
> b/meta-arm/recipes-devtools/fvp/fvp-common.inc
> > index ec82251..d6fbf87 100644
> > --- a/meta-arm/recipes-devtools/fvp/fvp-common.inc
> > +++ b/meta-arm/recipes-devtools/fvp/fvp-common.inc
> > @@ -21,12 +21,12 @@ fvp_link_binaries() {
> >      rm -f ${D}${bindir}/*.so
> >  }
> >
> > -FILES_${PN} = "${bindir} ${FVPDIR}"
> > +FILES:${PN} = "${bindir} ${FVPDIR}"
> >
> >  # Prebuilt binaries are already stripped
> > -INSANE_SKIP_${PN} += "already-stripped"
> > +INSANE_SKIP:${PN} += "already-stripped"
> >  # FVP can optionally have a GUI, but we can use the host libraries in
> native/nativesdk
> > -INSANE_SKIP_${PN} += "file-rdeps"
> > +INSANE_SKIP:${PN} += "file-rdeps"
> >
> >  # FVP brings its own standard library so don't let it be used as a
> shlib provider
> >  PRIVATE_LIBS = "libgcc_s.so.1 libstdc++.so.6"
> > diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
> b/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
> > index 0ba8992..84af757 100644
> > --- a/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
> > +++ b/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
> > @@ -1,19 +1,19 @@
> >  ARMFILESPATHS := "${THISDIR}/${PN}:"
> >
> >  COMPATIBLE_MACHINE_generic-arm64 = "generic-arm64"
> > -FILESEXTRAPATHS_prepend_generic-arm64 = "${ARMFILESPATHS}"
> > -SRC_URI_append_generic-arm64 = " \
> > +FILESEXTRAPATHS:prepend_generic-arm64 = "${ARMFILESPATHS}"
> > +SRC_URI:append_generic-arm64 = " \
> >      file://defconfig.patch \
> >      file://tcpci.cfg \
> >      "
> >
> > -FILESEXTRAPATHS_prepend_qemuarm64-sbsa = "${ARMFILESPATHS}"
> > -SRC_URI_append_qemuarm64-sbsa = " \
> > +FILESEXTRAPATHS:prepend:qemuarm64-sbsa = "${ARMFILESPATHS}"
> > +SRC_URI:append:qemuarm64-sbsa = " \
> >      file://defconfig.patch \
> >      "
> >
> > -FILESEXTRAPATHS_prepend_qemuarm64-secureboot = "${ARMFILESPATHS}"
> > -SRC_URI_append_qemuarm64-secureboot = " \
> > +FILESEXTRAPATHS:prepend:qemuarm64-secureboot = "${ARMFILESPATHS}"
> > +SRC_URI:append:qemuarm64-secureboot = " \
> >      file://zone_dma_revert.patch \
> >      file://tee.cfg \
> >      "
> > diff --git a/meta-arm/recipes-security/optee/optee-client.inc
> b/meta-arm/recipes-security/optee/optee-client.inc
> > index 65c9a44..deeb46c 100644
> > --- a/meta-arm/recipes-security/optee/optee-client.inc
> > +++ b/meta-arm/recipes-security/optee/optee-client.inc
> > @@ -21,9 +21,9 @@ EXTRA_OECMAKE = " \
> >      -DBUILD_SHARED_LIBS=ON \
> >      -DCFG_TEE_FS_PARENT_PATH='${localstatedir}/lib/tee' \
> >  "
> > -EXTRA_OECMAKE_append_toolchain-clang = " -DCFG_WERROR=0"
> > +EXTRA_OECMAKE:toolchain-clang = " -DCFG_WERROR=0"
> >
> > -do_install_append() {
> > +do_install:append() {
> >      install -D -p -m0644 ${WORKDIR}/tee-supplicant.service
> ${D}${systemd_system_unitdir}/tee-supplicant.service
> >      install -D -p -m0755 ${WORKDIR}/tee-supplicant.sh
> ${D}${sysconfdir}/init.d/tee-supplicant
> >
> > @@ -33,8 +33,8 @@ do_install_append() {
> >                ${D}${sysconfdir}/init.d/tee-supplicant
> >  }
> >
> > -SYSTEMD_SERVICE_${PN} = "tee-supplicant.service"
> > +SYSTEMD_SERVICE:${PN} = "tee-supplicant.service"
> >
> >  INITSCRIPT_PACKAGES = "${PN}"
> > -INITSCRIPT_NAME_${PN} = "tee-supplicant"
> > -INITSCRIPT_PARAMS_${PN} = "start 10 1 2 3 4 5 . stop 90 0 6 ."
> > +INITSCRIPT_NAME:${PN} = "tee-supplicant"
> > +INITSCRIPT_PARAMS:${PN} = "start 10 1 2 3 4 5 . stop 90 0 6 ."
> > diff --git a/meta-arm/recipes-security/optee/optee-examples.inc
> b/meta-arm/recipes-security/optee/optee-examples.inc
> > index f2e53f3..b74344a 100644
> > --- a/meta-arm/recipes-security/optee/optee-examples.inc
> > +++ b/meta-arm/recipes-security/optee/optee-examples.inc
> > @@ -39,7 +39,7 @@ do_install () {
> >      install -D -p -m0444 ${B}/plugins/*
> ${D}${libdir}/tee-supplicant/plugins
> >  }
> >
> > -FILES_${PN} += "${nonarch_base_libdir}/optee_armtz/ \
> > +FILES:${PN} += "${nonarch_base_libdir}/optee_armtz/ \
> >                  ${libdir}/tee-supplicant/plugins/ \
> >                 "
> >
> > diff --git a/meta-arm/recipes-security/optee/optee-os.inc
> b/meta-arm/recipes-security/optee/optee-os.inc
> > index 483b797..3d707ac 100644
> > --- a/meta-arm/recipes-security/optee/optee-os.inc
> > +++ b/meta-arm/recipes-security/optee/optee-os.inc
> > @@ -12,7 +12,7 @@ CVE_PRODUCT = "linaro:op-tee op-tee:op-tee_os"
> >
> >  DEPENDS = "python3-pycryptodome-native python3-pyelftools-native"
> >
> > -DEPENDS_append_toolchain-clang = " compiler-rt"
> > +DEPENDS:append:toolchain-clang = " compiler-rt"
> >
> >  SRC_URI = "git://github.com/OP-TEE/optee_os.git"
> >
> > @@ -65,12 +65,12 @@ addtask deploy before do_build after do_install
> >
> >  SYSROOT_DIRS += "${nonarch_base_libdir}/firmware"
> >
> > -FILES_${PN} = "${nonarch_base_libdir}/firmware/"
> > -FILES_${PN}-dev = "${includedir}/optee/"
> > +FILES:${PN} = "${nonarch_base_libdir}/firmware/"
> > +FILES:${PN}-dev = "${includedir}/optee/"
> >
> >  # note: "textrel" is not triggered on all archs
> > -INSANE_SKIP_${PN} = "textrel"
> > -INSANE_SKIP_${PN}-dev = "staticdev"
> > +INSANE_SKIP:${PN} = "textrel"
> > +INSANE_SKIP:${PN}-dev = "staticdev"
> >
> >  INHIBIT_PACKAGE_STRIP = "1"
> >
> > diff --git a/meta-arm/recipes-security/optee/optee-os_3.14.0.bb
> b/meta-arm/recipes-security/optee/optee-os_3.14.0.bb
> > index 3289e2c..95d82bb 100644
> > --- a/meta-arm/recipes-security/optee/optee-os_3.14.0.bb
> > +++ b/meta-arm/recipes-security/optee/optee-os_3.14.0.bb
> > @@ -2,7 +2,7 @@ require optee-os.inc
> >
> >  SRCREV = "d21befa5e53eae9db469eba1685f5aa5c6f92c2f"
> >
> > -SRC_URI_append = " \
> > +SRC_URI:append = " \
> >      file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
> >      file://0007-allow-setting-sysroot-for-clang.patch \
> >  "
> > diff --git a/meta-arm/recipes-security/optee/optee-test.inc
> b/meta-arm/recipes-security/optee/optee-test.inc
> > index bcbcc06..0a8e56c 100644
> > --- a/meta-arm/recipes-security/optee/optee-test.inc
> > +++ b/meta-arm/recipes-security/optee/optee-test.inc
> > @@ -43,7 +43,7 @@ do_install () {
> >      install -D -p -m0444 ${B}/supp_plugin/*.plugin
> ${D}${libdir}/tee-supplicant/plugins/
> >  }
> >
> > -FILES_${PN} += "${nonarch_base_libdir}/optee_armtz/ \
> > +FILES:${PN} += "${nonarch_base_libdir}/optee_armtz/ \
> >                  ${libdir}/tee-supplicant/plugins/ \
> >                 "
> >
> > diff --git a/meta-arm/recipes-security/optee/optee.inc
> b/meta-arm/recipes-security/optee/optee.inc
> > index d093b48..39a7042 100644
> > --- a/meta-arm/recipes-security/optee/optee.inc
> > +++ b/meta-arm/recipes-security/optee/optee.inc
> > @@ -1,15 +1,15 @@
> >  UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
> >
> >  COMPATIBLE_MACHINE ?= "invalid"
> > -COMPATIBLE_MACHINE_qemuarm64 ?= "qemuarm64"
> > +COMPATIBLE_MACHINE:qemuarm64 ?= "qemuarm64"
> >  # Please add supported machines below or set it in .bbappend or .conf
> >
> >  OPTEEMACHINE ?= "${MACHINE}"
> > -OPTEEMACHINE_aarch64_qemuall ?= "vexpress-qemu_armv8a"
> > +OPTEEMACHINE:aarch64:qemuall ?= "vexpress-qemu:armv8a"
> >
> >  OPTEE_ARCH = "null"
> > -OPTEE_ARCH_armv7a = "arm32"
> > -OPTEE_ARCH_aarch64 = "arm64"
> > +OPTEE_ARCH:armv7a = "arm32"
> > +OPTEE_ARCH:aarch64 = "arm64"
> >  OPTEE_CORE = "${@d.getVar('OPTEE_ARCH').upper()}"
> >
> >  OPTEE_TOOLCHAIN = "${@d.getVar('TOOLCHAIN') or 'gcc'}"
> > diff --git
> a/meta-atp/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend
> b/meta-atp/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend
> > index 5194ce1..6607f0f 100644
> > --- a/meta-atp/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend
> > +++ b/meta-atp/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend
> > @@ -1,6 +1,6 @@
> >  require recipes-devtools/atp/atp-source_3.1.inc
> >
> > -FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
> > +FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"
> >
> >  SRC_URI += "${ATP_SRC};destsuffix=git/atp;name=atp \
> >              file://start-gem5-atp.sh"
> > @@ -11,14 +11,14 @@ LIC_FILES_CHKSUM +=
> "file://atp/LICENSE;md5=${ATP_LIC_MD5}"
> >
> >  EXTRA_OESCONS += "EXTRAS=${S}/atp"
> >
> > -do_install_append() {
> > +do_install:append() {
> >      # baremetal_atp.py machine configuration and sample stream.atp file
> >      install -m 644 ${B}/atp/gem5/baremetal_atp.py \
> >                     ${B}/atp/configs/stream.atp \
> >                     ${D}${datadir}/gem5/configs
> >  }
> >
> > -do_deploy_append() {
> > +do_deploy:append() {
> >      # start-gem5-atp.sh launch script
> >      install -m 755 ${WORKDIR}/start-gem5-atp.sh ${DEPLOYDIR}
> >  }
> > diff --git a/meta-atp/recipes-devtools/gem5/gem5-m5ops_20.bbappend
> b/meta-atp/recipes-devtools/gem5/gem5-m5ops_20.bbappend
> > index 34024bf..3ba0c3c 100644
> > --- a/meta-atp/recipes-devtools/gem5/gem5-m5ops_20.bbappend
> > +++ b/meta-atp/recipes-devtools/gem5/gem5-m5ops_20.bbappend
> > @@ -1,6 +1,6 @@
> >  inherit update-rc.d
> >
> > -FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
> > +FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"
> >
> >  # Add startup script calling m5 readfile for automatic checkpoint and
> restore
> >  SRC_URI += "file://m5-readfile.sh"
> > @@ -8,7 +8,7 @@ SRC_URI += "file://m5-readfile.sh"
> >  INITSCRIPT_NAME = "m5-readfile.sh"
> >  INITSCRIPT_PARAMS = "defaults 99"
> >
> > -do_install_append() {
> > +do_install:append() {
> >      install -d ${D}/${INIT_D_DIR}
> >      install -m 755 ${WORKDIR}/m5-readfile.sh ${D}/${INIT_D_DIR}
> >  }
> > diff --git a/meta-atp/recipes-kernel/atp/atp-module_3.1.bb
> b/meta-atp/recipes-kernel/atp/atp-module_3.1.bb
> > index 9820a9d..0bf4949 100644
> > --- a/meta-atp/recipes-kernel/atp/atp-module_3.1.bb
> > +++ b/meta-atp/recipes-kernel/atp/atp-module_3.1.bb
> > @@ -12,11 +12,11 @@ ATP_MOD_DIR = "linux"
> >  EXTRA_OEMAKE += "-C ${ATP_MOD_DIR}"
> >
> >  PROVIDES = "kernel-module-atp"
> > -RPROVIDES_${PN} = "kernel-module-atp"
> > +RPROVIDES:${PN} = "kernel-module-atp"
> >  KERNEL_MODULE_AUTOLOAD += "atp_buffer_manager atp_device"
> >  MODULES_MODULE_SYMVERS_LOCATION = "${ATP_MOD_DIR}"
> >
> > -do_install_append() {
> > +do_install:append() {
> >      install -d ${D}${includedir}/linux
> >      install -m 644 ${ATP_MOD_DIR}/atp_buffer_manager_user.h \
> >                     ${ATP_MOD_DIR}/atp_device_user.h \
> > diff --git a/meta-atp/recipes-kernel/atp/atp-test_3.1.bb
> b/meta-atp/recipes-kernel/atp/atp-test_3.1.bb
> > index c3f3caa..5a3097e 100644
> > --- a/meta-atp/recipes-kernel/atp/atp-test_3.1.bb
> > +++ b/meta-atp/recipes-kernel/atp/atp-test_3.1.bb
> > @@ -18,4 +18,4 @@ do_install() {
> >  }
> >
> >  DEPENDS = "atp-uapi cppunit"
> > -RDEPENDS_${PN} = "atp-uapi"
> > +RDEPENDS:${PN} = "atp-uapi"
> > diff --git a/meta-atp/recipes-kernel/linux/linux-yocto_5.4.bbappend
> b/meta-atp/recipes-kernel/linux/linux-yocto_5.4.bbappend
> > index 701499b..c835220 100644
> > --- a/meta-atp/recipes-kernel/linux/linux-yocto_5.4.bbappend
> > +++ b/meta-atp/recipes-kernel/linux/linux-yocto_5.4.bbappend
> > @@ -1,2 +1,2 @@
> > -FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}-5.4:"
> > +FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}-5.4:"
> >  SRC_URI += "file://no_ftrace.cfg file://smmuv3.cfg"
> > diff --git a/meta-gem5/conf/layer.conf b/meta-gem5/conf/layer.conf
> > index e6320ef..5469c35 100644
> > --- a/meta-gem5/conf/layer.conf
> > +++ b/meta-gem5/conf/layer.conf
> > @@ -16,4 +16,4 @@ BBFILES_DYNAMIC += " \
> >
> virtualization-layer:${LAYERDIR}/dynamic-layers/meta-virtualization/*/*/*.bbappend
> \
> >  "
> >
> > -DISTRO_FEATURES_NATIVE_append = " ${@bb.utils.filter('DISTRO_FEATURES',
> 'xen', d)}"
> > +DISTRO_FEATURES_NATIVE:append = " ${@bb.utils.filter('DISTRO_FEATURES',
> 'xen', d)}"
> > diff --git a/meta-gem5/conf/machine/gem5-arm64.conf
> b/meta-gem5/conf/machine/gem5-arm64.conf
> > index 3e97682..fa931da 100644
> > --- a/meta-gem5/conf/machine/gem5-arm64.conf
> > +++ b/meta-gem5/conf/machine/gem5-arm64.conf
> > @@ -50,5 +50,5 @@ EXTRA_IMAGEDEPENDS += "gem5-aarch64-native"
> >  # As this is a virtual target that will not be used in the real world
> there is
> >  # no need for real SSH keys.  Disable rng-tools (which takes too long to
> >  # initialise) and install the pre-generated keys.
> > -PACKAGECONFIG_remove_pn-openssh = "rng-tools"
> > +PACKAGECONFIG:remove:pn-openssh = "rng-tools"
> >  MACHINE_EXTRA_RRECOMMENDS += "ssh-pregen-hostkeys"
> > diff --git
> a/meta-gem5/dynamic-layers/meta-virtualization/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend
> b/meta-gem5/dynamic-layers/meta-virtualization/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend
> > index 3b93b3b..223cbe7 100644
> > ---
> a/meta-gem5/dynamic-layers/meta-virtualization/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend
> > +++
> b/meta-gem5/dynamic-layers/meta-virtualization/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend
> > @@ -1,6 +1,6 @@
> >  # Use OVERRIDES to minimize the usage of
> >  # ${@bb.utils.contains('DISTRO_FEATURES', 'xen', ...
> > -OVERRIDES_append = "${@bb.utils.contains('DISTRO_FEATURES', 'xen',
> ':xen', '', d)}"
> > +OVERRIDES:append = "${@bb.utils.contains('DISTRO_FEATURES', 'xen',
> ':xen', '', d)}"
> >
> >  # Xen image to put in the image
> >  # This should point to a file in the deploy image directory
> > @@ -18,12 +18,12 @@ BOOT_WRAPPER_AARCH64_CMDLINE_xen_gem5-arm64 =
> "console=hvc0 root=/dev/vda rw"
> >  # Image generated by boot wrapper when Xen is present
> >  BOOT_WRAPPER_AARCH64_IMAGE_xen ?= "xen-system.axf"
> >
> > -EXTRA_OECONF_append_xen = " \
> > +EXTRA_OECONF:append_xen = " \
> >  --with-xen=${WORKDIR}/kernel/arch/arm64/boot/Image \
> >  --with-xen-cmdline="" \
> >  "
> >
> > -EXTRA_OEMAKE_append_xen = " \
> > +EXTRA_OEMAKE:append_xen = " \
> >  XEN_IMAGE=${DEPLOY_DIR_IMAGE}/${BOOT_WRAPPER_AARCH64_XEN} \
> >  XEN_CMDLINE="${BOOT_WRAPPER_AARCH64_XEN_CMDLINE}" \
> >  "
> > diff --git
> a/meta-gem5/dynamic-layers/meta-virtualization/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend
> b/meta-gem5/dynamic-layers/meta-virtualization/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend
> > index 8239a40..5c38bdd 100644
> > ---
> a/meta-gem5/dynamic-layers/meta-virtualization/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend
> > +++
> b/meta-gem5/dynamic-layers/meta-virtualization/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend
> > @@ -1,6 +1,6 @@
> >  # When booting gem5-arm64 with Xen we need to set the cpu as Cortex A53
> and
> >  # remove support for pointer authentification
> > -GEM5_RUN_EXTRA_append = " \
> > +GEM5_RUN_EXTRA:append = " \
> >  ${@bb.utils.contains('DISTRO_FEATURES_NATIVE', 'xen', \
> >  '--param=system.cpu_cluster[0].cpus[0].isa[0].midr=0x410fd030 \
> >  --param=system.cpu_cluster[0].cpus[0].isa[0].id_aa64isar1_el1=0x0', \
> > diff --git
> a/meta-gem5/dynamic-layers/meta-virtualization/recipes-extended/xen/xen_%.bbappend
> b/meta-gem5/dynamic-layers/meta-virtualization/recipes-extended/xen/xen_%.bbappend
> > index ef42c52..a721f8e 100644
> > ---
> a/meta-gem5/dynamic-layers/meta-virtualization/recipes-extended/xen/xen_%.bbappend
> > +++
> b/meta-gem5/dynamic-layers/meta-virtualization/recipes-extended/xen/xen_%.bbappend
> > @@ -1,4 +1,4 @@
> >  # gem5-arm64 support
> >  COMPATIBLE_MACHINE_gem5-arm64 = "gem5-arm64"
> > -FILESEXTRAPATHS_prepend_gem5-arm64 := "${THISDIR}/files:"
> > -SRC_URI_append_gem5-arm64 = " file://early-printk.cfg"
> > +FILESEXTRAPATHS:prepend_gem5-arm64 := "${THISDIR}/files:"
> > +SRC_URI:append_gem5-arm64 = " file://early-printk.cfg"
> > diff --git
> a/meta-gem5/dynamic-layers/meta-virtualization/recipes-kernel/linux/linux-%.bbappend
> b/meta-gem5/dynamic-layers/meta-virtualization/recipes-kernel/linux/linux-%.bbappend
> > index 5d3b52c..f2d2818 100644
> > ---
> a/meta-gem5/dynamic-layers/meta-virtualization/recipes-kernel/linux/linux-%.bbappend
> > +++
> b/meta-gem5/dynamic-layers/meta-virtualization/recipes-kernel/linux/linux-%.bbappend
> > @@ -1,9 +1,9 @@
> > -FILESEXTRAPATHS_prepend_gem5-arm64 := "${THISDIR}:"
> > +FILESEXTRAPATHS:prepend_gem5-arm64 := "${THISDIR}:"
> >
> >  #
> >  # virtualization kmeta extra
> >  #
> > -SRC_URI_append_gem5-arm64 = "
> file://virtualization-kmeta-extra-gem5;type=kmeta;name=virtualization-kmeta-extra-gem5;destsuffix=virtualization-kmeta-extra-gem5"
> > +SRC_URI:append_gem5-arm64 = "
> file://virtualization-kmeta-extra-gem5;type=kmeta;name=virtualization-kmeta-extra-gem5;destsuffix=virtualization-kmeta-extra-gem5"
> >
> >  # We need to turn off SVE support in the Linux kernel otherwise Xen is
> stopping
> >  # Linux kernel with a coredump while trying to access XEN bit of CPACR1
> core
> > @@ -11,4 +11,4 @@ SRC_URI_append_gem5-arm64 = "
> file://virtualization-kmeta-extra-gem5;type=kmeta;
> >  LINUX_VIRTUALIZATION_DISABLE_ARM64_SVE_gem5-arm64 =
> "${@bb.utils.contains('DISTRO_FEATURES', \
> >                                           'xen', '
> features/disable-arm64-sve.scc','',d)}"
> >
> > -KERNEL_FEATURES_append_gem5-arm64 =
> "${LINUX_VIRTUALIZATION_DISABLE_ARM64_SVE}"
> > +KERNEL_FEATURES:append_gem5-arm64 =
> "${LINUX_VIRTUALIZATION_DISABLE_ARM64_SVE}"
> > diff --git
> a/meta-gem5/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_%.bbappend
> b/meta-gem5/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_%.bbappend
> > index d890d1b..65a5b84 100644
> > ---
> a/meta-gem5/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_%.bbappend
> > +++
> b/meta-gem5/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_%.bbappend
> > @@ -4,7 +4,7 @@ COMPATIBLE_MACHINE_gem5-arm64 = "gem5-arm64"
> >  PROVIDES_gem5-arm64 += "virtual/gem5-bootloader"
> >
> >  # For gem5 we use the dtb generated by gem5 directly
> > -DEPENDS_append_gem5-arm64 = " gem5-aarch64-dtb"
> > +DEPENDS:append_gem5-arm64 = " gem5-aarch64-dtb"
> >  BOOT_WRAPPER_AARCH64_DEVICETREE_gem5-arm64 = "gem5-aarch64.dtb"
> >
> >  # The dtb must be generated for us to generate the axf
> > diff --git a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
> b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
> > index 79cf910..057aad8 100644
> > --- a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
> > +++ b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
> > @@ -8,13 +8,13 @@ require gem5-aarch64-native.inc
> >  require gem5-native.inc
> >
> >  # Get rid of compiler errors when building protobuf
> > -GEM5_SCONS_ARGS_append = " CCFLAGS_EXTRA='-Wno-error=unused-variable'
> --verbose"
> > +GEM5_SCONS_ARGS:append = " CCFLAGS_EXTRA='-Wno-error=unused-variable'
> --verbose"
> >
> >  # Get rid of linker errors and have a faster link process
> > -GEM5_SCONS_ARGS_append = " LDFLAGS_EXTRA='${BUILD_LDFLAGS}' \
> > +GEM5_SCONS_ARGS:append = " LDFLAGS_EXTRA='${BUILD_LDFLAGS}' \
> >  MARSHAL_LDFLAGS_EXTRA='${BUILD_LDFLAGS}' --force-lto "
> >
> > -do_compile_prepend() {
> > +do_compile:prepend() {
> >      # Gem5 expect to have python in the path (can be python2 or 3)
> >      # Create a link named python to python3
> >      real=$(which ${PYTHON})
> > diff --git a/meta-gem5/recipes-devtools/gem5/gem5-native.inc
> b/meta-gem5/recipes-devtools/gem5/gem5-native.inc
> > index 1462b4e..a719f72 100644
> > --- a/meta-gem5/recipes-devtools/gem5/gem5-native.inc
> > +++ b/meta-gem5/recipes-devtools/gem5/gem5-native.inc
> > @@ -45,8 +45,8 @@ do_install() {
> >      done
> >  }
> >
> > -FILES_${PN} = "${datadir}/gem5/* ${bindir}/*"
> > -INSANE_SKIP_${PN} += "already-stripped"
> > -RDEPENDS_${PN} += "python3-native hdf5-native protobuf-native
> libpng-native"
> > +FILES:${PN} = "${datadir}/gem5/* ${bindir}/*"
> > +INSANE_SKIP:${PN} += "already-stripped"
> > +RDEPENDS:${PN} += "python3-native hdf5-native protobuf-native
> libpng-native"
> >
> >  addtask addto_recipe_sysroot before do_build
> > diff --git a/meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend
> b/meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend
> > index 7913f61..8b86855 100644
> > --- a/meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend
> > +++ b/meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend
> > @@ -1,11 +1,11 @@
> > -FILESEXTRAPATHS_prepend := "${THISDIR}:${THISDIR}/files:"
> > +FILESEXTRAPATHS:prepend := "${THISDIR}:${THISDIR}/files:"
> >
> >  COMPATIBLE_MACHINE_gem5-arm64 = "gem5-arm64"
> >  KMACHINE_gem5-arm64 = "gem5-arm64"
> > -SRC_URI_append_gem5-arm64 = "
> file://gem5-kmeta;type=kmeta;name=gem5-kmeta;destsuffix=gem5-kmeta \
> > +SRC_URI:append_gem5-arm64 = "
> file://gem5-kmeta;type=kmeta;name=gem5-kmeta;destsuffix=gem5-kmeta \
> >                                file://dts/gem5-arm64;subdir=add-files"
> >
> > -do_patch_append_gem5-arm64() {
> > +do_patch:append_gem5-arm64() {
> >      tar -C ${WORKDIR}/add-files/dts -cf - gem5-arm64 | \
> >          tar -C arch/arm64/boot/dts -xf -
> >  }
> > --
> > 2.32.0
> >
> >
> >
> >
>
> 
>
>

--000000000000c3046305c8b6290b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 4, 2021 at 8:39 AM Sumit =
Garg &lt;<a href=3D"mailto:sumit.garg@linaro.org">sumit.garg@linaro.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On T=
ue, 3 Aug 2021 at 22:09, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Drop compatibility with older than honister releases<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
<br>
Thanks for taking the lead to do override syntax conversion for entire<br>
meta-arm. But even after this patch, I still observe following (a mix<br>
of new and old override syntax):<br>
<br>
COMPATIBLE_MACHINE_juno<br>
FILESEXTRAPATHS:prepend_juno<br>
SRC_URI:append_juno<br>
KMACHINE_juno<br>
KBUILD_DEFCONFIG_juno<br>
KCONFIG_MODE_juno<br>
KERNEL_FEATURES:append_corstone700-mps3<br>
LAYERDEPENDS_arm-toolchain<br>
LAYERSERIES_COMPAT_arm-toolchain<br></blockquote><div><br></div><div>The 2=
 above are not overrides, but variables, so here the _ is really a simple c=
haracter, not the override delimiter!</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
LAYERDEPENDS_meta-arm-bsp:append_musca-s1<br>
XEN_DEVICETREE_DTSI_MERGE:append_n1sdp<br>
<br>
and many more similar ones...<br>
<br>
Is it due to an issue with usage of scripts/contrib/convert-overrides.py?<=
br></blockquote><div><br></div><div>Yes, kind of. This script needs to be t=
aught what are the overrides in use in the layer being processed. Please ch=
eck the &#39;note&#39; here:</div><div><a href=3D"https://docs.yoctoproject=
.org/migration-guides/migration-3.4.html#override-syntax-changes">https://d=
ocs.yoctoproject.org/migration-guides/migration-3.4.html#override-syntax-ch=
anges</a><br></div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
-Sumit<br>
<br>
&gt; ---<br>
&gt;=C2=A0 ci/base.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=
=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 ci/gem5-arm64-xen.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 ci/qemuarmv5.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0=
2 +-<br>
&gt;=C2=A0 ci/testimage.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0=
2 +-<br>
&gt;=C2=A0 kas/fvp-baser-aemv8r64-bsp.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 .../classes/alternate-kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 .../classes/docker_extern_containers.bbclass=C2=A0 |=C2=A0 =C2=
=A04 +-<br>
&gt;=C2=A0 .../classes/kernel-xenguest.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../classes/xenguest_image_extra.bbclass=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../distro/include/arm-autonomy-guest.inc=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../conf/distro/include/arm-autonomy-host.inc |=C2=A0 =C2=A08 +=
-<br>
&gt;=C2=A0 meta-arm-autonomy/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../conf/machine/fvp-base-extra-settings.inc=C2=A0 |=C2=A0 =C2=
=A02 +-<br>
&gt;=C2=A0 .../conf/machine/juno-extra-settings.inc=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../conf/machine/n1sdp-extra-settings.inc=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 .../images/firmware-image-juno.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0|=C2=A0 12 +-<br>
&gt;=C2=A0 .../recipes-bsp/u-boot/u-boot_%.bbappend=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 .../xen-devicetree/xen-devicetree.bbappend=C2=A0 =C2=A0 |=C2=A0=
 22 +-<br>
&gt;=C2=A0 .../recipes-extended/xen/xen_%.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0|=C2=A0 12 +-<br>
&gt;=C2=A0 .../recipes-bsp/grub/grub-efi_%.bbappend=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../<a href=3D"http://import-docker-containers.bb" rel=3D"noref=
errer" target=3D"_blank">import-docker-containers.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../<a href=3D"http://packagegroup-docker-runtime-minimal.bb" r=
el=3D"noreferrer" target=3D"_blank">packagegroup-docker-runtime-minimal.bb<=
/a>=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../recipes-core/busybox/busybox_%.bbappend=C2=A0 =C2=A0|=C2=A0=
 =C2=A06 +-<br>
&gt;=C2=A0 .../init-ifupdown/init-ifupdown_1.0.bbappend=C2=A0 |=C2=A0 =C2=
=A04 +-<br>
&gt;=C2=A0 .../qemu/qemu-autonomy-host.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../xen-devicetree/<a href=3D"http://xen-devicetree.bb" rel=3D"=
noreferrer" target=3D"_blank">xen-devicetree.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../recipes-extended/xen/xen-tools_%.bbappend |=C2=A0 =C2=A02 +=
-<br>
&gt;=C2=A0 .../xen/xen-tools_4.14.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 .../recipes-extended/xen/xen_%.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../recipes-extended/xen/xen_4.14.bbappend=C2=A0 =C2=A0 |=C2=A0=
 =C2=A06 +-<br>
&gt;=C2=A0 .../xenguest/files/00-vif-xenguest.hook=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 .../xenguest/files/xenguest-manager=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0|=C2=A0 14 +-<br>
&gt;=C2=A0 .../xenguest/files/xenguest-mkimage=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../xenguest/<a href=3D"http://xenguest-base-image.bb" rel=3D"n=
oreferrer" target=3D"_blank">xenguest-base-image.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../xenguest/<a href=3D"http://xenguest-extern-guests.bb" rel=
=3D"noreferrer" target=3D"_blank">xenguest-extern-guests.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../xenguest/<a href=3D"http://xenguest-manager.bb" rel=3D"nore=
ferrer" target=3D"_blank">xenguest-manager.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../xenguest/<a href=3D"http://xenguest-mkimage.bb" rel=3D"nore=
ferrer" target=3D"_blank">xenguest-mkimage.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../xenguest/<a href=3D"http://xenguest-network.bb" rel=3D"nore=
ferrer" target=3D"_blank">xenguest-network.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 22 +-<br>
&gt;=C2=A0 .../linux/linux-arm-autonomy.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 meta-arm-bsp/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../conf/machine/corstone700-fvp.conf=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../conf/machine/corstone700-mps3.conf=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../conf/machine/fvp-baser-aemv8r64.conf=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 meta-arm-bsp/conf/machine/fvp-common.inc=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../conf/machine/include/arm/arch-armv6m.inc=C2=A0 |=C2=A0 =C2=
=A06 +-<br>
&gt;=C2=A0 .../conf/machine/include/arm/arch-armv7em.inc |=C2=A0 =C2=A06 +=
-<br>
&gt;=C2=A0 .../conf/machine/include/arm/arch-armv7m.inc=C2=A0 |=C2=A0 =C2=
=A06 +-<br>
&gt;=C2=A0 .../include/arm/arch-armv8-1m-main.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 .../machine/include/arm/arch-armv8-2a.inc=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 16 +-<br>
&gt;=C2=A0 .../machine/include/arm/arch-armv8-4a.inc=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 16 +-<br>
&gt;=C2=A0 .../machine/include/arm/arch-armv8m-base.inc=C2=A0 |=C2=A0 =C2=
=A06 +-<br>
&gt;=C2=A0 .../machine/include/arm/arch-armv8m-main.inc=C2=A0 |=C2=A0 24 +=
-<br>
&gt;=C2=A0 .../include/arm/armv8r/arch-armv8r64.inc=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 24 +-<br>
&gt;=C2=A0 .../conf/machine/include/corstone700.inc=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../conf/machine/include/tune-cortexm0.inc=C2=A0 =C2=A0 |=C2=A0=
 =C2=A06 +-<br>
&gt;=C2=A0 .../machine/include/tune-cortexm0plus.inc=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 .../conf/machine/include/tune-cortexm1.inc=C2=A0 =C2=A0 |=C2=A0=
 =C2=A06 +-<br>
&gt;=C2=A0 .../conf/machine/include/tune-cortexm23.inc=C2=A0 =C2=A0|=C2=A0=
 =C2=A06 +-<br>
&gt;=C2=A0 .../conf/machine/include/tune-cortexm3.inc=C2=A0 =C2=A0 |=C2=A0=
 =C2=A06 +-<br>
&gt;=C2=A0 .../conf/machine/include/tune-cortexm33.inc=C2=A0 =C2=A0|=C2=A0=
 =C2=A06 +-<br>
&gt;=C2=A0 .../conf/machine/include/tune-cortexm35p.inc=C2=A0 |=C2=A0 =C2=
=A06 +-<br>
&gt;=C2=A0 .../conf/machine/include/tune-cortexm4.inc=C2=A0 =C2=A0 |=C2=A0=
 =C2=A06 +-<br>
&gt;=C2=A0 .../conf/machine/include/tune-cortexm55.inc=C2=A0 =C2=A0|=C2=A0=
 =C2=A06 +-<br>
&gt;=C2=A0 .../conf/machine/include/tune-cortexm7.inc=C2=A0 =C2=A0 |=C2=A0=
 =C2=A06 +-<br>
&gt;=C2=A0 .../conf/machine/include/tune-neoversen1.inc=C2=A0 |=C2=A0 =C2=
=A08 +-<br>
&gt;=C2=A0 meta-arm-bsp/conf/machine/n1sdp.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 meta-arm-bsp/conf/machine/sgi575.conf=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../boot-firmware/<a href=3D"http://boot-firmware_git.bb" rel=
=3D"noreferrer" target=3D"_blank">boot-firmware_git.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 ...oot-wrapper-aarch64-fvp-baser-aemv8r64.inc |=C2=A0 =C2=A04 +=
-<br>
&gt;=C2=A0 .../external-system/<a href=3D"http://external-system_0.1.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">external-system_0.1.0.bb</a>=C2=A0 |=
=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../images/<a href=3D"http://n1sdp-board-firmware_2020.07.27.bb=
" rel=3D"noreferrer" target=3D"_blank">n1sdp-board-firmware_2020.07.27.bb</=
a> |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../scp-firmware/scp-firmware-juno.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../scp-firmware/scp-firmware-n1sdp.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 .../scp-firmware/scp-firmware-tc0.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../trusted-firmware-a-corstone500.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../trusted-firmware-a-corstone700.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../trusted-firmware-a-fvp-arm32.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../trusted-firmware-a-juno.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../trusted-firmware-a_2.%.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../recipes-bsp/u-boot/u-boot_%.bbappend=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 .../u-boot/u-boot_2020.04.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../u-boot/u-boot_2020.07.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 .../u-boot/u-boot_2021.07.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../recipes-bsp/uefi/edk2-firmware-n1sdp.inc=C2=A0 |=C2=A0 =C2=
=A06 +-<br>
&gt;=C2=A0 .../init-ifupdown/init-ifupdown_1.0.bbappend=C2=A0 |=C2=A0 =C2=
=A02 +-<br>
&gt;=C2=A0 .../linux/linux-arm-platforms.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 38 +-<br>
&gt;=C2=A0 .../linux/linux-arm64-ack_5.10.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../linux/linux-yocto-corstone700.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 10 +-<br>
&gt;=C2=A0 .../linux/linux-yocto_5.3%.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../linux/linux-yocto_5.6%.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../linux/linux-yocto_5.7%.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../recipes-security/optee/optee-os-tc0.inc=C2=A0 =C2=A0|=C2=A0=
 =C2=A06 +-<br>
&gt;=C2=A0 .../external-arm-toolchain-versions.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../distro/include/tcmode-external-arm.inc=C2=A0 =C2=A0 |=C2=A0=
 14 +-<br>
&gt;=C2=A0 meta-arm-toolchain/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../arm-binary-toolchain.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../<a href=3D"http://external-arm-sdk-toolchain.bb" rel=3D"nor=
eferrer" target=3D"_blank">external-arm-sdk-toolchain.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 30 +-<br>
&gt;=C2=A0 .../<a href=3D"http://external-arm-toolchain.bb" rel=3D"norefer=
rer" target=3D"_blank">external-arm-toolchain.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 374 +++++++++---------<br>
&gt;=C2=A0 .../<a href=3D"http://gcc-aarch64-none-elf_10.2-2020.11.bb" rel=
=
=3D"noreferrer" target=3D"_blank">gcc-aarch64-none-elf_10.2-2020.11.bb</a>=
=
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../external-arm-toolchain/license.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 134 +++----<br>
&gt;=C2=A0 .../recipes-devtools/gcc/gcc-arm-10.2.inc=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../recipes-devtools/gcc/gcc-arm-common.inc=C2=A0 =C2=A0|=C2=A0=
 =C2=A04 +-<br>
&gt;=C2=A0 .../gcc/<a href=3D"http://gcc-sanitizers_arm-10.2.bb" rel=3D"no=
referrer" target=3D"_blank">gcc-sanitizers_arm-10.2.bb</a>=C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../recipes-devtools/gcc/<a href=3D"http://gcc_arm-10.2.bb" rel=
=
=3D"noreferrer" target=3D"_blank">gcc_arm-10.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 10 +-<br>
&gt;=C2=A0 .../gcc/<a href=3D"http://libgcc-initial_arm-10.2.bb" rel=3D"no=
referrer" target=3D"_blank">libgcc-initial_arm-10.2.bb</a>=C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../recipes-devtools/gcc/<a href=3D"http://libgcc_arm-10.2.bb" =
rel=3D"noreferrer" target=3D"_blank">libgcc_arm-10.2.bb</a>=C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 meta-arm/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../conf/machine/qemuarm64-secureboot.conf=C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +-<br>
&gt;=C2=A0 .../<a href=3D"http://boot-wrapper-aarch64_git.bb" rel=3D"noref=
errer" target=3D"_blank">boot-wrapper-aarch64_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 meta-arm/recipes-bsp/hafnium/<a href=3D"http://hafnium_2.5.bb" =
rel=3D"noreferrer" target=3D"_blank">hafnium_2.5.bb</a>=C2=A0 =C2=A0|=C2=A0=
 =C2=A06 +-<br>
&gt;=C2=A0 .../scp-firmware/<a href=3D"http://scp-firmware_2.8.0.bb" rel=
=3D"noreferrer" target=3D"_blank">scp-firmware_2.8.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 .../trusted-firmware-a/trusted-firmware-a.inc |=C2=A0 18 +-<br>
&gt;=C2=A0 .../trusted-firmware-a_%.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 22 +-<br>
&gt;=C2=A0 .../<a href=3D"http://trusted-firmware-a_1.5.bb" rel=3D"norefer=
rer" target=3D"_blank">trusted-firmware-a_1.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../<a href=3D"http://trusted-firmware-m_1.3.0.bb" rel=3D"noref=
errer" target=3D"_blank">trusted-firmware-m_1.3.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend |=C2=A0 =C2=A04 +=
-<br>
&gt;=C2=A0 meta-arm/recipes-bsp/uefi/edk2-firmware.inc=C2=A0 =C2=A0|=C2=A0=
 10 +-<br>
&gt;=C2=A0 .../recipes-bsp/uefi/edk2-firmware_%.bbappend |=C2=A0 22 +-<br>
&gt;=C2=A0 meta-arm/recipes-bsp/uefi/<a href=3D"http://sbsa-acs_3.0.bb" re=
l=3D"noreferrer" target=3D"_blank">sbsa-acs_3.0.bb</a>=C2=A0 =C2=A0 =C2=A0|=
=
=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 meta-arm/recipes-devtools/fvp/fvp-common.inc=C2=A0 |=C2=A0 =C2=
=A06 +-<br>
&gt;=C2=A0 .../linux/linux-yocto_5.10.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0|=C2=A0 12 +-<br>
&gt;=C2=A0 .../recipes-security/optee/optee-client.inc=C2=A0 =C2=A0|=C2=A0=
 10 +-<br>
&gt;=C2=A0 .../recipes-security/optee/optee-examples.inc |=C2=A0 =C2=A02 +=
-<br>
&gt;=C2=A0 meta-arm/recipes-security/optee/optee-os.inc=C2=A0 |=C2=A0 10 +=
-<br>
&gt;=C2=A0 .../recipes-security/optee/<a href=3D"http://optee-os_3.14.0.bb=
" rel=3D"noreferrer" target=3D"_blank">optee-os_3.14.0.bb</a> |=C2=A0 =C2=
=A02 +-<br>
&gt;=C2=A0 .../recipes-security/optee/optee-test.inc=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 meta-arm/recipes-security/optee/optee.inc=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 .../gem5/gem5-aarch64-native_20.bbappend=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 .../gem5/gem5-m5ops_20.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 meta-atp/recipes-kernel/atp/<a href=3D"http://atp-module_3.1.bb=
" rel=3D"noreferrer" target=3D"_blank">atp-module_3.1.bb</a> |=C2=A0 =C2=A0=
4 +-<br>
&gt;=C2=A0 meta-atp/recipes-kernel/atp/<a href=3D"http://atp-test_3.1.bb" =
rel=3D"noreferrer" target=3D"_blank">atp-test_3.1.bb</a>=C2=A0 =C2=A0|=C2=
=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../linux/linux-yocto_5.4.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 meta-gem5/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 meta-gem5/conf/machine/gem5-arm64.conf=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../boot-wrapper-aarch64_%.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 .../gem5/gem5-aarch64-native_20.bbappend=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../recipes-extended/xen/xen_%.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../recipes-kernel/linux/linux-%.bbappend=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 .../boot-wrapper-aarch64_%.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../gem5/<a href=3D"http://gem5-aarch64-native_20.bb" rel=3D"no=
referrer" target=3D"_blank">gem5-aarch64-native_20.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 .../recipes-devtools/gem5/gem5-native.inc=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 .../linux/linux-yocto_5.4.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 142 files changed, 677 insertions(+), 677 deletions(-)<br>
&gt;<br>
&gt; diff --git a/ci/base.yml b/ci/base.yml<br>
&gt; index 2113dc4..b6462a0 100644<br>
&gt; --- a/ci/base.yml<br>
&gt; +++ b/ci/base.yml<br>
&gt; @@ -29,14 +29,14 @@ local_conf_header:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CONF_VERSION =3D &quot;1&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 PACKAGE_CLASSES =3D &quot;package_ipk&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 LICENSE_FLAGS_WHITELIST +=3D &quot;armcompiler&qu=
ot;<br>
&gt; -=C2=A0 =C2=A0 PACKAGECONFIG_remove_pn-qemu-system-native =3D &quot;g=
tk+ sdl&quot;<br>
&gt; -=C2=A0 =C2=A0 EXTRA_IMAGE_FEATURES_append =3D &quot; debug-tweaks&qu=
ot;<br>
&gt; +=C2=A0 =C2=A0 PACKAGECONFIG:remove:pn-qemu-system-native =3D &quot;g=
tk+ sdl&quot;<br>
&gt; +=C2=A0 =C2=A0 EXTRA_IMAGE_FEATURES:append =3D &quot; debug-tweaks&qu=
ot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 BB_NUMBER_THREADS =3D &quot;16&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 PARALLEL_MAKE =3D &quot;-j16&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 INHERIT +=3D &quot;rm_work&quot;<br>
&gt; -=C2=A0 =C2=A0 PACKAGECONFIG_append_pn-perf =3D &quot; coresight&quot=
;<br>
&gt; +=C2=A0 =C2=A0 PACKAGECONFIG:append:pn-perf =3D &quot; coresight&quot=
;<br>
&gt;=C2=A0 =C2=A0 noptest: |<br>
&gt; -=C2=A0 =C2=A0 DISTRO_FEATURES_remove =3D &quot;ptest&quot;<br>
&gt; +=C2=A0 =C2=A0 DISTRO_FEATURES:remove =3D &quot;ptest&quot;<br>
&gt;<br>
&gt;=C2=A0 machine: unset<br>
&gt;<br>
&gt; diff --git a/ci/gem5-arm64-xen.yml b/ci/gem5-arm64-xen.yml<br>
&gt; index 85763b8..e288244 100644<br>
&gt; --- a/ci/gem5-arm64-xen.yml<br>
&gt; +++ b/ci/gem5-arm64-xen.yml<br>
&gt; @@ -22,7 +22,7 @@ machine: gem5-arm64<br>
&gt;<br>
&gt;=C2=A0 local_conf_header:<br>
&gt;=C2=A0 =C2=A0 meta-virt:<br>
&gt; -=C2=A0 =C2=A0 DISTRO_FEATURES_append =3D &quot; virtualization xen&q=
uot;<br>
&gt; +=C2=A0 =C2=A0 DISTRO_FEATURES:append =3D &quot; virtualization xen&q=
uot;<br>
&gt;<br>
&gt;=C2=A0 target:<br>
&gt;=C2=A0 =C2=A0 - xen-image-minimal<br>
&gt; diff --git a/ci/qemuarmv5.yml b/ci/qemuarmv5.yml<br>
&gt; index aaf7f4f..4081124 100644<br>
&gt; --- a/ci/qemuarmv5.yml<br>
&gt; +++ b/ci/qemuarmv5.yml<br>
&gt; @@ -8,4 +8,4 @@ machine: qemuarmv5<br>
&gt;=C2=A0 local_conf_header:<br>
&gt;=C2=A0 =C2=A0 bugs: |<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Remove parselogs until errors can be resolved<b=
r>
&gt; -=C2=A0 =C2=A0 TEST_SUITES_remove =3D &quot;parselogs&quot;<br>
&gt; +=C2=A0 =C2=A0 TEST_SUITES:remove =3D &quot;parselogs&quot;<br>
&gt; diff --git a/ci/testimage.yml b/ci/testimage.yml<br>
&gt; index 8941ad3..70a08e0 100644<br>
&gt; --- a/ci/testimage.yml<br>
&gt; +++ b/ci/testimage.yml<br>
&gt; @@ -10,7 +10,7 @@ local_conf_header:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 TEST_SERVER_IP =3D &quot;127.0.0.1&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QEMU_USE_SLIRP =3D &quot;1&quot;<br>
&gt;=C2=A0 =C2=A0 packages: |<br>
&gt; -=C2=A0 =C2=A0 IMAGE_FEATURES_append =3D &quot; ssh-server-dropbear&q=
uot;<br>
&gt; +=C2=A0 =C2=A0 IMAGE_FEATURES:append =3D &quot; ssh-server-dropbear&q=
uot;<br>
&gt;<br>
&gt;=C2=A0 # Multiple targets are available, put it down to just one<br>
&gt;=C2=A0 target:<br>
&gt; diff --git a/kas/fvp-baser-aemv8r64-bsp.yml b/kas/fvp-baser-aemv8r64-=
bsp.yml<br>
&gt; index 47aae84..a54bffb 100644<br>
&gt; --- a/kas/fvp-baser-aemv8r64-bsp.yml<br>
&gt; +++ b/kas/fvp-baser-aemv8r64-bsp.yml<br>
&gt; @@ -29,10 +29,10 @@ local_conf_header:<br>
&gt;=C2=A0 =C2=A0 base: |<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CONF_VERSION =3D &quot;1&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 PACKAGE_CLASSES =3D &quot;package_ipk&quot;<br>
&gt; -=C2=A0 =C2=A0 PACKAGECONFIG_remove_pn-qemu-system-native =3D &quot;g=
tk+ sdl&quot;<br>
&gt; -=C2=A0 =C2=A0 EXTRA_IMAGE_FEATURES_append =3D &quot; debug-tweaks&qu=
ot;<br>
&gt; -=C2=A0 =C2=A0 IMAGE_CLASSES_append =3D &quot; ${@oe.utils.ifelse(d.g=
etVar(&#39;FVP_BASE_R_AEM_TARBALL_URI&#39;), &#39;fvpboot&#39;, &#39;&#39;)=
}&quot;<br>
&gt; -=C2=A0 =C2=A0 LICENSE_FLAGS_WHITELIST_append =3D &quot; ${@oe.utils.=
vartrue(&#39;FVP_BASE_R_ARM_EULA_ACCEPT&#39;, &#39;Arm-FVP-EULA&#39;, &#39;=
&#39;, d)}&quot;<br>
&gt; +=C2=A0 =C2=A0 PACKAGECONFIG:remove:pn-qemu-system-native =3D &quot;g=
tk+ sdl&quot;<br>
&gt; +=C2=A0 =C2=A0 EXTRA_IMAGE_FEATURES:append =3D &quot; debug-tweaks&qu=
ot;<br>
&gt; +=C2=A0 =C2=A0 IMAGE_CLASSES:append =3D &quot; ${@oe.utils.ifelse(d.g=
etVar(&#39;FVP_BASE_R_AEM_TARBALL_URI&#39;), &#39;fvpboot&#39;, &#39;&#39;)=
}&quot;<br>
&gt; +=C2=A0 =C2=A0 LICENSE_FLAGS_WHITELIST:append =3D &quot; ${@oe.utils.=
vartrue(&#39;FVP_BASE_R_ARM_EULA_ACCEPT&#39;, &#39;Arm-FVP-EULA&#39;, &#39;=
&#39;, d)}&quot;<br>
&gt;<br>
&gt;=C2=A0 target:<br>
&gt;=C2=A0 =C2=A0 - core-image-minimal<br>
&gt; diff --git a/meta-arm-autonomy/classes/alternate-kernel.bbclass b/met=
a-arm-autonomy/classes/alternate-kernel.bbclass<br>
&gt; index 9ca59e2..b25dfc7 100644<br>
&gt; --- a/meta-arm-autonomy/classes/alternate-kernel.bbclass<br>
&gt; +++ b/meta-arm-autonomy/classes/alternate-kernel.bbclass<br>
&gt; @@ -2,7 +2,7 @@<br>
&gt;=C2=A0 # an alternate kernel (set via PREFERRED_PROVIDER_alternate/ker=
nel).<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # It is mandatory to also set the KERNEL_PACKAGE_NAME for the a=
lternate kernel<br>
&gt; -# recipe via KERNEL_PACKAGE_NAME_pn-${PREFERRED_PROVIDER_alternate/k=
ernel} and<br>
&gt; +# recipe via KERNEL_PACKAGE_NAME:pn-${PREFERRED_PROVIDER_alternate/k=
ernel} and<br>
&gt;=C2=A0 # its value needs to be different from &quot;kernel&quot; since=
 this is the default set<br>
&gt;=C2=A0 # for PREFERRED_PROVIDER_virtual/kernel.<br>
&gt;=C2=A0 #<br>
&gt; @@ -16,11 +16,11 @@ PREFERRED_PROVIDER_alternate/kernel ??=3D &quot;&=
quot;<br>
&gt;=C2=A0 python () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 alternate_kernel =3D d.getVar(&#39;PREFERRED_PROV=
IDER_alternate/kernel&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if alternate_kernel:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 alternate_kernel_pkg_name =3D d.getVar(&=
#39;KERNEL_PACKAGE_NAME_pn-%s&#39; % alternate_kernel)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 alternate_kernel_pkg_name =3D d.getVar(&=
#39;KERNEL_PACKAGE_NAME:pn-%s&#39; % alternate_kernel)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if alternate_kernel_pkg_name:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;EXTR=
A_IMAGEDEPENDS&#39;, &#39; &#39; + alternate_kernel)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;IMAG=
E_INSTALL&#39;, &#39; kernel-modules&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;IMAG=
E_INSTALL&#39;, &#39; &#39; + alternate_kernel_pkg_name + &#39;-modules&#39=
;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipRecipe(=
&quot;No KERNEL_PACKAGE_NAME_pn-%s set&quot; % alternate_kernel )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipRecipe(=
&quot;No KERNEL_PACKAGE_NAME:pn-%s set&quot; % alternate_kernel )<br>
&gt;=C2=A0 }<br>
&gt; diff --git a/meta-arm-autonomy/classes/docker_extern_containers.bbcla=
ss b/meta-arm-autonomy/classes/docker_extern_containers.bbclass<br>
&gt; index 363784a..57ac85f 100644<br>
&gt; --- a/meta-arm-autonomy/classes/docker_extern_containers.bbclass<br>
&gt; +++ b/meta-arm-autonomy/classes/docker_extern_containers.bbclass<br>
&gt; @@ -71,7 +71,7 @@ inherit features_check<br>
&gt;<br>
&gt;=C2=A0 REQUIRED_DISTRO_FEATURES =3D &quot;docker&quot;<br>
&gt;<br>
&gt; -RDEPENDS_${PN} =3D &quot;packagegroup-docker-runtime-minimal&quot;<b=
r>
&gt; +RDEPENDS:${PN} =3D &quot;packagegroup-docker-runtime-minimal&quot;<b=
r>
&gt;<br>
&gt;=C2=A0 CONTAINER_IMAGE_FILES ??=3D &quot;&quot;<br>
&gt;=C2=A0 CONTAINERS_INSTALL_DIR ??=3D &quot;${datadir}/docker/images&quo=
t;<br>
&gt; @@ -112,4 +112,4 @@ do_install() {<br>
&gt;<br>
&gt;=C2=A0 do_install[vardeps] +=3D &quot;CONTAINER_IMAGE_FILES&quot;<br>
&gt;<br>
&gt; -FILES_${PN} +=3D &quot;${CONTAINERS_INSTALL_DIR}&quot;<br>
&gt; +FILES:${PN} +=3D &quot;${CONTAINERS_INSTALL_DIR}&quot;<br>
&gt; diff --git a/meta-arm-autonomy/classes/kernel-xenguest.bbclass b/meta=
-arm-autonomy/classes/kernel-xenguest.bbclass<br>
&gt; index 085fd56..59eb9d7 100644<br>
&gt; --- a/meta-arm-autonomy/classes/kernel-xenguest.bbclass<br>
&gt; +++ b/meta-arm-autonomy/classes/kernel-xenguest.bbclass<br>
&gt; @@ -29,7 +29,7 @@ do_assemble_xenguest_initramfs() {<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 do_assemble_xenguest_initramfs[depends] +=3D &quot;${INITRAMFS_=
IMAGE}:do_merge_xenguestenv&quot;<br>
&gt;<br>
&gt; -kernel_do_deploy_append() {<br>
&gt; +kernel_do_deploy:append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if [ -f &quot;${B}/${KERNEL_OUTPUT_DIR}/Image-ini=
tramfs.xenguest&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${B}/${KERNEL_OUTPU=
T_DIR}/Image-initramfs.xenguest &quot;$deployDir/Image-${INITRAMFS_NAME}.xe=
nguest&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -snf Image-${INITRAMFS_NAME}.xen=
guest $deployDir/Image-${INITRAMFS_LINK_NAME}.xenguest<br>
&gt; diff --git a/meta-arm-autonomy/classes/xenguest_image_extra.bbclass b=
/meta-arm-autonomy/classes/xenguest_image_extra.bbclass<br>
&gt; index 3123f49..a2c2dcf 100644<br>
&gt; --- a/meta-arm-autonomy/classes/xenguest_image_extra.bbclass<br>
&gt; +++ b/meta-arm-autonomy/classes/xenguest_image_extra.bbclass<br>
&gt; @@ -48,7 +48,7 @@ XENGUEST_IMAGE_VARS_EXTRA +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0XENGUEST_EXTRA_INIT_PRE XENGUEST_EXTRA_INIT XENGUEST_EXTR=
A_INIT_POST \<br>
&gt;=C2=A0 =C2=A0XENGUEST_EXTRA_FILES XENGUEST_EXTRA_DISK_FILES&quot;<br>
&gt;<br>
&gt; -do_deploy_append() {<br>
&gt; +do_deploy:append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if [ -z &quot;${XENGUEST_IMAGE_DEPLOY_DIR}&quot; =
-o \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -z &quot;${XENGUEST_IMAGE_DEPLOY_SU=
BDIR}&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 die &quot;Configuration error: XENG=
UEST_IMAGE_DEPLOY_DIR or XENGUEST_IMAGE_DEPLOY_SUBDIR is empty&quot;<br>
&gt; diff --git a/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest=
.inc b/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc<br>
&gt; index 8ef0a94..6ffcdb5 100644<br>
&gt; --- a/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc<br=
>
&gt; +++ b/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc<br=
>
&gt; @@ -1,7 +1,7 @@<br>
&gt;=C2=A0 # This files is added when DISTRO_FEATURES contains arm-autonom=
y-guest<br>
&gt;<br>
&gt;=C2=A0 # We need to have ipv4 activated<br>
&gt; -DISTRO_FEATURES_append =3D &quot; ipv4&quot;<br>
&gt; +DISTRO_FEATURES:append =3D &quot; ipv4&quot;<br>
&gt;<br>
&gt;=C2=A0 # Build a xenguest type image<br>
&gt;=C2=A0 IMAGE_CLASSES +=3D &quot;image_types_xenguest&quot;<br>
&gt; @@ -10,6 +10,6 @@ IMAGE_FSTYPES +=3D &quot;xenguest&quot;<br>
&gt;=C2=A0 # xenguest kernel extension to handle initramfs<br>
&gt;=C2=A0 KERNEL_CLASSES +=3D &quot;kernel-xenguest&quot;<br>
&gt;<br>
&gt; -IMAGE_INSTALL_append =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEAT=
URES&#39;, &#39;docker&#39;, \<br>
&gt; +IMAGE_INSTALL:append =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEAT=
URES&#39;, &#39;docker&#39;, \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 &#39; packagegroup-docker-runtime-minimal&#39;, \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 &#39;&#39;, d)}&quot;<br>
&gt; diff --git a/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.=
inc b/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc<br>
&gt; index d2aaabf..8c14a1f 100644<br>
&gt; --- a/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc<br>
&gt; +++ b/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc<br>
&gt; @@ -3,13 +3,13 @@<br>
&gt;=C2=A0 ARM_AUTONOMY_HOST_OVERRIDES =3D &quot;:autonomy-host&quot;<br>
&gt;<br>
&gt;=C2=A0 # We need to have xen and ipv4 activated<br>
&gt; -DISTRO_FEATURES_append =3D &quot; xen ipv4&quot;<br>
&gt; -DISTRO_FEATURES_NATIVE_append =3D &quot; arm-autonomy-host&quot;<br>
&gt; +DISTRO_FEATURES:append =3D &quot; xen ipv4&quot;<br>
&gt; +DISTRO_FEATURES_NATIVE:append =3D &quot; arm-autonomy-host&quot;<br>
&gt;<br>
&gt;=C2=A0 # Don&#39;t include kernels in standard images when building ar=
m-autonomy-host<br>
&gt;=C2=A0 # If the kernel image is needed in the rootfs the following sho=
uld be set from<br>
&gt; -# a bbappend: RDEPENDS_${KERNEL_PACKAGE_NAME}-base =3D &quot;${KERNE=
L_PACKAGE_NAME}-image&quot;<br>
&gt; -RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?=3D &quot;&quot;<br>
&gt; +# a bbappend: RDEPENDS:${KERNEL_PACKAGE_NAME}-base =3D &quot;${KERNE=
L_PACKAGE_NAME}-image&quot;<br>
&gt; +RDEPENDS:${KERNEL_PACKAGE_NAME}-base ?=3D &quot;&quot;<br>
&gt;<br>
&gt;=C2=A0 # Require extra machine specific settings from meta-arm-bsp dyn=
amic-layers only<br>
&gt;=C2=A0 # if meta-arm-bsp is in the bblayers.conf<br>
&gt; diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-autonomy/co=
nf/layer.conf<br>
&gt; index 98db8f8..d73f10f 100644<br>
&gt; --- a/meta-arm-autonomy/conf/layer.conf<br>
&gt; +++ b/meta-arm-autonomy/conf/layer.conf<br>
&gt; @@ -29,7 +29,7 @@ ARM_AUTONOMY_LAYERDIR :=3D &quot;${LAYERDIR}&quot;<=
br>
&gt;=C2=A0 ARM_AUTONOMY_DISTRO_CFGDIR =3D &quot;${ARM_AUTONOMY_LAYERDIR}/c=
onf/distro/include/&quot;<br>
&gt;<br>
&gt;=C2=A0 # Add class to handle arm-autonomy distro extensions<br>
&gt; -USER_CLASSES_append =3D &quot; arm-autonomy-features&quot;<br>
&gt; +USER_CLASSES:append =3D &quot; arm-autonomy-features&quot;<br>
&gt;<br>
&gt;=C2=A0 BBFILES_DYNAMIC +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 meta-arm-bsp:${LAYERDIR}/dynamic-layers/meta-arm-=
bsp/*/*/*.bbappend \<br>
&gt; diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machi=
ne/fvp-base-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-=
bsp/conf/machine/fvp-base-extra-settings.inc<br>
&gt; index 477d6d2..54544ed 100644<br>
&gt; --- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-=
base-extra-settings.inc<br>
&gt; +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-=
base-extra-settings.inc<br>
&gt; @@ -6,7 +6,7 @@ XENGUEST_MANAGER_VOLUME_DEVICE ?=3D &quot;/dev/vda2&q=
uot;<br>
&gt;<br>
&gt;=C2=A0 # We need to extend the wks search path to be able to find the =
wks file set in<br>
&gt;=C2=A0 # ARM_AUTONOMY_WKS_FILE.<br>
&gt; -WKS_SEARCH_PATH_prepend :=3D &quot;${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DI=
R}/wic:&quot;<br>
&gt; +WKS_SEARCH_PATH:prepend :=3D &quot;${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DI=
R}/wic:&quot;<br>
&gt;<br>
&gt;=C2=A0 ARM_AUTONOMY_WKS_FILE ?=3D &quot;<a href=3D"http://arm-autonomy=
-fvp-base-disk.wks.in" rel=3D"noreferrer" target=3D"_blank">arm-autonomy-fv=
p-base-disk.wks.in</a>&quot;<br>
&gt;=C2=A0 # set wks file only if INITRAMFS_IMAGE_BUNDLE is not set<br>
&gt; diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machi=
ne/juno-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/=
conf/machine/juno-extra-settings.inc<br>
&gt; index f8a16f4..6255c98 100644<br>
&gt; --- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno=
-extra-settings.inc<br>
&gt; +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno=
-extra-settings.inc<br>
&gt; @@ -7,7 +7,7 @@ XEN_DEVICETREE_DOM0_SIZE ?=3D &quot;0x02400000&quot;<=
br>
&gt;<br>
&gt;=C2=A0 # We need to extend the wks search path to be able to find the =
wks file set in<br>
&gt;=C2=A0 # ARM_AUTONOMY_WKS_FILE.<br>
&gt; -WKS_SEARCH_PATH_prepend :=3D &quot;${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DI=
R}/wic:&quot;<br>
&gt; +WKS_SEARCH_PATH:prepend :=3D &quot;${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DI=
R}/wic:&quot;<br>
&gt;<br>
&gt;=C2=A0 ARM_AUTONOMY_WKS_FILE ?=3D &quot;<a href=3D"http://arm-autonomy=
-juno-disk.wks.in" rel=3D"noreferrer" target=3D"_blank">arm-autonomy-juno-d=
isk.wks.in</a>&quot;<br>
&gt;=C2=A0 # set wks file only if INITRAMFS_IMAGE_BUNDLE is not set<br>
&gt; diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machi=
ne/n1sdp-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp=
/conf/machine/n1sdp-extra-settings.inc<br>
&gt; index 0bd150b..394d1b8 100644<br>
&gt; --- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sd=
p-extra-settings.inc<br>
&gt; +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sd=
p-extra-settings.inc<br>
&gt; @@ -2,7 +2,7 @@<br>
&gt;<br>
&gt;=C2=A0 # We need to extent the wks search path to be able to find the =
wks file set in<br>
&gt;=C2=A0 # ARM_AUTONOMY_WKS_FILE.<br>
&gt; -WKS_SEARCH_PATH_prepend :=3D &quot;${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DI=
R}/wic:&quot;<br>
&gt; +WKS_SEARCH_PATH:prepend :=3D &quot;${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DI=
R}/wic:&quot;<br>
&gt;<br>
&gt;=C2=A0 ARM_AUTONOMY_WKS_FILE ?=3D &quot;<a href=3D"http://arm-autonomy=
-n1sdp-efidisk.wks.in" rel=3D"noreferrer" target=3D"_blank">arm-autonomy-n1=
sdp-efidisk.wks.in</a>&quot;<br>
&gt;=C2=A0 WKS_FILE =3D &quot;${ARM_AUTONOMY_WKS_FILE}&quot;<br>
&gt; @@ -58,7 +58,7 @@ ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#3=
9;alternate-kernel&#39;, \<br>
&gt;=C2=A0 KERNEL_PACKAGE_NAME_alternate/kernel ?=3D &quot;kernel-rt&quot;=
<br>
&gt;=C2=A0 # When alternate-kernel DISTRO_FEATURE is present we set the ke=
rnel-rt by<br>
&gt;=C2=A0 # default<br>
&gt; -KERNEL_PACKAGE_NAME_pn-linux-yocto-rt =3D &quot;\<br>
&gt; +KERNEL_PACKAGE_NAME:pn-linux-yocto-rt =3D &quot;\<br>
&gt;=C2=A0 ${@ d.getVar(&#39;KERNEL_PACKAGE_NAME_alternate/kernel&#39;) \<=
br>
&gt;=C2=A0 if bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;alternate-=
kernel&#39;, True, False, d) \<br>
&gt;=C2=A0 else &#39;kernel&#39; }&quot;<br>
&gt; @@ -87,4 +87,4 @@ d.getVar(&#39;PREFERRED_PROVIDER_alternate/kernel&#=
39;) else &#39;&#39;}&quot;<br>
&gt;<br>
&gt;=C2=A0 # Additionnal kernel modules are necessary for n1sdp to be able=
 to mount FAT<br>
&gt;=C2=A0 # filesystems using CP437.<br>
&gt; -MACHINE_ESSENTIAL_EXTRA_RDEPENDS_append =3D &quot; kernel-module-nls=
-cp437 kernel-module-nls-iso8859-1&quot;<br>
&gt; +MACHINE_ESSENTIAL_EXTRA_RDEPENDS:append =3D &quot; kernel-module-nls=
-cp437 kernel-module-nls-iso8859-1&quot;<br>
&gt; diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bs=
p/images/firmware-image-juno.bbappend b/meta-arm-autonomy/dynamic-layers/me=
ta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend<br>
&gt; index 6e75af2..8013a8f 100644<br>
&gt; --- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/image=
s/firmware-image-juno.bbappend<br>
&gt; +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/image=
s/firmware-image-juno.bbappend<br>
&gt; @@ -1,14 +1,14 @@<br>
&gt;=C2=A0 # Use OVERRIDES to minimize the usage of<br>
&gt;=C2=A0 # ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;autonomy=
-host&#39;, ...<br>
&gt; -OVERRIDES_append =3D &quot;${ARM_AUTONOMY_HOST_OVERRIDES}&quot;<br>
&gt; +OVERRIDES:append =3D &quot;${ARM_AUTONOMY_HOST_OVERRIDES}&quot;<br>
&gt;<br>
&gt; -FILESEXTRAPATHS_prepend_autonomy-host :=3D &quot;${THISDIR}/${PN}:&q=
uot;<br>
&gt; +FILESEXTRAPATHS:prepend_autonomy-host :=3D &quot;${THISDIR}/${PN}:&q=
uot;<br>
&gt;<br>
&gt; -DEPENDS_append_autonomy-host =3D &quot; dos2unix-native&quot;<br>
&gt; +DEPENDS:append_autonomy-host =3D &quot; dos2unix-native&quot;<br>
&gt;<br>
&gt; -SRC_URI_append_autonomy-host =3D &quot; file://add-xen-support.patch=
;patchdir=3D../&quot;<br>
&gt; +SRC_URI:append_autonomy-host =3D &quot; file://add-xen-support.patch=
;patchdir=3D../&quot;<br>
&gt;<br>
&gt; -do_install_append_autonomy-host() {<br>
&gt; +do_install:append_autonomy-host() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mv -v ${D}/${UNPACK_DIR}/SOFTWARE/uEnv.txt \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}/${UNPACK_DIR}/SOFTWARE/=
uenvfile<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for dir in $(ls ${D}/${UNPACK_DIR}/SITE1/)<br>
&gt; @@ -22,7 +22,7 @@ DEPLOY_EXTRA_DEPS_autonomy-host =3D &quot;xen:do_de=
ploy xen-devicetree:do_deploy&quot;<br>
&gt;<br>
&gt;=C2=A0 do_deploy[depends] +=3D &quot;${DEPLOY_EXTRA_DEPS}&quot;<br>
&gt;<br>
&gt; -do_deploy_prepend_autonomy-host() {<br>
&gt; +do_deploy:prepend_autonomy-host() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # To avoid dependency loop between firmware-image=
-juno:do_install,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # xen:do_deploy and xen-devicetree:do_deploy when=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # INITRAMFS_IMAGE_BUNDLE =3D &quot;1&quot;, we ne=
ed to handle the xen and<br>
&gt; diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bs=
p/u-boot/u-boot_%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/=
recipes-bsp/u-boot/u-boot_%.bbappend<br>
&gt; index 10cd0d6..67449e9 100644<br>
&gt; --- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/u-boo=
t/u-boot_%.bbappend<br>
&gt; +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/u-boo=
t/u-boot_%.bbappend<br>
&gt; @@ -1,10 +1,10 @@<br>
&gt;=C2=A0 # Use OVERRIDES to minimize the usage of<br>
&gt;=C2=A0 # ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;autonomy=
-host&#39;, ...<br>
&gt; -OVERRIDES_append =3D &quot;${ARM_AUTONOMY_HOST_OVERRIDES}&quot;<br>
&gt; +OVERRIDES:append =3D &quot;${ARM_AUTONOMY_HOST_OVERRIDES}&quot;<br>
&gt;<br>
&gt; -FILESEXTRAPATHS_prepend_autonomy-host_fvp-base :=3D &quot;${THISDIR}=
/${PN}:&quot;<br>
&gt; +FILESEXTRAPATHS:prepend_autonomy-host_fvp-base :=3D &quot;${THISDIR}=
/${PN}:&quot;<br>
&gt;<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # FVP BASE<br>
&gt;=C2=A0 #<br>
&gt; -SRC_URI_append_autonomy-host_fvp-base =3D &quot; file://xen_u-boot_k=
ernel_addr.patch&quot;<br>
&gt; +SRC_URI:append_autonomy-host_fvp-base =3D &quot; file://xen_u-boot_k=
ernel_addr.patch&quot;<br>
&gt; diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-ex=
tended/xen-devicetree/xen-devicetree.bbappend b/meta-arm-autonomy/dynamic-l=
ayers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend<=
br>
&gt; index af632e2..499e16c 100644<br>
&gt; --- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/=
xen-devicetree/xen-devicetree.bbappend<br>
&gt; +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/=
xen-devicetree/xen-devicetree.bbappend<br>
&gt; @@ -1,23 +1,23 @@<br>
&gt;=C2=A0 # Platform dependent parameters<br>
&gt;<br>
&gt; -FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/files:&quot;<br>
&gt; +FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/files:&quot;<br>
&gt;<br>
&gt;=C2=A0 # Add a dtb snippet to turn off iommu in dom0 on Juno board<br>
&gt; -SRC_URI_append_juno =3D &quot; file://xen-juno.dtsi&quot;<br>
&gt; -XEN_DEVICETREE_DTSI_MERGE_append_juno =3D &quot; xen-juno.dtsi&quot;=
<br>
&gt; +SRC_URI:append_juno =3D &quot; file://xen-juno.dtsi&quot;<br>
&gt; +XEN_DEVICETREE_DTSI_MERGE:append_juno =3D &quot; xen-juno.dtsi&quot;=
<br>
&gt;<br>
&gt;=C2=A0 # Add a dtb snippet to remove pmu and iommu in dom0 on N1SDP<br=
>
&gt; -SRC_URI_append_n1sdp =3D &quot; file://xen-n1sdp.dtsi&quot;<br>
&gt; -XEN_DEVICETREE_DTSI_MERGE_append_n1sdp =3D &quot; xen-n1sdp.dtsi&quo=
t;<br>
&gt; +SRC_URI:append_n1sdp =3D &quot; file://xen-n1sdp.dtsi&quot;<br>
&gt; +XEN_DEVICETREE_DTSI_MERGE:append_n1sdp =3D &quot; xen-n1sdp.dtsi&quo=
t;<br>
&gt;=C2=A0 # For N1SDP, the XEN_DEVICETREE_DEPEND and XEN_DEVICETREE_DTBS =
variables are<br>
&gt;=C2=A0 # being set in meta-arm-autonomy/dynamic-layers/meta-arm-bsp/co=
nf/machine/n1sdp-extra-settings.inc<br>
&gt;<br>
&gt;=C2=A0 # Board specific configs<br>
&gt; -XEN_DEVICETREE_DOM0_BOOTARGS_append_juno =3D &quot; root=3D/dev/sda1=
 rootwait&quot;<br>
&gt; -XEN_DEVICETREE_XEN_BOOTARGS_append_juno =3D &quot; console=3Ddtuart =
dtuart=3Dserial0 bootscrub=3D0 iommu=3Dno&quot;<br>
&gt; +XEN_DEVICETREE_DOM0_BOOTARGS:append_juno =3D &quot; root=3D/dev/sda1=
 rootwait&quot;<br>
&gt; +XEN_DEVICETREE_XEN_BOOTARGS:append_juno =3D &quot; console=3Ddtuart =
dtuart=3Dserial0 bootscrub=3D0 iommu=3Dno&quot;<br>
&gt;<br>
&gt; -XEN_DEVICETREE_DOM0_BOOTARGS_append_n1sdp =3D &quot; root=3D/dev/sda=
2 rootwait&quot;<br>
&gt; -XEN_DEVICETREE_XEN_BOOTARGS_append_n1sdp =3D &quot; console=3Ddtuart=
 dtuart=3Dserial0 bootscrub=3D0 iommu=3Dno&quot;<br>
&gt; +XEN_DEVICETREE_DOM0_BOOTARGS:append_n1sdp =3D &quot; root=3D/dev/sda=
2 rootwait&quot;<br>
&gt; +XEN_DEVICETREE_XEN_BOOTARGS:append_n1sdp =3D &quot; console=3Ddtuart=
 dtuart=3Dserial0 bootscrub=3D0 iommu=3Dno&quot;<br>
&gt;<br>
&gt; -XEN_DEVICETREE_DOM0_BOOTARGS_append_fvp-base =3D &quot; root=3D/dev/=
vda1&quot;<br>
&gt; -XEN_DEVICETREE_XEN_BOOTARGS_append_fvp-base =3D &quot; console=3Ddtu=
art dtuart=3Dserial0 bootscrub=3D0&quot;<br>
&gt; +XEN_DEVICETREE_DOM0_BOOTARGS:append_fvp-base =3D &quot; root=3D/dev/=
vda1&quot;<br>
&gt; +XEN_DEVICETREE_XEN_BOOTARGS:append_fvp-base =3D &quot; console=3Ddtu=
art dtuart=3Dserial0 bootscrub=3D0&quot;<br>
&gt; diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-ex=
tended/xen/xen_%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/r=
ecipes-extended/xen/xen_%.bbappend<br>
&gt; index ef3cc23..f098b4f 100644<br>
&gt; --- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/=
xen/xen_%.bbappend<br>
&gt; +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/=
xen/xen_%.bbappend<br>
&gt; @@ -1,15 +1,15 @@<br>
&gt;=C2=A0 # FVP Base support<br>
&gt;=C2=A0 COMPATIBLE_MACHINE_fvp-base =3D &quot;fvp-base&quot;<br>
&gt; -FILESEXTRAPATHS_prepend_fvp-base :=3D &quot;${THISDIR}/files:&quot;<=
br>
&gt; -SRC_URI_append_fvp-base =3D &quot; file://early-printk.cfg&quot;<br>
&gt; +FILESEXTRAPATHS:prepend_fvp-base :=3D &quot;${THISDIR}/files:&quot;<=
br>
&gt; +SRC_URI:append_fvp-base =3D &quot; file://early-printk.cfg&quot;<br>
&gt;<br>
&gt;=C2=A0 # Juno support<br>
&gt;=C2=A0 COMPATIBLE_MACHINE_juno =3D &quot;juno&quot;<br>
&gt; -FILESEXTRAPATHS_prepend_juno :=3D &quot;${THISDIR}/files:&quot;<br>
&gt; -SRC_URI_append_juno =3D &quot; file://early-printk.cfg&quot;<br>
&gt; +FILESEXTRAPATHS:prepend_juno :=3D &quot;${THISDIR}/files:&quot;<br>
&gt; +SRC_URI:append_juno =3D &quot; file://early-printk.cfg&quot;<br>
&gt;<br>
&gt;=C2=A0 # N1SDP support<br>
&gt;=C2=A0 COMPATIBLE_MACHINE_n1sdp =3D &quot;n1sdp&quot;<br>
&gt; -FILESEXTRAPATHS_prepend_n1sdp :=3D &quot;${THISDIR}/files:&quot;<br>
&gt; -SRC_URI_append_n1sdp =3D &quot; file://n1sdp.cfg \<br>
&gt; +FILESEXTRAPATHS:prepend_n1sdp :=3D &quot;${THISDIR}/files:&quot;<br>
&gt; +SRC_URI:append_n1sdp =3D &quot; file://n1sdp.cfg \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0file://early-printk.cfg&quot;<br>
&gt; diff --git a/meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend b=
/meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend<br>
&gt; index e88edfd..18a1855 100644<br>
&gt; --- a/meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend<br>
&gt; +++ b/meta-arm-autonomy/recipes-bsp/grub/grub-efi_%.bbappend<br>
&gt; @@ -1,3 +1,3 @@<br>
&gt; -OVERRIDES_append =3D &quot;${ARM_AUTONOMY_HOST_OVERRIDES}&quot;<br>
&gt; +OVERRIDES:append =3D &quot;${ARM_AUTONOMY_HOST_OVERRIDES}&quot;<br>
&gt;<br>
&gt; -GRUB_BUILDIN_append_autonomy-host =3D &quot; xen_boot&quot;<br>
&gt; +GRUB_BUILDIN:append_autonomy-host =3D &quot; xen_boot&quot;<br>
&gt; diff --git a/meta-arm-autonomy/recipes-containers/import-docker-conta=
iners/<a href=3D"http://import-docker-containers.bb" rel=3D"noreferrer" tar=
get=3D"_blank">import-docker-containers.bb</a> b/meta-arm-autonomy/recipes-=
containers/import-docker-containers/<a href=3D"http://import-docker-contain=
ers.bb" rel=3D"noreferrer" target=3D"_blank">import-docker-containers.bb</a=
><br>
&gt; index 3fea508..04115f7 100644<br>
&gt; --- a/meta-arm-autonomy/recipes-containers/import-docker-containers/<=
a href=3D"http://import-docker-containers.bb" rel=3D"noreferrer" target=3D"=
_blank">import-docker-containers.bb</a><br>
&gt; +++ b/meta-arm-autonomy/recipes-containers/import-docker-containers/<=
a href=3D"http://import-docker-containers.bb" rel=3D"noreferrer" target=3D"=
_blank">import-docker-containers.bb</a><br>
&gt; @@ -25,7 +25,7 @@ INITSCRIPT_PARAMS =3D &quot;start 30 2 3 4 5 .&quot=
;<br>
&gt;=C2=A0 INITSCRIPT_NAME =3D &quot;import_containers.sh&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}&quot;<br>
&gt; -do_install_append() {<br>
&gt; +do_install:append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -d ${D}${sysconfdir}/init.d<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -m 755 import_containers.sh ${D}${sysconf=
dir}/init.d<br>
&gt;<br>
&gt; diff --git a/meta-arm-autonomy/recipes-containers/packagegroups/<a hr=
ef=3D"http://packagegroup-docker-runtime-minimal.bb" rel=3D"noreferrer" tar=
get=3D"_blank">packagegroup-docker-runtime-minimal.bb</a> b/meta-arm-autono=
my/recipes-containers/packagegroups/<a href=3D"http://packagegroup-docker-r=
untime-minimal.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-docker=
-runtime-minimal.bb</a><br>
&gt; index 2cbff9c..f78cc9f 100644<br>
&gt; --- a/meta-arm-autonomy/recipes-containers/packagegroups/<a href=3D"h=
ttp://packagegroup-docker-runtime-minimal.bb" rel=3D"noreferrer" target=3D"=
_blank">packagegroup-docker-runtime-minimal.bb</a><br>
&gt; +++ b/meta-arm-autonomy/recipes-containers/packagegroups/<a href=3D"h=
ttp://packagegroup-docker-runtime-minimal.bb" rel=3D"noreferrer" target=3D"=
_blank">packagegroup-docker-runtime-minimal.bb</a><br>
&gt; @@ -8,7 +8,7 @@ DESCRIPTION =3D &quot;The minimal set of packages req=
uired for running Docker&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit packagegroup<br>
&gt;<br>
&gt; -RDEPENDS_${PN} =3D &quot;\<br>
&gt; +RDEPENDS:${PN} =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 docker-ce \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 docker-ce-contrib \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 kernel-module-xt-nat \<br>
&gt; diff --git a/meta-arm-autonomy/recipes-core/busybox/busybox_%.bbappen=
d b/meta-arm-autonomy/recipes-core/busybox/busybox_%.bbappend<br>
&gt; index 36c4569..f834778 100644<br>
&gt; --- a/meta-arm-autonomy/recipes-core/busybox/busybox_%.bbappend<br>
&gt; +++ b/meta-arm-autonomy/recipes-core/busybox/busybox_%.bbappend<br>
&gt; @@ -1,8 +1,8 @@<br>
&gt;=C2=A0 # Use OVERRIDES to minimize the usage of<br>
&gt;=C2=A0 # ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;arm-auto=
nomy-host&#39;, ...<br>
&gt; -OVERRIDES_append =3D &quot;${ARM_AUTONOMY_HOST_OVERRIDES}&quot;<br>
&gt; +OVERRIDES:append =3D &quot;${ARM_AUTONOMY_HOST_OVERRIDES}&quot;<br>
&gt;<br>
&gt; -FILESEXTRAPATHS_prepend_autonomy-host :=3D &quot;${THISDIR}/${PN}:&q=
uot;<br>
&gt; +FILESEXTRAPATHS:prepend_autonomy-host :=3D &quot;${THISDIR}/${PN}:&q=
uot;<br>
&gt;<br>
&gt;=C2=A0 # The --exclude flag in Busybox tar is required by xenguest-mki=
mage<br>
&gt; -SRC_URI_append_autonomy-host =3D &quot; file://feature_tar_long_opti=
ons.cfg&quot;<br>
&gt; +SRC_URI:append_autonomy-host =3D &quot; file://feature_tar_long_opti=
ons.cfg&quot;<br>
&gt; diff --git a/meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdo=
wn_1.0.bbappend b/meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdow=
n_1.0.bbappend<br>
&gt; index a4edd05..621cc8e 100644<br>
&gt; --- a/meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.=
bbappend<br>
&gt; +++ b/meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.=
bbappend<br>
&gt; @@ -3,9 +3,9 @@<br>
&gt;=C2=A0 # configuration by adding network network interface configurati=
on file under<br>
&gt;=C2=A0 # interfaces.d directory.<br>
&gt;<br>
&gt; -OVERRIDES_append =3D &quot;${ARM_AUTONOMY_HOST_OVERRIDES}&quot;<br>
&gt; +OVERRIDES:append =3D &quot;${ARM_AUTONOMY_HOST_OVERRIDES}&quot;<br>
&gt;<br>
&gt; -do_install_append_autonomy-host() {<br>
&gt; +do_install:append_autonomy-host() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Add scan of interfaces.d to interfaces file<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cp -f ${WORKDIR}/interfaces ${WORKDIR}/interfaces=
.subdir<br>
&gt;=C2=A0 =C2=A0 =C2=A0 echo &quot;source-directory ${sysconfdir}/network=
/interfaces.d/&quot; \<br>
&gt; diff --git a/meta-arm-autonomy/recipes-devtools/qemu/qemu-autonomy-ho=
st.inc b/meta-arm-autonomy/recipes-devtools/qemu/qemu-autonomy-host.inc<br>
&gt; index 085f952..20573cb 100644<br>
&gt; --- a/meta-arm-autonomy/recipes-devtools/qemu/qemu-autonomy-host.inc<=
br>
&gt; +++ b/meta-arm-autonomy/recipes-devtools/qemu/qemu-autonomy-host.inc<=
br>
&gt; @@ -2,7 +2,7 @@<br>
&gt;=C2=A0 QEMU_TARGETS =3D &quot;i386&quot;<br>
&gt;<br>
&gt;=C2=A0 PACKAGECONFIG[noaudio] =3D &quot;--audio-drv-list=3D&#39;&#39;,=
,&quot;<br>
&gt; -PACKAGECONFIG_append =3D &quot; noaudio&quot;<br>
&gt; -PACKAGECONFIG_remove =3D &quot;fdt sdl kvm&quot;<br>
&gt; +PACKAGECONFIG:append =3D &quot; noaudio&quot;<br>
&gt; +PACKAGECONFIG:remove =3D &quot;fdt sdl kvm&quot;<br>
&gt;<br>
&gt;=C2=A0 require recipes-devtools/qemu/qemu-package-split.inc<br>
&gt; diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/<a hre=
f=3D"http://xen-devicetree.bb" rel=3D"noreferrer" target=3D"_blank">xen-dev=
icetree.bb</a> b/meta-arm-autonomy/recipes-extended/xen-devicetree/<a href=
=3D"http://xen-devicetree.bb" rel=3D"noreferrer" target=3D"_blank">xen-dev=
icetree.bb</a><br>
&gt; index 61fb624..223e237 100644<br>
&gt; --- a/meta-arm-autonomy/recipes-extended/xen-devicetree/<a href=3D"ht=
tp://xen-devicetree.bb" rel=3D"noreferrer" target=3D"_blank">xen-devicetree=
.bb</a><br>
&gt; +++ b/meta-arm-autonomy/recipes-extended/xen-devicetree/<a href=3D"ht=
tp://xen-devicetree.bb" rel=3D"noreferrer" target=3D"_blank">xen-devicetree=
.bb</a><br>
&gt; @@ -16,7 +16,7 @@ DESCRIPTION =3D &quot;Add entries in DTB for Xen an=
d Dom0&quot;<br>
&gt;=C2=A0 # customizable parameters<br>
&gt;=C2=A0 # kernel size is passed to xen via xen.dtb so we need to add<br=
>
&gt;=C2=A0 # &#39;virtual/kernel:do_deploy&#39; as a dependency<br>
&gt; -XEN_DEVICETREE_DEPEND_append =3D &quot; virtual/kernel:do_deploy&quo=
t;<br>
&gt; +XEN_DEVICETREE_DEPEND:append =3D &quot; virtual/kernel:do_deploy&quo=
t;<br>
&gt;=C2=A0 XEN_DEVICETREE_DTBS ?=3D &quot;${KERNEL_DEVICETREE}&quot;<br>
&gt;=C2=A0 XEN_DEVICETREE_XEN_BOOTARGS ?=3D &quot;noreboot dom0_mem=3D${XE=
N_DEVICETREE_DOM0_MEM}&quot;<br>
&gt;=C2=A0 XEN_DEVICETREE_DOM0_MEM ?=3D &quot;1024M,max:1024M&quot;<br>
&gt; diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbapp=
end b/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend<br>
&gt; index f2284b0..d1f5610 100644<br>
&gt; --- a/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend<br>
&gt; +++ b/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -PACKAGECONFIG_remove =3D &quot;\<br>
&gt; +PACKAGECONFIG:remove =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;arm-autonomy-host&#39;, \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;sdl&#39;, &#39;&#39;, d)}&quot;<br>
&gt; diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-tools_4.14.bb=
append b/meta-arm-autonomy/recipes-extended/xen/xen-tools_4.14.bbappend<br>
&gt; index 21192c3..4b8dc05 100644<br>
&gt; --- a/meta-arm-autonomy/recipes-extended/xen/xen-tools_4.14.bbappend<=
br>
&gt; +++ b/meta-arm-autonomy/recipes-extended/xen/xen-tools_4.14.bbappend<=
br>
&gt; @@ -1,7 +1,7 @@<br>
&gt;=C2=A0 # Use OVERRIDES to minimize the usage of<br>
&gt;=C2=A0 # ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;arm-auto=
nomy-host&#39;, ...<br>
&gt; -OVERRIDES_append =3D &quot;${ARM_AUTONOMY_HOST_OVERRIDES}&quot;<br>
&gt; +OVERRIDES:append =3D &quot;${ARM_AUTONOMY_HOST_OVERRIDES}&quot;<br>
&gt;<br>
&gt; -FILESEXTRAPATHS_prepend_autonomy-host :=3D &quot;${THISDIR}/${PN}-4.=
14:&quot;<br>
&gt; +FILESEXTRAPATHS:prepend_autonomy-host :=3D &quot;${THISDIR}/${PN}-4.=
14:&quot;<br>
&gt;<br>
&gt; -SRC_URI_append_autonomy-host =3D &quot; file://0001-vif-nat-fix-host=
name.patch&quot;<br>
&gt; +SRC_URI:append_autonomy-host =3D &quot; file://0001-vif-nat-fix-host=
name.patch&quot;<br>
&gt; diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend b/=
meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend<br>
&gt; index 4871ef8..1fe8313 100644<br>
&gt; --- a/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend<br>
&gt; +++ b/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend<br>
&gt; @@ -1,10 +1,10 @@<br>
&gt;=C2=A0 # Use OVERRIDES to minimize the usage of<br>
&gt;=C2=A0 # ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;arm-auto=
nomy-host&#39;, ...<br>
&gt; -OVERRIDES_append =3D &quot;${ARM_AUTONOMY_HOST_OVERRIDES}&quot;<br>
&gt; +OVERRIDES:append =3D &quot;${ARM_AUTONOMY_HOST_OVERRIDES}&quot;<br>
&gt;<br>
&gt;=C2=A0 # Make Xen machine specific<br>
&gt;=C2=A0 # This ensures that sstate is properly handled and that each ma=
chine can have<br>
&gt;=C2=A0 # its own configuration<br>
&gt;=C2=A0 PACKAGE_ARCH_autonomy-host =3D &quot;${MACHINE_ARCH}&quot;<br>
&gt;<br>
&gt; -PACKAGECONFIG_remove_autonomy-host =3D &quot;sdl&quot;<br>
&gt; +PACKAGECONFIG:remove_autonomy-host =3D &quot;sdl&quot;<br>
&gt; diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend=
 b/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend<br>
&gt; index 5e9ff85..69323d9 100644<br>
&gt; --- a/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend<br>
&gt; +++ b/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend<br>
&gt; @@ -1,9 +1,9 @@<br>
&gt;=C2=A0 # Use OVERRIDES to minimize the usage of<br>
&gt;=C2=A0 # ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;arm-auto=
nomy-host&#39;, ...<br>
&gt; -OVERRIDES_append =3D &quot;${ARM_AUTONOMY_HOST_OVERRIDES}&quot;<br>
&gt; +OVERRIDES:append =3D &quot;${ARM_AUTONOMY_HOST_OVERRIDES}&quot;<br>
&gt;<br>
&gt; -FILESEXTRAPATHS_prepend_autonomy-host :=3D &quot;${THISDIR}/${PN}-4.=
14:&quot;<br>
&gt; +FILESEXTRAPATHS:prepend_autonomy-host :=3D &quot;${THISDIR}/${PN}-4.=
14:&quot;<br>
&gt;<br>
&gt; -SRC_URI_append_autonomy-host =3D &quot; \<br>
&gt; +SRC_URI:append_autonomy-host =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0001-xen-arm-Throw-messages-for-unknown-FP=
-SIMD-implement.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif=
-xenguest.hook b/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-x=
enguest.hook<br>
&gt; index 37ecec0..04c6dad 100755<br>
&gt; --- a/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xengue=
st.hook<br>
&gt; +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xengue=
st.hook<br>
&gt; @@ -38,9 +38,9 @@ get_subnet_prefix() {<br>
&gt;<br>
&gt;=C2=A0 subnetprefix=3D$(get_subnet_prefix)<br>
&gt;<br>
&gt; -kea_remove_conf_entry()<br>
&gt; +kea:remove_conf_entry()<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 log debug &quot;kea_remove_conf_entry&quot;<br>
&gt; +=C2=A0 =C2=A0 log debug &quot;kea:remove_conf_entry&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 claim_lock &quot;vif-nat-kea&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Remove the the xenguest kea config file inclusi=
on in the kea main config<br>
&gt; @@ -120,7 +120,7 @@ case &quot;${XENGUEST_NETWORK_TYPE}&quot; in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iptable=
s_w -t nat -A POSTROUTING -o ${bridge} -j MASQUERADE -m comment --comment &=
quot;dom${domid}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offline)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kea_remove_c=
onf_entry<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kea:remove_c=
onf_entry<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remov=
e the NAT iptables rules created for the dom${domid}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guest_i=
pt_rule=3D$(iptables_w -t nat -vL POSTROUTING -n --line-number | grep -w do=
m${domid} | awk &#39;{print $1}&#39; | tac)<br>
&gt; diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xengue=
st-manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-man=
ager<br>
&gt; index 7e5f868..44935c3 100755<br>
&gt; --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mana=
ger<br>
&gt; +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mana=
ger<br>
&gt; @@ -361,7 +361,7 @@ function xenguest_detach_disk()<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 #Private<br>
&gt; -function xenguest_volume_remove()<br>
&gt; +function xenguest_volume:remove()<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Inputs:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # $1 - volumename<br>
&gt; @@ -446,7 +446,7 @@ function xenguest_disk_init()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 log info &quot;Creating hard drive for guest &#39=
;${guestname}&#39;. This might take a while...&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Remove volume if it already exist<br>
&gt; -=C2=A0 =C2=A0 xenguest_volume_remove ${volumename} ${guestname}<br>
&gt; +=C2=A0 =C2=A0 xenguest_volume:remove ${volumename} ${guestname}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if [ $? -ne 0 ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; @@ -713,7 +713,7 @@ function xenguest_guest_create()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 log_command &quot;xenguest-mkimage update ${XENGU=
EST_CONF_BASE}/guests/${guestname} --xen-name=3D${guestname}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if [ $? -ne 0 ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log error &quot;Setting guest name =
failed.&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 xenguest_guest_remove ${guestname}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 xenguest_guest:remove ${guestname}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;<br>
&gt; @@ -724,7 +724,7 @@ function xenguest_guest_create()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $disk_init_status -eq 2 ]; the=
n<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xenguest_detach_disk<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 xenguest_guest_remove ${guestname}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 xenguest_guest:remove ${guestname}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;<br>
&gt; @@ -733,7 +733,7 @@ function xenguest_guest_create()<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 # Private<br>
&gt; -function xenguest_guest_remove()<br>
&gt; +function xenguest_guest:remove()<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 guestname=3D&quot;$1&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 log info &quot;Attempting to remove guest &#39;${=
guestname}&#39;&quot;<br>
&gt; @@ -754,7 +754,7 @@ function xenguest_guest_remove()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 devname=3D&quot;/dev/${volumename}/${guestname}&q=
uot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # find and remove guest volume<br>
&gt; -=C2=A0 =C2=A0 xenguest_volume_remove ${volumename} ${guestname}<br>
&gt; +=C2=A0 =C2=A0 xenguest_volume:remove ${volumename} ${guestname}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 status=3D$?<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # remove guest files<br>
&gt; @@ -1080,7 +1080,7 @@ case ${cmd} in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if xl_list_contains $guestname; the=
n<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xenguest_guest_kill $=
{guestname}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 xenguest_guest_remove ${guestname}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 xenguest_guest:remove ${guestname}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 start)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guestname=3D&quot;${arg1:-}&quot;<b=
r>
&gt; diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xengue=
st-mkimage b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mki=
mage<br>
&gt; index 29e0911..9a3b8cf 100755<br>
&gt; --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkim=
age<br>
&gt; +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkim=
age<br>
&gt; @@ -343,7 +343,7 @@ xen_config_set_string() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sed -i &quot;s@.*${param} =3D .*@${param} =3D \&q=
uot;${value}\&quot;@&quot; ${dst}<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -xen_config_append_string() {<br>
&gt; +xen_config:append_string() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 param=3D&quot;${1}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 shift<br>
&gt;=C2=A0 =C2=A0 =C2=A0 value=3D&quot;$@&quot;<br>
&gt; @@ -795,7 +795,7 @@ for arg in &quot;${@}&quot;; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xen_config_set_string=
 &quot;extra&quot; &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --xen-extra=3D*)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xen_config_append_string &=
quot;extra&quot; ${optarg}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xen_config:append_string &=
quot;extra&quot; ${optarg}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --xen-root=3D*)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -z &quot;${optar=
g}&quot; ]; then<br>
&gt; diff --git a/meta-arm-autonomy/recipes-extended/xenguest/<a href=3D"h=
ttp://xenguest-base-image.bb" rel=3D"noreferrer" target=3D"_blank">xenguest=
-base-image.bb</a> b/meta-arm-autonomy/recipes-extended/xenguest/<a href=3D=
"http://xenguest-base-image.bb" rel=3D"noreferrer" target=3D"_blank">xengue=
st-base-image.bb</a><br>
&gt; index 73278e5..d3efed1 100644<br>
&gt; --- a/meta-arm-autonomy/recipes-extended/xenguest/<a href=3D"http://x=
enguest-base-image.bb" rel=3D"noreferrer" target=3D"_blank">xenguest-base-i=
mage.bb</a><br>
&gt; +++ b/meta-arm-autonomy/recipes-extended/xenguest/<a href=3D"http://x=
enguest-base-image.bb" rel=3D"noreferrer" target=3D"_blank">xenguest-base-i=
mage.bb</a><br>
&gt; @@ -46,7 +46,7 @@ XENGUEST_IMAGE_SRC_URI_DISK_FILES ??=3D &quot;&quot=
;<br>
&gt;<br>
&gt;=C2=A0 # Add xen files<br>
&gt;=C2=A0 # Any extrafiles files to be added to XENGUEST_IMAGE_SRC_URI_XE=
N_FILES should<br>
&gt; -# be performed via XENGUEST_IMAGE_SRC_URI_XEN_FILES_append.<br>
&gt; +# be performed via XENGUEST_IMAGE_SRC_URI_XEN_FILES:append.<br>
&gt;=C2=A0 # The kea-subnet4.json holds the kea dhcp4 subnet configuration=
 for Dom0.<br>
&gt;=C2=A0 # And it is used when XENGUEST_IMAGE_NETWORK_TYPE=3D&quot;nat&q=
uot;.<br>
&gt;=C2=A0 # Any customizations to it should be performed by replacing it<=
br>
&gt; diff --git a/meta-arm-autonomy/recipes-extended/xenguest/<a href=3D"h=
ttp://xenguest-extern-guests.bb" rel=3D"noreferrer" target=3D"_blank">xengu=
est-extern-guests.bb</a> b/meta-arm-autonomy/recipes-extended/xenguest/<a h=
ref=3D"http://xenguest-extern-guests.bb" rel=3D"noreferrer" target=3D"_blan=
k">xenguest-extern-guests.bb</a><br>
&gt; index fff6f6c..ac58184 100644<br>
&gt; --- a/meta-arm-autonomy/recipes-extended/xenguest/<a href=3D"http://x=
enguest-extern-guests.bb" rel=3D"noreferrer" target=3D"_blank">xenguest-ext=
ern-guests.bb</a><br>
&gt; +++ b/meta-arm-autonomy/recipes-extended/xenguest/<a href=3D"http://x=
enguest-extern-guests.bb" rel=3D"noreferrer" target=3D"_blank">xenguest-ext=
ern-guests.bb</a><br>
&gt; @@ -67,7 +67,7 @@ do_install() {<br>
&gt;<br>
&gt;=C2=A0 do_install[vardeps] +=3D &quot;ARM_AUTONOMY_HOST_IMAGE_EXTERN_G=
UESTS&quot;<br>
&gt;<br>
&gt; -FILES_${PN} +=3D &quot;${XENGUEST_MANAGER_GUEST_DIR}&quot;<br>
&gt; +FILES:${PN} +=3D &quot;${XENGUEST_MANAGER_GUEST_DIR}&quot;<br>
&gt;<br>
&gt;=C2=A0 # In a multiconfig build this variable will hold a dependency s=
tring, which<br>
&gt;=C2=A0 # differs based on whether the guest has initramfs or not.=C2=
=A0 It may have a space<br>
&gt; diff --git a/meta-arm-autonomy/recipes-extended/xenguest/<a href=3D"h=
ttp://xenguest-manager.bb" rel=3D"noreferrer" target=3D"_blank">xenguest-ma=
nager.bb</a> b/meta-arm-autonomy/recipes-extended/xenguest/<a href=3D"http:=
//xenguest-manager.bb" rel=3D"noreferrer" target=3D"_blank">xenguest-manage=
r.bb</a><br>
&gt; index aaf6cde..83ff95d 100644<br>
&gt; --- a/meta-arm-autonomy/recipes-extended/xenguest/<a href=3D"http://x=
enguest-manager.bb" rel=3D"noreferrer" target=3D"_blank">xenguest-manager.b=
b</a><br>
&gt; +++ b/meta-arm-autonomy/recipes-extended/xenguest/<a href=3D"http://x=
enguest-manager.bb" rel=3D"noreferrer" target=3D"_blank">xenguest-manager.b=
b</a><br>
&gt; @@ -56,8 +56,8 @@ do_install() {<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 # Things that we need on the target<br>
&gt; -RDEPENDS_${PN} +=3D &quot;bash xenguest-mkimage lvm2 xen-tools parte=
d e2fsprogs \<br>
&gt; +RDEPENDS:${PN} +=3D &quot;bash xenguest-mkimage lvm2 xen-tools parte=
d e2fsprogs \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0dosfstools logrotate&quot;<br>
&gt;<br>
&gt; -FILES_${PN} +=3D &quot;${bindir}/xenguest-manager \<br>
&gt; +FILES:${PN} +=3D &quot;${bindir}/xenguest-manager \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${syscon=
fdir}/xenguest&quot;<br>
&gt; diff --git a/meta-arm-autonomy/recipes-extended/xenguest/<a href=3D"h=
ttp://xenguest-mkimage.bb" rel=3D"noreferrer" target=3D"_blank">xenguest-mk=
image.bb</a> b/meta-arm-autonomy/recipes-extended/xenguest/<a href=3D"http:=
//xenguest-mkimage.bb" rel=3D"noreferrer" target=3D"_blank">xenguest-mkimag=
e.bb</a><br>
&gt; index 548e7c3..91344aa 100644<br>
&gt; --- a/meta-arm-autonomy/recipes-extended/xenguest/<a href=3D"http://x=
enguest-mkimage.bb" rel=3D"noreferrer" target=3D"_blank">xenguest-mkimage.b=
b</a><br>
&gt; +++ b/meta-arm-autonomy/recipes-extended/xenguest/<a href=3D"http://x=
enguest-mkimage.bb" rel=3D"noreferrer" target=3D"_blank">xenguest-mkimage.b=
b</a><br>
&gt; @@ -31,6 +31,6 @@ do_install() {<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 # We need bash<br>
&gt; -RDEPENDS_${PN} =3D &quot;bash&quot;<br>
&gt; -FILES_${PN} =3D &quot;${bindir}/xenguest-mkimage&quot;<br>
&gt; +RDEPENDS:${PN} =3D &quot;bash&quot;<br>
&gt; +FILES:${PN} =3D &quot;${bindir}/xenguest-mkimage&quot;<br>
&gt;<br>
&gt; diff --git a/meta-arm-autonomy/recipes-extended/xenguest/<a href=3D"h=
ttp://xenguest-network.bb" rel=3D"noreferrer" target=3D"_blank">xenguest-ne=
twork.bb</a> b/meta-arm-autonomy/recipes-extended/xenguest/<a href=3D"http:=
//xenguest-network.bb" rel=3D"noreferrer" target=3D"_blank">xenguest-networ=
k.bb</a><br>
&gt; index 65ab8aa..66c6f26 100644<br>
&gt; --- a/meta-arm-autonomy/recipes-extended/xenguest/<a href=3D"http://x=
enguest-network.bb" rel=3D"noreferrer" target=3D"_blank">xenguest-network.b=
b</a><br>
&gt; +++ b/meta-arm-autonomy/recipes-extended/xenguest/<a href=3D"http://x=
enguest-network.bb" rel=3D"noreferrer" target=3D"_blank">xenguest-network.b=
b</a><br>
&gt; @@ -31,13 +31,13 @@ PACKAGES =3D+ &quot;${PN}-kea-dhcp4&quot;<br>
&gt;=C2=A0 # Prefix with a_ to make sure it is executed in runlevel 01 bef=
ore others<br>
&gt;=C2=A0 # run start script before ifupdown and run stop script after if=
updown<br>
&gt;=C2=A0 INITSCRIPT_PACKAGES =3D &quot;${PN} ${PN}-kea-dhcp4&quot;<br>
&gt; -INITSCRIPT_NAME_${PN} =3D &quot;a_xenguest-network-bridge&quot;<br>
&gt; -INITSCRIPT_PARAMS_${PN} =3D &quot;start 01 2 3 4 5 . stop 81 0 1 6 .=
&quot;<br>
&gt; +INITSCRIPT_NAME:${PN} =3D &quot;a_xenguest-network-bridge&quot;<br>
&gt; +INITSCRIPT_PARAMS:${PN} =3D &quot;start 01 2 3 4 5 . stop 81 0 1 6 .=
&quot;<br>
&gt;<br>
&gt;=C2=A0 # Kea configuration needs to be restored before kea init script=
s:<br>
&gt;=C2=A0 # Kea dhcp4 server is 30, so lets use 20, to have higher priori=
ty<br>
&gt; -INITSCRIPT_NAME_${PN}-kea-dhcp4 =3D &quot;kea-restore-default-config=
&quot;<br>
&gt; -INITSCRIPT_PARAMS_${PN}-kea-dhcp4 =3D &quot;defaults 20&quot;<br>
&gt; +INITSCRIPT_NAME:${PN}-kea-dhcp4 =3D &quot;kea-restore-default-config=
&quot;<br>
&gt; +INITSCRIPT_PARAMS:${PN}-kea-dhcp4 =3D &quot;defaults 20&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit allarch update-rc.d<br>
&gt;<br>
&gt; @@ -77,7 +77,7 @@ do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${sysconfdir}/kea/kea-dhcp4.con=
f.original<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -RDEPENDS_${PN} +=3D &quot;bridge-utils \<br>
&gt; +RDEPENDS:${PN} +=3D &quot;bridge-utils \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0iptables \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0kea \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0${PN}-kea-dhcp4 \<br>
&gt; @@ -87,10 +87,10 @@ RDEPENDS_${PN} +=3D &quot;bridge-utils \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0kernel-module-xt-nat \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0kernel-module-xt-masquerade \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
&quot;<br>
&gt; -FILES_${PN} +=3D &quot;${sysconfdir}/network/interfaces.d/xenguest-n=
etwork-bridge.cfg&quot;<br>
&gt; -FILES_${PN} +=3D &quot;${sysconfdir}/xenguest/init.pre/network-bridg=
e.sh&quot;<br>
&gt; -FILES_${PN} +=3D &quot;${sysconfdir}/xen/scripts/vif-post.d/00-vif-x=
enguest.hook&quot;<br>
&gt; +FILES:${PN} +=3D &quot;${sysconfdir}/network/interfaces.d/xenguest-n=
etwork-bridge.cfg&quot;<br>
&gt; +FILES:${PN} +=3D &quot;${sysconfdir}/xenguest/init.pre/network-bridg=
e.sh&quot;<br>
&gt; +FILES:${PN} +=3D &quot;${sysconfdir}/xen/scripts/vif-post.d/00-vif-x=
enguest.hook&quot;<br>
&gt;<br>
&gt; -FILES_${PN}-kea-dhcp4 =3D &quot;${sysconfdir}/kea/kea-dhcp4.conf.ori=
ginal&quot;<br>
&gt; -FILES_${PN}-kea-dhcp4 +=3D &quot;${sysconfdir}/init.d/${INITSCRIPT_N=
AME_${PN}-kea-dhcp4}&quot;<br>
&gt; -FILES_${PN}-kea-dhcp4 +=3D &quot;${sysconfdir}/xenguest/<a href=3D"h=
ttp://init.post/xenguest-network-init-post.sh" rel=3D"noreferrer" target=3D=
"_blank">init.post/xenguest-network-init-post.sh</a>&quot;<br>
&gt; +FILES:${PN}-kea-dhcp4 =3D &quot;${sysconfdir}/kea/kea-dhcp4.conf.ori=
ginal&quot;<br>
&gt; +FILES:${PN}-kea-dhcp4 +=3D &quot;${sysconfdir}/init.d/${INITSCRIPT_N=
AME_${PN}-kea-dhcp4}&quot;<br>
&gt; +FILES:${PN}-kea-dhcp4 +=3D &quot;${sysconfdir}/xenguest/<a href=3D"h=
ttp://init.post/xenguest-network-init-post.sh" rel=3D"noreferrer" target=3D=
"_blank">init.post/xenguest-network-init-post.sh</a>&quot;<br>
&gt; diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonom=
y.inc b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc<br>
&gt; index 5361e75..588856c 100644<br>
&gt; --- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc<b=
r>
&gt; +++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc<b=
r>
&gt; @@ -1,11 +1,11 @@<br>
&gt;=C2=A0 # Add arm-autonomy specific features to the kernel<br>
&gt;<br>
&gt; -FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}:&quot;<br>
&gt; +FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}:&quot;<br>
&gt;<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # arm-autonomy kmeta<br>
&gt;=C2=A0 #<br>
&gt; -SRC_URI_append =3D &quot; file://arm-autonomy-kmeta;type=3Dkmeta;nam=
e=3Darm-autonomy-kmeta;destsuffix=3Darm-autonomy-kmeta&quot;<br>
&gt; +SRC_URI:append =3D &quot; file://arm-autonomy-kmeta;type=3Dkmeta;nam=
e=3Darm-autonomy-kmeta;destsuffix=3Darm-autonomy-kmeta&quot;<br>
&gt;<br>
&gt;=C2=A0 # Add common Xen (host and guest) configs and patches<br>
&gt;=C2=A0 KERNEL_FEATURES +=3D &quot;${@bb.utils.contains_any(&#39;DISTRO=
_FEATURES&#39;, \<br>
&gt; @@ -27,8 +27,8 @@ KERNEL_FEATURES +=3D &quot;${@bb.utils.contains(&#3=
9;DISTRO_FEATURES&#39;, \<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 # Add support for arm64-autonomy-guest machine<br>
&gt; -COMPATIBLE_MACHINE_arm64-autonomy-guest =3D &quot;arm64-autonomy-gue=
st&quot;<br>
&gt; -KMACHINE_arm64-autonomy-guest =3D &quot;arm64-autonomy-guest&quot;<b=
r>
&gt; +COMPATIBLE_MACHINE:arm64-autonomy-guest =3D &quot;arm64-autonomy-gue=
st&quot;<br>
&gt; +KMACHINE:arm64-autonomy-guest =3D &quot;arm64-autonomy-guest&quot;<b=
r>
&gt;<br>
&gt;=C2=A0 # Add Minimal Kernel Configs for Docker runtime<br>
&gt;=C2=A0 KERNEL_FEATURES +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEA=
TURES&#39;, \<br>
&gt; diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.c=
onf<br>
&gt; index 665f914..e5ae59d 100644<br>
&gt; --- a/meta-arm-bsp/conf/layer.conf<br>
&gt; +++ b/meta-arm-bsp/conf/layer.conf<br>
&gt; @@ -13,8 +13,8 @@ LAYERSERIES_COMPAT_meta-arm-bsp =3D &quot;hardknott=
&quot;<br>
&gt;<br>
&gt;=C2=A0 LAYERDEPENDS_meta-arm-bsp =3D &quot;core meta-arm&quot;<br>
&gt;=C2=A0 # This won&#39;t be used by layerindex-fetch, but works everywh=
ere else<br>
&gt; -LAYERDEPENDS_meta-arm-bsp_append_musca-b1 =3D &quot; meta-python&quo=
t;<br>
&gt; -LAYERDEPENDS_meta-arm-bsp_append_musca-s1 =3D &quot; meta-python&quo=
t;<br>
&gt; +LAYERDEPENDS_meta-arm-bsp:append_musca-b1 =3D &quot; meta-python&quo=
t;<br>
&gt; +LAYERDEPENDS_meta-arm-bsp:append_musca-s1 =3D &quot; meta-python&quo=
t;<br>
&gt;<br>
&gt;=C2=A0 # Additional license directories.<br>
&gt;=C2=A0 LICENSE_PATH +=3D &quot;${LAYERDIR}/custom-licenses&quot;<br>
&gt; diff --git a/meta-arm-bsp/conf/machine/corstone700-fvp.conf b/meta-ar=
m-bsp/conf/machine/corstone700-fvp.conf<br>
&gt; index 2ee3b52..6056b36 100644<br>
&gt; --- a/meta-arm-bsp/conf/machine/corstone700-fvp.conf<br>
&gt; +++ b/meta-arm-bsp/conf/machine/corstone700-fvp.conf<br>
&gt; @@ -6,7 +6,7 @@ require conf/machine/include/corstone700.inc<br>
&gt;<br>
&gt;=C2=A0 # default feature used: eth_lan91c111<br>
&gt;=C2=A0 # add the following line to local.conf to disable the feature:<=
br>
&gt; -# MACHINE_FEATURES_remove =3D &quot;eth_lan91c111&quot;<br>
&gt; +# MACHINE_FEATURES:remove =3D &quot;eth_lan91c111&quot;<br>
&gt;=C2=A0 MACHINE_FEATURES +=3D &quot;eth_lan91c111&quot;<br>
&gt;<br>
&gt;=C2=A0 TFA_TARGET_PLATFORM =3D &quot;fvp&quot;<br>
&gt; diff --git a/meta-arm-bsp/conf/machine/corstone700-mps3.conf b/meta-a=
rm-bsp/conf/machine/corstone700-mps3.conf<br>
&gt; index 9aaa17c..916ba0e 100644<br>
&gt; --- a/meta-arm-bsp/conf/machine/corstone700-mps3.conf<br>
&gt; +++ b/meta-arm-bsp/conf/machine/corstone700-mps3.conf<br>
&gt; @@ -6,12 +6,12 @@ require conf/machine/include/corstone700.inc<br>
&gt;<br>
&gt;=C2=A0 # default feature used: eth_lan9115<br>
&gt;=C2=A0 # add the following line to local.conf to disable the feature:<=
br>
&gt; -# MACHINE_FEATURES_remove =3D &quot;eth_lan9115&quot;<br>
&gt; +# MACHINE_FEATURES:remove =3D &quot;eth_lan9115&quot;<br>
&gt;=C2=A0 MACHINE_FEATURES +=3D &quot;eth_lan9115&quot;<br>
&gt;<br>
&gt;=C2=A0 # default feature used: usb_host<br>
&gt;=C2=A0 # add the following line to local.conf to disable the feature:<=
br>
&gt; -# MACHINE_FEATURES_remove =3D &quot;usb_host&quot;<br>
&gt; +# MACHINE_FEATURES:remove =3D &quot;usb_host&quot;<br>
&gt;=C2=A0 MACHINE_FEATURES +=3D &quot;usb_host&quot;<br>
&gt;<br>
&gt;=C2=A0 TFA_TARGET_PLATFORM =3D &quot;fpga&quot;<br>
&gt; diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta=
-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf<br>
&gt; index 29dd662..aeb23a4 100644<br>
&gt; --- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf<br>
&gt; +++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf<br>
&gt; @@ -22,7 +22,7 @@ WKS_FILE ?=3D &quot;fvp-base.wks&quot;<br>
&gt;=C2=A0 # As this is a virtual target that will not be used in the real=
 world there is<br>
&gt;=C2=A0 # no need for real SSH keys.=C2=A0 Disable rng-tools (which tak=
es too long to<br>
&gt;=C2=A0 # initialise) and install the pre-generated keys.<br>
&gt; -PACKAGECONFIG_remove_pn-openssh =3D &quot;rng-tools&quot;<br>
&gt; +PACKAGECONFIG:remove:pn-openssh =3D &quot;rng-tools&quot;<br>
&gt;=C2=A0 MACHINE_EXTRA_RRECOMMENDS +=3D &quot;ssh-pregen-hostkeys&quot;<=
br>
&gt;<br>
&gt;=C2=A0 FVP_EXTRA_ARGS =3D &quot;-a cluster0*=3D${DEPLOY_DIR_IMAGE}/lin=
ux-system.axf&quot;<br>
&gt; diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/=
conf/machine/fvp-common.inc<br>
&gt; index 72dae65..2579d94 100644<br>
&gt; --- a/meta-arm-bsp/conf/machine/fvp-common.inc<br>
&gt; +++ b/meta-arm-bsp/conf/machine/fvp-common.inc<br>
&gt; @@ -23,5 +23,5 @@ EXTRA_IMAGEDEPENDS +=3D &quot;virtual/trusted-firmw=
are-a u-boot&quot;<br>
&gt;=C2=A0 # As this is a virtual target that will not be used in the real=
 world there is<br>
&gt;=C2=A0 # no need for real SSH keys.=C2=A0 Disable rng-tools (which tak=
es too long to<br>
&gt;=C2=A0 # initialise) and install the pre-generated keys.<br>
&gt; -PACKAGECONFIG_remove_pn-openssh =3D &quot;rng-tools&quot;<br>
&gt; +PACKAGECONFIG:remove:pn-openssh =3D &quot;rng-tools&quot;<br>
&gt;=C2=A0 MACHINE_EXTRA_RRECOMMENDS +=3D &quot;ssh-pregen-hostkeys&quot;<=
br>
&gt; diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv6m.inc b/=
meta-arm-bsp/conf/machine/include/arm/arch-armv6m.inc<br>
&gt; index 739550d..e7ca665 100755<br>
&gt; --- a/meta-arm-bsp/conf/machine/include/arm/arch-armv6m.inc<br>
&gt; +++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv6m.inc<br>
&gt; @@ -14,6 +14,6 @@ require conf/machine/include/arm/arch-armv5.inc<br>
&gt;<br>
&gt;=C2=A0 # Little Endian<br>
&gt;=C2=A0 AVAILTUNES +=3D &quot;armv6m&quot;<br>
&gt; -ARMPKGARCH_tune-armv6m=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D &quot;armv6m&quot;<br>
&gt; -TUNE_FEATURES_tune-armv6m=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quo=
t;armv6m&quot;<br>
&gt; -PACKAGE_EXTRA_ARCHS_tune-armv6m=C2=A0 =C2=A0 =3D &quot;armv6m&quot;<=
br>
&gt; +ARMPKGARCH:tune-armv6m=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D &quot;armv6m&quot;<br>
&gt; +TUNE_FEATURES:tune-armv6m=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quo=
t;armv6m&quot;<br>
&gt; +PACKAGE_EXTRA_ARCHS:tune-armv6m=C2=A0 =C2=A0 =3D &quot;armv6m&quot;<=
br>
&gt; diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv7em.inc b=
/meta-arm-bsp/conf/machine/include/arm/arch-armv7em.inc<br>
&gt; index 197286f..adcab27 100755<br>
&gt; --- a/meta-arm-bsp/conf/machine/include/arm/arch-armv7em.inc<br>
&gt; +++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv7em.inc<br>
&gt; @@ -12,6 +12,6 @@ TUNECONFLICTS[armv7em] =3D &quot;armv4 armv5 armv6 =
armv7a&quot;<br>
&gt;=C2=A0 require conf/machine/include/arm/arch-armv7m.inc<br>
&gt;<br>
&gt;=C2=A0 AVAILTUNES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D &quot;armv7em&quot;<br>
&gt; -ARMPKGARCH_tune-armv7em=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =3D &quot;armv7em&quot;<br>
&gt; -TUNE_FEATURES_tune-armv7em=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0=3D &quot;armv7em&quot;<br>
&gt; -PACKAGE_EXTRA_ARCHS_tune-armv7em=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot=
;armv7em&quot;<br>
&gt; +ARMPKGARCH:tune-armv7em=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =3D &quot;armv7em&quot;<br>
&gt; +TUNE_FEATURES:tune-armv7em=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0=3D &quot;armv7em&quot;<br>
&gt; +PACKAGE_EXTRA_ARCHS:tune-armv7em=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot=
;armv7em&quot;<br>
&gt; diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv7m.inc b/=
meta-arm-bsp/conf/machine/include/arm/arch-armv7m.inc<br>
&gt; index c659e8b..a36c265 100755<br>
&gt; --- a/meta-arm-bsp/conf/machine/include/arm/arch-armv7m.inc<br>
&gt; +++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv7m.inc<br>
&gt; @@ -12,6 +12,6 @@ TUNECONFLICTS[armv7m] =3D &quot;armv4 armv5 armv6 a=
rmv7a&quot;<br>
&gt;=C2=A0 require conf/machine/include/arm/arch-armv6m.inc<br>
&gt;<br>
&gt;=C2=A0 AVAILTUNES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D &quot;armv7m&quot;<br>
&gt; -ARMPKGARCH_tune-armv7m=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D &quot;armv7m&quot;<br>
&gt; -TUNE_FEATURES_tune-armv7m=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D &quot;armv7m&quot;<br>
&gt; -PACKAGE_EXTRA_ARCHS_tune-armv7m=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot=
;armv7m&quot;<br>
&gt; +ARMPKGARCH:tune-armv7m=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D &quot;armv7m&quot;<br>
&gt; +TUNE_FEATURES:tune-armv7m=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D &quot;armv7m&quot;<br>
&gt; +PACKAGE_EXTRA_ARCHS:tune-armv7m=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot=
;armv7m&quot;<br>
&gt; diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv8-1m-main=
.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv8-1m-main.inc<br>
&gt; index fc8add4..9171b31 100755<br>
&gt; --- a/meta-arm-bsp/conf/machine/include/arm/arch-armv8-1m-main.inc<br=
>
&gt; +++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv8-1m-main.inc<br=
>
&gt; @@ -13,6 +13,6 @@ TUNECONFLICTS[armv8-1m-main] =3D &quot;armv4 armv5 =
armv6 armv7a&quot;<br>
&gt;=C2=A0 require conf/machine/include/arm/arch-armv8m-main.inc<br>
&gt;<br>
&gt;=C2=A0 AVAILTUNES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D &quot;armv8-1m-main&quo=
t;<br>
&gt; -ARMPKGARCH_tune-armv8-1m-main=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D =
&quot;armv8-1m-main&quot;<br>
&gt; -TUNE_FEATURES_tune-armv8-1m-main=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot=
;armv8-1m-main&quot;<br>
&gt; -PACKAGE_EXTRA_ARCHS_tune-armv8-1m-main =3D &quot;armv8-1m-main&quot;=
<br>
&gt; +ARMPKGARCH:tune-armv8-1m-main=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D =
&quot;armv8-1m-main&quot;<br>
&gt; +TUNE_FEATURES:tune-armv8-1m-main=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot=
;armv8-1m-main&quot;<br>
&gt; +PACKAGE_EXTRA_ARCHS:tune-armv8-1m-main =3D &quot;armv8-1m-main&quot;=
<br>
&gt; diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv8-2a.inc =
b/meta-arm-bsp/conf/machine/include/arm/arch-armv8-2a.inc<br>
&gt; index 0af949e..3bfe0d5 100644<br>
&gt; --- a/meta-arm-bsp/conf/machine/include/arm/arch-armv8-2a.inc<br>
&gt; +++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv8-2a.inc<br>
&gt; @@ -8,11 +8,11 @@ MACHINEOVERRIDES =3D. &quot;${@bb.utils.contains(&#=
39;TUNE_FEATURES&#39;, &#39;armv8-2a&#39;, &#39;armv8-2a<br>
&gt;=C2=A0 require conf/machine/include/arm/arch-armv8a.inc<br>
&gt;<br>
&gt;=C2=A0 AVAILTUNES +=3D &quot;armv8-2a armv8-2a-crypto&quot;<br>
&gt; -ARMPKGARCH_tune-armv8-2a=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D &quot;armv8-2a&quot;<br>
&gt; -ARMPKGARCH_tune-armv8-2a-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0?=3D &quot;armv8-2a&quot;<br>
&gt; -TUNE_FEATURES_tune-armv8-2a=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D &quot;aarch64 armv8-2a&quot;<br>
&gt; -TUNE_FEATURES_tune-armv8-2a-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D &quot;${TUNE_FEATURES_tune-armv8-2a} crypto&quot;<br>
&gt; -PACKAGE_EXTRA_ARCHS_tune-armv8-2a=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =3D &quot;${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8-2a&quot;<br>
&gt; -PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto=C2=A0 =C2=A0 =C2=A0=3D &quo=
t;${PACKAGE_EXTRA_ARCHS_tune-armv8-2a} armv8-2a-crypto&quot;<br>
&gt; -BASE_LIB_tune-armv8-2a=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;lib64&quot;<br>
&gt; -BASE_LIB_tune-armv8-2a-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D &quot;lib64&quot;<br>
&gt; +ARMPKGARCH:tune-armv8-2a=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D &quot;armv8-2a&quot;<br>
&gt; +ARMPKGARCH:tune-armv8-2a-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0?=3D &quot;armv8-2a&quot;<br>
&gt; +TUNE_FEATURES:tune-armv8-2a=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D &quot;aarch64 armv8-2a&quot;<br>
&gt; +TUNE_FEATURES:tune-armv8-2a-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D &quot;${TUNE_FEATURES:tune-armv8-2a} crypto&quot;<br>
&gt; +PACKAGE_EXTRA_ARCHS:tune-armv8-2a=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =3D &quot;${PACKAGE_EXTRA_ARCHS:tune-armv8a} armv8-2a&quot;<br>
&gt; +PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto=C2=A0 =C2=A0 =C2=A0=3D &quo=
t;${PACKAGE_EXTRA_ARCHS:tune-armv8-2a} armv8-2a-crypto&quot;<br>
&gt; +BASE_LIB:tune-armv8-2a=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;lib64&quot;<br>
&gt; +BASE_LIB:tune-armv8-2a-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D &quot;lib64&quot;<br>
&gt; diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv8-4a.inc =
b/meta-arm-bsp/conf/machine/include/arm/arch-armv8-4a.inc<br>
&gt; index a4f2ca2..2dc04b6 100644<br>
&gt; --- a/meta-arm-bsp/conf/machine/include/arm/arch-armv8-4a.inc<br>
&gt; +++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv8-4a.inc<br>
&gt; @@ -9,11 +9,11 @@ require conf/machine/include/arm/arch-armv8a.inc<br=
>
&gt;<br>
&gt;=C2=A0 # Little Endian base configs<br>
&gt;=C2=A0 AVAILTUNES +=3D &quot;armv8-4a armv8-4a-crypto&quot;<br>
&gt; -ARMPKGARCH_tune-armv8-4a=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D &quot;armv8-4a&quot;<br>
&gt; -ARMPKGARCH_tune-armv8-4a-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0?=3D &quot;armv8-4a&quot;<br>
&gt; -TUNE_FEATURES_tune-armv8-4a=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D &quot;aarch64 armv8-4a&quot;<br>
&gt; -TUNE_FEATURES_tune-armv8-4a-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D &quot;${TUNE_FEATURES_tune-armv8-4a} crypto&quot;<br>
&gt; -PACKAGE_EXTRA_ARCHS_tune-armv8-4a=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =3D &quot;${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8-4a&quot;<br>
&gt; -PACKAGE_EXTRA_ARCHS_tune-armv8-4a-crypto=C2=A0 =C2=A0 =C2=A0=3D &quo=
t;${PACKAGE_EXTRA_ARCHS_tune-armv8-4a} armv8-4a-crypto&quot;<br>
&gt; -BASE_LIB_tune-armv8-4a=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;lib64&quot;<br>
&gt; -BASE_LIB_tune-armv8-4a-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D &quot;lib64&quot;<br>
&gt; +ARMPKGARCH:tune-armv8-4a=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D &quot;armv8-4a&quot;<br>
&gt; +ARMPKGARCH:tune-armv8-4a-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0?=3D &quot;armv8-4a&quot;<br>
&gt; +TUNE_FEATURES:tune-armv8-4a=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D &quot;aarch64 armv8-4a&quot;<br>
&gt; +TUNE_FEATURES:tune-armv8-4a-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D &quot;${TUNE_FEATURES:tune-armv8-4a} crypto&quot;<br>
&gt; +PACKAGE_EXTRA_ARCHS:tune-armv8-4a=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =3D &quot;${PACKAGE_EXTRA_ARCHS:tune-armv8a} armv8-4a&quot;<br>
&gt; +PACKAGE_EXTRA_ARCHS:tune-armv8-4a-crypto=C2=A0 =C2=A0 =C2=A0=3D &quo=
t;${PACKAGE_EXTRA_ARCHS:tune-armv8-4a} armv8-4a-crypto&quot;<br>
&gt; +BASE_LIB:tune-armv8-4a=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;lib64&quot;<br>
&gt; +BASE_LIB:tune-armv8-4a-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D &quot;lib64&quot;<br>
&gt; diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-base.i=
nc b/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-base.inc<br>
&gt; index 04cdf7d..d9a341c 100755<br>
&gt; --- a/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-base.inc<br>
&gt; +++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-base.inc<br>
&gt; @@ -12,6 +12,6 @@ TUNECONFLICTS[armv8m-base] =3D &quot;armv4 armv5 ar=
mv6 armv7a&quot;<br>
&gt;=C2=A0 require conf/machine/include/arm/arch-armv7m.inc<br>
&gt;<br>
&gt;=C2=A0 AVAILTUNES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D &quot;armv8m-base&quot;<br>
&gt; -ARMPKGARCH_tune-armv8m-base=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &q=
uot;armv8m-base&quot;<br>
&gt; -TUNE_FEATURES_tune-armv8m-base=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;a=
rmv8m-base&quot;<br>
&gt; -PACKAGE_EXTRA_ARCHS_tune-armv8m-base =3D &quot;armv8m-base&quot;<br>
&gt; +ARMPKGARCH:tune-armv8m-base=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &q=
uot;armv8m-base&quot;<br>
&gt; +TUNE_FEATURES:tune-armv8m-base=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;a=
rmv8m-base&quot;<br>
&gt; +PACKAGE_EXTRA_ARCHS:tune-armv8m-base =3D &quot;armv8m-base&quot;<br>
&gt; diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-main.i=
nc b/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-main.inc<br>
&gt; index f2e078d..27f552b 100755<br>
&gt; --- a/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-main.inc<br>
&gt; +++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-main.inc<br>
&gt; @@ -22,15 +22,15 @@ TUNE_CCARGS_MFPU .=3D &quot;${@bb.utils.contains(=
&#39;TUNE_FEATURES&#39;, &#39;vfpv5spd16&#39;, &#39;fpv5-s<br>
&gt;=C2=A0 MARCH_FPU =3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39=
;, [ &#39;vfpv5spd16&#39; ], &#39;+fp&#39;, &#39;+nofp&#39;, d)}&quot;<br>
&gt;<br>
&gt;=C2=A0 AVAILTUNES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 +=3D &quot;armv8m-main armv8m-mainearmv8m-main-vfpv5spd16 armv8m-ma=
ine-vfpv5spd16&quot;<br>
&gt; -ARMPKGARCH_tune-armv8m-main=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;armv8m-main&quot;<br>
&gt; -ARMPKGARCH_tune-armv8m-maine=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;armv8m-main&quot;<br>
&gt; -ARMPKGARCH_tune-armv8m-main-vfpv5spd16=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D &quot;armv8m-main&quot;<br>
&gt; -ARMPKGARCH_tune-armv8m-maine-vfpv5spd16=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D &quot;armv8m-main&quot;<br>
&gt; -TUNE_FEATURES_tune-armv8m-main=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;armv8m-main&quot;<br>
&gt; -TUNE_FEATURES_tune-armv8m-maine=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;${TUNE_FEATURES_tune-armv8m-main} ds=
p&quot;<br>
&gt; -TUNE_FEATURES_tune-armv8m-main-vfpv5spd16=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =3D &quot;${TUNE_FEATURES_tune-armv8m-main} vfpv5spd16&quot;<br>
&gt; -TUNE_FEATURES_tune-armv8m-maine-vfpv5spd16=C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D &quot;${TUNE_FEATURES_tune-armv8m-main-vfpv5spd16} dsp&quot;<br>
&gt; -PACKAGE_EXTRA_ARCHS_tune-armv8m-main=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D &quot;armv8m-main&quot;<br>
&gt; -PACKAGE_EXTRA_ARCHS_tune-armv8m-maine=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =3D &quot;${PACKAGE_EXTRA_ARCHS_tune-armv8m-main} armv8m-maine&=
quot;<br>
&gt; -PACKAGE_EXTRA_ARCHS_tune-armv8m-main-vfpv5spd16=C2=A0 =3D &quot;${PA=
CKAGE_EXTRA_ARCHS_tune-armv8m-main} armv8m-main-fpv5-spd16&quot;<br>
&gt; -PACKAGE_EXTRA_ARCHS_tune-armv8m-maine-vfpv5spd16 =3D &quot;${PACKAGE=
_EXTRA_ARCHS_tune-armv8m-main} armv8m-maine-fpv5-spd16&quot;<br>
&gt; +ARMPKGARCH:tune-armv8m-main=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;armv8m-main&quot;<br>
&gt; +ARMPKGARCH:tune-armv8m-maine=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;armv8m-main&quot;<br>
&gt; +ARMPKGARCH:tune-armv8m-main-vfpv5spd16=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D &quot;armv8m-main&quot;<br>
&gt; +ARMPKGARCH:tune-armv8m-maine-vfpv5spd16=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D &quot;armv8m-main&quot;<br>
&gt; +TUNE_FEATURES:tune-armv8m-main=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;armv8m-main&quot;<br>
&gt; +TUNE_FEATURES:tune-armv8m-maine=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;${TUNE_FEATURES:tune-armv8m-main} ds=
p&quot;<br>
&gt; +TUNE_FEATURES:tune-armv8m-main-vfpv5spd16=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =3D &quot;${TUNE_FEATURES:tune-armv8m-main} vfpv5spd16&quot;<br>
&gt; +TUNE_FEATURES:tune-armv8m-maine-vfpv5spd16=C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D &quot;${TUNE_FEATURES:tune-armv8m-main-vfpv5spd16} dsp&quot;<br>
&gt; +PACKAGE_EXTRA_ARCHS:tune-armv8m-main=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D &quot;armv8m-main&quot;<br>
&gt; +PACKAGE_EXTRA_ARCHS:tune-armv8m-maine=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =3D &quot;${PACKAGE_EXTRA_ARCHS:tune-armv8m-main} armv8m-maine&=
quot;<br>
&gt; +PACKAGE_EXTRA_ARCHS:tune-armv8m-main-vfpv5spd16=C2=A0 =3D &quot;${PA=
CKAGE_EXTRA_ARCHS:tune-armv8m-main} armv8m-main-fpv5-spd16&quot;<br>
&gt; +PACKAGE_EXTRA_ARCHS:tune-armv8m-maine-vfpv5spd16 =3D &quot;${PACKAGE=
_EXTRA_ARCHS:tune-armv8m-main} armv8m-maine-fpv5-spd16&quot;<br>
&gt; diff --git a/meta-arm-bsp/conf/machine/include/arm/armv8r/arch-armv8r=
64.inc b/meta-arm-bsp/conf/machine/include/arm/armv8r/arch-armv8r64.inc<br>
&gt; index 92bfa31..f9383fc 100644<br>
&gt; --- a/meta-arm-bsp/conf/machine/include/arm/armv8r/arch-armv8r64.inc<=
br>
&gt; +++ b/meta-arm-bsp/conf/machine/include/arm/armv8r/arch-armv8r64.inc<=
br>
&gt; @@ -12,15 +12,15 @@ require conf/machine/include/arm/arch-arm64.inc<b=
r>
&gt;<br>
&gt;=C2=A0 # Little Endian base configs<br>
&gt;=C2=A0 AVAILTUNES +=3D &quot;armv8r armv8r-crc armv8r-crypto&quot;<br>
&gt; -ARMPKGARCH_tune-armv8r=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D &quot;armv8r&quot;<br>
&gt; -ARMPKGARCH_tune-armv8r-crc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 ?=3D &quot;armv8r&quot;<br>
&gt; -ARMPKGARCH_tune-armv8r-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0?=3D &quot;armv8r&quot;<br>
&gt; -TUNE_FEATURES_tune-armv8r=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D &quot;aarch64 armv8r&quot;<br>
&gt; -TUNE_FEATURES_tune-armv8r-crc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D &quot;${TUNE_FEATURES_tune-armv8r} crc&quot;<br>
&gt; -TUNE_FEATURES_tune-armv8r-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D &quot;${TUNE_FEATURES_tune-armv8r} crypto&quot;<br>
&gt; -PACKAGE_EXTRA_ARCHS_tune-armv8r=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D &quot;aarch64 armv8r&quot;<br>
&gt; -PACKAGE_EXTRA_ARCHS_tune-armv8r-crc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &=
quot;${PACKAGE_EXTRA_ARCHS_tune-armv8r} armv8r-crc&quot;<br>
&gt; -PACKAGE_EXTRA_ARCHS_tune-armv8r-crypto=C2=A0 =C2=A0 =C2=A0=3D &quot;=
${PACKAGE_EXTRA_ARCHS_tune-armv8r} armv8r-crypto&quot;<br>
&gt; -BASE_LIB_tune-armv8r=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;lib64&quot;<br>
&gt; -BASE_LIB_tune-armv8r-crc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;lib64&quot;<br>
&gt; -BASE_LIB_tune-armv8r-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =3D &quot;lib64&quot;<br>
&gt; +ARMPKGARCH:tune-armv8r=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D &quot;armv8r&quot;<br>
&gt; +ARMPKGARCH:tune-armv8r-crc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 ?=3D &quot;armv8r&quot;<br>
&gt; +ARMPKGARCH:tune-armv8r-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0?=3D &quot;armv8r&quot;<br>
&gt; +TUNE_FEATURES:tune-armv8r=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D &quot;aarch64 armv8r&quot;<br>
&gt; +TUNE_FEATURES:tune-armv8r-crc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D &quot;${TUNE_FEATURES:tune-armv8r} crc&quot;<br>
&gt; +TUNE_FEATURES:tune-armv8r-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D &quot;${TUNE_FEATURES:tune-armv8r} crypto&quot;<br>
&gt; +PACKAGE_EXTRA_ARCHS:tune-armv8r=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D &quot;aarch64 armv8r&quot;<br>
&gt; +PACKAGE_EXTRA_ARCHS:tune-armv8r-crc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &=
quot;${PACKAGE_EXTRA_ARCHS:tune-armv8r} armv8r-crc&quot;<br>
&gt; +PACKAGE_EXTRA_ARCHS:tune-armv8r-crypto=C2=A0 =C2=A0 =C2=A0=3D &quot;=
${PACKAGE_EXTRA_ARCHS:tune-armv8r} armv8r-crypto&quot;<br>
&gt; +BASE_LIB:tune-armv8r=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;lib64&quot;<br>
&gt; +BASE_LIB:tune-armv8r-crc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;lib64&quot;<br>
&gt; +BASE_LIB:tune-armv8r-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =3D &quot;lib64&quot;<br>
&gt; diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc b/meta=
-arm-bsp/conf/machine/include/corstone700.inc<br>
&gt; index 228fdd2..60ed422 100644<br>
&gt; --- a/meta-arm-bsp/conf/machine/include/corstone700.inc<br>
&gt; +++ b/meta-arm-bsp/conf/machine/include/corstone700.inc<br>
&gt; @@ -24,7 +24,7 @@ EXTRA_IMAGEDEPENDS +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 virtual/control-processor-firmware=C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt; -WKS_FILE_DEPENDS_append =3D &quot; ${EXTRA_IMAGEDEPENDS}&quot;<br>
&gt; +WKS_FILE_DEPENDS:append =3D &quot; ${EXTRA_IMAGEDEPENDS}&quot;<br>
&gt;<br>
&gt;=C2=A0 WKS_FILE ?=3D &quot;arm-reference-image.corstone700.wks&quot;<b=
r>
&gt;<br>
&gt; diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm0.inc b/me=
ta-arm-bsp/conf/machine/include/tune-cortexm0.inc<br>
&gt; index 7849ff6..5b29600 100755<br>
&gt; --- a/meta-arm-bsp/conf/machine/include/tune-cortexm0.inc<br>
&gt; +++ b/meta-arm-bsp/conf/machine/include/tune-cortexm0.inc<br>
&gt; @@ -9,6 +9,6 @@ TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&#39;TUNE=
_FEATURES&#39;, &#39;cortexm0&#39;, &#39; -mcpu=3Dcortex<br>
&gt;=C2=A0 require conf/machine/include/arm/arch-armv6m.inc<br>
&gt;<br>
&gt;=C2=A0 AVAILTUNES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D &quot;cortexm0&quot;<br=
>
&gt; -ARMPKGARCH_tune-cortexm0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D &quot;cortexm0&quot;<br>
&gt; -TUNE_FEATURES_tune-cortexm0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =3D &quot;${TUNE_FEATURES_tune-armv6m} cortexm0&quot;<br>
&gt; -PACKAGE_EXTRA_ARCHS_tune-cortexm0=C2=A0 =C2=A0 =C2=A0 =3D &quot;${PA=
CKAGE_EXTRA_ARCHS_tune-armv6m} cortexm0&quot;<br>
&gt; +ARMPKGARCH:tune-cortexm0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D &quot;cortexm0&quot;<br>
&gt; +TUNE_FEATURES:tune-cortexm0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =3D &quot;${TUNE_FEATURES:tune-armv6m} cortexm0&quot;<br>
&gt; +PACKAGE_EXTRA_ARCHS:tune-cortexm0=C2=A0 =C2=A0 =C2=A0 =3D &quot;${PA=
CKAGE_EXTRA_ARCHS:tune-armv6m} cortexm0&quot;<br>
&gt; diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm0plus.inc =
b/meta-arm-bsp/conf/machine/include/tune-cortexm0plus.inc<br>
&gt; index 83f8cac..1a3bee4 100755<br>
&gt; --- a/meta-arm-bsp/conf/machine/include/tune-cortexm0plus.inc<br>
&gt; +++ b/meta-arm-bsp/conf/machine/include/tune-cortexm0plus.inc<br>
&gt; @@ -9,6 +9,6 @@ TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&#39;TUNE=
_FEATURES&#39;, &#39;cortexm0-plus&#39;, &#39; -mcpu=3Dc<br>
&gt;=C2=A0 require conf/machine/include/arm/arch-armv6m.inc<br>
&gt;<br>
&gt;=C2=A0 AVAILTUNES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D &quot;cortexm0-plus&quo=
t;<br>
&gt; -ARMPKGARCH_tune-cortexm0-plus=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D =
&quot;cortexm0-plus&quot;<br>
&gt; -TUNE_FEATURES_tune-cortexm0-plus=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot=
;${TUNE_FEATURES_tune-armv6m} cortexm0-plus&quot;<br>
&gt; -PACKAGE_EXTRA_ARCHS_tune-cortexm0-plus =3D &quot;${PACKAGE_EXTRA_ARC=
HS_tune-armv6m} cortexm0-plus&quot;<br>
&gt; +ARMPKGARCH:tune-cortexm0-plus=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D =
&quot;cortexm0-plus&quot;<br>
&gt; +TUNE_FEATURES:tune-cortexm0-plus=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot=
;${TUNE_FEATURES:tune-armv6m} cortexm0-plus&quot;<br>
&gt; +PACKAGE_EXTRA_ARCHS:tune-cortexm0-plus =3D &quot;${PACKAGE_EXTRA_ARC=
HS:tune-armv6m} cortexm0-plus&quot;<br>
&gt; diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm1.inc b/me=
ta-arm-bsp/conf/machine/include/tune-cortexm1.inc<br>
&gt; index ed36361..16661f3 100755<br>
&gt; --- a/meta-arm-bsp/conf/machine/include/tune-cortexm1.inc<br>
&gt; +++ b/meta-arm-bsp/conf/machine/include/tune-cortexm1.inc<br>
&gt; @@ -9,6 +9,6 @@ TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&#39;TUNE=
_FEATURES&#39;, &#39;cortexm1&#39;, &#39; -mcpu=3Dcortex<br>
&gt;=C2=A0 require conf/machine/include/arm/arch-armv6m.inc<br>
&gt;<br>
&gt;=C2=A0 AVAILTUNES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D &quot;cortexm1&quot;<br=
>
&gt; -ARMPKGARCH_tune-cortexm1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D &quot;cortexm1&quot;<br>
&gt; -TUNE_FEATURES_tune-cortexm1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =3D &quot;${TUNE_FEATURES_tune-armv6m} cortexm1&quot;<br>
&gt; -PACKAGE_EXTRA_ARCHS_tune-cortexm1=C2=A0 =C2=A0 =C2=A0 =3D &quot;${PA=
CKAGE_EXTRA_ARCHS_tune-armv6m} cortexm1&quot;<br>
&gt; +ARMPKGARCH:tune-cortexm1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D &quot;cortexm1&quot;<br>
&gt; +TUNE_FEATURES:tune-cortexm1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =3D &quot;${TUNE_FEATURES:tune-armv6m} cortexm1&quot;<br>
&gt; +PACKAGE_EXTRA_ARCHS:tune-cortexm1=C2=A0 =C2=A0 =C2=A0 =3D &quot;${PA=
CKAGE_EXTRA_ARCHS:tune-armv6m} cortexm1&quot;<br>
&gt; diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm23.inc b/m=
eta-arm-bsp/conf/machine/include/tune-cortexm23.inc<br>
&gt; index e2e0a34..25780bc 100755<br>
&gt; --- a/meta-arm-bsp/conf/machine/include/tune-cortexm23.inc<br>
&gt; +++ b/meta-arm-bsp/conf/machine/include/tune-cortexm23.inc<br>
&gt; @@ -9,6 +9,6 @@ TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&#39;TUNE=
_FEATURES&#39;, &#39;cortexm23&#39;, &#39; -mcpu=3Dcorte<br>
&gt;=C2=A0 require conf/machine/include/arm/arch-armv8m-base.inc<br>
&gt;<br>
&gt;=C2=A0 AVAILTUNES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D &quot;cortexm23&quot;<br>
&gt; -ARMPKGARCH_tune-cortexm23=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D &quot;cortexm23&quot;<br>
&gt; -TUNE_FEATURES_tune-cortexm23=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &q=
uot;${TUNE_FEATURES_tune-armv8m-base} cortexm23&quot;<br>
&gt; -PACKAGE_EXTRA_ARCHS_tune-cortexm23=C2=A0 =C2=A0=3D &quot;${PACKAGE_E=
XTRA_ARCHS_tune-armv8m-base} cortexm23&quot;<br>
&gt; +ARMPKGARCH:tune-cortexm23=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D &quot;cortexm23&quot;<br>
&gt; +TUNE_FEATURES:tune-cortexm23=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &q=
uot;${TUNE_FEATURES:tune-armv8m-base} cortexm23&quot;<br>
&gt; +PACKAGE_EXTRA_ARCHS:tune-cortexm23=C2=A0 =C2=A0=3D &quot;${PACKAGE_E=
XTRA_ARCHS:tune-armv8m-base} cortexm23&quot;<br>
&gt; diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm3.inc b/me=
ta-arm-bsp/conf/machine/include/tune-cortexm3.inc<br>
&gt; index f837ad2..a6cb566 100755<br>
&gt; --- a/meta-arm-bsp/conf/machine/include/tune-cortexm3.inc<br>
&gt; +++ b/meta-arm-bsp/conf/machine/include/tune-cortexm3.inc<br>
&gt; @@ -9,6 +9,6 @@ TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&#39;TUNE=
_FEATURES&#39;, &#39;cortexm3&#39;, &#39; -mcpu=3Dcortex<br>
&gt;=C2=A0 require conf/machine/include/arm/arch-armv7m.inc<br>
&gt;<br>
&gt;=C2=A0 AVAILTUNES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D &quot;cortexm3&quot;<br=
>
&gt; -ARMPKGARCH_tune-cortexm3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D &quot;cortexm3&quot;<br>
&gt; -TUNE_FEATURES_tune-cortexm3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =3D &quot;${TUNE_FEATURES_tune-armv7m} cortexm3&quot;<br>
&gt; -PACKAGE_EXTRA_ARCHS_tune-cortexm3=C2=A0 =C2=A0 =C2=A0 =3D &quot;${PA=
CKAGE_EXTRA_ARCHS_tune-armv7m} cortexm3&quot;<br>
&gt; +ARMPKGARCH:tune-cortexm3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D &quot;cortexm3&quot;<br>
&gt; +TUNE_FEATURES:tune-cortexm3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =3D &quot;${TUNE_FEATURES:tune-armv7m} cortexm3&quot;<br>
&gt; +PACKAGE_EXTRA_ARCHS:tune-cortexm3=C2=A0 =C2=A0 =C2=A0 =3D &quot;${PA=
CKAGE_EXTRA_ARCHS:tune-armv7m} cortexm3&quot;<br>
&gt; diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm33.inc b/m=
eta-arm-bsp/conf/machine/include/tune-cortexm33.inc<br>
&gt; index 105a605..04d1fe2 100755<br>
&gt; --- a/meta-arm-bsp/conf/machine/include/tune-cortexm33.inc<br>
&gt; +++ b/meta-arm-bsp/conf/machine/include/tune-cortexm33.inc<br>
&gt; @@ -12,6 +12,6 @@ require conf/machine/include/arm/arch-armv8m-main.i=
nc<br>
&gt;=C2=A0 # optional.=C2=A0 So forcing below so that compiling works, but=
 this should<br>
&gt;=C2=A0 # be fixed in GCC<br>
&gt;=C2=A0 AVAILTUNES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D &quot;cortexm33&quot;<br>
&gt; -ARMPKGARCH_tune-cortexm33=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D &quot;cortexm33&quot;<br>
&gt; -TUNE_FEATURES_tune-cortexm33=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &q=
uot;${TUNE_FEATURES_tune-armv8m-maine-vfpv5spd16} cortexm33&quot;<br>
&gt; -PACKAGE_EXTRA_ARCHS_tune-cortexm33=C2=A0 =C2=A0=3D &quot;${PACKAGE_E=
XTRA_ARCHS_tune-armv8m-maine-vfpv5spd16} cortexm33e-fpv5-spd16&quot;<br>
&gt; +ARMPKGARCH:tune-cortexm33=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D &quot;cortexm33&quot;<br>
&gt; +TUNE_FEATURES:tune-cortexm33=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &q=
uot;${TUNE_FEATURES:tune-armv8m-maine-vfpv5spd16} cortexm33&quot;<br>
&gt; +PACKAGE_EXTRA_ARCHS:tune-cortexm33=C2=A0 =C2=A0=3D &quot;${PACKAGE_E=
XTRA_ARCHS:tune-armv8m-maine-vfpv5spd16} cortexm33e-fpv5-spd16&quot;<br>
&gt; diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm35p.inc b/=
meta-arm-bsp/conf/machine/include/tune-cortexm35p.inc<br>
&gt; index 7d73421..60e978f 100755<br>
&gt; --- a/meta-arm-bsp/conf/machine/include/tune-cortexm35p.inc<br>
&gt; +++ b/meta-arm-bsp/conf/machine/include/tune-cortexm35p.inc<br>
&gt; @@ -12,6 +12,6 @@ require conf/machine/include/arm/arch-armv8m-main.i=
nc<br>
&gt;=C2=A0 # optional.=C2=A0 So forcing below so that compiling works, but=
 this should<br>
&gt;=C2=A0 # be fixed in GCC<br>
&gt;=C2=A0 AVAILTUNES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D &quot;cortexm35p&quot;<br>
&gt; -ARMPKGARCH_tune-cortexm35p=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D &quot;cortexm35p&quot;<br>
&gt; -TUNE_FEATURES_tune-cortexm35p=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;$=
{TUNE_FEATURES_tune-armv8m-maine-vfpv5spd16} cortexm35p&quot;<br>
&gt; -PACKAGE_EXTRA_ARCHS_tune-cortexm35p=C2=A0 =3D &quot;${PACKAGE_EXTRA_=
ARCHS_tune-armv8m-maine-vfpv5spd16} cortexm35pe-fpv5-spd16&quot;<br>
&gt; +ARMPKGARCH:tune-cortexm35p=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D &quot;cortexm35p&quot;<br>
&gt; +TUNE_FEATURES:tune-cortexm35p=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;$=
{TUNE_FEATURES:tune-armv8m-maine-vfpv5spd16} cortexm35p&quot;<br>
&gt; +PACKAGE_EXTRA_ARCHS:tune-cortexm35p=C2=A0 =3D &quot;${PACKAGE_EXTRA_=
ARCHS:tune-armv8m-maine-vfpv5spd16} cortexm35pe-fpv5-spd16&quot;<br>
&gt; diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm4.inc b/me=
ta-arm-bsp/conf/machine/include/tune-cortexm4.inc<br>
&gt; index 8f498f5..e86622f 100755<br>
&gt; --- a/meta-arm-bsp/conf/machine/include/tune-cortexm4.inc<br>
&gt; +++ b/meta-arm-bsp/conf/machine/include/tune-cortexm4.inc<br>
&gt; @@ -9,6 +9,6 @@ TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&#39;TUNE=
_FEATURES&#39;, &#39;cortexm4&#39;, &#39; -mcpu=3Dcortex<br>
&gt;=C2=A0 require conf/machine/include/arm/arch-armv7em.inc<br>
&gt;<br>
&gt;=C2=A0 AVAILTUNES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D &quot;cortexm4&quot;<br=
>
&gt; -ARMPKGARCH_tune-cortexm4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D &quot;cortexm4&quot;<br>
&gt; -TUNE_FEATURES_tune-cortexm4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =3D &quot;${TUNE_FEATURES_tune-armv7em} cortexm4&quot;<br>
&gt; -PACKAGE_EXTRA_ARCHS_tune-cortexm4=C2=A0 =C2=A0 =C2=A0 =3D &quot;${PA=
CKAGE_EXTRA_ARCHS_tune-armv7em} cortexm4&quot;<br>
&gt; +ARMPKGARCH:tune-cortexm4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D &quot;cortexm4&quot;<br>
&gt; +TUNE_FEATURES:tune-cortexm4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =3D &quot;${TUNE_FEATURES:tune-armv7em} cortexm4&quot;<br>
&gt; +PACKAGE_EXTRA_ARCHS:tune-cortexm4=C2=A0 =C2=A0 =C2=A0 =3D &quot;${PA=
CKAGE_EXTRA_ARCHS:tune-armv7em} cortexm4&quot;<br>
&gt; diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm55.inc b/m=
eta-arm-bsp/conf/machine/include/tune-cortexm55.inc<br>
&gt; index b92aff1..493ad67 100755<br>
&gt; --- a/meta-arm-bsp/conf/machine/include/tune-cortexm55.inc<br>
&gt; +++ b/meta-arm-bsp/conf/machine/include/tune-cortexm55.inc<br>
&gt; @@ -9,6 +9,6 @@ TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&#39;TUNE=
_FEATURES&#39;, &#39;cortexm55&#39;, &#39; -mcpu=3Dcorte<br>
&gt;=C2=A0 require conf/machine/include/arm/arch-armv8-1m-main.inc<br>
&gt;<br>
&gt;=C2=A0 AVAILTUNES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D &quot;cortexm55&quot;<b=
r>
&gt; -ARMPKGARCH_tune-cortexm55=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D &quot;cortexm55&quot;<br>
&gt; -TUNE_FEATURES_tune-cortexm55=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D &quot;${TUNE_FEATURES_tune-armv8-1m-main} cortexm55&quot;<br>
&gt; -PACKAGE_EXTRA_ARCHS_tune-cortexm55=C2=A0 =C2=A0 =C2=A0=3D &quot;${PA=
CKAGE_EXTRA_ARCHS_tune-armv8-1m-main} cortexm55&quot;<br>
&gt; +ARMPKGARCH:tune-cortexm55=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D &quot;cortexm55&quot;<br>
&gt; +TUNE_FEATURES:tune-cortexm55=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D &quot;${TUNE_FEATURES:tune-armv8-1m-main} cortexm55&quot;<br>
&gt; +PACKAGE_EXTRA_ARCHS:tune-cortexm55=C2=A0 =C2=A0 =C2=A0=3D &quot;${PA=
CKAGE_EXTRA_ARCHS:tune-armv8-1m-main} cortexm55&quot;<br>
&gt; diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm7.inc b/me=
ta-arm-bsp/conf/machine/include/tune-cortexm7.inc<br>
&gt; index 21b7c01..6434ec6 100755<br>
&gt; --- a/meta-arm-bsp/conf/machine/include/tune-cortexm7.inc<br>
&gt; +++ b/meta-arm-bsp/conf/machine/include/tune-cortexm7.inc<br>
&gt; @@ -9,6 +9,6 @@ TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&#39;TUNE=
_FEATURES&#39;, &#39;cortexm7&#39;, &#39; -mcpu=3Dcortex<br>
&gt;=C2=A0 require conf/machine/include/arm/arch-armv7em.inc<br>
&gt;<br>
&gt;=C2=A0 AVAILTUNES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D &quot;cortexm7&quot;<br=
>
&gt; -ARMPKGARCH_tune-cortexm7=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D &quot;cortexm7&quot;<br>
&gt; -TUNE_FEATURES_tune-cortexm7=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =3D &quot;${TUNE_FEATURES_tune-armv7em} cortexm7&quot;<br>
&gt; -PACKAGE_EXTRA_ARCHS_tune-cortexm7=C2=A0 =C2=A0 =C2=A0 =3D &quot;${PA=
CKAGE_EXTRA_ARCHS_tune-armv7em} cortexm7&quot;<br>
&gt; +ARMPKGARCH:tune-cortexm7=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D &quot;cortexm7&quot;<br>
&gt; +TUNE_FEATURES:tune-cortexm7=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =3D &quot;${TUNE_FEATURES:tune-armv7em} cortexm7&quot;<br>
&gt; +PACKAGE_EXTRA_ARCHS:tune-cortexm7=C2=A0 =C2=A0 =C2=A0 =3D &quot;${PA=
CKAGE_EXTRA_ARCHS:tune-armv7em} cortexm7&quot;<br>
&gt; diff --git a/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc b/=
meta-arm-bsp/conf/machine/include/tune-neoversen1.inc<br>
&gt; index 04e28ee..6999805 100644<br>
&gt; --- a/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc<br>
&gt; +++ b/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc<br>
&gt; @@ -8,7 +8,7 @@ require conf/machine/include/arm/arch-armv8-2a.inc<br=
>
&gt;<br>
&gt;=C2=A0 # Little Endian base configs<br>
&gt;=C2=A0 AVAILTUNES +=3D &quot;neoversen1&quot;<br>
&gt; -ARMPKGARCH_tune-neoversen1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0=3D &quot;neoversen1&quot;<br>
&gt; -TUNE_FEATURES_tune-neoversen1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D =
&quot;aarch64 neoversen1 crc crypto&quot;<br>
&gt; -PACKAGE_EXTRA_ARCHS_tune-neoversen1=C2=A0 =C2=A0 =3D &quot;${PACKAGE=
_EXTRA_ARCHS_tune-armv8a-crc-crypto} neoversen1&quot;<br>
&gt; -BASE_LIB_tune-neoversen1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D &quot;lib64&quot;<br>
&gt; +ARMPKGARCH:tune-neoversen1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0=3D &quot;neoversen1&quot;<br>
&gt; +TUNE_FEATURES:tune-neoversen1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D =
&quot;aarch64 neoversen1 crc crypto&quot;<br>
&gt; +PACKAGE_EXTRA_ARCHS:tune-neoversen1=C2=A0 =C2=A0 =3D &quot;${PACKAGE=
_EXTRA_ARCHS:tune-armv8a-crc-crypto} neoversen1&quot;<br>
&gt; +BASE_LIB:tune-neoversen1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D &quot;lib64&quot;<br>
&gt; diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf=
/machine/n1sdp.conf<br>
&gt; index 2126cc1..e80580d 100644<br>
&gt; --- a/meta-arm-bsp/conf/machine/n1sdp.conf<br>
&gt; +++ b/meta-arm-bsp/conf/machine/n1sdp.conf<br>
&gt; @@ -15,7 +15,7 @@ SERIAL_CONSOLES =3D &quot;115200;ttyAMA0&quot;<br>
&gt;=C2=A0 # Set default WKS<br>
&gt;=C2=A0 WKS_FILE ?=3D &quot;n1sdp-efidisk.wks&quot;<br>
&gt;=C2=A0 IMAGE_EFI_BOOT_FILES ?=3D &quot;n1sdp-multi-chip.dtb n1sdp-sing=
le-chip.dtb&quot;<br>
&gt; -WKS_FILE_DEPENDS_append =3D &quot; ${EXTRA_IMAGEDEPENDS}&quot;<br>
&gt; +WKS_FILE_DEPENDS:append =3D &quot; ${EXTRA_IMAGEDEPENDS}&quot;<br>
&gt;<br>
&gt;=C2=A0 # Use kernel provided by yocto<br>
&gt;=C2=A0 PREFERRED_PROVIDER_virtual/kernel ?=3D &quot;linux-yocto&quot;<=
br>
&gt; diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/con=
f/machine/sgi575.conf<br>
&gt; index cf91266..82009f3 100644<br>
&gt; --- a/meta-arm-bsp/conf/machine/sgi575.conf<br>
&gt; +++ b/meta-arm-bsp/conf/machine/sgi575.conf<br>
&gt; @@ -26,4 +26,4 @@ MACHINE_FEATURES +=3D &quot;efi&quot;<br>
&gt;=C2=A0 IMAGE_FSTYPES +=3D &quot;cpio.gz wic&quot;<br>
&gt;<br>
&gt;=C2=A0 WKS_FILE ?=3D &quot;sgi575-efidisk.wks&quot;<br>
&gt; -WKS_FILE_DEPENDS_append =3D &quot; ${EXTRA_IMAGEDEPENDS}&quot;<br>
&gt; +WKS_FILE_DEPENDS:append =3D &quot; ${EXTRA_IMAGEDEPENDS}&quot;<br>
&gt; diff --git a/meta-arm-bsp/recipes-bsp/boot-firmware/<a href=3D"http:/=
/boot-firmware_git.bb" rel=3D"noreferrer" target=3D"_blank">boot-firmware_g=
it.bb</a> b/meta-arm-bsp/recipes-bsp/boot-firmware/<a href=3D"http://boot-f=
irmware_git.bb" rel=3D"noreferrer" target=3D"_blank">boot-firmware_git.bb</=
a><br>
&gt; index c48e586..cfcb98d 100644<br>
&gt; --- a/meta-arm-bsp/recipes-bsp/boot-firmware/<a href=3D"http://boot-f=
irmware_git.bb" rel=3D"noreferrer" target=3D"_blank">boot-firmware_git.bb</=
a><br>
&gt; +++ b/meta-arm-bsp/recipes-bsp/boot-firmware/<a href=3D"http://boot-f=
irmware_git.bb" rel=3D"noreferrer" target=3D"_blank">boot-firmware_git.bb</=
a><br>
&gt; @@ -50,10 +50,10 @@ do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --out ${D}/firmware/spitoc.bin<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -FILES_${PN} =3D &quot;/firmware&quot;<br>
&gt; +FILES:${PN} =3D &quot;/firmware&quot;<br>
&gt;=C2=A0 SYSROOT_DIRS +=3D &quot;/firmware&quot;<br>
&gt;=C2=A0 # Skip QA check for relocations in .text of elf binaries<br>
&gt; -INSANE_SKIP_${PN} =3D &quot;textrel&quot;<br>
&gt; +INSANE_SKIP:${PN} =3D &quot;textrel&quot;<br>
&gt;<br>
&gt;=C2=A0 do_deploy() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Copy the images to deploy directory<br>
&gt; diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapp=
er-aarch64-fvp-baser-aemv8r64.inc b/meta-arm-bsp/recipes-bsp/boot-wrapper-a=
arch64/boot-wrapper-aarch64-fvp-baser-aemv8r64.inc<br>
&gt; index bd8e993..f1bf614 100644<br>
&gt; --- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarc=
h64-fvp-baser-aemv8r64.inc<br>
&gt; +++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarc=
h64-fvp-baser-aemv8r64.inc<br>
&gt; @@ -1,7 +1,7 @@<br>
&gt;=C2=A0 COMPATIBLE_MACHINE =3D &quot;fvp-baser-aemv8r64&quot;<br>
&gt;<br>
&gt; -FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/files/${MACHINE}:&quot=
;<br>
&gt; -SRC_URI_append =3D &quot; \<br>
&gt; +FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/files/${MACHINE}:&quot=
;<br>
&gt; +SRC_URI:append =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0001-Decouple-V2M_SYS-config-by-auto-detec=
t-dtb-node.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0002-arch64-Introduce-EL2-boot-code-for-v8=
-r64.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0003-Allow-enable-psci-to-choose-between-s=
mc-and-hvc.patch \<br>
&gt; diff --git a/meta-arm-bsp/recipes-bsp/external-system/<a href=3D"http=
://external-system_0.1.0.bb" rel=3D"noreferrer" target=3D"_blank">external-=
system_0.1.0.bb</a> b/meta-arm-bsp/recipes-bsp/external-system/<a href=3D"h=
ttp://external-system_0.1.0.bb" rel=3D"noreferrer" target=3D"_blank">extern=
al-system_0.1.0.bb</a><br>
&gt; index a8052c6..1ab745e 100644<br>
&gt; --- a/meta-arm-bsp/recipes-bsp/external-system/<a href=3D"http://exte=
rnal-system_0.1.0.bb" rel=3D"noreferrer" target=3D"_blank">external-system_=
0.1.0.bb</a><br>
&gt; +++ b/meta-arm-bsp/recipes-bsp/external-system/<a href=3D"http://exte=
rnal-system_0.1.0.bb" rel=3D"noreferrer" target=3D"_blank">external-system_=
0.1.0.bb</a><br>
&gt; @@ -34,7 +34,7 @@ do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -D -p -m 0644 ${B}/product/${PRODUCT}/fir=
mware/release/bin/firmware.bin ${D}/firmware/es_flashfw.bin<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -FILES_${PN} =3D &quot;/firmware&quot;<br>
&gt; +FILES:${PN} =3D &quot;/firmware&quot;<br>
&gt;=C2=A0 SYSROOT_DIRS +=3D &quot;/firmware&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit deploy<br>
&gt; diff --git a/meta-arm-bsp/recipes-bsp/images/<a href=3D"http://n1sdp-=
board-firmware_2020.07.27.bb" rel=3D"noreferrer" target=3D"_blank">n1sdp-bo=
ard-firmware_2020.07.27.bb</a> b/meta-arm-bsp/recipes-bsp/images/<a href=3D=
"http://n1sdp-board-firmware_2020.07.27.bb" rel=3D"noreferrer" target=3D"_b=
lank">n1sdp-board-firmware_2020.07.27.bb</a><br>
&gt; index 1551ac9..228ed92 100644<br>
&gt; --- a/meta-arm-bsp/recipes-bsp/images/<a href=3D"http://n1sdp-board-f=
irmware_2020.07.27.bb" rel=3D"noreferrer" target=3D"_blank">n1sdp-board-fir=
mware_2020.07.27.bb</a><br>
&gt; +++ b/meta-arm-bsp/recipes-bsp/images/<a href=3D"http://n1sdp-board-f=
irmware_2020.07.27.bb" rel=3D"noreferrer" target=3D"_blank">n1sdp-board-fir=
mware_2020.07.27.bb</a><br>
&gt; @@ -24,7 +24,7 @@ do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cp -Rp --no-preserve=3Downership ${S}/* ${D}${INS=
TALL_DIR}<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -FILES_${PN} =3D &quot;${INSTALL_DIR}&quot;<br>
&gt; +FILES:${PN} =3D &quot;${INSTALL_DIR}&quot;<br>
&gt;=C2=A0 SYSROOT_DIRS +=3D &quot;${INSTALL_DIR}&quot;<br>
&gt;<br>
&gt;=C2=A0 do_deploy() {<br>
&gt; diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.=
inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc<br>
&gt; index 9e1e1c2..a72cbd9 100644<br>
&gt; --- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc<br>
&gt; +++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc<br>
&gt; @@ -4,4 +4,4 @@ COMPATIBLE_MACHINE =3D &quot;juno&quot;<br>
&gt;<br>
&gt;=C2=A0 SCP_PLATFORM =3D &quot;juno&quot;<br>
&gt;=C2=A0 FW_TARGETS =3D &quot;scp&quot;<br>
&gt; -FW_INSTALL_append =3D &quot; romfw_bypass&quot;<br>
&gt; +FW_INSTALL:append =3D &quot; romfw_bypass&quot;<br>
&gt; diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp=
.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc<br>
&gt; index 0772364..01b8349 100644<br>
&gt; --- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc<br=
>
&gt; +++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc<br=
>
&gt; @@ -3,9 +3,9 @@<br>
&gt;=C2=A0 SCP_PLATFORM=C2=A0 =3D &quot;n1sdp&quot;<br>
&gt;=C2=A0 SCP_LOG_LEVEL =3D &quot;INFO&quot;<br>
&gt;<br>
&gt; -FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/files/:&quot;<br>
&gt; +FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/files/:&quot;<br>
&gt;<br>
&gt; -SRC_URI_append =3D &quot; \<br>
&gt; +SRC_URI:append =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0file://enabling-coresight-debug-non-secure-access.=
patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt; @@ -14,7 +14,7 @@ COMPATIBLE_MACHINE_n1sdp =3D &quot;n1sdp&quot;<br>
&gt;=C2=A0 DEPENDS +=3D &quot;fiptool-native&quot;<br>
&gt;=C2=A0 DEPENDS +=3D &quot;virtual/trusted-firmware-a&quot;<br>
&gt;<br>
&gt; -do_install_append() {<br>
&gt; +do_install:append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0fiptool \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--scp-fw &quot;${D}/firmware/scp_ram=
fw.bin&quot; \<br>
&gt; diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.i=
nc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc<br>
&gt; index 62a0e25..761a370 100644<br>
&gt; --- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc<br>
&gt; +++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc<br>
&gt; @@ -5,7 +5,7 @@ SRCREV =3D &quot;67a3612716ad3b839da4209a173404692607=
c5a1&quot;<br>
&gt;=C2=A0 PV =3D &quot;2.8+git${SRCPV}&quot;<br>
&gt;<br>
&gt;=C2=A0 # This is incorporated into the SRCREV above<br>
&gt; -SRC_URI_remove =3D &quot; \<br>
&gt; +SRC_URI:remove =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0001-smt-Make-status-and-length-volatile-f=
or-mod_smt_memo.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt; diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firm=
ware-a-corstone500.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/truste=
d-firmware-a-corstone500.inc<br>
&gt; index 4d3432c..acd9e3d 100644<br>
&gt; --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
corstone500.inc<br>
&gt; +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
corstone500.inc<br>
&gt; @@ -7,7 +7,7 @@ TFA_UBOOT =3D &quot;1&quot;<br>
&gt;=C2=A0 TFA_BUILD_TARGET =3D &quot;all fip&quot;<br>
&gt;=C2=A0 TFA_INSTALL_TARGET =3D &quot;bl1.bin fip.bin&quot;<br>
&gt;<br>
&gt; -EXTRA_OEMAKE_append =3D &quot; \<br>
&gt; +EXTRA_OEMAKE:append =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 ARCH=3Daarch32 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 FVP_HW_CONFIG_DTS=3Dfdts/a5ds.dts \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 ARM_ARCH_MAJOR=3D7 \<br>
&gt; diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firm=
ware-a-corstone700.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/truste=
d-firmware-a-corstone700.inc<br>
&gt; index 5755005..d600de9 100644<br>
&gt; --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
corstone700.inc<br>
&gt; +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
corstone700.inc<br>
&gt; @@ -7,7 +7,7 @@ TFA_UBOOT =3D &quot;1&quot;<br>
&gt;=C2=A0 TFA_BUILD_TARGET =3D &quot;all fip&quot;<br>
&gt;=C2=A0 TFA_INSTALL_TARGET =3D &quot;fip.bin&quot;<br>
&gt;<br>
&gt; -EXTRA_OEMAKE_append =3D &quot; \<br>
&gt; +EXTRA_OEMAKE:append =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 ARCH=3Daarch32 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 TARGET_PLATFORM=3D${TFA_TARGET_PLATFORM} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 AARCH32_SP=3Dsp_min \<br>
&gt; diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firm=
ware-a-fvp-arm32.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-=
firmware-a-fvp-arm32.inc<br>
&gt; index 117c25f..fdaadb9 100644<br>
&gt; --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
fvp-arm32.inc<br>
&gt; +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
fvp-arm32.inc<br>
&gt; @@ -5,7 +5,7 @@ TFA_PLATFORM =3D &quot;fvp&quot;<br>
&gt;=C2=A0 TFA_UBOOT =3D &quot;1&quot;<br>
&gt;=C2=A0 TFA_BUILD_TARGET =3D &quot;dtbs bl1 bl32 fip&quot;<br>
&gt;<br>
&gt; -EXTRA_OEMAKE_append =3D &quot; \<br>
&gt; +EXTRA_OEMAKE:append =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ARCH=3Daarch32 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 AARCH32_SP=3Dsp_min \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firm=
ware-a-juno.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a-juno.inc<br>
&gt; index 3aa8520..c7293c0 100644<br>
&gt; --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
juno.inc<br>
&gt; +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
juno.inc<br>
&gt; @@ -10,4 +10,4 @@ TFA_BUILD_TARGET =3D &quot;bl1 bl2 bl31 dtbs fip&qu=
ot;<br>
&gt;=C2=A0 # Juno needs the System Control Processor Firmware<br>
&gt;=C2=A0 DEPENDS +=3D &quot;virtual/control-processor-firmware&quot;<br>
&gt;<br>
&gt; -EXTRA_OEMAKE_append =3D &quot; SCP_BL2=3D${RECIPE_SYSROOT}/firmware/=
scp_ramfw.bin&quot;<br>
&gt; +EXTRA_OEMAKE:append =3D &quot; SCP_BL2=3D${RECIPE_SYSROOT}/firmware/=
scp_ramfw.bin&quot;<br>
&gt; diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firm=
ware-a_2.%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-f=
irmware-a_2.%.bbappend<br>
&gt; index e5b10ff..f317cb8 100644<br>
&gt; --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_=
2.%.bbappend<br>
&gt; +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_=
2.%.bbappend<br>
&gt; @@ -1,3 +1,3 @@<br>
&gt; -FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/files/:&quot;<br>
&gt; +FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/files/:&quot;<br>
&gt;<br>
&gt;=C2=A0 # Don&#39;t put machine customisation in here, use a versioned =
append.<br>
&gt; \ No newline at end of file<br>
&gt; diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta=
-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend<br>
&gt; index 692b4eb..3631c9e 100644<br>
&gt; --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend<br>
&gt; +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend<br>
&gt; @@ -1,13 +1,13 @@<br>
&gt;=C2=A0 # Machine specific u-boot<br>
&gt;<br>
&gt; -FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
&gt; +FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
&gt;<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # FVP BASE<br>
&gt;=C2=A0 #<br>
&gt; -SRC_URI_append_fvp-base =3D &quot; file://bootargs.cfg&quot;<br>
&gt; +SRC_URI:append_fvp-base =3D &quot; file://bootargs.cfg&quot;<br>
&gt;<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # FVP BASE ARM32<br>
&gt;=C2=A0 #<br>
&gt; -SRC_URI_append_fvp-base-arm32 =3D &quot; file://0001-Add-vexpress_ae=
mv8a_aarch32-variant.patch&quot;<br>
&gt; +SRC_URI:append_fvp-base-arm32 =3D &quot; file://0001-Add-vexpress_ae=
mv8a_aarch32-variant.patch&quot;<br>
&gt; diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bbappend =
b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bbappend<br>
&gt; index 00b40e5..54d8a1f 100644<br>
&gt; --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bbappend<br>
&gt; +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bbappend<br>
&gt; @@ -1,8 +1,8 @@<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # Corstone700 KMACHINE<br>
&gt;=C2=A0 #<br>
&gt; -FILESEXTRAPATHS_prepend_corstone700 :=3D &quot;${THISDIR}/${BP}/cors=
tone700:&quot;<br>
&gt; -SRC_URI_append_corstone700 =3D &quot; file://0001-arm-Add-corstone70=
0-platform.patch \<br>
&gt; +FILESEXTRAPATHS:prepend_corstone700 :=3D &quot;${THISDIR}/${BP}/cors=
tone700:&quot;<br>
&gt; +SRC_URI:append_corstone700 =3D &quot; file://0001-arm-Add-corstone70=
0-platform.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-boot-add-bootx=
-command-to-start-XiP-images.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-boot-starting-=
the-XIP-kernel-using-bootx-command.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-arm-enabling-t=
he-arch_timer-driver.patch&quot;<br>
&gt; diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend =
b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend<br>
&gt; index add6a78..113f26d 100644<br>
&gt; --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend<br>
&gt; +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend<br>
&gt; @@ -1,16 +1,16 @@<br>
&gt;=C2=A0 # Machine specific u-boot<br>
&gt;<br>
&gt;=C2=A0 THIS_DIR :=3D &quot;${THISDIR}&quot;<br>
&gt; -FILESEXTRAPATHS_prepend =3D &quot;${THIS_DIR}/${BP}:&quot;<br>
&gt; +FILESEXTRAPATHS:prepend =3D &quot;${THIS_DIR}/${BP}:&quot;<br>
&gt;<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # Corstone-500 MACHINE<br>
&gt;=C2=A0 #<br>
&gt; -SRC_URI_append_corstone500 =3D &quot; \<br>
&gt; +SRC_URI:append_corstone500 =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0file://0001-armv7-adding-generic-timer-access-through-MMIO.patch \<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0file://0002-board-arm-add-corstone500-board.patch&quot;<br>
&gt;<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # Juno KMACHINE<br>
&gt;=C2=A0 #<br>
&gt; -SRC_URI_append_juno =3D &quot; file://u-boot_vexpress_uenv.patch&quo=
t;<br>
&gt; +SRC_URI:append_juno =3D &quot; file://u-boot_vexpress_uenv.patch&quo=
t;<br>
&gt; diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.07.bbappend =
b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.07.bbappend<br>
&gt; index ad6147f..7c5384e 100644<br>
&gt; --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.07.bbappend<br>
&gt; +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.07.bbappend<br>
&gt; @@ -1,12 +1,12 @@<br>
&gt;=C2=A0 # Machine specific u-boot<br>
&gt;<br>
&gt;=C2=A0 THIS_DIR :=3D &quot;${THISDIR}&quot;<br>
&gt; -FILESEXTRAPATHS_prepend =3D &quot;${THIS_DIR}/${BP}:&quot;<br>
&gt; +FILESEXTRAPATHS:prepend =3D &quot;${THIS_DIR}/${BP}:&quot;<br>
&gt;<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # TC0 MACHINE<br>
&gt;=C2=A0 #<br>
&gt; -SRC_URI_append_tc0 =3D &quot; \<br>
&gt; +SRC_URI:append_tc0 =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0001-board-armltd-Remove-bootargs-from-Tot=
al-Compute-conf.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0002-cmd-part-Correct-error-handling.patch=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://bootargs.cfg \<br>
&gt; diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc b/=
meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc<br>
&gt; index 0009e85..3749d01 100644<br>
&gt; --- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc<br>
&gt; +++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc<br>
&gt; @@ -1,6 +1,6 @@<br>
&gt; -FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/files:&quot;<br>
&gt; +FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/files:&quot;<br>
&gt;<br>
&gt; -SRC_URI_append =3D &quot; file://Add-mem-regions-to-support.patch;pa=
tchdir=3D${S}/edk2-platforms \<br>
&gt; +SRC_URI:append =3D &quot; file://Add-mem-regions-to-support.patch;pa=
tchdir=3D${S}/edk2-platforms \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0file://Introduce-platform-DXE-driver.patch;patchdir=3D${S}/edk2-plat=
forms \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0file://Enable-N1SDP-platform-specific-configs.patch;patchdir=3D${S}/=
edk2-platforms \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0file://Configuration-Manager-for-N1SDP.patch;patchdir=3D${S}/edk2-pl=
atforms &quot;<br>
&gt; @@ -19,7 +19,7 @@ COMPATIBLE_MACHINE =3D &quot;n1sdp&quot;<br>
&gt;=C2=A0 EFIDIR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot=
;/EFI/BOOT&quot;<br>
&gt;=C2=A0 EFI_BOOT_IMAGE=C2=A0 =C2=A0 =C2=A0=3D &quot;bootaa64.efi&quot;<=
br>
&gt;<br>
&gt; -do_deploy_append() {<br>
&gt; +do_deploy:append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 EFIPATH=3D$(echo &quot;${EFIDIR}&quot; | sed &#39=
;s/\//\\/g&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 printf &#39;FS2:%s\%s\n&#39; &quot;$EFIPATH&quot;=
 &quot;${EFI_BOOT_IMAGE}&quot; &gt; ${DEPLOYDIR}/startup.nsh<br>
&gt;=C2=A0 }<br>
&gt; diff --git a/meta-arm-bsp/recipes-core/init-ifupdown/init-ifupdown_1.=
0.bbappend b/meta-arm-bsp/recipes-core/init-ifupdown/init-ifupdown_1.0.bbap=
pend<br>
&gt; index 2c5f61a..65e37d8 100644<br>
&gt; --- a/meta-arm-bsp/recipes-core/init-ifupdown/init-ifupdown_1.0.bbapp=
end<br>
&gt; +++ b/meta-arm-bsp/recipes-core/init-ifupdown/init-ifupdown_1.0.bbapp=
end<br>
&gt; @@ -5,4 +5,4 @@<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&gt;<br>
&gt; -FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/files:&quot;<br>
&gt; +FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/files:&quot;<br>
&gt; diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.in=
c b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc<br>
&gt; index ef87fd6..0fc2d34 100644<br>
&gt; --- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc<br>
&gt; +++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc<br>
&gt; @@ -13,12 +13,12 @@ ARMBSPFILESPATHS :=3D &quot;${THISDIR}:${THISDIR}=
/files:&quot;<br>
&gt;<br>
&gt;=C2=A0 # Arm platforms kmeta<br>
&gt;=C2=A0 SRC_URI_KMETA =3D &quot;file://arm-platforms-kmeta;type=3Dkmeta=
;name=3Darm-platforms-kmeta;destsuffix=3Darm-platforms-kmeta&quot;<br>
&gt; -SRC_URI_append_fvp-base =3D &quot; ${SRC_URI_KMETA}&quot;<br>
&gt; -SRC_URI_append_fvp-base-arm32 =3D &quot; ${SRC_URI_KMETA}&quot;<br>
&gt; -SRC_URI_append_juno =3D &quot; ${SRC_URI_KMETA}&quot;<br>
&gt; -SRC_URI_append_n1sdp =3D &quot; ${SRC_URI_KMETA}&quot;<br>
&gt; -SRC_URI_append_fvp-baser-aemv8r64 =3D &quot; ${SRC_URI_KMETA}&quot;<=
br>
&gt; -SRCREV_arm-platforms-kmeta =3D &quot;6147e82375aa9df8f2a162d42ea6406=
c79c854c5&quot;<br>
&gt; +SRC_URI:append_fvp-base =3D &quot; ${SRC_URI_KMETA}&quot;<br>
&gt; +SRC_URI:append_fvp-base-arm32 =3D &quot; ${SRC_URI_KMETA}&quot;<br>
&gt; +SRC_URI:append_juno =3D &quot; ${SRC_URI_KMETA}&quot;<br>
&gt; +SRC_URI:append_n1sdp =3D &quot; ${SRC_URI_KMETA}&quot;<br>
&gt; +SRC_URI:append_fvp-baser-aemv8r64 =3D &quot; ${SRC_URI_KMETA}&quot;<=
br>
&gt; +SRCREV:arm-platforms-kmeta =3D &quot;6147e82375aa9df8f2a162d42ea6406=
c79c854c5&quot;<br>
&gt;<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # Corstone-500 KMACHINE<br>
&gt; @@ -30,15 +30,15 @@ COMPATIBLE_MACHINE_corstone500 =3D &quot;corstone=
500&quot;<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 COMPATIBLE_MACHINE_fvp-base =3D &quot;fvp-base&quot;<br>
&gt;=C2=A0 KMACHINE_fvp-base =3D &quot;fvp&quot;<br>
&gt; -FILESEXTRAPATHS_prepend_fvp-base :=3D &quot;${ARMBSPFILESPATHS}&quot=
;<br>
&gt; +FILESEXTRAPATHS:prepend_fvp-base :=3D &quot;${ARMBSPFILESPATHS}&quot=
;<br>
&gt;<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # FVP BASE ARM32 KMACHINE<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 COMPATIBLE_MACHINE_fvp-base-arm32 =3D &quot;fvp-base-arm32&quot=
;<br>
&gt;=C2=A0 KMACHINE_fvp-base-arm32 =3D &quot;fvp-arm32&quot;<br>
&gt; -FILESEXTRAPATHS_prepend_fvp-base-arm32 :=3D &quot;${ARMBSPFILESPATHS=
}&quot;<br>
&gt; -SRC_URI_append_fvp-base-arm32 =3D &quot; file://fvp-base-arm32-dts.p=
atch \<br>
&gt; +FILESEXTRAPATHS:prepend_fvp-base-arm32 :=3D &quot;${ARMBSPFILESPATHS=
}&quot;<br>
&gt; +SRC_URI:append_fvp-base-arm32 =3D &quot; file://fvp-base-arm32-dts.p=
atch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-ARM-ve=
xpress-enable-GICv3.patch&quot;<br>
&gt;<br>
&gt;=C2=A0 #<br>
&gt; @@ -48,8 +48,8 @@ COMPATIBLE_MACHINE_juno =3D &quot;juno&quot;<br>
&gt;=C2=A0 KMACHINE_juno =3D &quot;juno&quot;<br>
&gt;=C2=A0 KBUILD_DEFCONFIG_juno =3D &quot;defconfig&quot;<br>
&gt;=C2=A0 KCONFIG_MODE_juno =3D &quot;--alldefconfig&quot;<br>
&gt; -FILESEXTRAPATHS_prepend_juno :=3D &quot;${ARMBSPFILESPATHS}&quot;<br=
>
&gt; -SRC_URI_append_juno =3D &quot; \<br>
&gt; +FILESEXTRAPATHS:prepend_juno :=3D &quot;${ARMBSPFILESPATHS}&quot;<br=
>
&gt; +SRC_URI:append_juno =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0001-mailbox-add-support-for-doorbell-sign=
al-mode-control.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0002-dt-bindings-mailbox-add-bindings-to-s=
upport-ARM-MHU-.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0003-mailbox-arm_mhu-migrate-to-threaded-i=
rq-handler.patch \<br>
&gt; @@ -74,8 +74,8 @@ KCONFIG_MODE_sgi575 =3D &quot;--alldefconfig&quot;<=
br>
&gt;=C2=A0 COMPATIBLE_MACHINE_tc0 =3D &quot;tc0&quot;<br>
&gt;=C2=A0 KMACHINE_tc0 =3D &quot;tc0&quot;<br>
&gt;=C2=A0 KCONFIG_MODE_tc0 =3D &quot;--alldefconfig&quot;<br>
&gt; -FILESEXTRAPATHS_prepend_tc0 :=3D &quot;${ARMBSPFILESPATHS}&quot;<br>
&gt; -SRC_URI_append_tc0 =3D &quot; \<br>
&gt; +FILESEXTRAPATHS:prepend_tc0 :=3D &quot;${ARMBSPFILESPATHS}&quot;<br>
&gt; +SRC_URI:append_tc0 =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://defconfig \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0001-drm-Add-component-aware-simple-encode=
r.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0002-drm-arm-komeda-add-RENDER-capability-=
to-the-device-n.patch \<br>
&gt; @@ -103,12 +103,12 @@ SRC_URI_append_tc0 =3D &quot; \<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # N1SDP KMACHINE<br>
&gt;=C2=A0 #<br>
&gt; -FILESEXTRAPATHS_prepend_n1sdp :=3D &quot;${THISDIR}/linux-yocto-5.10=
/n1sdp:&quot;<br>
&gt; +FILESEXTRAPATHS:prepend_n1sdp :=3D &quot;${THISDIR}/linux-yocto-5.10=
/n1sdp:&quot;<br>
&gt;=C2=A0 COMPATIBLE_MACHINE_n1sdp =3D &quot;n1sdp&quot;<br>
&gt;=C2=A0 KBUILD_DEFCONFIG_n1sdp =3D &quot;defconfig&quot;<br>
&gt;=C2=A0 KCONFIG_MODE_n1sdp =3D &quot;--alldefconfig&quot;<br>
&gt; -FILESEXTRAPATHS_prepend_n1sdp :=3D &quot;${ARMBSPFILESPATHS}&quot;<b=
r>
&gt; -SRC_URI_append_n1sdp =3D &quot; \<br>
&gt; +FILESEXTRAPATHS:prepend_n1sdp :=3D &quot;${ARMBSPFILESPATHS}&quot;<b=
r>
&gt; +SRC_URI:append_n1sdp =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0001-pci_quirk-add-acs-override-for-PCI-de=
vices.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0002-pcie-Add-quirk-for-the-Arm-Neoverse-N=
1SDP-platform.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0003-n1sdp-update-n1sdp-pci-quirk-for-SR-I=
OV-support.patch \<br>
&gt; @@ -121,7 +121,7 @@ SRC_URI_append_n1sdp =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;=C2=A0 # Since we use the intree defconfig and the preempt-rt turns of=
f some configs<br>
&gt;=C2=A0 # do_kernel_configcheck will display warnings. So, lets disable=
 it.<br>
&gt; -KCONF_AUDIT_LEVEL_n1sdp_pn-linux-yocto-rt =3D &quot;0&quot;<br>
&gt; +KCONF_AUDIT_LEVEL_n1sdp:pn-linux-yocto-rt =3D &quot;0&quot;<br>
&gt;<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # Musca B1/S2 can&#39;t run Linux<br>
&gt; @@ -133,5 +133,5 @@ COMPATIBLE_MACHINE_musca-s1 =3D &quot;(^$)&quot;<=
br>
&gt;=C2=A0 # FVP BaseR AEMv8r64 Machine<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 COMPATIBLE_MACHINE_fvp-baser-aemv8r64 =3D &quot;fvp-baser-aemv8=
r64&quot;<br>
&gt; -FILESEXTRAPATHS_prepend_fvp-baser-aemv8r64 :=3D &quot;${ARMBSPFILESP=
ATHS}&quot;<br>
&gt; -SRC_URI_append_fvp-baser-aemv8r64 =3D &quot; file://fvp-baser-aemv8r=
64.dts;subdir=3Dgit/arch/arm64/boot/dts/arm&quot;<br>
&gt; +FILESEXTRAPATHS:prepend_fvp-baser-aemv8r64 :=3D &quot;${ARMBSPFILESP=
ATHS}&quot;<br>
&gt; +SRC_URI:append_fvp-baser-aemv8r64 =3D &quot; file://fvp-baser-aemv8r=
64.dts;subdir=3Dgit/arch/arm64/boot/dts/arm&quot;<br>
&gt; diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_5.10.b=
bappend b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_5.10.bbappend<b=
r>
&gt; index 55dac37..e2f9145 100644<br>
&gt; --- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_5.10.bbappend=
<br>
&gt; +++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_5.10.bbappend=
<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 # Machine specific configurations<br>
&gt;<br>
&gt; -FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${BP}:&quot;<br>
&gt; +FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/${BP}:&quot;<br>
&gt;<br>
&gt;=C2=A0 require linux-arm-platforms.inc<br>
&gt; diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-corstone70=
0.inc b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-corstone700.inc<br>
&gt; index eb584e5..8b2a282 100644<br>
&gt; --- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-corstone700.inc<b=
r>
&gt; +++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-corstone700.inc<b=
r>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}:${THISDIR}/files:&quot=
;<br>
&gt; +FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}:${THISDIR}/files:&quot=
;<br>
&gt;<br>
&gt;=C2=A0 COMPATIBLE_MACHINE =3D &quot;${MACHINE}&quot;<br>
&gt;<br>
&gt; @@ -31,12 +31,12 @@ KERNEL_IMAGETYPE =3D &quot;xipImage&quot;<br>
&gt;<br>
&gt;=C2=A0 KCONFIG_MODE =3D &quot;--alldefconfig&quot;<br>
&gt;<br>
&gt; -SRC_URI_append =3D &quot; ${SRC_URI_KMETA}&quot;<br>
&gt; +SRC_URI:append =3D &quot; ${SRC_URI_KMETA}&quot;<br>
&gt;<br>
&gt;=C2=A0 KERNEL_EXTRA_FEATURES =3D &quot;bsp/arm-platforms/corstone700-b=
sp.scc&quot;<br>
&gt; -KERNEL_FEATURES_append =3D &quot; ${KERNEL_EXTRA_FEATURES}&quot;<br>
&gt; +KERNEL_FEATURES:append =3D &quot; ${KERNEL_EXTRA_FEATURES}&quot;<br>
&gt;<br>
&gt; -KERNEL_FEATURES_append_corstone700-fvp =3D &quot; \<br>
&gt; +KERNEL_FEATURES:append_corstone700-fvp =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;MACHINE_FEATURES&#39;, =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;eth_lan91c111&#39;, \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;bsp/arm-platforms/corstone700/xip_dhcp_cmd=
line.cfg \<br>
&gt; @@ -44,7 +44,7 @@ KERNEL_FEATURES_append_corstone700-fvp =3D &quot; \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;bsp/arm-platforms/corstone700/xip_cmdline.=
cfg&#39;, \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 d)}&quot;<br>
&gt;<br>
&gt; -KERNEL_FEATURES_append_corstone700-mps3 =3D &quot; \<br>
&gt; +KERNEL_FEATURES:append_corstone700-mps3 =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;MACHINE_FEATURES&#39;, =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;eth_lan9115&#39;, \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;bsp/arm-platforms/corstone700/xip_dhcp_cmd=
line.cfg \<br>
&gt; diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3%.bbapp=
end b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3%.bbappend<br>
&gt; index f931d7d..498ef1d 100644<br>
&gt; --- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3%.bbappend<br>
&gt; +++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3%.bbappend<br>
&gt; @@ -1,6 +1,6 @@<br>
&gt; -FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/linux-yocto-5.3:&quot;=
<br>
&gt; +FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/linux-yocto-5.3:&quot;=
<br>
&gt;<br>
&gt; -SRC_URI_append =3D &quot; file://0001-perf-cs-etm-Move-definition-of=
-traceid_list-global-v.patch \<br>
&gt; +SRC_URI:append =3D &quot; file://0001-perf-cs-etm-Move-definition-of=
-traceid_list-global-v.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0file://0002-perf-tests-bp_account-Make-global-variable-static.patch =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0file://0003-perf-bench-Share-some-global-variables-to-fix-build-.pat=
ch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0file://0004-libtraceevent-Fix-build-with-binutils-2.35.patch \<br>
&gt; diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6%.bbapp=
end b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6%.bbappend<br>
&gt; index c4c55ad..7de3ebd 100644<br>
&gt; --- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6%.bbappend<br>
&gt; +++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6%.bbappend<br>
&gt; @@ -1,6 +1,6 @@<br>
&gt; -FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/linux-yocto-5.6:&quot;=
<br>
&gt; +FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/linux-yocto-5.6:&quot;=
<br>
&gt;<br>
&gt; -SRC_URI_append =3D &quot; file://0001-libtraceevent-Fix-build-with-b=
inutils-2.35.patch \<br>
&gt; +SRC_URI:append =3D &quot; file://0001-libtraceevent-Fix-build-with-b=
inutils-2.35.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0file://0002-perf-cs-etm-Move-definition-of-traceid_list-global-v.pat=
ch&quot;<br>
&gt;<br>
&gt;=C2=A0 #<br>
&gt; diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bbapp=
end b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bbappend<br>
&gt; index 607a50e..03ce8e9 100644<br>
&gt; --- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bbappend<br>
&gt; +++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bbappend<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt; -FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/linux-yocto-5.7:&quot;=
<br>
&gt; +FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/linux-yocto-5.7:&quot;=
<br>
&gt;<br>
&gt; -SRC_URI_append =3D &quot; file://coresight-traceid.patch \<br>
&gt; +SRC_URI:append =3D &quot; file://coresight-traceid.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0file://defconfig.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&=
quot;<br>
&gt; diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc b/m=
eta-arm-bsp/recipes-security/optee/optee-os-tc0.inc<br>
&gt; index c48cc6c..0542efa 100644<br>
&gt; --- a/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc<br>
&gt; +++ b/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc<br>
&gt; @@ -5,8 +5,8 @@<br>
&gt;=C2=A0 SRCREV =3D &quot;49dbb9ef65643c4322cf3f848910fa880d1c02f6&quot;=
<br>
&gt;=C2=A0 PV =3D &quot;3.14.0+git${SRCPV}&quot;<br>
&gt;<br>
&gt; -FILESEXTRAPATHS_prepend_tc0 :=3D &quot;${THISDIR}/files/optee-os/tc0=
:&quot;<br>
&gt; -SRC_URI_append =3D &quot; \<br>
&gt; +FILESEXTRAPATHS:prepend_tc0 :=3D &quot;${THISDIR}/files/optee-os/tc0=
:&quot;<br>
&gt; +SRC_URI:append =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://sp_layout.json \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0001-WIP-Enable-managed-exit.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; @@ -27,7 +27,7 @@ EXTRA_OEMAKE +=3D &quot; CFG_WITH_STATS=3Dy&quot;<b=
r>
&gt;=C2=A0 EXTRA_OEMAKE +=3D &quot; CFG_CORE_SEL2_SPMC=3Dy&quot;<br>
&gt;<br>
&gt;=C2=A0 # Copy optee manifest file<br>
&gt; -do_install_append() {<br>
&gt; +do_install:append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -d ${D}${nonarch_base_libdir}/firmware/<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 install -m 644 ${WORKDIR}/sp_layout.json ${D}${no=
narch_base_libdir}/firmware/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -m 644 \<br>
&gt; diff --git a/meta-arm-toolchain/conf/distro/include/external-arm-tool=
chain-versions.inc b/meta-arm-toolchain/conf/distro/include/external-arm-to=
olchain-versions.inc<br>
&gt; index a89f2f0..9ee9a5d 100644<br>
&gt; --- a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-v=
ersions.inc<br>
&gt; +++ b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-v=
ersions.inc<br>
&gt; @@ -126,7 +126,7 @@ def eat_get_bfd_version(d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 first_line =3D stdout.splitlines()[=
0]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return first_line.split()[-1]<br>
&gt;<br>
&gt; -python external_arm_toolchain_version_handler () {<br>
&gt; +python external:arm_toolchain_version_handler () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if not isinstance(e, bb.event.ConfigParsed):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt;=C2=A0 =C2=A0 =C2=A0 d =3D e.data<br>
&gt; @@ -140,4 +140,4 @@ python external_arm_toolchain_version_handler () =
{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;EAT_VER_GDB&#39;, eat_get_gdb_versi=
on(ld))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;EAT_VER_BFD&#39;, eat_get_bfd_versi=
on(ld))<br>
&gt;=C2=A0 }<br>
&gt; -addhandler external_arm_toolchain_version_handler<br>
&gt; +addhandler external:arm_toolchain_version_handler<br>
&gt; diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-a=
rm.inc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc<br>
&gt; index 7d5aecc..a3ea26f 100644<br>
&gt; --- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc<=
br>
&gt; +++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc<=
br>
&gt; @@ -7,16 +7,16 @@ EXTERNAL_TOOLCHAIN ?=3D &quot;/usr/local/arm-binary=
-toolchain/${TARGET_ARCH}&quot;<br>
&gt;=C2=A0 TOOLCHAIN_PATH_ADD =3D &quot;${EXTERNAL_TOOLCHAIN}/bin:&quot;<b=
r>
&gt;=C2=A0 PATH =3D. &quot;${TOOLCHAIN_PATH_ADD}&quot;<br>
&gt;<br>
&gt; -EAT_TARGET_SYS_arm ?=3D &quot;${@ &#39;arm-none-linux-gnueabihf&#39;=
 if os.path.exists(&#39;${EXTERNAL_TOOLCHAIN}/bin/arm-none-linux-gnueabihf-=
gcc&#39;) else &#39;arm-linux-gnueabihf&#39;}&quot;<br>
&gt; -EAT_TARGET_SYS_aarch64 ?=3D &quot;${@ &#39;aarch64-none-linux-gnu&#3=
9; if os.path.exists(&#39;${EXTERNAL_TOOLCHAIN}/bin/aarch64-none-linux-gnu-=
gcc&#39;) else &#39;aarch64-linux-gnu&#39;}&quot;<br>
&gt; +EAT_TARGET_SYS:arm ?=3D &quot;${@ &#39;arm-none-linux-gnueabihf&#39;=
 if os.path.exists(&#39;${EXTERNAL_TOOLCHAIN}/bin/arm-none-linux-gnueabihf-=
gcc&#39;) else &#39;arm-linux-gnueabihf&#39;}&quot;<br>
&gt; +EAT_TARGET_SYS:aarch64 ?=3D &quot;${@ &#39;aarch64-none-linux-gnu&#3=
9; if os.path.exists(&#39;${EXTERNAL_TOOLCHAIN}/bin/aarch64-none-linux-gnu-=
gcc&#39;) else &#39;aarch64-linux-gnu&#39;}&quot;<br>
&gt;=C2=A0 EAT_TARGET_SYS =3D &quot;${TARGET_SYS}&quot;<br>
&gt;=C2=A0 TARGET_PREFIX =3D &quot;${EAT_TARGET_SYS}-&quot;<br>
&gt;<br>
&gt; -EAT_LIBDIR_arm =3D &quot;lib&quot;<br>
&gt; -EAT_LIBDIR_aarch64 =3D &quot;lib64&quot;<br>
&gt; +EAT_LIBDIR:arm =3D &quot;lib&quot;<br>
&gt; +EAT_LIBDIR:aarch64 =3D &quot;lib64&quot;<br>
&gt;<br>
&gt; -GCCMULTILIB_forcevariable =3D &quot;--disable-multilib&quot;<br>
&gt; -IMAGE_LINGUAS_forcevariable =3D &quot;&quot;<br>
&gt; +GCCMULTILIB:forcevariable =3D &quot;--disable-multilib&quot;<br>
&gt; +IMAGE_LINGUAS:forcevariable =3D &quot;&quot;<br>
&gt;<br>
&gt;=C2=A0 # Blacklist toolchain recipes as a belt-and-suspenders way to u=
se the external toolchain<br>
&gt;=C2=A0 PNBLACKLIST[glibc] =3D &quot;Using external toolchain&quot;<br>
&gt; @@ -62,7 +62,7 @@ DISTRO_FEATURES_LIBC =3D &quot;ipv4 ipv6 libc-backt=
race libc-big-macros libc-bsd libc-c<br>
&gt;=C2=A0 ENABLE_BINARY_LOCALE_GENERATION =3D &quot;0&quot;<br>
&gt;=C2=A0 GLIBC_INTERNAL_USE_BINARY_LOCALE =3D &quot;precompiled&quot;<br=
>
&gt;=C2=A0 LIBCOVERRIDE =3D &quot;:libc-glibc&quot;<br>
&gt; -LIBC_DEPENDENCIES_remove =3D &quot;glibc-gconv-cp1252 glibc-gconv-ib=
m850 glibc-gconv-iso8859-1 glibc-gconv-iso8859-15 glibc-localedata-i18n&quo=
t;<br>
&gt; +LIBC_DEPENDENCIES:remove =3D &quot;glibc-gconv-cp1252 glibc-gconv-ib=
m850 glibc-gconv-iso8859-1 glibc-gconv-iso8859-15 glibc-localedata-i18n&quo=
t;<br>
&gt;<br>
&gt;=C2=A0 ERROR_QA[type] ?=3D &quot;list&quot;<br>
&gt;=C2=A0 python toolchain_metadata_setup () {<br>
&gt; diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/=
conf/layer.conf<br>
&gt; index 04486d4..b4232df 100644<br>
&gt; --- a/meta-arm-toolchain/conf/layer.conf<br>
&gt; +++ b/meta-arm-toolchain/conf/layer.conf<br>
&gt; @@ -12,10 +12,10 @@ BBFILE_PRIORITY_arm-toolchain =3D &quot;5&quot;<b=
r>
&gt;=C2=A0 LICENSE_PATH +=3D &quot;${LAYERDIR}/custom-licenses&quot;<br>
&gt;<br>
&gt;=C2=A0 LAYERDEPENDS_arm-toolchain =3D &quot;core&quot;<br>
&gt; -LAYERSERIES_COMPAT_arm-toolchain =3D &quot;hardknott&quot;<br>
&gt; +LAYERSERIES_COMPAT_arm-toolchain =3D &quot;honister&quot;<br>
&gt;<br>
&gt;=C2=A0 # do not error out on bbappends for missing recipes<br>
&gt;=C2=A0 BB_DANGLINGAPPENDS_WARNONLY =3D &quot;true&quot;<br>
&gt;<br>
&gt;=C2=A0 # These variables are used for armcompiler license<br>
&gt; -BB_HASHBASE_WHITELIST_append =3D &quot; ARM_TOOL_VARIANT ARMLMD_LICE=
NSE_FILE LM_LICENSE_FILE&quot;<br>
&gt; +BB_HASHBASE_WHITELIST:append =3D &quot; ARM_TOOL_VARIANT ARMLMD_LICE=
NSE_FILE LM_LICENSE_FILE&quot;<br>
&gt; diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolcha=
in/arm-binary-toolchain.inc b/meta-arm-toolchain/recipes-devtools/external-=
arm-toolchain/arm-binary-toolchain.inc<br>
&gt; index 046ab62..f237454 100644<br>
&gt; --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-=
binary-toolchain.inc<br>
&gt; +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-=
binary-toolchain.inc<br>
&gt; @@ -1,6 +1,6 @@<br>
&gt;=C2=A0 INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
&gt;<br>
&gt; -FILES_${PN} =3D &quot;${datadir} ${bindir}&quot;<br>
&gt; +FILES:${PN} =3D &quot;${datadir} ${bindir}&quot;<br>
&gt;<br>
&gt;=C2=A0 BINNAME =3D &quot;${@d.getVar(&quot;BPN&quot;).strip(&quot;gcc-=
&quot;)}&quot;<br>
&gt;<br>
&gt; @@ -15,7 +15,7 @@ do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 done<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -INSANE_SKIP_${PN} =3D &quot;already-stripped libdir staticdev file-r=
deps arch dev-so&quot;<br>
&gt; +INSANE_SKIP:${PN} =3D &quot;already-stripped libdir staticdev file-r=
deps arch dev-so&quot;<br>
&gt;<br>
&gt;=C2=A0 INHIBIT_SYSROOT_STRIP =3D &quot;1&quot;<br>
&gt;=C2=A0 INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
&gt; diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolcha=
in/<a href=3D"http://external-arm-sdk-toolchain.bb" rel=3D"noreferrer" targ=
et=3D"_blank">external-arm-sdk-toolchain.bb</a> b/meta-arm-toolchain/recipe=
s-devtools/external-arm-toolchain/<a href=3D"http://external-arm-sdk-toolch=
ain.bb" rel=3D"noreferrer" target=3D"_blank">external-arm-sdk-toolchain.bb<=
/a><br>
&gt; index 4f0adce..138245d 100644<br>
&gt; --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/<a h=
ref=3D"http://external-arm-sdk-toolchain.bb" rel=3D"noreferrer" target=3D"_=
blank">external-arm-sdk-toolchain.bb</a><br>
&gt; +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/<a h=
ref=3D"http://external-arm-sdk-toolchain.bb" rel=3D"noreferrer" target=3D"_=
blank">external-arm-sdk-toolchain.bb</a><br>
&gt; @@ -15,9 +15,9 @@ EXCLUDE_FROM_SHLIBS =3D &quot;1&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://${COMMON_LICENSE_DIR}/MIT;md5=
=
=3D0835ade698e0bcf8506ecda2f7b4f302&quot;<br>
&gt;<br>
&gt;=C2=A0 # Skip packaging QA checks for prebuilt binaries<br>
&gt; -INSANE_SKIP_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D &quot;d=
ev-so staticdev file-rdeps libdir&quot;<br>
&gt; -INSANE_SKIP_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D &quot;d=
ev-so file-rdeps&quot;<br>
&gt; -INSANE_SKIP_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D &q=
uot;dev-so file-rdeps&quot;<br>
&gt; +INSANE_SKIP:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D &quot;d=
ev-so staticdev file-rdeps libdir&quot;<br>
&gt; +INSANE_SKIP:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D &quot;d=
ev-so file-rdeps&quot;<br>
&gt; +INSANE_SKIP:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D &q=
uot;dev-so file-rdeps&quot;<br>
&gt;<br>
&gt;=C2=A0 # Skip file dependencies in RPM for prebuilt binaries<br>
&gt;=C2=A0 SKIP_FILEDEPS =3D &quot;1&quot;<br>
&gt; @@ -41,7 +41,7 @@ libexecdir =3D &quot;${exec_prefix}/libexec&quot;<b=
r>
&gt;=C2=A0 datadir =3D &quot;${exec_prefix}/share&quot;<br>
&gt;=C2=A0 gcclibdir =3D &quot;${libdir}/gcc&quot;<br>
&gt;<br>
&gt; -FILES_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D &quot;\<br>
&gt; +FILES:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${prefix}/${EAT_TARGET_SYS}/lib/libs=
tdc++.* \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${prefix}/${EAT_TARGET_SYS}/lib/libg=
cc_s.* \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${prefix}/${EAT_TARGET_SYS}/lib/libs=
upc++.* \<br>
&gt; @@ -54,12 +54,12 @@ FILES_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH=
} =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libexecdir}/* \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; -FILES_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D &quot;\<br>
&gt; +FILES:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/${TARGET_PREFIX}gdb* \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/gdb/* \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; -FILES_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D &quot;\<=
br>
&gt; +FILES:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D &quot;\<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${prefix}/${EAT_TARGET_SYS}/bin/ld* =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${prefix}/${EAT_TARGET_SYS}/bin/objc=
opy \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${prefix}/${EAT_TARGET_SYS}/bin/stri=
p \<br>
&gt; @@ -85,17 +85,17 @@ FILES_binutils-cross-canadian-${TRANSLATED_TARGET=
_ARCH} =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/${TARGET_PREFIX}size \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; -DESCRIPTION_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D &quot;T=
he GNU cc and gcc C compilers&quot;<br>
&gt; -DESCRIPTION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D &quot;g=
db - GNU debugger&quot;<br>
&gt; -DESCRIPTION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D &q=
uot;A GNU collection of binary utilities&quot;<br>
&gt; +DESCRIPTION:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D &quot;T=
he GNU cc and gcc C compilers&quot;<br>
&gt; +DESCRIPTION:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D &quot;g=
db - GNU debugger&quot;<br>
&gt; +DESCRIPTION:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D &q=
uot;A GNU collection of binary utilities&quot;<br>
&gt;<br>
&gt; -LICENSE_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D &quot;${EAT=
_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D &quot;${EAT=
_GDB_LICENSE}&quot;<br>
&gt; -LICENSE_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D &quot;=
${EAT_BFD_LICENSE}&quot;<br>
&gt; +LICENSE:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D &quot;${EAT=
_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D &quot;${EAT=
_GDB_LICENSE}&quot;<br>
&gt; +LICENSE:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D &quot;=
${EAT_BFD_LICENSE}&quot;<br>
&gt;<br>
&gt; -PKGV_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D &quot;${EAT_VE=
R_GCC}&quot;<br>
&gt; -PKGV_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D &quot;${EAT_VE=
R_GDB}&quot;<br>
&gt; -PKGV_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D &quot;${E=
AT_VER_BFD}&quot;<br>
&gt; +PKGV:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D &quot;${EAT_VE=
R_GCC}&quot;<br>
&gt; +PKGV:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D &quot;${EAT_VE=
R_GDB}&quot;<br>
&gt; +PKGV:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D &quot;${E=
AT_VER_BFD}&quot;<br>
&gt;<br>
&gt;=C2=A0 do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${prefix}/${EAT_TARGE=
T_SYS}/bin<br>
&gt; diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolcha=
in/<a href=3D"http://external-arm-toolchain.bb" rel=3D"noreferrer" target=
=3D"_blank">external-arm-toolchain.bb</a> b/meta-arm-toolchain/recipes-dev=
tools/external-arm-toolchain/<a href=3D"http://external-arm-toolchain.bb" r=
el=3D"noreferrer" target=3D"_blank">external-arm-toolchain.bb</a><br>
&gt; index c506c41..a58eeb4 100644<br>
&gt; --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/<a h=
ref=3D"http://external-arm-toolchain.bb" rel=3D"noreferrer" target=3D"_blan=
k">external-arm-toolchain.bb</a><br>
&gt; +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/<a h=
ref=3D"http://external-arm-toolchain.bb" rel=3D"noreferrer" target=3D"_blan=
k">external-arm-toolchain.bb</a><br>
&gt; @@ -322,132 +322,132 @@ PACKAGES +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-staticdev \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; -INSANE_SKIP_${PN}-dbg =3D &quot;staticdev&quot;<br>
&gt; -INSANE_SKIP_${PN}-utils +=3D &quot;ldflags&quot;<br>
&gt; -INSANE_SKIP_libstdc++ +=3D &quot;ldflags&quot;<br>
&gt; -INSANE_SKIP_libgfortran +=3D &quot;ldflags&quot;<br>
&gt; -INSANE_SKIP_libgcc +=3D &quot;ldflags dev-deps&quot;<br>
&gt; -INSANE_SKIP_libgcc-dev +=3D &quot;staticdev&quot;<br>
&gt; -INSANE_SKIP_libgfortran +=3D &quot;ldflags dev-deps&quot;<br>
&gt; -INSANE_SKIP_libstdc++ +=3D &quot;ldflags dev-deps&quot;<br>
&gt; -INSANE_SKIP_libatomic +=3D &quot;ldflags&quot;<br>
&gt; -INSANE_SKIP_libasan +=3D &quot;ldflags&quot;<br>
&gt; -INSANE_SKIP_libubsan +=3D &quot;ldflags&quot;<br>
&gt; -INSANE_SKIP_libssp +=3D &quot;ldflags&quot;<br>
&gt; -INSANE_SKIP_libgomp +=3D &quot;ldflags&quot;<br>
&gt; -INSANE_SKIP_libitm +=3D &quot;ldflags&quot;<br>
&gt; -INSANE_SKIP_gdbserver +=3D &quot;ldflags&quot;<br>
&gt; +INSANE_SKIP:${PN}-dbg =3D &quot;staticdev&quot;<br>
&gt; +INSANE_SKIP:${PN}-utils +=3D &quot;ldflags&quot;<br>
&gt; +INSANE_SKIP:libstdc++ +=3D &quot;ldflags&quot;<br>
&gt; +INSANE_SKIP:libgfortran +=3D &quot;ldflags&quot;<br>
&gt; +INSANE_SKIP:libgcc +=3D &quot;ldflags dev-deps&quot;<br>
&gt; +INSANE_SKIP:libgcc-dev +=3D &quot;staticdev&quot;<br>
&gt; +INSANE_SKIP:libgfortran +=3D &quot;ldflags dev-deps&quot;<br>
&gt; +INSANE_SKIP:libstdc++ +=3D &quot;ldflags dev-deps&quot;<br>
&gt; +INSANE_SKIP:libatomic +=3D &quot;ldflags&quot;<br>
&gt; +INSANE_SKIP:libasan +=3D &quot;ldflags&quot;<br>
&gt; +INSANE_SKIP:libubsan +=3D &quot;ldflags&quot;<br>
&gt; +INSANE_SKIP:libssp +=3D &quot;ldflags&quot;<br>
&gt; +INSANE_SKIP:libgomp +=3D &quot;ldflags&quot;<br>
&gt; +INSANE_SKIP:libitm +=3D &quot;ldflags&quot;<br>
&gt; +INSANE_SKIP:gdbserver +=3D &quot;ldflags&quot;<br>
&gt;<br>
&gt;=C2=A0 # OE-core has literally listed &#39;glibc&#39; in LIBC_DEPENDEN=
CIES :/<br>
&gt; -RPROVIDES_${PN} =3D &quot;glibc rtld(GNU_HASH)&quot;<br>
&gt; +RPROVIDES:${PN} =3D &quot;glibc rtld(GNU_HASH)&quot;<br>
&gt;=C2=A0 # Add runtime provides for the other libc* packages as well<br>
&gt; -RPROVIDES_${PN}-dev =3D &quot;glibc-dev&quot;<br>
&gt; -RPROVIDES_${PN}-doc =3D &quot;glibc-doc&quot;<br>
&gt; -RPROVIDES_${PN}-dbg =3D &quot;glibc-dbg&quot;<br>
&gt; -RPROVIDES_${PN}-pic =3D &quot;glibc-pic&quot;<br>
&gt; -RPROVIDES_${PN}-utils =3D &quot;glibc-utils&quot;<br>
&gt; -RPROVIDES_${PN}-mtrace =3D &quot;glibc-mtrace libc-mtrace&quot;<br>
&gt; -<br>
&gt; -PKG_${PN} =3D &quot;glibc&quot;<br>
&gt; -PKG_${PN}-dev =3D &quot;glibc-dev&quot;<br>
&gt; -PKG_${PN}-doc =3D &quot;glibc-doc&quot;<br>
&gt; -PKG_${PN}-dbg =3D &quot;glibc-dbg&quot;<br>
&gt; -PKG_${PN}-pic =3D &quot;glibc-pic&quot;<br>
&gt; -PKG_${PN}-utils =3D &quot;glibc-utils&quot;<br>
&gt; -PKG_${PN}-mtrace =3D &quot;glibc-mtrace&quot;<br>
&gt; -PKG_${PN}-gconv =3D &quot;glibc-gconv&quot;<br>
&gt; -PKG_${PN}-extra-nss =3D &quot;glibc-extra-nss&quot;<br>
&gt; -PKG_${PN}-thread-db =3D &quot;glibc-thread-db&quot;<br>
&gt; -PKG_${PN}-pcprofile =3D &quot;glibc-pcprofile&quot;<br>
&gt; -PKG_${PN}-staticdev =3D &quot;glibc-staticdev&quot;<br>
&gt; +RPROVIDES:${PN}-dev =3D &quot;glibc-dev&quot;<br>
&gt; +RPROVIDES:${PN}-doc =3D &quot;glibc-doc&quot;<br>
&gt; +RPROVIDES:${PN}-dbg =3D &quot;glibc-dbg&quot;<br>
&gt; +RPROVIDES:${PN}-pic =3D &quot;glibc-pic&quot;<br>
&gt; +RPROVIDES:${PN}-utils =3D &quot;glibc-utils&quot;<br>
&gt; +RPROVIDES:${PN}-mtrace =3D &quot;glibc-mtrace libc-mtrace&quot;<br>
&gt; +<br>
&gt; +PKG:${PN} =3D &quot;glibc&quot;<br>
&gt; +PKG:${PN}-dev =3D &quot;glibc-dev&quot;<br>
&gt; +PKG:${PN}-doc =3D &quot;glibc-doc&quot;<br>
&gt; +PKG:${PN}-dbg =3D &quot;glibc-dbg&quot;<br>
&gt; +PKG:${PN}-pic =3D &quot;glibc-pic&quot;<br>
&gt; +PKG:${PN}-utils =3D &quot;glibc-utils&quot;<br>
&gt; +PKG:${PN}-mtrace =3D &quot;glibc-mtrace&quot;<br>
&gt; +PKG:${PN}-gconv =3D &quot;glibc-gconv&quot;<br>
&gt; +PKG:${PN}-extra-nss =3D &quot;glibc-extra-nss&quot;<br>
&gt; +PKG:${PN}-thread-db =3D &quot;glibc-thread-db&quot;<br>
&gt; +PKG:${PN}-pcprofile =3D &quot;glibc-pcprofile&quot;<br>
&gt; +PKG:${PN}-staticdev =3D &quot;glibc-staticdev&quot;<br>
&gt;<br>
&gt;=C2=A0 PKGV =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; -PKGV_${PN} =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; -PKGV_${PN}-dev =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; -PKGV_${PN}-doc =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; -PKGV_${PN}-dbg =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; -PKGV_${PN}-pic =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; -PKGV_${PN}-utils =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; -PKGV_${PN}-mtrace =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; -PKGV_${PN}-gconv =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; -PKGV_${PN}-extra-nss =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; -PKGV_${PN}-thread-db =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; -PKGV_${PN}-pcprofile =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; -PKGV_${PN}-staticdev =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; -PKGV_catchsegv =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; -PKGV_glibc-extra-nss =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; -PKGV_glibc-thread-db =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; -<br>
&gt; -PKGV_libmemusage =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; -PKGV_libsegfault =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; -PKGV_libsotruss =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; -PKGV_sln =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; -PKGV_nscd =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; -PKGV_ldd =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; -<br>
&gt; -PKGV_libasan-dev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libasan =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libasan-staticdev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libatomic-dev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libatomic =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libatomic-staticdev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libg2c-dev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libg2c =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libgcc-dev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libgcc =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libgfortran-dbg =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libgfortran-dev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libgfortran =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libgfortran-staticdev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libgomp-dev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libgomp =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libgomp-staticdev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libitm-dev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libitm =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libitm-staticdev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_liblsan-dev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_liblsan =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_liblsan-staticdev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libmudflap-dev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libmudflap =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libmudflap-staticdev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libquadmath-dev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libquadmath =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libquadmath-staticdev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libssp-dev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libssp =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libssp-staticdev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libstdc++-dbg =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libstdc++-dev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libstdc++ =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libstdc++-precompile-dev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libstdc++-staticdev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libtsan-dev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libtsan =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libtsan-staticdev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libubsan-dev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libubsan =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -PKGV_libubsan-staticdev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; -<br>
&gt; -PKGV_linux-libc-headers-dev =3D &quot;${EAT_VER_KERNEL}&quot;<br>
&gt; -PKGV_linux-libc-headers =3D &quot;${EAT_VER_KERNEL}&quot;<br>
&gt; -<br>
&gt; -PKGV_gdbserver =3D &quot;${EAT_VER_GDBSERVER}&quot;<br>
&gt; -<br>
&gt; -ALLOW_EMPTY_${PN}-mtrace =3D &quot;1&quot;<br>
&gt; -FILES_${PN}-mtrace =3D &quot;${bindir}/mtrace&quot;<br>
&gt; -<br>
&gt; -FILES_libgcov-staticdev =3D &quot;${libdir}/gcc/${TARGET_SYS}/${BINV=
}/libgcov.a&quot;<br>
&gt; -<br>
&gt; -FILES_libsegfault =3D &quot;${base_libdir}/libSegFault*&quot;<br>
&gt; -<br>
&gt; -FILES_catchsegv =3D &quot;${bindir}/catchsegv&quot;<br>
&gt; -RDEPENDS_catchsegv =3D &quot;libsegfault&quot;<br>
&gt; +PKGV:${PN} =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; +PKGV:${PN}-dev =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; +PKGV:${PN}-doc =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; +PKGV:${PN}-dbg =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; +PKGV:${PN}-pic =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; +PKGV:${PN}-utils =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; +PKGV:${PN}-mtrace =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; +PKGV:${PN}-gconv =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; +PKGV:${PN}-extra-nss =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; +PKGV:${PN}-thread-db =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; +PKGV:${PN}-pcprofile =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; +PKGV:${PN}-staticdev =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; +PKGV:catchsegv =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; +PKGV:glibc-extra-nss =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; +PKGV:glibc-thread-db =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; +<br>
&gt; +PKGV:libmemusage =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; +PKGV:libsegfault =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; +PKGV:libsotruss =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; +PKGV:sln =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; +PKGV:nscd =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; +PKGV:ldd =3D &quot;${EAT_VER_LIBC}&quot;<br>
&gt; +<br>
&gt; +PKGV:libasan-dev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libasan =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libasan-staticdev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libatomic-dev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libatomic =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libatomic-staticdev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libg2c-dev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libg2c =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libgcc-dev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libgcc =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libgfortran-dbg =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libgfortran-dev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libgfortran =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libgfortran-staticdev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libgomp-dev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libgomp =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libgomp-staticdev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libitm-dev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libitm =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libitm-staticdev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:liblsan-dev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:liblsan =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:liblsan-staticdev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libmudflap-dev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libmudflap =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libmudflap-staticdev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libquadmath-dev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libquadmath =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libquadmath-staticdev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libssp-dev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libssp =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libssp-staticdev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libstdc++-dbg =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libstdc++-dev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libstdc++ =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libstdc++-precompile-dev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libstdc++-staticdev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libtsan-dev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libtsan =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libtsan-staticdev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libubsan-dev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libubsan =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +PKGV:libubsan-staticdev =3D &quot;${EAT_VER_GCC}&quot;<br>
&gt; +<br>
&gt; +PKGV:linux-libc-headers-dev =3D &quot;${EAT_VER_KERNEL}&quot;<br>
&gt; +PKGV:linux-libc-headers =3D &quot;${EAT_VER_KERNEL}&quot;<br>
&gt; +<br>
&gt; +PKGV:gdbserver =3D &quot;${EAT_VER_GDBSERVER}&quot;<br>
&gt; +<br>
&gt; +ALLOW_EMPTY:${PN}-mtrace =3D &quot;1&quot;<br>
&gt; +FILES:${PN}-mtrace =3D &quot;${bindir}/mtrace&quot;<br>
&gt; +<br>
&gt; +FILES:libgcov-staticdev =3D &quot;${libdir}/gcc/${TARGET_SYS}/${BINV=
}/libgcov.a&quot;<br>
&gt; +<br>
&gt; +FILES:libsegfault =3D &quot;${base_libdir}/libSegFault*&quot;<br>
&gt; +<br>
&gt; +FILES:catchsegv =3D &quot;${bindir}/catchsegv&quot;<br>
&gt; +RDEPENDS:catchsegv =3D &quot;libsegfault&quot;<br>
&gt;<br>
&gt;=C2=A0 # From libgfortran.inc:<br>
&gt;<br>
&gt; -FILES_libgfortran =3D &quot;${libdir}/libgfortran.so.*&quot;<br>
&gt; -FILES_libgfortran-dev =3D &quot;\<br>
&gt; +FILES:libgfortran =3D &quot;${libdir}/libgfortran.so.*&quot;<br>
&gt; +FILES:libgfortran-dev =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/libgfortran*.so \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/libgfortran.spec \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/<a href=3D"http://libgfortran.la" rel=
=3D"noreferrer" target=3D"_blank">libgfortran.la</a> \<br>
&gt; @@ -455,49 +455,49 @@ FILES_libgfortran-dev =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/gcc/${TARGET_SYS}/${BINV}/libcaf_single=
* \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude/ \<b=
r>
&gt;=C2=A0 &quot;<br>
&gt; -FILES_libgfortran-staticdev =3D &quot;${libdir}/libgfortran.a&quot;<=
br>
&gt; +FILES:libgfortran-staticdev =3D &quot;${libdir}/libgfortran.a&quot;<=
br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 # From gcc-sanitizers.inc:<br>
&gt;<br>
&gt; -FILES_libasan +=3D &quot;${libdir}/libasan.so.*&quot;<br>
&gt; -FILES_libasan-dev +=3D &quot;\<br>
&gt; +FILES:libasan +=3D &quot;${libdir}/libasan.so.*&quot;<br>
&gt; +FILES:libasan-dev +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/libasan_preinit.o \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/libasan.so \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/<a href=3D"http://libasan.la" rel=3D"no=
referrer" target=3D"_blank">libasan.la</a> \<br>
&gt;=C2=A0 &quot;<br>
&gt; -FILES_libasan-staticdev +=3D &quot;${libdir}/libasan.a&quot;<br>
&gt; +FILES:libasan-staticdev +=3D &quot;${libdir}/libasan.a&quot;<br>
&gt;<br>
&gt; -FILES_libubsan +=3D &quot;${libdir}/libubsan.so.*&quot;<br>
&gt; -FILES_libubsan-dev +=3D &quot;\<br>
&gt; +FILES:libubsan +=3D &quot;${libdir}/libubsan.so.*&quot;<br>
&gt; +FILES:libubsan-dev +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/libubsan.so \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/<a href=3D"http://libubsan.la" rel=3D"n=
oreferrer" target=3D"_blank">libubsan.la</a> \<br>
&gt;=C2=A0 &quot;<br>
&gt; -FILES_libubsan-staticdev +=3D &quot;${libdir}/libubsan.a&quot;<br>
&gt; +FILES:libubsan-staticdev +=3D &quot;${libdir}/libubsan.a&quot;<br>
&gt;<br>
&gt; -FILES_liblsan +=3D &quot;${libdir}/liblsan.so.*&quot;<br>
&gt; -FILES_liblsan-dev +=3D &quot;\<br>
&gt; +FILES:liblsan +=3D &quot;${libdir}/liblsan.so.*&quot;<br>
&gt; +FILES:liblsan-dev +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/liblsan.so \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/<a href=3D"http://liblsan.la" rel=3D"no=
referrer" target=3D"_blank">liblsan.la</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/liblsan_preinit.o \<br>
&gt;=C2=A0 &quot;<br>
&gt; -FILES_liblsan-staticdev +=3D &quot;${libdir}/liblsan.a&quot;<br>
&gt; +FILES:liblsan-staticdev +=3D &quot;${libdir}/liblsan.a&quot;<br>
&gt;<br>
&gt; -FILES_libtsan +=3D &quot;${libdir}/libtsan.so.*&quot;<br>
&gt; -FILES_libtsan-dev +=3D &quot;\<br>
&gt; +FILES:libtsan +=3D &quot;${libdir}/libtsan.so.*&quot;<br>
&gt; +FILES:libtsan-dev +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/libtsan.so \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/<a href=3D"http://libtsan.la" rel=3D"no=
referrer" target=3D"_blank">libtsan.la</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/libtsan_*.o \<br>
&gt;=C2=A0 &quot;<br>
&gt; -FILES_libtsan-staticdev +=3D &quot;${libdir}/libtsan.a&quot;<br>
&gt; +FILES:libtsan-staticdev +=3D &quot;${libdir}/libtsan.a&quot;<br>
&gt;<br>
&gt; -FILES_gcc-sanitizers =3D &quot;${libdir}/*.spec ${libdir}/gcc/${TARG=
ET_SYS}/${BINV}/include/sanitizer/*.h&quot;<br>
&gt; +FILES:gcc-sanitizers =3D &quot;${libdir}/*.spec ${libdir}/gcc/${TARG=
ET_SYS}/${BINV}/include/sanitizer/*.h&quot;<br>
&gt;<br>
&gt;=C2=A0 # From libgcc.inc:<br>
&gt;<br>
&gt; -FILES_libgcc =3D &quot;${base_libdir}/libgcc_s.so.1&quot;<br>
&gt; +FILES:libgcc =3D &quot;${base_libdir}/libgcc_s.so.1&quot;<br>
&gt;<br>
&gt; -FILES_libgcc-dev =3D &quot;\<br>
&gt; +FILES:libgcc-dev =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${base_libdir}/libgcc*.so \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${@oe.utils.conditional(&#39;BASETARGET_SYS&#39;,=
 &#39;${TARGET_SYS}&#39;, &#39;&#39;, &#39;${libdir}/${BASETARGET_SYS}&#39;=
, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/${TARGET_SYS}/${BINV}* \<br>
&gt; @@ -505,8 +505,8 @@ FILES_libgcc-dev =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/gcc/${TARGET_SYS}/${BINV}/include \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; -FILES_linux-libc-headers =3D &quot;&quot;<br>
&gt; -FILES_linux-libc-headers-dev =3D &quot;\<br>
&gt; +FILES:linux-libc-headers =3D &quot;&quot;<br>
&gt; +FILES:linux-libc-headers-dev =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${includedir}/asm* \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${includedir}/linux \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${includedir}/mtd \<br>
&gt; @@ -515,7 +515,7 @@ FILES_linux-libc-headers-dev =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${includedir}/sound \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${includedir}/video \<br>
&gt;=C2=A0 &quot;<br>
&gt; -FILES_${PN} +=3D &quot;\<br>
&gt; +FILES:${PN} +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/bin \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/locale \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/gconv/gconv-modules \<br>
&gt; @@ -563,112 +563,112 @@ FILES_${PN} +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${base_libdir}/libpcprofile.so \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt; -FILES_${PN}-dbg +=3D &quot;${base_libdir}/debug&quot;<br>
&gt; +FILES:${PN}-dbg +=3D &quot;${base_libdir}/debug&quot;<br>
&gt;<br>
&gt;=C2=A0 # From gcc-runtime.inc<br>
&gt;<br>
&gt;=C2=A0 # include python debugging scripts<br>
&gt; -FILES_gcc-runtime-dbg +=3D &quot;\<br>
&gt; +FILES:gcc-runtime-dbg +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/libstdc++.so.*-gdb.py \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${datadir}/gcc-${BINV}/python/libstdcxx \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; -FILES_libg2c =3D &quot;${target_libdir}/libg2c.so.*&quot;<br>
&gt; -SUMMARY_libg2c =3D &quot;Companion runtime library for g77&quot;<br>
&gt; -FILES_libg2c-dev =3D &quot;\<br>
&gt; +FILES:libg2c =3D &quot;${target_libdir}/libg2c.so.*&quot;<br>
&gt; +SUMMARY:libg2c =3D &quot;Companion runtime library for g77&quot;<br>
&gt; +FILES:libg2c-dev =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/libg2c.so \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/libg2c.a \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/libfrtbegin.a \<br>
&gt;=C2=A0 &quot;<br>
&gt; -SUMMARY_libg2c-dev =3D &quot;Companion runtime library for g77 - dev=
elopment files&quot;<br>
&gt; +SUMMARY:libg2c-dev =3D &quot;Companion runtime library for g77 - dev=
elopment files&quot;<br>
&gt;<br>
&gt; -FILES_libstdc++ =3D &quot;${libdir}/libstdc++.so.*&quot;<br>
&gt; -SUMMARY_libstdc++ =3D &quot;GNU standard C++ library&quot;<br>
&gt; -FILES_libstdc++-dev =3D &quot;\<br>
&gt; +FILES:libstdc++ =3D &quot;${libdir}/libstdc++.so.*&quot;<br>
&gt; +SUMMARY:libstdc++ =3D &quot;GNU standard C++ library&quot;<br>
&gt; +FILES:libstdc++-dev =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /include/c++ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${includedir}/c++/ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/libstdc++.so \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/libstdc++*.la \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/libsupc++.la \<br>
&gt;=C2=A0 &quot;<br>
&gt; -SUMMARY_libstdc++-dev =3D &quot;GNU standard C++ library - developme=
nt files&quot;<br>
&gt; +SUMMARY:libstdc++-dev =3D &quot;GNU standard C++ library - developme=
nt files&quot;<br>
&gt;<br>
&gt; -FILES_libstdc++-staticdev =3D &quot;\<br>
&gt; +FILES:libstdc++-staticdev =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/libstdc++*.a \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/libsupc++.a \<br>
&gt;=C2=A0 &quot;<br>
&gt; -SUMMARY_libstdc++-staticdev =3D &quot;GNU standard C++ library - sta=
tic development files&quot;<br>
&gt; +SUMMARY:libstdc++-staticdev =3D &quot;GNU standard C++ library - sta=
tic development files&quot;<br>
&gt;<br>
&gt; -FILES_libstdc++-precompile-dev =3D &quot;${includedir}/c++/${TARGET_=
SYS}/bits/*.gch&quot;<br>
&gt; -SUMMARY_libstdc++-precompile-dev =3D &quot;GNU standard C++ library =
- precompiled header files&quot;<br>
&gt; +FILES:libstdc++-precompile-dev =3D &quot;${includedir}/c++/${TARGET_=
SYS}/bits/*.gch&quot;<br>
&gt; +SUMMARY:libstdc++-precompile-dev =3D &quot;GNU standard C++ library =
- precompiled header files&quot;<br>
&gt;<br>
&gt; -FILES_libssp =3D &quot;${libdir}/libssp.so.*&quot;<br>
&gt; -SUMMARY_libssp =3D &quot;GNU stack smashing protection library&quot;=
<br>
&gt; -FILES_libssp-dev =3D &quot;\<br>
&gt; +FILES:libssp =3D &quot;${libdir}/libssp.so.*&quot;<br>
&gt; +SUMMARY:libssp =3D &quot;GNU stack smashing protection library&quot;=
<br>
&gt; +FILES:libssp-dev =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/libssp*.so \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/libssp*_nonshared.a \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/libssp*.la \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/ssp \=
<br>
&gt;=C2=A0 &quot;<br>
&gt; -SUMMARY_libssp-dev =3D &quot;GNU stack smashing protection library -=
 development files&quot;<br>
&gt; -FILES_libssp-staticdev =3D &quot;${libdir}/libssp*.a&quot;<br>
&gt; -SUMMARY_libssp-staticdev =3D &quot;GNU stack smashing protection lib=
rary - static development files&quot;<br>
&gt; +SUMMARY:libssp-dev =3D &quot;GNU stack smashing protection library -=
 development files&quot;<br>
&gt; +FILES:libssp-staticdev =3D &quot;${libdir}/libssp*.a&quot;<br>
&gt; +SUMMARY:libssp-staticdev =3D &quot;GNU stack smashing protection lib=
rary - static development files&quot;<br>
&gt;<br>
&gt; -FILES_libquadmath =3D &quot;${libdir}/libquadmath*.so.*&quot;<br>
&gt; -SUMMARY_libquadmath =3D &quot;GNU quad-precision math library&quot;<=
br>
&gt; -FILES_libquadmath-dev =3D &quot;\<br>
&gt; +FILES:libquadmath =3D &quot;${libdir}/libquadmath*.so.*&quot;<br>
&gt; +SUMMARY:libquadmath =3D &quot;GNU quad-precision math library&quot;<=
br>
&gt; +FILES:libquadmath-dev =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/quadm=
ath* \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/libquadmath*.so \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/<a href=3D"http://libquadmath.la" rel=
=3D"noreferrer" target=3D"_blank">libquadmath.la</a> \<br>
&gt;=C2=A0 &quot;<br>
&gt; -SUMMARY_libquadmath-dev =3D &quot;GNU quad-precision math library - =
development files&quot;<br>
&gt; -FILES_libquadmath-staticdev =3D &quot;${libdir}/libquadmath.a&quot;<=
br>
&gt; -SUMMARY_libquadmath-staticdev =3D &quot;GNU quad-precision math libr=
ary - static development files&quot;<br>
&gt; +SUMMARY:libquadmath-dev =3D &quot;GNU quad-precision math library - =
development files&quot;<br>
&gt; +FILES:libquadmath-staticdev =3D &quot;${libdir}/libquadmath.a&quot;<=
br>
&gt; +SUMMARY:libquadmath-staticdev =3D &quot;GNU quad-precision math libr=
ary - static development files&quot;<br>
&gt;<br>
&gt;=C2=A0 # NOTE: mudflap has been removed as of gcc 4.9 and has been sup=
erseded by the address sanitiser<br>
&gt; -FILES_libmudflap =3D &quot;${libdir}/libmudflap*.so.*&quot;<br>
&gt; -SUMMARY_libmudflap =3D &quot;Pointer debugging library for gcc&quot;=
<br>
&gt; -FILES_libmudflap-dev =3D &quot;\<br>
&gt; +FILES:libmudflap =3D &quot;${libdir}/libmudflap*.so.*&quot;<br>
&gt; +SUMMARY:libmudflap =3D &quot;Pointer debugging library for gcc&quot;=
<br>
&gt; +FILES:libmudflap-dev =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/libmudflap*.so \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/<a href=3D"http://libmudflap.la" rel=3D=
"noreferrer" target=3D"_blank">libmudflap.la</a> \<br>
&gt;=C2=A0 &quot;<br>
&gt; -SUMMARY_libmudflap-dev =3D &quot;Pointer debugging library for gcc -=
 development files&quot;<br>
&gt; -FILES_libmudflap-staticdev =3D &quot;${libdir}/libmudflap.a&quot;<br=
>
&gt; -SUMMARY_libmudflap-staticdev =3D &quot;Pointer debugging library for=
 gcc - static development files&quot;<br>
&gt; +SUMMARY:libmudflap-dev =3D &quot;Pointer debugging library for gcc -=
 development files&quot;<br>
&gt; +FILES:libmudflap-staticdev =3D &quot;${libdir}/libmudflap.a&quot;<br=
>
&gt; +SUMMARY:libmudflap-staticdev =3D &quot;Pointer debugging library for=
 gcc - static development files&quot;<br>
&gt;<br>
&gt; -FILES_libgomp =3D &quot;${libdir}/libgomp*${SOLIBS}&quot;<br>
&gt; -SUMMARY_libgomp =3D &quot;GNU OpenMP parallel programming library&qu=
ot;<br>
&gt; -FILES_libgomp-dev =3D &quot;\<br>
&gt; +FILES:libgomp =3D &quot;${libdir}/libgomp*${SOLIBS}&quot;<br>
&gt; +SUMMARY:libgomp =3D &quot;GNU OpenMP parallel programming library&qu=
ot;<br>
&gt; +FILES:libgomp-dev =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/libgomp*${SOLIBSDEV} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/libgomp*.la \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/libgomp.spec \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/opena=
cc.h \<br>
&gt;=C2=A0 &quot;<br>
&gt; -SUMMARY_libgomp-dev =3D &quot;GNU OpenMP parallel programming librar=
y - development files&quot;<br>
&gt; -FILES_libgomp-staticdev =3D &quot;${libdir}/libgomp*.a&quot;<br>
&gt; -SUMMARY_libgomp-staticdev =3D &quot;GNU OpenMP parallel programming =
library - static development files&quot;<br>
&gt; +SUMMARY:libgomp-dev =3D &quot;GNU OpenMP parallel programming librar=
y - development files&quot;<br>
&gt; +FILES:libgomp-staticdev =3D &quot;${libdir}/libgomp*.a&quot;<br>
&gt; +SUMMARY:libgomp-staticdev =3D &quot;GNU OpenMP parallel programming =
library - static development files&quot;<br>
&gt;<br>
&gt; -FILES_libatomic =3D &quot;${libdir}/libatomic.so.*&quot;<br>
&gt; -SUMMARY_libatomic =3D &quot;GNU C++11 atomics support library&quot;<=
br>
&gt; -FILES_libatomic-dev =3D &quot;\<br>
&gt; +FILES:libatomic =3D &quot;${libdir}/libatomic.so.*&quot;<br>
&gt; +SUMMARY:libatomic =3D &quot;GNU C++11 atomics support library&quot;<=
br>
&gt; +FILES:libatomic-dev =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/libatomic.so \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/<a href=3D"http://libatomic.la" rel=3D"=
noreferrer" target=3D"_blank">libatomic.la</a> \<br>
&gt;=C2=A0 &quot;<br>
&gt; -SUMMARY_libatomic-dev =3D &quot;GNU C++11 atomics support library - =
development files&quot;<br>
&gt; -FILES_libatomic-staticdev =3D &quot;${libdir}/libatomic.a&quot;<br>
&gt; -SUMMARY_libatomic-staticdev =3D &quot;GNU C++11 atomics support libr=
ary - static development files&quot;<br>
&gt; +SUMMARY:libatomic-dev =3D &quot;GNU C++11 atomics support library - =
development files&quot;<br>
&gt; +FILES:libatomic-staticdev =3D &quot;${libdir}/libatomic.a&quot;<br>
&gt; +SUMMARY:libatomic-staticdev =3D &quot;GNU C++11 atomics support libr=
ary - static development files&quot;<br>
&gt;<br>
&gt; -FILES_libitm =3D &quot;${libdir}/libitm.so.*&quot;<br>
&gt; -SUMMARY_libitm =3D &quot;GNU transactional memory support library&qu=
ot;<br>
&gt; -FILES_libitm-dev =3D &quot;\<br>
&gt; +FILES:libitm =3D &quot;${libdir}/libitm.so.*&quot;<br>
&gt; +SUMMARY:libitm =3D &quot;GNU transactional memory support library&qu=
ot;<br>
&gt; +FILES:libitm-dev =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/libitm.so \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/<a href=3D"http://libitm.la" rel=3D"nor=
eferrer" target=3D"_blank">libitm.la</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/libitm.spec \<br>
&gt;=C2=A0 &quot;<br>
&gt; -SUMMARY_libitm-dev =3D &quot;GNU transactional memory support librar=
y - development files&quot;<br>
&gt; -FILES_libitm-staticdev =3D &quot;${libdir}/libitm.a&quot;<br>
&gt; -SUMMARY_libitm-staticdev =3D &quot;GNU transactional memory support =
library - static development files&quot;<br>
&gt; +SUMMARY:libitm-dev =3D &quot;GNU transactional memory support librar=
y - development files&quot;<br>
&gt; +FILES:libitm-staticdev =3D &quot;${libdir}/libitm.a&quot;<br>
&gt; +SUMMARY:libitm-staticdev =3D &quot;GNU transactional memory support =
library - static development files&quot;<br>
&gt;<br>
&gt;=C2=A0 EAT_VER_MAIN ??=3D &quot;&quot;<br>
&gt;<br>
&gt; diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolcha=
in/<a href=3D"http://gcc-aarch64-none-elf_10.2-2020.11.bb" rel=3D"noreferre=
r" target=3D"_blank">gcc-aarch64-none-elf_10.2-2020.11.bb</a> b/meta-arm-to=
olchain/recipes-devtools/external-arm-toolchain/<a href=3D"http://gcc-aarch=
64-none-elf_10.2-2020.11.bb" rel=3D"noreferrer" target=3D"_blank">gcc-aarch=
64-none-elf_10.2-2020.11.bb</a><br>
&gt; index 91caee1..fabe1b1 100644<br>
&gt; --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/<a h=
ref=3D"http://gcc-aarch64-none-elf_10.2-2020.11.bb" rel=3D"noreferrer" targ=
et=3D"_blank">gcc-aarch64-none-elf_10.2-2020.11.bb</a><br>
&gt; +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/<a h=
ref=3D"http://gcc-aarch64-none-elf_10.2-2020.11.bb" rel=3D"noreferrer" targ=
et=3D"_blank">gcc-aarch64-none-elf_10.2-2020.11.bb</a><br>
&gt; @@ -9,8 +9,8 @@ SUMMARY =3D &quot;Baremetal GCC for Aarch64 processor=
s&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;GPL-3.0-with-GCC-exception &amp; GPLv3&quot;<=
br>
&gt;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;${@d.getVar(d.expand(&quot;LIC_FILES=
_CHKSUM_${HOST_ARCH}&quot;))}&quot;<br>
&gt; -LIC_FILES_CHKSUM_aarch64 =3D &quot;file://share/doc/gcc/Copying.html=
;md5=3Dfdf39a58ab6e893f3d83594cef77fa05&quot;<br>
&gt; -LIC_FILES_CHKSUM_x86-64 =3D &quot;file://share/doc/gcc/Copying.html;=
md5=3De4bcb5bee0c4a50c06704b0b73fcbe0c&quot;<br>
&gt; +LIC_FILES_CHKSUM:aarch64 =3D &quot;file://share/doc/gcc/Copying.html=
;md5=3Dfdf39a58ab6e893f3d83594cef77fa05&quot;<br>
&gt; +LIC_FILES_CHKSUM:x86-64 =3D &quot;file://share/doc/gcc/Copying.html;=
md5=3De4bcb5bee0c4a50c06704b0b73fcbe0c&quot;<br>
&gt;<br>
&gt;=C2=A0 PROVIDES =3D &quot;virtual/aarch64-none-elf-gcc&quot;<br>
&gt;<br>
&gt; diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolcha=
in/license.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain=
/license.inc<br>
&gt; index fcc9268..67daa41 100644<br>
&gt; --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/lice=
nse.inc<br>
&gt; +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/lice=
nse.inc<br>
&gt; @@ -6,74 +6,74 @@ EAT_GDB_LICENSE =3D &quot;GPL-3.0&quot;<br>
&gt;=C2=A0 EAT_LIBC_LICENSE =3D &quot;GPLv2 &amp; LGPLv2.1&quot;<br>
&gt;=C2=A0 EAT_RLE_LICENSE =3D &quot;GPL-3.0-with-GCC-exception&quot;<br>
&gt;<br>
&gt; -LICENSE_${PN} =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; -LICENSE_${PN}-dev =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; -LICENSE_${PN}-doc =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; -LICENSE_${PN}-dbg =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; -LICENSE_${PN}-pic =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; -LICENSE_${PN}-utils =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; -LICENSE_${PN}-mtrace =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; -LICENSE_${PN}-gconv =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; -LICENSE_${PN}-extra-nss =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; -LICENSE_${PN}-thread-db =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; -LICENSE_${PN}-pcprofile =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; -LICENSE_${PN}-staticdev =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; -LICENSE_catchsegv =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; -LICENSE_glibc-extra-nss =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; -LICENSE_glibc-thread-db =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; +LICENSE:${PN} =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; +LICENSE:${PN}-dev =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; +LICENSE:${PN}-doc =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; +LICENSE:${PN}-dbg =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; +LICENSE:${PN}-pic =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; +LICENSE:${PN}-utils =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; +LICENSE:${PN}-mtrace =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; +LICENSE:${PN}-gconv =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; +LICENSE:${PN}-extra-nss =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; +LICENSE:${PN}-thread-db =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; +LICENSE:${PN}-pcprofile =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; +LICENSE:${PN}-staticdev =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; +LICENSE:catchsegv =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; +LICENSE:glibc-extra-nss =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; +LICENSE:glibc-thread-db =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt;<br>
&gt; -LICENSE_libmemusage =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; -LICENSE_libsegfault =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; -LICENSE_libsotruss =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; -LICENSE_sln =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; -LICENSE_nscd =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; -LICENSE_ldd =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; +LICENSE:libmemusage =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; +LICENSE:libsegfault =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; +LICENSE:libsotruss =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; +LICENSE:sln =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; +LICENSE:nscd =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt; +LICENSE:ldd =3D &quot;${EAT_LIBC_LICENSE}&quot;<br>
&gt;<br>
&gt; -LICENSE_libasan-dev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libasan =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libasan-staticdev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libatomic-dev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libatomic =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libatomic-staticdev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libg2c-dev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libg2c =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libgcc-dev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libgcc =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libgfortran-dbg =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libgfortran-dev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libgfortran =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libgfortran-staticdev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libgomp-dev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libgomp =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libgomp-staticdev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libitm-dev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libitm =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libitm-staticdev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_liblsan-dev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_liblsan =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_liblsan-staticdev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libmudflap-dev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libmudflap =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libmudflap-staticdev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libquadmath-dev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libquadmath =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libquadmath-staticdev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libssp-dev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libssp =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libssp-staticdev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libstdc++-dbg =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libstdc++-dev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libstdc++ =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libstdc++-precompile-dev =3D &quot;${EAT_GCC_LICENSE}&quot;<=
br>
&gt; -LICENSE_libstdc++-staticdev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libtsan-dev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libtsan =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libtsan-staticdev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libubsan-dev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libubsan =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; -LICENSE_libubsan-staticdev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libasan-dev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libasan =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libasan-staticdev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libatomic-dev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libatomic =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libatomic-staticdev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libg2c-dev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libg2c =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libgcc-dev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libgcc =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libgfortran-dbg =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libgfortran-dev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libgfortran =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libgfortran-staticdev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libgomp-dev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libgomp =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libgomp-staticdev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libitm-dev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libitm =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libitm-staticdev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:liblsan-dev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:liblsan =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:liblsan-staticdev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libmudflap-dev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libmudflap =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libmudflap-staticdev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libquadmath-dev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libquadmath =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libquadmath-staticdev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libssp-dev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libssp =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libssp-staticdev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libstdc++-dbg =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libstdc++-dev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libstdc++ =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libstdc++-precompile-dev =3D &quot;${EAT_GCC_LICENSE}&quot;<=
br>
&gt; +LICENSE:libstdc++-staticdev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libtsan-dev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libtsan =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libtsan-staticdev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libubsan-dev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libubsan =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt; +LICENSE:libubsan-staticdev =3D &quot;${EAT_GCC_LICENSE}&quot;<br>
&gt;<br>
&gt; -LICENSE_linux-libc-headers-dev =3D &quot;GPLv2&quot;<br>
&gt; -LICENSE_linux-libc-headers =3D &quot;GPLv2&quot;<br>
&gt; +LICENSE:linux-libc-headers-dev =3D &quot;GPLv2&quot;<br>
&gt; +LICENSE:linux-libc-headers =3D &quot;GPLv2&quot;<br>
&gt;<br>
&gt; -LICENSE_gdbserver =3D &quot;GPLv2 &amp; GPLv3 &amp; LGPLv2 &amp; LGP=
Lv3&quot;<br>
&gt; +LICENSE:gdbserver =3D &quot;GPLv2 &amp; GPLv3 &amp; LGPLv2 &amp; LGP=
Lv3&quot;<br>
&gt; diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2.inc=
 b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2.inc<br>
&gt; index 2a82293..dc611c3 100644<br>
&gt; --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2.inc<br>
&gt; +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2.inc<br>
&gt; @@ -82,7 +82,7 @@ FORTRAN =3D &quot;&quot;<br>
&gt;=C2=A0 JAVA =3D &quot;&quot;<br>
&gt;<br>
&gt;=C2=A0 SSP ?=3D &quot;--disable-libssp&quot;<br>
&gt; -SSP_mingw32 =3D &quot;--enable-libssp&quot;<br>
&gt; +SSP:mingw32 =3D &quot;--enable-libssp&quot;<br>
&gt;<br>
&gt;=C2=A0 EXTRA_OECONF_BASE =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${SSP} \<br>
&gt; @@ -112,7 +112,7 @@ EXTRA_OECONF_INITIAL =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --disable-libssp \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; -EXTRA_OECONF_append_aarchilp32 =3D &quot; --with-abi=3Dilp32&quot;<b=
r>
&gt; +EXTRA_OECONF:append_aarchilp32 =3D &quot; --with-abi=3Dilp32&quot;<b=
r>
&gt;<br>
&gt;=C2=A0 EXTRA_OECONF_PATHS =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --with-gxx-include-dir=3D/not/exist{target_includ=
edir}/c++/${BINV} \<br>
&gt; diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.i=
nc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc<br>
&gt; index 392c57f..d7cc4e7 100644<br>
&gt; --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc<br>
&gt; +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc<br>
&gt; @@ -9,7 +9,7 @@<br>
&gt;=C2=A0 # copy the file for target build in recipe-specific sysroot, in=
 external-arm<br>
&gt;=C2=A0 # toolchain mode and if the required file does not exist alread=
y.<br>
&gt;<br>
&gt; -do_install_prepend_class-target () {<br>
&gt; +do_install:prepend:class-target () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${TCMODE}&quot; =3D &quot=
;external-arm&quot; -a ! -f ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TA=
RGET_SYS}/${BINV}/include/unwind.h ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install =
-d ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include=
/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install =
${STAGING_LIBDIR}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/include/unwind.h ${STAGI=
NG_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/<br>
&gt; @@ -20,7 +20,7 @@ do_install_prepend_class-target () {<br>
&gt;=C2=A0 # gcc installs additional aliases as ${TARGET_SYS}-${EAT_TARGET=
_SYS}-gcc, etc.<br>
&gt;=C2=A0 # Since those are not packaged and not too useful, let&#39;s re=
move them to avoid<br>
&gt;=C2=A0 # QA issues<br>
&gt; -do_install_append () {<br>
&gt; +do_install:append () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for f in g++ gcc gcc-ar gcc-ranlib g=
cc-nm; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${=
D}${bindir}/${TARGET_SYS}-${EAT_TARGET_SYS}-$f<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt; diff --git a/meta-arm-toolchain/recipes-devtools/gcc/<a href=3D"http:=
//gcc-sanitizers_arm-10.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-sani=
tizers_arm-10.2.bb</a> b/meta-arm-toolchain/recipes-devtools/gcc/<a href=3D=
"http://gcc-sanitizers_arm-10.2.bb" rel=3D"noreferrer" target=3D"_blank">gc=
c-sanitizers_arm-10.2.bb</a><br>
&gt; index 9c41e92..e88ebe1 100644<br>
&gt; --- a/meta-arm-toolchain/recipes-devtools/gcc/<a href=3D"http://gcc-s=
anitizers_arm-10.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-sanitizers_=
arm-10.2.bb</a><br>
&gt; +++ b/meta-arm-toolchain/recipes-devtools/gcc/<a href=3D"http://gcc-s=
anitizers_arm-10.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-sanitizers_=
arm-10.2.bb</a><br>
&gt; @@ -3,5 +3,5 @@ require recipes-devtools/gcc/gcc-sanitizers.inc<br>
&gt;<br>
&gt;=C2=A0 # Building with thumb enabled on armv4t armv5t fails with<br>
&gt;=C2=A0 # sanitizer_linux.s:5749: Error: lo register required -- `ldr i=
p,[sp],#8&#39;<br>
&gt; -ARM_INSTRUCTION_SET_armv4 =3D &quot;arm&quot;<br>
&gt; -ARM_INSTRUCTION_SET_armv5 =3D &quot;arm&quot;<br>
&gt; +ARM_INSTRUCTION_SET:armv4 =3D &quot;arm&quot;<br>
&gt; +ARM_INSTRUCTION_SET:armv5 =3D &quot;arm&quot;<br>
&gt; diff --git a/meta-arm-toolchain/recipes-devtools/gcc/<a href=3D"http:=
//gcc_arm-10.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc_arm-10.2.bb</a>=
 b/meta-arm-toolchain/recipes-devtools/gcc/<a href=3D"http://gcc_arm-10.2.b=
b" rel=3D"noreferrer" target=3D"_blank">gcc_arm-10.2.bb</a><br>
&gt; index 51a0877..9296730 100644<br>
&gt; --- a/meta-arm-toolchain/recipes-devtools/gcc/<a href=3D"http://gcc_a=
rm-10.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc_arm-10.2.bb</a><br>
&gt; +++ b/meta-arm-toolchain/recipes-devtools/gcc/<a href=3D"http://gcc_a=
rm-10.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc_arm-10.2.bb</a><br>
&gt; @@ -5,11 +5,11 @@ require recipes-devtools/gcc/gcc-arm-common.inc<br>
&gt;=C2=A0 # Building with thumb enabled on armv4t armv5t fails with<br>
&gt;=C2=A0 # | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7438:(.text.unlikely+0=
x2fa): relocation truncated to fit: R_ARM_THM_CALL against symbol `fancy_ab=
ort(char const*, int, char const*)&#39; defined in .glue_7 section in linke=
r stubs<br>
&gt;=C2=A0 # | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7442:(.text.unlikely+0=
x318): additional relocation overflows omitted from the output<br>
&gt; -ARM_INSTRUCTION_SET_armv4 =3D &quot;arm&quot;<br>
&gt; -ARM_INSTRUCTION_SET_armv5 =3D &quot;arm&quot;<br>
&gt; +ARM_INSTRUCTION_SET:armv4 =3D &quot;arm&quot;<br>
&gt; +ARM_INSTRUCTION_SET:armv5 =3D &quot;arm&quot;<br>
&gt;<br>
&gt; -ARMFPARCHEXT_armv6 =3D &quot;${@&#39;+fp&#39; if d.getVar(&#39;TARGE=
T_FPU&#39;) =3D=3D &#39;hard&#39; else &#39;&#39;}&quot;<br>
&gt; -ARMFPARCHEXT_armv7a =3D &quot;${@&#39;+fp&#39; if d.getVar(&#39;TARG=
ET_FPU&#39;) =3D=3D &#39;hard&#39; else &#39;&#39;}&quot;<br>
&gt; -ARMFPARCHEXT_armv7ve =3D &quot;${@&#39;+fp&#39; if d.getVar(&#39;TAR=
GET_FPU&#39;) =3D=3D &#39;hard&#39; else &#39;&#39;}&quot;<br>
&gt; +ARMFPARCHEXT:armv6 =3D &quot;${@&#39;+fp&#39; if d.getVar(&#39;TARGE=
T_FPU&#39;) =3D=3D &#39;hard&#39; else &#39;&#39;}&quot;<br>
&gt; +ARMFPARCHEXT:armv7a =3D &quot;${@&#39;+fp&#39; if d.getVar(&#39;TARG=
ET_FPU&#39;) =3D=3D &#39;hard&#39; else &#39;&#39;}&quot;<br>
&gt; +ARMFPARCHEXT:armv7ve =3D &quot;${@&#39;+fp&#39; if d.getVar(&#39;TAR=
GET_FPU&#39;) =3D=3D &#39;hard&#39; else &#39;&#39;}&quot;<br>
&gt;<br>
&gt;=C2=A0 BBCLASSEXTEND =3D &quot;nativesdk&quot;<br>
&gt; diff --git a/meta-arm-toolchain/recipes-devtools/gcc/<a href=3D"http:=
//libgcc-initial_arm-10.2.bb" rel=3D"noreferrer" target=3D"_blank">libgcc-i=
nitial_arm-10.2.bb</a> b/meta-arm-toolchain/recipes-devtools/gcc/<a href=3D=
"http://libgcc-initial_arm-10.2.bb" rel=3D"noreferrer" target=3D"_blank">li=
bgcc-initial_arm-10.2.bb</a><br>
&gt; index 32f3dc0..ca1159c 100644<br>
&gt; --- a/meta-arm-toolchain/recipes-devtools/gcc/<a href=3D"http://libgc=
c-initial_arm-10.2.bb" rel=3D"noreferrer" target=3D"_blank">libgcc-initial_=
arm-10.2.bb</a><br>
&gt; +++ b/meta-arm-toolchain/recipes-devtools/gcc/<a href=3D"http://libgc=
c-initial_arm-10.2.bb" rel=3D"noreferrer" target=3D"_blank">libgcc-initial_=
arm-10.2.bb</a><br>
&gt; @@ -2,4 +2,4 @@ require recipes-devtools/gcc/gcc-${PV}.inc<br>
&gt;=C2=A0 require recipes-devtools/gcc/libgcc-initial.inc<br>
&gt;<br>
&gt;=C2=A0 # Building with thumb enabled on armv6t fails<br>
&gt; -ARM_INSTRUCTION_SET_armv6 =3D &quot;arm&quot;<br>
&gt; +ARM_INSTRUCTION_SET:armv6 =3D &quot;arm&quot;<br>
&gt; diff --git a/meta-arm-toolchain/recipes-devtools/gcc/<a href=3D"http:=
//libgcc_arm-10.2.bb" rel=3D"noreferrer" target=3D"_blank">libgcc_arm-10.2.=
bb</a> b/meta-arm-toolchain/recipes-devtools/gcc/<a href=3D"http://libgcc_a=
rm-10.2.bb" rel=3D"noreferrer" target=3D"_blank">libgcc_arm-10.2.bb</a><br>
&gt; index 572bab1..35ac5df 100644<br>
&gt; --- a/meta-arm-toolchain/recipes-devtools/gcc/<a href=3D"http://libgc=
c_arm-10.2.bb" rel=3D"noreferrer" target=3D"_blank">libgcc_arm-10.2.bb</a><=
br>
&gt; +++ b/meta-arm-toolchain/recipes-devtools/gcc/<a href=3D"http://libgc=
c_arm-10.2.bb" rel=3D"noreferrer" target=3D"_blank">libgcc_arm-10.2.bb</a><=
br>
&gt; @@ -2,4 +2,4 @@ require recipes-devtools/gcc/gcc-${PV}.inc<br>
&gt;=C2=A0 require recipes-devtools/gcc/libgcc.inc<br>
&gt;<br>
&gt;=C2=A0 # Building with thumb enabled on armv6t fails<br>
&gt; -ARM_INSTRUCTION_SET_armv6 =3D &quot;arm&quot;<br>
&gt; +ARM_INSTRUCTION_SET:armv6 =3D &quot;arm&quot;<br>
&gt; diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf<br>
&gt; index 9ee8749..24d9091 100644<br>
&gt; --- a/meta-arm/conf/layer.conf<br>
&gt; +++ b/meta-arm/conf/layer.conf<br>
&gt; @@ -13,4 +13,4 @@ LAYERDEPENDS_meta-arm =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 core \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 arm-toolchain \<br>
&gt;=C2=A0 &quot;<br>
&gt; -LAYERSERIES_COMPAT_meta-arm =3D &quot;hardknott&quot;<br>
&gt; +LAYERSERIES_COMPAT_meta-arm =3D &quot;honister&quot;<br>
&gt; diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-a=
rm/conf/machine/qemuarm64-secureboot.conf<br>
&gt; index fe19ed2..57b4b15 100644<br>
&gt; --- a/meta-arm/conf/machine/qemuarm64-secureboot.conf<br>
&gt; +++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf<br>
&gt; @@ -4,7 +4,7 @@ require ${COREBASE}/meta/conf/machine/qemuarm64.conf<=
br>
&gt;<br>
&gt;=C2=A0 KMACHINE =3D &quot;qemuarm64&quot;<br>
&gt;<br>
&gt; -UBOOT_MACHINE =3D &quot;qemu_arm64_defconfig&quot;<br>
&gt; +UBOOT_MACHINE =3D &quot;qemu:arm64_defconfig&quot;<br>
&gt;<br>
&gt;=C2=A0 QB_MACHINE =3D &quot;-machine virt,secure=3Don&quot;<br>
&gt;=C2=A0 QB_OPT_APPEND +=3D &quot;-no-acpi&quot;<br>
&gt; diff --git a/meta-arm/recipes-bsp/boot-wrapper-aarch64/<a href=3D"htt=
p://boot-wrapper-aarch64_git.bb" rel=3D"noreferrer" target=3D"_blank">boot-=
wrapper-aarch64_git.bb</a> b/meta-arm/recipes-bsp/boot-wrapper-aarch64/<a h=
ref=3D"http://boot-wrapper-aarch64_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">boot-wrapper-aarch64_git.bb</a><br>
&gt; index 3e4751e..c723517 100644<br>
&gt; --- a/meta-arm/recipes-bsp/boot-wrapper-aarch64/<a href=3D"http://boo=
t-wrapper-aarch64_git.bb" rel=3D"noreferrer" target=3D"_blank">boot-wrapper=
-aarch64_git.bb</a><br>
&gt; +++ b/meta-arm/recipes-bsp/boot-wrapper-aarch64/<a href=3D"http://boo=
t-wrapper-aarch64_git.bb" rel=3D"noreferrer" target=3D"_blank">boot-wrapper=
-aarch64_git.bb</a><br>
&gt; @@ -52,7 +52,7 @@ EXTRA_OEMAKE +=3D &quot;&#39;KERNEL_IMAGE=3D${DEPLO=
Y_DIR_IMAGE}/${BOOT_WRAPPER_AARCH64_KERNEL<br>
&gt;=C2=A0 EXTRA_OEMAKE +=3D &quot;&#39;CMDLINE=3D${BOOT_WRAPPER_AARCH64_C=
MDLINE}&#39;&quot;<br>
&gt;<br>
&gt;<br>
&gt; -do_configure_prepend() {<br>
&gt; +do_configure:prepend() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Create dummy files to make configure happy.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # We will pass the generated ones directly to mak=
e.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mkdir -p ${WORKDIR}/kernel/arch/arm64/boot<br>
&gt; diff --git a/meta-arm/recipes-bsp/hafnium/<a href=3D"http://hafnium_2=
.5.bb" rel=3D"noreferrer" target=3D"_blank">hafnium_2.5.bb</a> b/meta-arm/r=
ecipes-bsp/hafnium/<a href=3D"http://hafnium_2.5.bb" rel=3D"noreferrer" tar=
get=3D"_blank">hafnium_2.5.bb</a><br>
&gt; index 6d8bb3f..be510a1 100644<br>
&gt; --- a/meta-arm/recipes-bsp/hafnium/<a href=3D"http://hafnium_2.5.bb" =
rel=3D"noreferrer" target=3D"_blank">hafnium_2.5.bb</a><br>
&gt; +++ b/meta-arm/recipes-bsp/hafnium/<a href=3D"http://hafnium_2.5.bb" =
rel=3D"noreferrer" target=3D"_blank">hafnium_2.5.bb</a><br>
&gt; @@ -33,7 +33,7 @@ DEPENDS =3D &quot;bison-native bc-native openssl-na=
tive&quot;<br>
&gt;=C2=A0 # set project to build<br>
&gt;=C2=A0 EXTRA_OEMAKE +=3D &quot;PROJECT=3D${HAFNIUM_PROJECT}&quot;<br>
&gt;<br>
&gt; -do_compile_prepend() {<br>
&gt; +do_compile:prepend() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Hafnium expects &#39;python&#39;. Create symlin=
k python to python3<br>
&gt;=C2=A0 =C2=A0 =C2=A0 real=3D$(which ${PYTHON})<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ln -snf $real $(dirname $real)/python<br>
&gt; @@ -64,10 +64,10 @@ do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 done<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -FILES_${PN} =3D &quot;/firmware&quot;<br>
&gt; +FILES:${PN} =3D &quot;/firmware&quot;<br>
&gt;=C2=A0 SYSROOT_DIRS +=3D &quot;/firmware&quot;<br>
&gt;=C2=A0 # skip QA tests: {&#39;ldflags&#39;}<br>
&gt; -INSANE_SKIP_${PN} =3D &quot;ldflags&quot;<br>
&gt; +INSANE_SKIP:${PN} =3D &quot;ldflags&quot;<br>
&gt;<br>
&gt;=C2=A0 do_deploy() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cp -rf ${D}/firmware/* ${DEPLOYDIR}/<br>
&gt; diff --git a/meta-arm/recipes-bsp/scp-firmware/<a href=3D"http://scp-=
firmware_2.8.0.bb" rel=3D"noreferrer" target=3D"_blank">scp-firmware_2.8.0.=
bb</a> b/meta-arm/recipes-bsp/scp-firmware/<a href=3D"http://scp-firmware_2=
.8.0.bb" rel=3D"noreferrer" target=3D"_blank">scp-firmware_2.8.0.bb</a><br>
&gt; index ca7017a..d40d82d 100644<br>
&gt; --- a/meta-arm/recipes-bsp/scp-firmware/<a href=3D"http://scp-firmwar=
e_2.8.0.bb" rel=3D"noreferrer" target=3D"_blank">scp-firmware_2.8.0.bb</a><=
br>
&gt; +++ b/meta-arm/recipes-bsp/scp-firmware/<a href=3D"http://scp-firmwar=
e_2.8.0.bb" rel=3D"noreferrer" target=3D"_blank">scp-firmware_2.8.0.bb</a><=
br>
&gt; @@ -67,12 +67,12 @@ do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -FILES_${PN} =3D &quot;/firmware&quot;<br>
&gt; +FILES:${PN} =3D &quot;/firmware&quot;<br>
&gt;=C2=A0 SYSROOT_DIRS +=3D &quot;/firmware&quot;<br>
&gt;<br>
&gt; -FILES_${PN}-dbg +=3D &quot;/firmware/*.elf&quot;<br>
&gt; +FILES:${PN}-dbg +=3D &quot;/firmware/*.elf&quot;<br>
&gt;=C2=A0 # Skip QA check for relocations in .text of elf binaries<br>
&gt; -INSANE_SKIP_${PN}-dbg =3D &quot;arch textrel&quot;<br>
&gt; +INSANE_SKIP:${PN}-dbg =3D &quot;arch textrel&quot;<br>
&gt;=C2=A0 INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quot;<br>
&gt;=C2=A0 INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
&gt;<br>
&gt; diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc<br>
&gt; index 57f1438..a1e59d8 100644<br>
&gt; --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc<=
br>
&gt; +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc<=
br>
&gt; @@ -48,12 +48,12 @@ SRC_URI_MBEDTLS ??=3D &quot;&quot;<br>
&gt;=C2=A0 # This should be set to MBEDTLS LIC FILES checksum<br>
&gt;=C2=A0 LIC_FILES_CHKSUM_MBEDTLS ??=3D &quot;&quot;<br>
&gt;=C2=A0 # add MBEDTLS to our sources if activated<br>
&gt; -SRC_URI_append =3D &quot; ${@bb.utils.contains(&#39;TFA_MBEDTLS&#39;=
, &#39;1&#39;, &#39;${SRC_URI_MBEDTLS}&#39;, &#39;&#39;, d)}&quot;<br>
&gt; +SRC_URI:append =3D &quot; ${@bb.utils.contains(&#39;TFA_MBEDTLS&#39;=
, &#39;1&#39;, &#39;${SRC_URI_MBEDTLS}&#39;, &#39;&#39;, d)}&quot;<br>
&gt;=C2=A0 # Update license variables<br>
&gt; -LICENSE_append =3D &quot;${@bb.utils.contains(&#39;TFA_MBEDTLS&#39;,=
 &#39;1&#39;, &#39; &amp; Apache-2.0&#39;, &#39;&#39;, d)}&quot;<br>
&gt; -LIC_FILES_CHKSUM_append =3D &quot;${@bb.utils.contains(&#39;TFA_MBED=
TLS&#39;, &#39;1&#39;, &#39; ${LIC_FILES_CHKSUM_MBEDTLS}&#39;, &#39;&#39;, =
d)}&quot;<br>
&gt; +LICENSE:append =3D &quot;${@bb.utils.contains(&#39;TFA_MBEDTLS&#39;,=
 &#39;1&#39;, &#39; &amp; Apache-2.0&#39;, &#39;&#39;, d)}&quot;<br>
&gt; +LIC_FILES_CHKSUM:append =3D &quot;${@bb.utils.contains(&#39;TFA_MBED=
TLS&#39;, &#39;1&#39;, &#39; ${LIC_FILES_CHKSUM_MBEDTLS}&#39;, &#39;&#39;, =
d)}&quot;<br>
&gt;=C2=A0 # add mbed TLS to version<br>
&gt; -SRCREV_FORMAT_append =3D &quot;${@bb.utils.contains(&#39;TFA_MBEDTLS=
&#39;, &#39;1&#39;, &#39;_mbedtls&#39;, &#39;&#39;, d)}&quot;<br>
&gt; +SRCREV_FORMAT:append =3D &quot;${@bb.utils.contains(&#39;TFA_MBEDTLS=
&#39;, &#39;1&#39;, &#39;_mbedtls&#39;, &#39;&#39;, d)}&quot;<br>
&gt;<br>
&gt;=C2=A0 # U-boot support (set TFA_UBOOT to 1 to activate)<br>
&gt;=C2=A0 # When U-Boot support is activated BL33 is activated with u-boo=
t.bin file<br>
&gt; @@ -82,12 +82,12 @@ LD[unexport] =3D &quot;1&quot;<br>
&gt;=C2=A0 do_configure[noexec] =3D &quot;1&quot;<br>
&gt;<br>
&gt;=C2=A0 # Baremetal, just need a compiler<br>
&gt; -DEPENDS_remove =3D &quot;virtual/${TARGET_PREFIX}compilerlibs virtua=
l/libc&quot;<br>
&gt; +DEPENDS:remove =3D &quot;virtual/${TARGET_PREFIX}compilerlibs virtua=
l/libc&quot;<br>
&gt;<br>
&gt;=C2=A0 # We need dtc for dtbs compilation<br>
&gt;=C2=A0 # We need openssl for fiptool<br>
&gt;=C2=A0 DEPENDS =3D &quot;dtc-native openssl-native&quot;<br>
&gt; -DEPENDS_append_toolchain-clang =3D &quot; compiler-rt&quot;<br>
&gt; +DEPENDS:append:toolchain-clang =3D &quot; compiler-rt&quot;<br>
&gt;<br>
&gt;=C2=A0 # CC and LD introduce arguments which conflict with those other=
wise provided by<br>
&gt;=C2=A0 # this recipe. The heads of these variables excluding those arg=
uments<br>
&gt; @@ -217,12 +217,12 @@ do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 done<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -FILES_${PN} =3D &quot;/firmware&quot;<br>
&gt; +FILES:${PN} =3D &quot;/firmware&quot;<br>
&gt;=C2=A0 SYSROOT_DIRS +=3D &quot;/firmware&quot;<br>
&gt;<br>
&gt; -FILES_${PN}-dbg =3D &quot;/firmware/*.elf&quot;<br>
&gt; +FILES:${PN}-dbg =3D &quot;/firmware/*.elf&quot;<br>
&gt;=C2=A0 # Skip QA check for relocations in .text of elf binaries<br>
&gt; -INSANE_SKIP_${PN}-dbg =3D &quot;textrel&quot;<br>
&gt; +INSANE_SKIP:${PN}-dbg =3D &quot;textrel&quot;<br>
&gt;<br>
&gt;=C2=A0 do_deploy() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cp -rf ${D}/firmware/* ${DEPLOYDIR}/<br>
&gt; diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_%.bbappend b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_=
%.bbappend<br>
&gt; index dd74cd5..5b5a049 100644<br>
&gt; --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bb=
append<br>
&gt; +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bb=
append<br>
&gt; @@ -1,26 +1,26 @@<br>
&gt; -COMPATIBLE_MACHINE_qemuarm64 =3D &quot;qemuarm64&quot;<br>
&gt; +COMPATIBLE_MACHINE:qemuarm64 =3D &quot;qemuarm64&quot;<br>
&gt;<br>
&gt; -TFA_PLATFORM_qemuarm64-secureboot =3D &quot;qemu&quot;<br>
&gt; -TFA_PLATFORM_qemuarm64-sbsa =3D &quot;qemu_sbsa&quot;<br>
&gt; +TFA_PLATFORM:qemuarm64-secureboot =3D &quot;qemu&quot;<br>
&gt; +TFA_PLATFORM:qemuarm64-sbsa =3D &quot;qemu_sbsa&quot;<br>
&gt;<br>
&gt; -TFA_SPD_qemuarm64-secureboot =3D &quot;opteed&quot;<br>
&gt; +TFA_SPD:qemuarm64-secureboot =3D &quot;opteed&quot;<br>
&gt;<br>
&gt; -TFA_UBOOT_qemuarm64-secureboot =3D &quot;1&quot;<br>
&gt; -TFA_BUILD_TARGET_aarch64_qemuall =3D &quot;all fip&quot;<br>
&gt; +TFA_UBOOT:qemuarm64-secureboot =3D &quot;1&quot;<br>
&gt; +TFA_BUILD_TARGET:aarch64:qemuall =3D &quot;all fip&quot;<br>
&gt;<br>
&gt; -TFA_INSTALL_TARGET_qemuarm64-secureboot =3D &quot;flash.bin&quot;<br=
>
&gt; -TFA_INSTALL_TARGET_qemuarm64-sbsa =3D &quot;bl1 fip&quot;<br>
&gt; +TFA_INSTALL_TARGET:qemuarm64-secureboot =3D &quot;flash.bin&quot;<br=
>
&gt; +TFA_INSTALL_TARGET:qemuarm64-sbsa =3D &quot;bl1 fip&quot;<br>
&gt;<br>
&gt; -DEPENDS_append_aarch64_qemuall =3D &quot; optee-os&quot;<br>
&gt; +DEPENDS:append:aarch64:qemuall =3D &quot; optee-os&quot;<br>
&gt;<br>
&gt; -EXTRA_OEMAKE_append_aarch64_qemuall =3D &quot; \<br>
&gt; +EXTRA_OEMAKE:append:aarch64:qemuall =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 BL32=3D${STAGING_DIR_TARGET}${nonarch_base_libdir=
}/firmware/tee-header_v2.bin \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 BL32_EXTRA1=3D${STAGING_DIR_TARGET}${nonarch_base=
_libdir}/firmware/tee-pager_v2.bin \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 BL32_EXTRA2=3D${STAGING_DIR_TARGET}${nonarch_base=
_libdir}/firmware/tee-pageable_v2.bin \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 BL32_RAM_LOCATION=3Dtdram \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt; -do_compile_append_qemuarm64-secureboot() {<br>
&gt; +do_compile:append:qemuarm64-secureboot() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Create a secure flash image for booting AArch64=
 Qemu. See:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # <a href=3D"https://git.trustedfirmware.org/TF-A=
/trusted-firmware-a.git/tree/docs/plat/qemu.rst" rel=3D"noreferrer" target=
=3D"_blank">https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/tr=
ee/docs/plat/qemu.rst</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 dd if=3D${BUILD_DIR}/bl1.bin of=3D${BUILD_DIR}/fl=
ash.bin bs=3D4096 conv=3Dnotrunc<br>
&gt; diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"http:=
//trusted-firmware-a_1.5.bb" rel=3D"noreferrer" target=3D"_blank">trusted-f=
irmware-a_1.5.bb</a> b/meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"h=
ttp://trusted-firmware-a_1.5.bb" rel=3D"noreferrer" target=3D"_blank">trust=
ed-firmware-a_1.5.bb</a><br>
&gt; index 56d3507..1a004b8 100644<br>
&gt; --- a/meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"http://trust=
ed-firmware-a_1.5.bb" rel=3D"noreferrer" target=3D"_blank">trusted-firmware=
-a_1.5.bb</a><br>
&gt; +++ b/meta-arm/recipes-bsp/trusted-firmware-a/<a href=3D"http://trust=
ed-firmware-a_1.5.bb" rel=3D"noreferrer" target=3D"_blank">trusted-firmware=
-a_1.5.bb</a><br>
&gt; @@ -8,7 +8,7 @@ require trusted-firmware-a.inc<br>
&gt;=C2=A0 SRCREV_FORMAT =3D &quot;tfa&quot;<br>
&gt;<br>
&gt;=C2=A0 # TF-A v1.5<br>
&gt; -SRCREV_tfa =3D &quot;ed8112606c54d85781fc8429160883d6310ece32&quot;<=
br>
&gt; +SRCREV:tfa =3D &quot;ed8112606c54d85781fc8429160883d6310ece32&quot;<=
br>
&gt;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM +=3D &quot;file://license.rst;md5=3De927e02bca=
647e14efd87e9e914b2443&quot;<br>
&gt;<br>
&gt; @@ -20,7 +20,7 @@ LIC_FILES_CHKSUM +=3D &quot;file://license.rst;md5=
=3De927e02bca647e14efd87e9e914b2443&quot;<br>
&gt;=C2=A0 SRC_URI_MBEDTLS =3D &quot;git://<a href=3D"http://github.com/AR=
Mmbed/mbedtls.git;name=3Dmbedtls;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;=
branch=3Dmbedtls-2.16" rel=3D"noreferrer" target=3D"_blank">github.com/ARMm=
bed/mbedtls.git;name=3Dmbedtls;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;br=
anch=3Dmbedtls-2.16</a>&quot;<br>
&gt;<br>
&gt;=C2=A0 # mbed TLS v2.16.2<br>
&gt; -SRCREV_mbedtls =3D &quot;d81c11b8ab61fd5b2da8133aa73c5fe33a0633eb&qu=
ot;<br>
&gt; +SRCREV:mbedtls =3D &quot;d81c11b8ab61fd5b2da8133aa73c5fe33a0633eb&qu=
ot;<br>
&gt;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM_MBEDTLS =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://mbedtls/apache-2.0.txt;md5=3D3b83ef96387f1=
4655fc854ddc3c6bd57 \<br>
&gt; diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/<a href=3D"http:=
//trusted-firmware-m_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">trusted=
-firmware-m_1.3.0.bb</a> b/meta-arm/recipes-bsp/trusted-firmware-m/<a href=
=3D"http://trusted-firmware-m_1.3.0.bb" rel=3D"noreferrer" target=3D"_blan=
k">trusted-firmware-m_1.3.0.bb</a><br>
&gt; index c954e02..7c850b0 100644<br>
&gt; --- a/meta-arm/recipes-bsp/trusted-firmware-m/<a href=3D"http://trust=
ed-firmware-m_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">trusted-firmwa=
re-m_1.3.0.bb</a><br>
&gt; +++ b/meta-arm/recipes-bsp/trusted-firmware-m/<a href=3D"http://trust=
ed-firmware-m_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">trusted-firmwa=
re-m_1.3.0.bb</a><br>
&gt; @@ -118,7 +118,7 @@ do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -m 0644 ${B}/bin/* ${D}/firmware/<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -FILES_${PN} =3D &quot;/firmware&quot;<br>
&gt; +FILES:${PN} =3D &quot;/firmware&quot;<br>
&gt;=C2=A0 SYSROOT_DIRS +=3D &quot;/firmware&quot;<br>
&gt;<br>
&gt;=C2=A0 addtask deploy after do_install<br>
&gt; diff --git a/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
/recipes-bsp/u-boot/u-boot_%.bbappend<br>
&gt; index afcd70a..f725156 100644<br>
&gt; --- a/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend<br>
&gt; +++ b/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend<br>
&gt; @@ -1,3 +1,3 @@<br>
&gt; -FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
&gt; +FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
&gt;<br>
&gt; -SRC_URI_append_qemuarm64-secureboot =3D &quot; file://qemuarm64.cfg&=
quot;<br>
&gt; +SRC_URI:append:qemuarm64-secureboot =3D &quot; file://qemuarm64.cfg&=
quot;<br>
&gt; diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/r=
ecipes-bsp/uefi/edk2-firmware.inc<br>
&gt; index c5ab48c..4b44086 100644<br>
&gt; --- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc<br>
&gt; +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc<br>
&gt; @@ -38,7 +38,7 @@ EDK2_EXTRA_BUILD=C2=A0 =C2=A0=3D &quot;&quot;<br>
&gt;=C2=A0 EDK2_BUILD_MODE ?=3D &quot;${@bb.utils.contains(&#39;EDK2_BUILD=
_RELEASE&#39;, &#39;1&#39;, &#39;RELEASE&#39;, &#39;DEBUG&#39;, d)}&quot;<b=
r>
&gt;<br>
&gt;=C2=A0 # Baremetal, no need for a C library<br>
&gt; -DEPENDS_remove =3D &quot;virtual/${TARGET_PREFIX}compilerlibs virtua=
l/libc&quot;<br>
&gt; +DEPENDS:remove =3D &quot;virtual/${TARGET_PREFIX}compilerlibs virtua=
l/libc&quot;<br>
&gt;=C2=A0 DEPENDS +=3D &quot;util-linux-native iasl-native&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit deploy<br>
&gt; @@ -63,9 +63,9 @@ export CONF_PATH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0=3D &quot;${S}/Conf&quot;<br>
&gt;=C2=A0 export BTOOLS_PATH =3D &quot;${EDK_TOOLS_PATH}/BinWrappers/Posi=
xLike&quot;<br>
&gt;<br>
&gt;=C2=A0 EDK_COMPILER ?=3D &quot;GCC5&quot;<br>
&gt; -EDK_COMPILER_toolchain-clang =3D &quot;CLANG38&quot;<br>
&gt; +EDK_COMPILER:toolchain-clang =3D &quot;CLANG38&quot;<br>
&gt;<br>
&gt; -do_configure_prepend() {<br>
&gt; +do_configure:prepend() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sed -i -e &quot;s#-target ${HOST_ARCH}-linux-gnu*=
#-target ${HOST_SYS}#&quot; ${S}/BaseTools/Conf/tools_def.template<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; @@ -95,10 +95,10 @@ do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_=
MODE}_${EDK_COMPILER}/FV/${EDK2_BIN_NAME} ${D}/firmware/uefi.bin<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -FILES_${PN} =3D &quot;/firmware&quot;<br>
&gt; +FILES:${PN} =3D &quot;/firmware&quot;<br>
&gt;=C2=A0 SYSROOT_DIRS +=3D &quot;/firmware&quot;<br>
&gt;=C2=A0 # Skip QA check for relocations in .text of elf binaries<br>
&gt; -INSANE_SKIP_${PN} =3D &quot;textrel&quot;<br>
&gt; +INSANE_SKIP:${PN} =3D &quot;textrel&quot;<br>
&gt;<br>
&gt;=C2=A0 do_deploy() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Copy the images to deploy directory<br>
&gt; diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend b/met=
a-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend<br>
&gt; index 8330ac9..fbdec1f 100644<br>
&gt; --- a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend<br>
&gt; +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend<br>
&gt; @@ -1,25 +1,25 @@<br>
&gt;=C2=A0 COMPATIBLE_MACHINE =3D &quot;qemuarm64&quot;<br>
&gt;<br>
&gt; -DEPENDS_append_qemuarm64-sbsa =3D &quot; virtual/trusted-firmware-a&=
quot;<br>
&gt; +DEPENDS:append:qemuarm64-sbsa =3D &quot; virtual/trusted-firmware-a&=
quot;<br>
&gt;<br>
&gt; -EDK2_BUILD_RELEASE_aarch64_qemuall =3D &quot;1&quot;<br>
&gt; -EDK2_ARCH_aarch64_qemuall=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quo=
t;AARCH64&quot;<br>
&gt; +EDK2_BUILD_RELEASE:aarch64:qemuall =3D &quot;1&quot;<br>
&gt; +EDK2_ARCH:aarch64:qemuall=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quo=
t;AARCH64&quot;<br>
&gt;<br>
&gt; -EDK2_PLATFORM_qemuarm64-sbsa=C2=A0 =C2=A0 =C2=A0 =3D &quot;SbsaQemu&=
quot;<br>
&gt; -EDK2_PLATFORM_DSC_qemuarm64-sbsa=C2=A0 =3D &quot;Platform/Qemu/SbsaQ=
emu/SbsaQemu.dsc&quot;<br>
&gt; -EDK2_BIN_NAME_qemuarm64-sbsa=C2=A0 =C2=A0 =C2=A0 =3D &quot;SBSA_FLAS=
H0.fd&quot;<br>
&gt; +EDK2_PLATFORM:qemuarm64-sbsa=C2=A0 =C2=A0 =C2=A0 =3D &quot;SbsaQemu&=
quot;<br>
&gt; +EDK2_PLATFORM_DSC:qemuarm64-sbsa=C2=A0 =3D &quot;Platform/Qemu/SbsaQ=
emu/SbsaQemu.dsc&quot;<br>
&gt; +EDK2_BIN_NAME:qemuarm64-sbsa=C2=A0 =C2=A0 =C2=A0 =3D &quot;SBSA_FLAS=
H0.fd&quot;<br>
&gt;<br>
&gt; -EDK2_PLATFORM_qemuarm64-secureboot=C2=A0 =C2=A0 =C2=A0 =3D &quot;Arm=
VirtQemu-AARCH64&quot;<br>
&gt; -EDK2_PLATFORM_DSC_qemuarm64-secureboot=C2=A0 =3D &quot;ArmVirtPkg/Ar=
mVirtQemu.dsc&quot;<br>
&gt; -EDK2_BIN_NAME_qemuarm64-secureboot=C2=A0 =C2=A0 =C2=A0 =3D &quot;QEM=
U_EFI.fd&quot;<br>
&gt; +EDK2_PLATFORM:qemuarm64-secureboot=C2=A0 =C2=A0 =C2=A0 =3D &quot;Arm=
VirtQemu-AARCH64&quot;<br>
&gt; +EDK2_PLATFORM_DSC:qemuarm64-secureboot=C2=A0 =3D &quot;ArmVirtPkg/Ar=
mVirtQemu.dsc&quot;<br>
&gt; +EDK2_BIN_NAME:qemuarm64-secureboot=C2=A0 =C2=A0 =C2=A0 =3D &quot;QEM=
U_EFI.fd&quot;<br>
&gt;<br>
&gt; -do_compile_prepend_qemuarm64-sbsa() {<br>
&gt; +do_compile:prepend:qemuarm64-sbsa() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mkdir -p ${B}/Platform/Qemu/Sbsa/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cp ${RECIPE_SYSROOT}/firmware/bl1.bin ${B}/Platfo=
rm/Qemu/Sbsa/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cp ${RECIPE_SYSROOT}/firmware/fip.bin ${B}/Platfo=
rm/Qemu/Sbsa/<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -do_install_append_qemuarm64-sbsa() {<br>
&gt; +do_install:append:qemuarm64-sbsa() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_=
MODE}_${EDK_COMPILER}/FV/SBSA_FLASH0.fd ${D}/firmware/ovmf-tfa.bin<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_=
MODE}_${EDK_COMPILER}/FV/SBSA_FLASH1.fd ${D}/firmware/ovmf-uefi.bin<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /usr/bin/truncate -s 256M ${D}/firmware/ovmf*.bin=
<br>
&gt; diff --git a/meta-arm/recipes-bsp/uefi/<a href=3D"http://sbsa-acs_3.0=
.bb" rel=3D"noreferrer" target=3D"_blank">sbsa-acs_3.0.bb</a> b/meta-arm/re=
cipes-bsp/uefi/<a href=3D"http://sbsa-acs_3.0.bb" rel=3D"noreferrer" target=
=
=3D"_blank">sbsa-acs_3.0.bb</a><br>
&gt; index c0d8e91..14f6606 100644<br>
&gt; --- a/meta-arm/recipes-bsp/uefi/<a href=3D"http://sbsa-acs_3.0.bb" re=
l=3D"noreferrer" target=3D"_blank">sbsa-acs_3.0.bb</a><br>
&gt; +++ b/meta-arm/recipes-bsp/uefi/<a href=3D"http://sbsa-acs_3.0.bb" re=
l=3D"noreferrer" target=3D"_blank">sbsa-acs_3.0.bb</a><br>
&gt; @@ -1,6 +1,6 @@<br>
&gt;=C2=A0 require recipes-bsp/uefi/<a href=3D"http://edk2-firmware_202102=
.bb" rel=3D"noreferrer" target=3D"_blank">edk2-firmware_202102.bb</a><br>
&gt;<br>
&gt; -PROVIDES_remove =3D &quot;virtual/uefi-firmware&quot;<br>
&gt; +PROVIDES:remove =3D &quot;virtual/uefi-firmware&quot;<br>
&gt;<br>
&gt;=C2=A0 LICENSE +=3D &quot;&amp; Apache-2.0&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM +=3D &quot;file://ShellPkg/Application/sbsa-ac=
s/LICENSE.md;md5=3D2a944942e1496af1886903d274dedb13&quot;<br>
&gt; diff --git a/meta-arm/recipes-devtools/fvp/fvp-common.inc b/meta-arm/=
recipes-devtools/fvp/fvp-common.inc<br>
&gt; index ec82251..d6fbf87 100644<br>
&gt; --- a/meta-arm/recipes-devtools/fvp/fvp-common.inc<br>
&gt; +++ b/meta-arm/recipes-devtools/fvp/fvp-common.inc<br>
&gt; @@ -21,12 +21,12 @@ fvp_link_binaries() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rm -f ${D}${bindir}/*.so<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -FILES_${PN} =3D &quot;${bindir} ${FVPDIR}&quot;<br>
&gt; +FILES:${PN} =3D &quot;${bindir} ${FVPDIR}&quot;<br>
&gt;<br>
&gt;=C2=A0 # Prebuilt binaries are already stripped<br>
&gt; -INSANE_SKIP_${PN} +=3D &quot;already-stripped&quot;<br>
&gt; +INSANE_SKIP:${PN} +=3D &quot;already-stripped&quot;<br>
&gt;=C2=A0 # FVP can optionally have a GUI, but we can use the host librar=
ies in native/nativesdk<br>
&gt; -INSANE_SKIP_${PN} +=3D &quot;file-rdeps&quot;<br>
&gt; +INSANE_SKIP:${PN} +=3D &quot;file-rdeps&quot;<br>
&gt;<br>
&gt;=C2=A0 # FVP brings its own standard library so don&#39;t let it be us=
ed as a shlib provider<br>
&gt;=C2=A0 PRIVATE_LIBS =3D &quot;libgcc_s.so.1 libstdc++.so.6&quot;<br>
&gt; diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend =
b/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend<br>
&gt; index 0ba8992..84af757 100644<br>
&gt; --- a/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend<br>
&gt; +++ b/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend<br>
&gt; @@ -1,19 +1,19 @@<br>
&gt;=C2=A0 ARMFILESPATHS :=3D &quot;${THISDIR}/${PN}:&quot;<br>
&gt;<br>
&gt;=C2=A0 COMPATIBLE_MACHINE_generic-arm64 =3D &quot;generic-arm64&quot;<=
br>
&gt; -FILESEXTRAPATHS_prepend_generic-arm64 =3D &quot;${ARMFILESPATHS}&quo=
t;<br>
&gt; -SRC_URI_append_generic-arm64 =3D &quot; \<br>
&gt; +FILESEXTRAPATHS:prepend_generic-arm64 =3D &quot;${ARMFILESPATHS}&quo=
t;<br>
&gt; +SRC_URI:append_generic-arm64 =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://defconfig.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://tcpci.cfg \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt; -FILESEXTRAPATHS_prepend_qemuarm64-sbsa =3D &quot;${ARMFILESPATHS}&qu=
ot;<br>
&gt; -SRC_URI_append_qemuarm64-sbsa =3D &quot; \<br>
&gt; +FILESEXTRAPATHS:prepend:qemuarm64-sbsa =3D &quot;${ARMFILESPATHS}&qu=
ot;<br>
&gt; +SRC_URI:append:qemuarm64-sbsa =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://defconfig.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt; -FILESEXTRAPATHS_prepend_qemuarm64-secureboot =3D &quot;${ARMFILESPAT=
HS}&quot;<br>
&gt; -SRC_URI_append_qemuarm64-secureboot =3D &quot; \<br>
&gt; +FILESEXTRAPATHS:prepend:qemuarm64-secureboot =3D &quot;${ARMFILESPAT=
HS}&quot;<br>
&gt; +SRC_URI:append:qemuarm64-secureboot =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://zone_dma_revert.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://tee.cfg \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-=
arm/recipes-security/optee/optee-client.inc<br>
&gt; index 65c9a44..deeb46c 100644<br>
&gt; --- a/meta-arm/recipes-security/optee/optee-client.inc<br>
&gt; +++ b/meta-arm/recipes-security/optee/optee-client.inc<br>
&gt; @@ -21,9 +21,9 @@ EXTRA_OECMAKE =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 -DBUILD_SHARED_LIBS=3DON \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 -DCFG_TEE_FS_PARENT_PATH=3D&#39;${localstatedir}/=
lib/tee&#39; \<br>
&gt;=C2=A0 &quot;<br>
&gt; -EXTRA_OECMAKE_append_toolchain-clang =3D &quot; -DCFG_WERROR=3D0&quo=
t;<br>
&gt; +EXTRA_OECMAKE:toolchain-clang =3D &quot; -DCFG_WERROR=3D0&quot;<br>
&gt;<br>
&gt; -do_install_append() {<br>
&gt; +do_install:append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -D -p -m0644 ${WORKDIR}/tee-supplicant.se=
rvice ${D}${systemd_system_unitdir}/tee-supplicant.service<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -D -p -m0755 ${WORKDIR}/tee-supplicant.sh=
 ${D}${sysconfdir}/init.d/tee-supplicant<br>
&gt;<br>
&gt; @@ -33,8 +33,8 @@ do_install_append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${sysconfd=
ir}/init.d/tee-supplicant<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -SYSTEMD_SERVICE_${PN} =3D &quot;tee-supplicant.service&quot;<br>
&gt; +SYSTEMD_SERVICE:${PN} =3D &quot;tee-supplicant.service&quot;<br>
&gt;<br>
&gt;=C2=A0 INITSCRIPT_PACKAGES =3D &quot;${PN}&quot;<br>
&gt; -INITSCRIPT_NAME_${PN} =3D &quot;tee-supplicant&quot;<br>
&gt; -INITSCRIPT_PARAMS_${PN} =3D &quot;start 10 1 2 3 4 5 . stop 90 0 6 .=
&quot;<br>
&gt; +INITSCRIPT_NAME:${PN} =3D &quot;tee-supplicant&quot;<br>
&gt; +INITSCRIPT_PARAMS:${PN} =3D &quot;start 10 1 2 3 4 5 . stop 90 0 6 .=
&quot;<br>
&gt; diff --git a/meta-arm/recipes-security/optee/optee-examples.inc b/met=
a-arm/recipes-security/optee/optee-examples.inc<br>
&gt; index f2e53f3..b74344a 100644<br>
&gt; --- a/meta-arm/recipes-security/optee/optee-examples.inc<br>
&gt; +++ b/meta-arm/recipes-security/optee/optee-examples.inc<br>
&gt; @@ -39,7 +39,7 @@ do_install () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -D -p -m0444 ${B}/plugins/* ${D}${libdir}=
/tee-supplicant/plugins<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -FILES_${PN} +=3D &quot;${nonarch_base_libdir}/optee_armtz/ \<br>
&gt; +FILES:${PN} +=3D &quot;${nonarch_base_libdir}/optee_armtz/ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${libdi=
r}/tee-supplicant/plugins/ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<b=
r>
&gt;<br>
&gt; diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/=
recipes-security/optee/optee-os.inc<br>
&gt; index 483b797..3d707ac 100644<br>
&gt; --- a/meta-arm/recipes-security/optee/optee-os.inc<br>
&gt; +++ b/meta-arm/recipes-security/optee/optee-os.inc<br>
&gt; @@ -12,7 +12,7 @@ CVE_PRODUCT =3D &quot;linaro:op-tee op-tee:op-tee_o=
s&quot;<br>
&gt;<br>
&gt;=C2=A0 DEPENDS =3D &quot;python3-pycryptodome-native python3-pyelftool=
s-native&quot;<br>
&gt;<br>
&gt; -DEPENDS_append_toolchain-clang =3D &quot; compiler-rt&quot;<br>
&gt; +DEPENDS:append:toolchain-clang =3D &quot; compiler-rt&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/OP-TEE/opt=
ee_os.git" rel=3D"noreferrer" target=3D"_blank">github.com/OP-TEE/optee_os.=
git</a>&quot;<br>
&gt;<br>
&gt; @@ -65,12 +65,12 @@ addtask deploy before do_build after do_install<b=
r>
&gt;<br>
&gt;=C2=A0 SYSROOT_DIRS +=3D &quot;${nonarch_base_libdir}/firmware&quot;<b=
r>
&gt;<br>
&gt; -FILES_${PN} =3D &quot;${nonarch_base_libdir}/firmware/&quot;<br>
&gt; -FILES_${PN}-dev =3D &quot;${includedir}/optee/&quot;<br>
&gt; +FILES:${PN} =3D &quot;${nonarch_base_libdir}/firmware/&quot;<br>
&gt; +FILES:${PN}-dev =3D &quot;${includedir}/optee/&quot;<br>
&gt;<br>
&gt;=C2=A0 # note: &quot;textrel&quot; is not triggered on all archs<br>
&gt; -INSANE_SKIP_${PN} =3D &quot;textrel&quot;<br>
&gt; -INSANE_SKIP_${PN}-dev =3D &quot;staticdev&quot;<br>
&gt; +INSANE_SKIP:${PN} =3D &quot;textrel&quot;<br>
&gt; +INSANE_SKIP:${PN}-dev =3D &quot;staticdev&quot;<br>
&gt;<br>
&gt;=C2=A0 INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
&gt;<br>
&gt; diff --git a/meta-arm/recipes-security/optee/<a href=3D"http://optee-=
os_3.14.0.bb" rel=3D"noreferrer" target=3D"_blank">optee-os_3.14.0.bb</a> b=
/meta-arm/recipes-security/optee/<a href=3D"http://optee-os_3.14.0.bb" rel=
=3D"noreferrer" target=3D"_blank">optee-os_3.14.0.bb</a><br>
&gt; index 3289e2c..95d82bb 100644<br>
&gt; --- a/meta-arm/recipes-security/optee/<a href=3D"http://optee-os_3.14=
.0.bb" rel=3D"noreferrer" target=3D"_blank">optee-os_3.14.0.bb</a><br>
&gt; +++ b/meta-arm/recipes-security/optee/<a href=3D"http://optee-os_3.14=
.0.bb" rel=3D"noreferrer" target=3D"_blank">optee-os_3.14.0.bb</a><br>
&gt; @@ -2,7 +2,7 @@ require optee-os.inc<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;d21befa5e53eae9db469eba1685f5aa5c6f92c2f&quot;=
<br>
&gt;<br>
&gt; -SRC_URI_append =3D &quot; \<br>
&gt; +SRC_URI:append =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0006-allow-setting-sysroot-for-libgcc-look=
up.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0007-allow-setting-sysroot-for-clang.patch=
 \<br>
&gt;=C2=A0 &quot;<br>
&gt; diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-ar=
m/recipes-security/optee/optee-test.inc<br>
&gt; index bcbcc06..0a8e56c 100644<br>
&gt; --- a/meta-arm/recipes-security/optee/optee-test.inc<br>
&gt; +++ b/meta-arm/recipes-security/optee/optee-test.inc<br>
&gt; @@ -43,7 +43,7 @@ do_install () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -D -p -m0444 ${B}/supp_plugin/*.plugin ${=
D}${libdir}/tee-supplicant/plugins/<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -FILES_${PN} +=3D &quot;${nonarch_base_libdir}/optee_armtz/ \<br>
&gt; +FILES:${PN} +=3D &quot;${nonarch_base_libdir}/optee_armtz/ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${libdi=
r}/tee-supplicant/plugins/ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<b=
r>
&gt;<br>
&gt; diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/rec=
ipes-security/optee/optee.inc<br>
&gt; index d093b48..39a7042 100644<br>
&gt; --- a/meta-arm/recipes-security/optee/optee.inc<br>
&gt; +++ b/meta-arm/recipes-security/optee/optee.inc<br>
&gt; @@ -1,15 +1,15 @@<br>
&gt;=C2=A0 UPSTREAM_CHECK_GITTAGREGEX =3D &quot;^(?P&lt;pver&gt;\d+(\.\d+)=
+)$&quot;<br>
&gt;<br>
&gt;=C2=A0 COMPATIBLE_MACHINE ?=3D &quot;invalid&quot;<br>
&gt; -COMPATIBLE_MACHINE_qemuarm64 ?=3D &quot;qemuarm64&quot;<br>
&gt; +COMPATIBLE_MACHINE:qemuarm64 ?=3D &quot;qemuarm64&quot;<br>
&gt;=C2=A0 # Please add supported machines below or set it in .bbappend or=
 .conf<br>
&gt;<br>
&gt;=C2=A0 OPTEEMACHINE ?=3D &quot;${MACHINE}&quot;<br>
&gt; -OPTEEMACHINE_aarch64_qemuall ?=3D &quot;vexpress-qemu_armv8a&quot;<b=
r>
&gt; +OPTEEMACHINE:aarch64:qemuall ?=3D &quot;vexpress-qemu:armv8a&quot;<b=
r>
&gt;<br>
&gt;=C2=A0 OPTEE_ARCH =3D &quot;null&quot;<br>
&gt; -OPTEE_ARCH_armv7a =3D &quot;arm32&quot;<br>
&gt; -OPTEE_ARCH_aarch64 =3D &quot;arm64&quot;<br>
&gt; +OPTEE_ARCH:armv7a =3D &quot;arm32&quot;<br>
&gt; +OPTEE_ARCH:aarch64 =3D &quot;arm64&quot;<br>
&gt;=C2=A0 OPTEE_CORE =3D &quot;${@d.getVar(&#39;OPTEE_ARCH&#39;).upper()}=
&quot;<br>
&gt;<br>
&gt;=C2=A0 OPTEE_TOOLCHAIN =3D &quot;${@d.getVar(&#39;TOOLCHAIN&#39;) or &=
#39;gcc&#39;}&quot;<br>
&gt; diff --git a/meta-atp/recipes-devtools/gem5/gem5-aarch64-native_20.bb=
append b/meta-atp/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend<br>
&gt; index 5194ce1..6607f0f 100644<br>
&gt; --- a/meta-atp/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend<=
br>
&gt; +++ b/meta-atp/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend<=
br>
&gt; @@ -1,6 +1,6 @@<br>
&gt;=C2=A0 require recipes-devtools/atp/atp-source_3.1.inc<br>
&gt;<br>
&gt; -FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${BPN}:&quot;<br>
&gt; +FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/${BPN}:&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI +=3D &quot;${ATP_SRC};destsuffix=3Dgit/atp;name=3Datp \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://start-gem5-atp=
.sh&quot;<br>
&gt; @@ -11,14 +11,14 @@ LIC_FILES_CHKSUM +=3D &quot;file://atp/LICENSE;md=
5=3D${ATP_LIC_MD5}&quot;<br>
&gt;<br>
&gt;=C2=A0 EXTRA_OESCONS +=3D &quot;EXTRAS=3D${S}/atp&quot;<br>
&gt;<br>
&gt; -do_install_append() {<br>
&gt; +do_install:append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # baremetal_atp.py machine configuration and samp=
le stream.atp file<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -m 644 ${B}/atp/gem5/baremetal_atp.py \<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0${B}/atp/configs/stream.atp \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0${D}${datadir}/gem5/configs<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -do_deploy_append() {<br>
&gt; +do_deploy:append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # start-gem5-atp.sh launch script<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -m 755 ${WORKDIR}/start-gem5-atp.sh ${DEP=
LOYDIR}<br>
&gt;=C2=A0 }<br>
&gt; diff --git a/meta-atp/recipes-devtools/gem5/gem5-m5ops_20.bbappend b/=
meta-atp/recipes-devtools/gem5/gem5-m5ops_20.bbappend<br>
&gt; index 34024bf..3ba0c3c 100644<br>
&gt; --- a/meta-atp/recipes-devtools/gem5/gem5-m5ops_20.bbappend<br>
&gt; +++ b/meta-atp/recipes-devtools/gem5/gem5-m5ops_20.bbappend<br>
&gt; @@ -1,6 +1,6 @@<br>
&gt;=C2=A0 inherit update-rc.d<br>
&gt;<br>
&gt; -FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${BPN}:&quot;<br>
&gt; +FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/${BPN}:&quot;<br>
&gt;<br>
&gt;=C2=A0 # Add startup script calling m5 readfile for automatic checkpoi=
nt and restore<br>
&gt;=C2=A0 SRC_URI +=3D &quot;file://m5-readfile.sh&quot;<br>
&gt; @@ -8,7 +8,7 @@ SRC_URI +=3D &quot;file://m5-readfile.sh&quot;<br>
&gt;=C2=A0 INITSCRIPT_NAME =3D &quot;m5-readfile.sh&quot;<br>
&gt;=C2=A0 INITSCRIPT_PARAMS =3D &quot;defaults 99&quot;<br>
&gt;<br>
&gt; -do_install_append() {<br>
&gt; +do_install:append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -d ${D}/${INIT_D_DIR}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -m 755 ${WORKDIR}/m5-readfile.sh ${D}/${I=
NIT_D_DIR}<br>
&gt;=C2=A0 }<br>
&gt; diff --git a/meta-atp/recipes-kernel/atp/<a href=3D"http://atp-module=
_3.1.bb" rel=3D"noreferrer" target=3D"_blank">atp-module_3.1.bb</a> b/meta-=
atp/recipes-kernel/atp/<a href=3D"http://atp-module_3.1.bb" rel=3D"noreferr=
er" target=3D"_blank">atp-module_3.1.bb</a><br>
&gt; index 9820a9d..0bf4949 100644<br>
&gt; --- a/meta-atp/recipes-kernel/atp/<a href=3D"http://atp-module_3.1.bb=
" rel=3D"noreferrer" target=3D"_blank">atp-module_3.1.bb</a><br>
&gt; +++ b/meta-atp/recipes-kernel/atp/<a href=3D"http://atp-module_3.1.bb=
" rel=3D"noreferrer" target=3D"_blank">atp-module_3.1.bb</a><br>
&gt; @@ -12,11 +12,11 @@ ATP_MOD_DIR =3D &quot;linux&quot;<br>
&gt;=C2=A0 EXTRA_OEMAKE +=3D &quot;-C ${ATP_MOD_DIR}&quot;<br>
&gt;<br>
&gt;=C2=A0 PROVIDES =3D &quot;kernel-module-atp&quot;<br>
&gt; -RPROVIDES_${PN} =3D &quot;kernel-module-atp&quot;<br>
&gt; +RPROVIDES:${PN} =3D &quot;kernel-module-atp&quot;<br>
&gt;=C2=A0 KERNEL_MODULE_AUTOLOAD +=3D &quot;atp_buffer_manager atp_device=
&quot;<br>
&gt;=C2=A0 MODULES_MODULE_SYMVERS_LOCATION =3D &quot;${ATP_MOD_DIR}&quot;<=
br>
&gt;<br>
&gt; -do_install_append() {<br>
&gt; +do_install:append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -d ${D}${includedir}/linux<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -m 644 ${ATP_MOD_DIR}/atp_buffer_manager_=
user.h \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0${ATP_MOD_DIR}/atp_device_user.h \<br>
&gt; diff --git a/meta-atp/recipes-kernel/atp/<a href=3D"http://atp-test_3=
.1.bb" rel=3D"noreferrer" target=3D"_blank">atp-test_3.1.bb</a> b/meta-atp/=
recipes-kernel/atp/<a href=3D"http://atp-test_3.1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">atp-test_3.1.bb</a><br>
&gt; index c3f3caa..5a3097e 100644<br>
&gt; --- a/meta-atp/recipes-kernel/atp/<a href=3D"http://atp-test_3.1.bb" =
rel=3D"noreferrer" target=3D"_blank">atp-test_3.1.bb</a><br>
&gt; +++ b/meta-atp/recipes-kernel/atp/<a href=3D"http://atp-test_3.1.bb" =
rel=3D"noreferrer" target=3D"_blank">atp-test_3.1.bb</a><br>
&gt; @@ -18,4 +18,4 @@ do_install() {<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 DEPENDS =3D &quot;atp-uapi cppunit&quot;<br>
&gt; -RDEPENDS_${PN} =3D &quot;atp-uapi&quot;<br>
&gt; +RDEPENDS:${PN} =3D &quot;atp-uapi&quot;<br>
&gt; diff --git a/meta-atp/recipes-kernel/linux/linux-yocto_5.4.bbappend b=
/meta-atp/recipes-kernel/linux/linux-yocto_5.4.bbappend<br>
&gt; index 701499b..c835220 100644<br>
&gt; --- a/meta-atp/recipes-kernel/linux/linux-yocto_5.4.bbappend<br>
&gt; +++ b/meta-atp/recipes-kernel/linux/linux-yocto_5.4.bbappend<br>
&gt; @@ -1,2 +1,2 @@<br>
&gt; -FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${BPN}-5.4:&quot;<br>
&gt; +FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/${BPN}-5.4:&quot;<br>
&gt;=C2=A0 SRC_URI +=3D &quot;file://no_ftrace.cfg file://smmuv3.cfg&quot;=
<br>
&gt; diff --git a/meta-gem5/conf/layer.conf b/meta-gem5/conf/layer.conf<br=
>
&gt; index e6320ef..5469c35 100644<br>
&gt; --- a/meta-gem5/conf/layer.conf<br>
&gt; +++ b/meta-gem5/conf/layer.conf<br>
&gt; @@ -16,4 +16,4 @@ BBFILES_DYNAMIC +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 virtualization-layer:${LAYERDIR}/dynamic-layers/m=
eta-virtualization/*/*/*.bbappend \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; -DISTRO_FEATURES_NATIVE_append =3D &quot; ${@bb.utils.filter(&#39;DIS=
TRO_FEATURES&#39;, &#39;xen&#39;, d)}&quot;<br>
&gt; +DISTRO_FEATURES_NATIVE:append =3D &quot; ${@bb.utils.filter(&#39;DIS=
TRO_FEATURES&#39;, &#39;xen&#39;, d)}&quot;<br>
&gt; diff --git a/meta-gem5/conf/machine/gem5-arm64.conf b/meta-gem5/conf/=
machine/gem5-arm64.conf<br>
&gt; index 3e97682..fa931da 100644<br>
&gt; --- a/meta-gem5/conf/machine/gem5-arm64.conf<br>
&gt; +++ b/meta-gem5/conf/machine/gem5-arm64.conf<br>
&gt; @@ -50,5 +50,5 @@ EXTRA_IMAGEDEPENDS +=3D &quot;gem5-aarch64-native&q=
uot;<br>
&gt;=C2=A0 # As this is a virtual target that will not be used in the real=
 world there is<br>
&gt;=C2=A0 # no need for real SSH keys.=C2=A0 Disable rng-tools (which tak=
es too long to<br>
&gt;=C2=A0 # initialise) and install the pre-generated keys.<br>
&gt; -PACKAGECONFIG_remove_pn-openssh =3D &quot;rng-tools&quot;<br>
&gt; +PACKAGECONFIG:remove:pn-openssh =3D &quot;rng-tools&quot;<br>
&gt;=C2=A0 MACHINE_EXTRA_RRECOMMENDS +=3D &quot;ssh-pregen-hostkeys&quot;<=
br>
&gt; diff --git a/meta-gem5/dynamic-layers/meta-virtualization/recipes-bsp=
/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend b/meta-gem5/dynamic-=
layers/meta-virtualization/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-a=
arch64_%.bbappend<br>
&gt; index 3b93b3b..223cbe7 100644<br>
&gt; --- a/meta-gem5/dynamic-layers/meta-virtualization/recipes-bsp/boot-w=
rapper-aaarch64/boot-wrapper-aarch64_%.bbappend<br>
&gt; +++ b/meta-gem5/dynamic-layers/meta-virtualization/recipes-bsp/boot-w=
rapper-aaarch64/boot-wrapper-aarch64_%.bbappend<br>
&gt; @@ -1,6 +1,6 @@<br>
&gt;=C2=A0 # Use OVERRIDES to minimize the usage of<br>
&gt;=C2=A0 # ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;xen&#39;=
, ...<br>
&gt; -OVERRIDES_append =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES=
&#39;, &#39;xen&#39;, &#39;:xen&#39;, &#39;&#39;, d)}&quot;<br>
&gt; +OVERRIDES:append =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES=
&#39;, &#39;xen&#39;, &#39;:xen&#39;, &#39;&#39;, d)}&quot;<br>
&gt;<br>
&gt;=C2=A0 # Xen image to put in the image<br>
&gt;=C2=A0 # This should point to a file in the deploy image directory<br>
&gt; @@ -18,12 +18,12 @@ BOOT_WRAPPER_AARCH64_CMDLINE_xen_gem5-arm64 =3D &=
quot;console=3Dhvc0 root=3D/dev/vda rw&quot;<br>
&gt;=C2=A0 # Image generated by boot wrapper when Xen is present<br>
&gt;=C2=A0 BOOT_WRAPPER_AARCH64_IMAGE_xen ?=3D &quot;xen-system.axf&quot;<=
br>
&gt;<br>
&gt; -EXTRA_OECONF_append_xen =3D &quot; \<br>
&gt; +EXTRA_OECONF:append_xen =3D &quot; \<br>
&gt;=C2=A0 --with-xen=3D${WORKDIR}/kernel/arch/arm64/boot/Image \<br>
&gt;=C2=A0 --with-xen-cmdline=3D&quot;&quot; \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; -EXTRA_OEMAKE_append_xen =3D &quot; \<br>
&gt; +EXTRA_OEMAKE:append_xen =3D &quot; \<br>
&gt;=C2=A0 XEN_IMAGE=3D${DEPLOY_DIR_IMAGE}/${BOOT_WRAPPER_AARCH64_XEN} \<b=
r>
&gt;=C2=A0 XEN_CMDLINE=3D&quot;${BOOT_WRAPPER_AARCH64_XEN_CMDLINE}&quot; \=
<br>
&gt;=C2=A0 &quot;<br>
&gt; diff --git a/meta-gem5/dynamic-layers/meta-virtualization/recipes-dev=
tools/gem5/gem5-aarch64-native_20.bbappend b/meta-gem5/dynamic-layers/meta-=
virtualization/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend<br>
&gt; index 8239a40..5c38bdd 100644<br>
&gt; --- a/meta-gem5/dynamic-layers/meta-virtualization/recipes-devtools/g=
em5/gem5-aarch64-native_20.bbappend<br>
&gt; +++ b/meta-gem5/dynamic-layers/meta-virtualization/recipes-devtools/g=
em5/gem5-aarch64-native_20.bbappend<br>
&gt; @@ -1,6 +1,6 @@<br>
&gt;=C2=A0 # When booting gem5-arm64 with Xen we need to set the cpu as Co=
rtex A53 and<br>
&gt;=C2=A0 # remove support for pointer authentification<br>
&gt; -GEM5_RUN_EXTRA_append =3D &quot; \<br>
&gt; +GEM5_RUN_EXTRA:append =3D &quot; \<br>
&gt;=C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES_NATIVE&#39;, &#39;xen=
&#39;, \<br>
&gt;=C2=A0 &#39;--param=3Dsystem.cpu_cluster[0].cpus[0].isa[0].midr=3D0x41=
0fd030 \<br>
&gt;=C2=A0 --param=3Dsystem.cpu_cluster[0].cpus[0].isa[0].id_aa64isar1_el1=
=
=3D0x0&#39;, \<br>
&gt; diff --git a/meta-gem5/dynamic-layers/meta-virtualization/recipes-ext=
ended/xen/xen_%.bbappend b/meta-gem5/dynamic-layers/meta-virtualization/rec=
ipes-extended/xen/xen_%.bbappend<br>
&gt; index ef42c52..a721f8e 100644<br>
&gt; --- a/meta-gem5/dynamic-layers/meta-virtualization/recipes-extended/x=
en/xen_%.bbappend<br>
&gt; +++ b/meta-gem5/dynamic-layers/meta-virtualization/recipes-extended/x=
en/xen_%.bbappend<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt;=C2=A0 # gem5-arm64 support<br>
&gt;=C2=A0 COMPATIBLE_MACHINE_gem5-arm64 =3D &quot;gem5-arm64&quot;<br>
&gt; -FILESEXTRAPATHS_prepend_gem5-arm64 :=3D &quot;${THISDIR}/files:&quot=
;<br>
&gt; -SRC_URI_append_gem5-arm64 =3D &quot; file://early-printk.cfg&quot;<b=
r>
&gt; +FILESEXTRAPATHS:prepend_gem5-arm64 :=3D &quot;${THISDIR}/files:&quot=
;<br>
&gt; +SRC_URI:append_gem5-arm64 =3D &quot; file://early-printk.cfg&quot;<b=
r>
&gt; diff --git a/meta-gem5/dynamic-layers/meta-virtualization/recipes-ker=
nel/linux/linux-%.bbappend b/meta-gem5/dynamic-layers/meta-virtualization/r=
ecipes-kernel/linux/linux-%.bbappend<br>
&gt; index 5d3b52c..f2d2818 100644<br>
&gt; --- a/meta-gem5/dynamic-layers/meta-virtualization/recipes-kernel/lin=
ux/linux-%.bbappend<br>
&gt; +++ b/meta-gem5/dynamic-layers/meta-virtualization/recipes-kernel/lin=
ux/linux-%.bbappend<br>
&gt; @@ -1,9 +1,9 @@<br>
&gt; -FILESEXTRAPATHS_prepend_gem5-arm64 :=3D &quot;${THISDIR}:&quot;<br>
&gt; +FILESEXTRAPATHS:prepend_gem5-arm64 :=3D &quot;${THISDIR}:&quot;<br>
&gt;<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # virtualization kmeta extra<br>
&gt;=C2=A0 #<br>
&gt; -SRC_URI_append_gem5-arm64 =3D &quot; file://virtualization-kmeta-ext=
ra-gem5;type=3Dkmeta;name=3Dvirtualization-kmeta-extra-gem5;destsuffix=3Dvi=
rtualization-kmeta-extra-gem5&quot;<br>
&gt; +SRC_URI:append_gem5-arm64 =3D &quot; file://virtualization-kmeta-ext=
ra-gem5;type=3Dkmeta;name=3Dvirtualization-kmeta-extra-gem5;destsuffix=3Dvi=
rtualization-kmeta-extra-gem5&quot;<br>
&gt;<br>
&gt;=C2=A0 # We need to turn off SVE support in the Linux kernel otherwise=
 Xen is stopping<br>
&gt;=C2=A0 # Linux kernel with a coredump while trying to access XEN bit o=
f CPACR1 core<br>
&gt; @@ -11,4 +11,4 @@ SRC_URI_append_gem5-arm64 =3D &quot; file://virtual=
ization-kmeta-extra-gem5;type=3Dkmeta;<br>
&gt;=C2=A0 LINUX_VIRTUALIZATION_DISABLE_ARM64_SVE_gem5-arm64 =3D &quot;${@=
bb.utils.contains(&#39;DISTRO_FEATURES&#39;, \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;xen&#39;, &#39; features/disable-arm64-sve.scc&#39;,&#39;&#=
39;,d)}&quot;<br>
&gt;<br>
&gt; -KERNEL_FEATURES_append_gem5-arm64 =3D &quot;${LINUX_VIRTUALIZATION_D=
ISABLE_ARM64_SVE}&quot;<br>
&gt; +KERNEL_FEATURES:append_gem5-arm64 =3D &quot;${LINUX_VIRTUALIZATION_D=
ISABLE_ARM64_SVE}&quot;<br>
&gt; diff --git a/meta-gem5/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-=
aarch64_%.bbappend b/meta-gem5/recipes-bsp/boot-wrapper-aarch64/boot-wrappe=
r-aarch64_%.bbappend<br>
&gt; index d890d1b..65a5b84 100644<br>
&gt; --- a/meta-gem5/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64=
_%.bbappend<br>
&gt; +++ b/meta-gem5/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64=
_%.bbappend<br>
&gt; @@ -4,7 +4,7 @@ COMPATIBLE_MACHINE_gem5-arm64 =3D &quot;gem5-arm64&qu=
ot;<br>
&gt;=C2=A0 PROVIDES_gem5-arm64 +=3D &quot;virtual/gem5-bootloader&quot;<br=
>
&gt;<br>
&gt;=C2=A0 # For gem5 we use the dtb generated by gem5 directly<br>
&gt; -DEPENDS_append_gem5-arm64 =3D &quot; gem5-aarch64-dtb&quot;<br>
&gt; +DEPENDS:append_gem5-arm64 =3D &quot; gem5-aarch64-dtb&quot;<br>
&gt;=C2=A0 BOOT_WRAPPER_AARCH64_DEVICETREE_gem5-arm64 =3D &quot;gem5-aarch=
64.dtb&quot;<br>
&gt;<br>
&gt;=C2=A0 # The dtb must be generated for us to generate the axf<br>
&gt; diff --git a/meta-gem5/recipes-devtools/gem5/<a href=3D"http://gem5-a=
arch64-native_20.bb" rel=3D"noreferrer" target=3D"_blank">gem5-aarch64-nati=
ve_20.bb</a> b/meta-gem5/recipes-devtools/gem5/<a href=3D"http://gem5-aarch=
64-native_20.bb" rel=3D"noreferrer" target=3D"_blank">gem5-aarch64-native_2=
0.bb</a><br>
&gt; index 79cf910..057aad8 100644<br>
&gt; --- a/meta-gem5/recipes-devtools/gem5/<a href=3D"http://gem5-aarch64-=
native_20.bb" rel=3D"noreferrer" target=3D"_blank">gem5-aarch64-native_20.b=
b</a><br>
&gt; +++ b/meta-gem5/recipes-devtools/gem5/<a href=3D"http://gem5-aarch64-=
native_20.bb" rel=3D"noreferrer" target=3D"_blank">gem5-aarch64-native_20.b=
b</a><br>
&gt; @@ -8,13 +8,13 @@ require gem5-aarch64-native.inc<br>
&gt;=C2=A0 require gem5-native.inc<br>
&gt;<br>
&gt;=C2=A0 # Get rid of compiler errors when building protobuf<br>
&gt; -GEM5_SCONS_ARGS_append =3D &quot; CCFLAGS_EXTRA=3D&#39;-Wno-error=3D=
unused-variable&#39; --verbose&quot;<br>
&gt; +GEM5_SCONS_ARGS:append =3D &quot; CCFLAGS_EXTRA=3D&#39;-Wno-error=3D=
unused-variable&#39; --verbose&quot;<br>
&gt;<br>
&gt;=C2=A0 # Get rid of linker errors and have a faster link process<br>
&gt; -GEM5_SCONS_ARGS_append =3D &quot; LDFLAGS_EXTRA=3D&#39;${BUILD_LDFLA=
GS}&#39; \<br>
&gt; +GEM5_SCONS_ARGS:append =3D &quot; LDFLAGS_EXTRA=3D&#39;${BUILD_LDFLA=
GS}&#39; \<br>
&gt;=C2=A0 MARSHAL_LDFLAGS_EXTRA=3D&#39;${BUILD_LDFLAGS}&#39; --force-lto =
&quot;<br>
&gt;<br>
&gt; -do_compile_prepend() {<br>
&gt; +do_compile:prepend() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Gem5 expect to have python in the path (can be =
python2 or 3)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Create a link named python to python3<br>
&gt;=C2=A0 =C2=A0 =C2=A0 real=3D$(which ${PYTHON})<br>
&gt; diff --git a/meta-gem5/recipes-devtools/gem5/gem5-native.inc b/meta-g=
em5/recipes-devtools/gem5/gem5-native.inc<br>
&gt; index 1462b4e..a719f72 100644<br>
&gt; --- a/meta-gem5/recipes-devtools/gem5/gem5-native.inc<br>
&gt; +++ b/meta-gem5/recipes-devtools/gem5/gem5-native.inc<br>
&gt; @@ -45,8 +45,8 @@ do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 done<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -FILES_${PN} =3D &quot;${datadir}/gem5/* ${bindir}/*&quot;<br>
&gt; -INSANE_SKIP_${PN} +=3D &quot;already-stripped&quot;<br>
&gt; -RDEPENDS_${PN} +=3D &quot;python3-native hdf5-native protobuf-native=
 libpng-native&quot;<br>
&gt; +FILES:${PN} =3D &quot;${datadir}/gem5/* ${bindir}/*&quot;<br>
&gt; +INSANE_SKIP:${PN} +=3D &quot;already-stripped&quot;<br>
&gt; +RDEPENDS:${PN} +=3D &quot;python3-native hdf5-native protobuf-native=
 libpng-native&quot;<br>
&gt;<br>
&gt;=C2=A0 addtask addto_recipe_sysroot before do_build<br>
&gt; diff --git a/meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend =
b/meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend<br>
&gt; index 7913f61..8b86855 100644<br>
&gt; --- a/meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend<br>
&gt; +++ b/meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend<br>
&gt; @@ -1,11 +1,11 @@<br>
&gt; -FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}:${THISDIR}/files:&quot=
;<br>
&gt; +FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}:${THISDIR}/files:&quot=
;<br>
&gt;<br>
&gt;=C2=A0 COMPATIBLE_MACHINE_gem5-arm64 =3D &quot;gem5-arm64&quot;<br>
&gt;=C2=A0 KMACHINE_gem5-arm64 =3D &quot;gem5-arm64&quot;<br>
&gt; -SRC_URI_append_gem5-arm64 =3D &quot; file://gem5-kmeta;type=3Dkmeta;=
name=3Dgem5-kmeta;destsuffix=3Dgem5-kmeta \<br>
&gt; +SRC_URI:append_gem5-arm64 =3D &quot; file://gem5-kmeta;type=3Dkmeta;=
name=3Dgem5-kmeta;destsuffix=3Dgem5-kmeta \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://dts/gem5-arm64;subdir=3Da=
dd-files&quot;<br>
&gt;<br>
&gt; -do_patch_append_gem5-arm64() {<br>
&gt; +do_patch:append_gem5-arm64() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tar -C ${WORKDIR}/add-files/dts -cf - gem5-arm64 =
| \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tar -C arch/arm64/boot/dts -xf -<br=
>
&gt;=C2=A0 }<br>
&gt; --<br>
&gt; 2.32.0<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000c3046305c8b6290b--
