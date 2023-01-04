Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4AE7C4708E
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:39:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9958.1672832341035403406
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Jan 2023 03:39:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5911D1596;
	Wed,  4 Jan 2023 03:39:42 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 332F63F587;
	Wed,  4 Jan 2023 03:39:00 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 5/5] arm-bsp/documentation: update fvp-base documentation to use runfvp
Date: Wed,  4 Jan 2023 11:38:49 +0000
Message-Id: <20230104113849.3011256-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230104113849.3011256-1-ross.burton@arm.com>
References: <20230104113849.3011256-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 Jan 2023 11:39:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4232

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/documentation/fvp-base-arm32.md | 53 ++++----------------
 meta-arm-bsp/documentation/fvp-base.md       | 41 ++++-----------
 2 files changed, 20 insertions(+), 74 deletions(-)

diff --git a/meta-arm-bsp/documentation/fvp-base-arm32.md b/meta-arm-bsp/=
documentation/fvp-base-arm32.md
index 54408b0d..141e61f3 100644
--- a/meta-arm-bsp/documentation/fvp-base-arm32.md
+++ b/meta-arm-bsp/documentation/fvp-base-arm32.md
@@ -1,55 +1,24 @@
-# Armv7-A Base Platform FVP Support in meta-arm-bsp
+# Armv8-A Base Platform FVP (32-bit) Support in meta-arm-bsp
=20
-## How to build and run
+## Howto Build and Run
=20
 ### Configuration:
-In the local.conf file, MACHINE should be set as follows:
-MACHINE ?=3D "fvp-base-arm32"
+In the local.conf file, `MACHINE` should be set:
+```
+MACHINE =3D "fvp-base-arm32"
+```
=20
 ### Build:
-```bash$ bitbake core-image-minimal```
+```
+$ bitbake core-image-base
+```
=20
 ### Run:
-To Run the Fixed Virtual Platform simulation tool you must download "Arm=
v8-A
-Base Platform FVP" from Arm developer (This might require the user to
-register) from this address:
-https://developer.arm.com/tools-and-software/simulation-models/fixed-vir=
tual-platforms
-and install it on your host PC.
-
-Fast Models Fixed Virtual Platforms (FVP) Reference Guide:
-https://developer.arm.com/docs/100966/latest
-
-Armv8=E2=80=91A Foundation Platform User Guide:
-https://developer.arm.com/docs/100961/latest/
+The `fvp-base` machine has support for the `runfvp` script, so running i=
s simple:
=20
-
-Once done, do the following to build and run an image:
-```bash$ bitbake core-image-minimal```
-```bash$ export YOCTO_DEPLOY_IMGS_DIR=3D"<yocto-build-dir/tmp/deploy/ima=
ges/fvp-base-arm32>"```
-```bash$ cd <path-to-Base_RevC_AEMv8A_pkg-dir/models/Linux64_GCC-X.X/>``=
`
 ```
-bash$ ./FVP_Base_RevC-2xAEMv8A -C bp.virtio_net.enabled=3D1 \
-         -C cache_state_modelled=3D0 \
-         -C bp.secureflashloader.fname=3D${YOCTO_DEPLOY_IMGS_DIR}/bl1-fv=
p.bin \
-         -C bp.flashloader0.fname=3D${YOCTO_DEPLOY_IMGS_DIR}/fip-fvp.bin=
 \
-         --data cluster0.cpu0=3D${YOCTO_DEPLOY_IMGS_DIR}/Image@0x8008000=
0 \
-         -C bp.virtioblockdevice.image_path=3D${YOCTO_DEPLOY_IMGS_DIR}/c=
ore-image-minimal-fvp-base-arm32.wic \
-         -C cluster0.cpu0.CONFIG64=3D0 \
-         -C cluster0.cpu1.CONFIG64=3D0 \
-         -C cluster0.cpu2.CONFIG64=3D0 \
-         -C cluster0.cpu3.CONFIG64=3D0 \
-         -C cluster1.cpu0.CONFIG64=3D0 \
-         -C cluster1.cpu1.CONFIG64=3D0 \
-         -C cluster1.cpu2.CONFIG64=3D0 \
-         -C cluster1.cpu3.CONFIG64=3D0 \
-
+$ runfvp tmp/deploy/images/fvp-base-arm32/core-image-base-fvp-base-arm32=
.fvpconf
 ```
