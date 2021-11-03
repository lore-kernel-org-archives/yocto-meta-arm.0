Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD07C433F5
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 22:26:52 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.3924.1635978410774696569
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 03 Nov 2021 15:26:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9656D40C50;
	Wed,  3 Nov 2021 22:26:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vg_sLS3p1yzu; Wed,  3 Nov 2021 22:26:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6FA6240A3D;
	Wed,  3 Nov 2021 22:26:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 36E9E1746B2; Wed,  3 Nov 2021 18:26:48 -0400 (EDT)
Date: Wed, 3 Nov 2021 18:26:48 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] Update git: SRC_URIs
Message-ID: <20211103222648.GV10132@denix.org>
References: <20211103160427.890131-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211103160427.890131-1-ross.burton@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 03 Nov 2021 22:26:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2337

On Wed, Nov 03, 2021 at 04:04:27PM +0000, Ross Burton wrote:
> GitHub has deprecated the unauthorised git protocol[1], so all GitHub

s/unauthorised/unauthenticated


> URLs need to specify protocol=https.
> 
> Also the git fetcher is making the branch parameter mandatory, so add it
> where it is currently implicit.
> 
> [1] https://github.blog/2021-09-01-improving-git-protocol-security-github/
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb   | 2 +-
>  .../trusted-firmware-a/trusted-firmware-a-corstone1000.inc    | 2 +-
>  meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bb             | 2 +-
>  meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb             | 2 +-
>  meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.10.bb             | 2 +-
>  .../corstone700-test-app/corstone700-test-app_1.0.bb          | 2 +-
>  .../boot-wrapper-aarch64/boot-wrapper-aarch64_git.bb          | 2 +-
>  meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb                   | 2 +-
>  meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb       | 2 +-
>  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 2 +-
>  meta-arm/recipes-bsp/uefi/edk2-firmware.inc                   | 4 ++--
>  meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb       | 2 +-
>  meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb  | 2 +-
>  meta-arm/recipes-devtools/opencsd/opencsd_1.1.0.bb            | 2 +-
>  meta-arm/recipes-security/optee/optee-client.inc              | 2 +-
>  meta-arm/recipes-security/optee/optee-examples.inc            | 2 +-
>  meta-arm/recipes-security/optee/optee-os.inc                  | 2 +-
>  meta-arm/recipes-security/optee/optee-test.inc                | 2 +-
>  meta-atp/recipes-devtools/atp/atp-source_3.1.inc              | 2 +-
>  19 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb b/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb
> index cfcb98de..0a8e2df6 100644
> --- a/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb
> +++ b/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb
> @@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause & Apache-2.0"
>  LIC_FILES_CHKSUM = "file://license.md;md5=e44b2531cd6ffe9dece394dbe988d9a0 \
>                      file://cmsis/LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
>  
> -SRC_URI = "gitsm://git.linaro.org/landing-teams/working/arm/boot-firmware.git;protocol=https \
> +SRC_URI = "gitsm://git.linaro.org/landing-teams/working/arm/boot-firmware.git;protocol=https;branch=master \
>             file://gen-module-race.patch"
>  SRCREV = "af7eeb1bb8c5a85a5e5a76d48acc6fe864d715a9"
>  PV = "2020.02.10+git${SRCPV}"
> diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
> index 833396e8..32546bb3 100644
> --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
> +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
> @@ -2,7 +2,7 @@
>  
>  COMPATIBLE_MACHINE = "(corstone1000)"
>  
> -SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa"
> +SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
>  
>  # TF-A master branch with all Corstone1000 patches merged
>  SRCREV_tfa = "459b24451a0829460783ce8dfa15561e36d901d8"
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bb b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bb
> index e54e34a1..1cd54be4 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bb
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bb
> @@ -16,7 +16,7 @@ PE = "1"
>  # repo during parse
>  SRCREV = "36fec02b1f90b92cf51ec531564f9284eae27ab4"
>  
> -SRC_URI = "git://git.denx.de/u-boot.git \
> +SRC_URI = "git://git.denx.de/u-boot.git;branch=master \
>            "
>  
>  S = "${WORKDIR}/git"
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb
> index fa99a3a8..4dc4a2f7 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb
> @@ -14,7 +14,7 @@ PE = "1"
>  # repo during parse
>  SRCREV = "2f5fbb5b39f7b67044dda5c35e4a4b31685a3109"
>  
> -SRC_URI = "git://git.denx.de/u-boot.git \
> +SRC_URI = "git://git.denx.de/u-boot.git;branch=master \
>            "
>  
>  S = "${WORKDIR}/git"
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.10.bb b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.10.bb
> index 6fffdbd2..0c4926bc 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.10.bb
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.10.bb
> @@ -14,7 +14,7 @@ PE = "1"
>  # repo during parse
>  SRCREV = "050acee119b3757fee3bd128f55d720fdd9bb890"
>  
> -SRC_URI = "git://git.denx.de/u-boot.git \
> +SRC_URI = "git://git.denx.de/u-boot.git;branch=master \
>            "
>  
>  S = "${WORKDIR}/git"
> diff --git a/meta-arm-bsp/recipes-test/corstone700-test-app/corstone700-test-app_1.0.bb b/meta-arm-bsp/recipes-test/corstone700-test-app/corstone700-test-app_1.0.bb
> index d2bfb19f..8bd71ac4 100644
> --- a/meta-arm-bsp/recipes-test/corstone700-test-app/corstone700-test-app_1.0.bb
> +++ b/meta-arm-bsp/recipes-test/corstone700-test-app/corstone700-test-app_1.0.bb
> @@ -4,7 +4,7 @@ HOMEPAGE = "https://git.linaro.org/landing-teams/working/arm/test-apps.git"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://license.md;md5=e44b2531cd6ffe9dece394dbe988d9a0"
>  
> -SRC_URI = "git://git.linaro.org/landing-teams/working/arm/test-apps.git;protocol=https"
> +SRC_URI = "git://git.linaro.org/landing-teams/working/arm/test-apps.git;protocol=https;branch=master"
>  SRCREV = "ecd93a275d11cf08f670a97783110bd698250963"
>  PV .= "~git${SRCPV}"
>  
> diff --git a/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.bb b/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.bb
> index c7235173..8f4b9653 100644
> --- a/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.bb
> +++ b/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.bb
> @@ -3,7 +3,7 @@ LICENSE = "BSD"
>  
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=bb63326febfb5fb909226c8e7ebcef5c"
>  
> -SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wrapper-aarch64.git"
> +SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wrapper-aarch64.git;branch=master"
>  SRCREV = "8d5a765251d9113c3c0f9fa14de42a9e7486fe8a"
>  
>  PV = "git${SRCPV}"
> diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb b/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
> index dc248e48..b6dd685c 100644
> --- a/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
> +++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
> @@ -9,7 +9,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  inherit deploy python3native pkgconfig
>  
> -SRC_URI = "gitsm://git.trustedfirmware.org/hafnium/hafnium.git;protocol=https \
> +SRC_URI = "gitsm://git.trustedfirmware.org/hafnium/hafnium.git;protocol=https;branch=master \
>             file://hashbang.patch \
>             file://pkg-config-native.patch \
>             file://native-dtc.patch"
> diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb
> index d40d82db..40648aa4 100644
> --- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb
> +++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://license.md;beginline=5;md5=9db9e3d2fb8d9300a6c3d15101
>                      file://contrib/cmsis/git/LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
>  
>  SRC_URI = "\
> -    gitsm://github.com/ARM-software/SCP-firmware.git;protocol=https \
> +    gitsm://github.com/ARM-software/SCP-firmware.git;protocol=https;branch=master \
>      file://0001-smt-Make-status-and-length-volatile-for-mod_smt_memo.patch \
>  "
>  SRCREV  = "043de77f220a0b4b0ec3aa367bd515a9e9df2a29"
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index 0d49a0a2..39b51566 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -7,7 +7,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  inherit deploy
>  
> -SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa \
> +SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master \
>             file://ssl.patch"
>  UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
>  
> diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> index 4b440860..2f6f42c0 100644
> --- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> @@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://License.txt;md5=2b415520383f7964e96700ae12b4570a"
>  LIC_FILES_CHKSUM += "file://edk2-platforms/License.txt;md5=2b415520383f7964e96700ae12b4570a"
>  
>  # These can be overridden as needed
> -EDK2_SRC_URI = "gitsm://github.com/tianocore/edk2.git"
> -EDK2_PLATFORMS_SRC_URI = "git://github.com/tianocore/edk2-platforms.git"
> +EDK2_SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https"
> +EDK2_PLATFORMS_SRC_URI = "git://github.com/tianocore/edk2-platforms.git;branch=master;protocol=https"
>  
>  SRC_URI = "\
>      ${EDK2_SRC_URI};name=edk2;destsuffix=edk2;nobranch=1 \
> diff --git a/meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb b/meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb
> index dd36eca8..1d771b6d 100644
> --- a/meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb
> +++ b/meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb
> @@ -5,7 +5,7 @@
>  DESCRIPTION = "fiptool - Trusted Firmware tool for packaging"
>  LICENSE = "BSD-3-Clause"
>  
> -SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;destsuffix=fiptool-${PV};protocol=https \
> +SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;destsuffix=fiptool-${PV};protocol=https;branch=master \
>             file://ssl.patch"
>  LIC_FILES_CHKSUM = "file://docs/license.rst;md5=713afe122abbe07f067f939ca3c480c5"
>  
> diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
> index b3ba4376..91b7d64f 100644
> --- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
> +++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
> @@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                     "
>  
>  SRCREV = "9d8d75fa08352470c51abc23fe3b314879bd8b78"
> -SRC_URI = "git://github.com/ARM-software/gator.git;protocol=http;branch=main \
> +SRC_URI = "git://github.com/ARM-software/gator.git;protocol=http;branch=main;protocol=https \
>             file://0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-GAT.patch;striplevel=2 \
>            "
>  
> diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_1.1.0.bb b/meta-arm/recipes-devtools/opencsd/opencsd_1.1.0.bb
> index e77433d6..804efb50 100644
> --- a/meta-arm/recipes-devtools/opencsd/opencsd_1.1.0.bb
> +++ b/meta-arm/recipes-devtools/opencsd/opencsd_1.1.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/Linaro/OpenCSD"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=ad8cb685eb324d2fa2530b985a43f3e5"
>  
> -SRC_URI = "git://github.com/Linaro/OpenCSD;protocol=https"
> +SRC_URI = "git://github.com/Linaro/OpenCSD;protocol=https;branch=master"
>  SRCREV = "54c3f67811fbcea853b7d223383d4a755819bb7e"
>  
>  S = "${WORKDIR}/git"
> diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/recipes-security/optee/optee-client.inc
> index 1642b0d0..3b9943cc 100644
> --- a/meta-arm/recipes-security/optee/optee-client.inc
> +++ b/meta-arm/recipes-security/optee/optee-client.inc
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=69663ab153298557a59c67a60a743e5b"
>  inherit systemd update-rc.d cmake
>  
>  SRC_URI = " \
> -    git://github.com/OP-TEE/optee_client.git \
> +    git://github.com/OP-TEE/optee_client.git;branch=master;protocol=https \
>      file://tee-supplicant.service \
>      file://tee-supplicant.sh \
>  "
> diff --git a/meta-arm/recipes-security/optee/optee-examples.inc b/meta-arm/recipes-security/optee/optee-examples.inc
> index b74344ac..921fa18d 100644
> --- a/meta-arm/recipes-security/optee/optee-examples.inc
> +++ b/meta-arm/recipes-security/optee/optee-examples.inc
> @@ -11,7 +11,7 @@ inherit python3native
>  
>  require optee.inc
>  
> -SRC_URI = "git://github.com/linaro-swg/optee_examples.git \
> +SRC_URI = "git://github.com/linaro-swg/optee_examples.git;branch=master;protocol=https \
>             file://0001-plugins-Honour-default-cross-compiler-environment-se.patch \
>             file://0002-Makefile-Enable-plugins-installation-in-rootfs.patch \
>            "
> diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
> index 3d707acf..277646e7 100644
> --- a/meta-arm/recipes-security/optee/optee-os.inc
> +++ b/meta-arm/recipes-security/optee/optee-os.inc
> @@ -14,7 +14,7 @@ DEPENDS = "python3-pycryptodome-native python3-pyelftools-native"
>  
>  DEPENDS:append:toolchain-clang = " compiler-rt"
>  
> -SRC_URI = "git://github.com/OP-TEE/optee_os.git"
> +SRC_URI = "git://github.com/OP-TEE/optee_os.git;branch=master;protocol=https"
>  
>  S = "${WORKDIR}/git"
>  B = "${WORKDIR}/build"
> diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/recipes-security/optee/optee-test.inc
> index 0a8e56ca..99656a14 100644
> --- a/meta-arm/recipes-security/optee/optee-test.inc
> +++ b/meta-arm/recipes-security/optee/optee-test.inc
> @@ -10,7 +10,7 @@ require optee.inc
>  
>  DEPENDS = "optee-client optee-os python3-pycryptodome-native"
>  
> -SRC_URI = "git://github.com/OP-TEE/optee_test.git \
> +SRC_URI = "git://github.com/OP-TEE/optee_test.git;branch=master;protocol=https \
>             file://run-ptest \
>            "
>  
> diff --git a/meta-atp/recipes-devtools/atp/atp-source_3.1.inc b/meta-atp/recipes-devtools/atp/atp-source_3.1.inc
> index e5442c9c..de24ef83 100644
> --- a/meta-atp/recipes-devtools/atp/atp-source_3.1.inc
> +++ b/meta-atp/recipes-devtools/atp/atp-source_3.1.inc
> @@ -1,4 +1,4 @@
> -ATP_SRC = "git://github.com/ARM-software/ATP-Engine.git;protocol=https"
> +ATP_SRC = "git://github.com/ARM-software/ATP-Engine.git;protocol=https;branch=master"
>  ATP_REV = "be1066029d6256626b37be004e2a663fbc29f37e"
>  ATP_LIC = "BSD-3-Clause-Clear"
>  ATP_LIC_MD5 = "e836b5992257064f488715d9a59752c3"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2335): https://lists.yoctoproject.org/g/meta-arm/message/2335
> Mute This Topic: https://lists.yoctoproject.org/mt/86794790/3617104
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [denis@denix.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

