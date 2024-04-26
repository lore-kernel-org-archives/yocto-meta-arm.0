Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED1F3C41513
	for <webhook@archiver.kernel.org>; Fri, 26 Apr 2024 15:20:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.455.1714144824654993722
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Apr 2024 08:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AD991007;
	Fri, 26 Apr 2024 08:20:52 -0700 (PDT)
Received: from e130802.arm.com (unknown [10.57.64.236])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 959F03F73F;
	Fri, 26 Apr 2024 08:20:23 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com
Cc: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 1/3] arm-bsp/external-system: costone1000: install the firmware in the filesystem
Date: Fri, 26 Apr 2024 16:20:12 +0100
Message-Id: <20240426152014.356666-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240426152014.356666-1-abdellatif.elkhlifi@arm.com>
References: <20240426152014.356666-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 26 Apr 2024 15:20:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5615

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

install the external system binaries under /lib/firmware

The kernel's remoteproc subsystem expects the firmware file to be under /=
lib/firmware

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 kas/corstone1000-image-configuration.yml            |  3 +++
 .../external-system/external-system_0.1.0.bb        | 13 +++++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/kas/corstone1000-image-configuration.yml b/kas/corstone1000-=
image-configuration.yml
index 2b285223..7912a2b4 100644
--- a/kas/corstone1000-image-configuration.yml
+++ b/kas/corstone1000-image-configuration.yml
@@ -38,3 +38,6 @@ local_conf_header:
=20
     # TS PSA API tests commands for crypto, its, ps and iat
     CORE_IMAGE_EXTRA_INSTALL +=3D "packagegroup-ts-tests-psa"
+
+    # external system firmware
+    CORE_IMAGE_EXTRA_INSTALL:firmware +=3D "external-system-elf"
diff --git a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1=
.0.bb b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
index 18649cee..8bd11616 100644
--- a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
+++ b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
@@ -38,15 +38,20 @@ do_compile() {
 do_compile[cleandirs] =3D "${B}"
=20
 do_install() {
-    install -D -p -m 0644 ${B}/product/${PRODUCT}/firmware/release/bin/f=
irmware.bin ${D}/firmware/es_flashfw.bin
+    install -D -p -m 0644 ${B}/product/${PRODUCT}/firmware/release/bin/f=
irmware.bin ${D}${nonarch_base_libdir}/firmware/es_flashfw.bin
+    install -D -p -m 0644 ${B}/product/${PRODUCT}/firmware/release/bin/f=
irmware.elf ${D}${nonarch_base_libdir}/firmware/es_flashfw.elf
 }
=20
-FILES:${PN} =3D "/firmware"
-SYSROOT_DIRS +=3D "/firmware"
+FILES:${PN} =3D "${nonarch_base_libdir}/firmware/es_flashfw.bin"
+FILES:${PN}-elf =3D "${nonarch_base_libdir}/firmware/es_flashfw.elf"
+PACKAGES +=3D "${PN}-elf"
+INSANE_SKIP:${PN}-elf +=3D "arch"
+
+SYSROOT_DIRS +=3D "${nonarch_base_libdir}/firmware"
=20
 inherit deploy
=20
 do_deploy() {
-    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
+    cp -rf ${D}${nonarch_base_libdir}/firmware/* ${DEPLOYDIR}/
 }
 addtask deploy after do_install
--=20
2.25.1


