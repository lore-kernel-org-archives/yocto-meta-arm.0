Return-Path: <frazer.carsley@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81CBBC83F25
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 13:18:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.40361.1753103873626589720
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Jul 2025 06:17:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: frazer.carsley@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0052A153B;
	Mon, 21 Jul 2025 06:17:47 -0700 (PDT)
Received: from e138143.arm.com (unknown [10.57.53.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08E6E3F6A8;
	Mon, 21 Jul 2025 06:17:51 -0700 (PDT)
From: Frazer Carsley <frazer.carsley@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Frazer Carsley <frazer.carsley@arm.com>
Subject: [PATCH 1/1] arm-bsp/corstone1000: Ensures external-system only built when enabled.
Date: Mon, 21 Jul 2025 14:16:41 +0100
Message-ID: <20250721131641.149839-1-frazer.carsley@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Jul 2025 13:18:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6620

The external-system component was marked as a dependency for the
corstone1000-recovery image regardless of whether external-system was
requested or not. This ensures that is no longer the case.

Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
---
 kas/corstone1000-extsys.yml                                  | 3 +++
 kas/corstone1000-image-configuration.yml                     | 3 ---
 meta-arm-bsp/conf/machine/corstone1000-fvp.conf              | 3 ++-
 .../images/corstone1000-firmware-deploy-image.inc            | 5 ++++-
 .../recipes-bsp/images/corstone1000-flash-firmware-image.bb  | 3 ++-
 5 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/kas/corstone1000-extsys.yml b/kas/corstone1000-extsys.yml
index 0534b09c..6e795654 100644
--- a/kas/corstone1000-extsys.yml
+++ b/kas/corstone1000-extsys.yml
@@ -4,3 +4,6 @@ header:
 local_conf_header:
   extsys: |
     MACHINE_FEATURES +=3D "corstone1000-extsys"
+
+    # external system firmware
+    CORE_IMAGE_EXTRA_INSTALL:firmware +=3D "external-system-elf"
diff --git a/kas/corstone1000-image-configuration.yml b/kas/corstone1000-=
image-configuration.yml
index 4c3172a5..f955d7ab 100644
--- a/kas/corstone1000-image-configuration.yml
+++ b/kas/corstone1000-image-configuration.yml
@@ -40,9 +40,6 @@ local_conf_header:
     CORE_IMAGE_EXTRA_INSTALL +=3D "packagegroup-ts-tests-psa"
     CORE_IMAGE_EXTRA_INSTALL:firmware +=3D "packagegroup-ts-tests-psa"
=20
-    # external system firmware
-    CORE_IMAGE_EXTRA_INSTALL:firmware +=3D "external-system-elf"
-
   capsule: |
     CAPSULE_EXTENSION =3D "uefi.capsule"
     CAPSULE_FW_VERSION =3D "6"
diff --git a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf b/meta-arm-b=
sp/conf/machine/corstone1000-fvp.conf
index a605a695..df0275ef 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
@@ -42,7 +42,8 @@ FVP_CONFIG[se.cryptocell.USER_OTP_FILTERING_DISABLE] ?=3D=
 "1"
 FVP_DATA ?=3D "board.flash0=3Dcorstone1000-flash-firmware-image-${MACHIN=
E}.wic@0x68000000"
=20
 # External system (cortex-M3)
-FVP_CONFIG[extsys_harness0.extsys_flashloader.fname] ?=3D "es_flashfw.bi=
n"
+FVP_CONFIG[extsys_harness0.extsys_flashloader.fname] ?=3D "${@bb.utils.c=
ontains(\
+    'MACHINE_FEATURES', 'corstone1000-extsys', 'es_flashfw.bin', '', d)}=
"
=20
 # FVP Terminals
 FVP_TERMINALS[host.host_terminal_0] ?=3D "Normal World Console"
diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-firmware-deploy=
-image.inc b/meta-arm-bsp/recipes-bsp/images/corstone1000-firmware-deploy=
-image.inc
index f959573d..dfd88971 100644
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-firmware-deploy-image.=
inc
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-firmware-deploy-image.=
inc
@@ -2,7 +2,10 @@ COMPATIBLE_MACHINE =3D "corstone1000"
=20
 FIRMWARE_BINARIES =3D "corstone1000-flash-firmware-image-${MACHINE}.wic =
\
                      bl1.bin \
-                     es_flashfw.bin \
+                     ${@bb.utils.contains('MACHINE_FEATURES', \
+                                          'corstone1000-extsys', \
+                                          'es_flashfw.bin', \
+                                          '', d)} \
                      ${CAPSULE_NAME}.${CAPSULE_EXTENSION} \
                      corstone1000_capsule_cert.crt \
                      corstone1000_capsule_key.key \
diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-=
image.bb b/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-im=
age.bb
index 73cc32aa..5d313c7b 100644
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image.b=
b
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image.b=
b
@@ -14,7 +14,8 @@ inherit tfm_sign_image
 inherit uefi_capsule
 inherit deploy
=20
-DEPENDS +=3D "external-system \
+DEPENDS +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'corstone1000-ext=
sys', \
+                                 'external-system', '', d)} \
             trusted-firmware-a \
             trusted-firmware-m \
             u-boot \