-
-
-If you have built a configuration without a ramdisk, you can use the fol=
lowing
-command in U-boot to start Linux:
-```fvp32# bootz 0x80080000 - 0x82000000```
-
 ## Devices supported in the kernel
 - serial
 - virtio disk
diff --git a/meta-arm-bsp/documentation/fvp-base.md b/meta-arm-bsp/docume=
ntation/fvp-base.md
index b0026de4..7eda8d34 100644
--- a/meta-arm-bsp/documentation/fvp-base.md
+++ b/meta-arm-bsp/documentation/fvp-base.md
@@ -3,45 +3,22 @@
 ## Howto Build and Run
=20
 ### Configuration:
-In the local.conf file, MACHINE should be set as follow:
-MACHINE ?=3D "fvp-base"
+In the local.conf file, `MACHINE` should be set:
+```
+MACHINE =3D "fvp-base"
+```
=20
 ### Build:
-```bash$ bitbake core-image-minimal```
+```
+$ bitbake core-image-base
+```
=20
 ### Run:
-To Run the Fixed Virtual Platform simulation tool you must download "Arm=
v8-A
-Base Platform FVP" from Arm developer (This might require the user to
-register) from this address:
-https://developer.arm.com/tools-and-software/simulation-models/fixed-vir=
tual-platforms
-and install it on your host PC.
-
-Fast Models Fixed Virtual Platforms (FVP) Reference Guide:
-https://developer.arm.com/docs/100966/latest
+The `fvp-base` machine has support for the `runfvp` script, so running i=
s simple:
=20
-Armv8=E2=80=91A Foundation Platform User Guide:
-https://developer.arm.com/docs/100961/latest/
-
-
-Once done, do the following to build and run an image:
-```bash$ bitbake core-image-minimal```
-```bash$ export YOCTO_DEPLOY_IMGS_DIR=3D"<yocto-build-dir/tmp/deploy/ima=
ges/fvp-base>"```
-```bash$ cd <path-to-Base_RevC_AEMv8A_pkg-dir/models/Linux64_GCC-X.X/>``=
`
 ```
-bash$ ./FVP_Base_RevC-2xAEMv8A -C bp.virtio_net.enabled=3D1 \
-         -C cache_state_modelled=3D0 \
-         -C bp.secureflashloader.fname=3D${YOCTO_DEPLOY_IMGS_DIR}/bl1-fv=
p.bin \
-         -C bp.flashloader0.fname=3D${YOCTO_DEPLOY_IMGS_DIR}/fip-fvp.bin=
 \
-         --data cluster0.cpu0=3D${YOCTO_DEPLOY_IMGS_DIR}/Image@0x8008000=
0 \
-         --data cluster0.cpu0=3D${YOCTO_DEPLOY_IMGS_DIR}/fvp-base-gicv3-=
psci-custom.dtb@0x83000000 \
-         -C bp.virtioblockdevice.image_path=3D${YOCTO_DEPLOY_IMGS_DIR}/c=
ore-image-minimal-fvp-base.wic
+$ runfvp tmp/deploy/images/fvp-base/core-image-base-fvp-base.fvpconf
 ```
-
-
-If you have built a configuration without a ramdisk, you can use the fol=
lowing
-command in U-boot to start Linux:
-```VExpress64# booti 0x80080000 - 0x83000000```
-
 ## Devices supported in the kernel
 - serial
 - virtio disk
--=20
2.34.1


