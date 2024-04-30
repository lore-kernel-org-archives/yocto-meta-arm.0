Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B768C4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 15:59:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.19545.1714492782277989421
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 08:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65F972F4;
	Tue, 30 Apr 2024 09:00:08 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.32.147])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03B473F73F;
	Tue, 30 Apr 2024 08:59:40 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 5/5] arm-bsp/corstone1000-recovery-image: replace core-image-minimal
Date: Tue, 30 Apr 2024 17:59:24 +0200
Message-Id: <20240430155924.799192-6-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240430155924.799192-1-bence.balogh@arm.com>
References: <20240430155924.799192-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 15:59:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5660

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Add corstone1000-recovery-image image based on core-image-minimal
while disabling the testimage task which is irrelevant in case of
an initramfs bundle.

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 kas/corstone1000-image-configuration.yml                   | 4 ++--
 .../recipes-bsp/images/corstone1000-recovery-image.bb      | 7 +++++++
 2 files changed, 9 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/images/corstone1000-recovery=
-image.bb

diff --git a/kas/corstone1000-image-configuration.yml b/kas/corstone1000-=
image-configuration.yml
index 4fa5931d..a3ed6f4f 100644
--- a/kas/corstone1000-image-configuration.yml
+++ b/kas/corstone1000-image-configuration.yml
@@ -15,8 +15,8 @@ local_conf_header:
   initramfsetup: |
     # Telling the build system which image is responsible of the generat=
ion of the initramfs rootfs
     INITRAMFS_IMAGE_BUNDLE:firmware =3D "1"
-    INITRAMFS_IMAGE:firmware ?=3D "core-image-minimal"
-    IMAGE_FSTYPES:firmware:pn-core-image-minimal =3D "${INITRAMFS_FSTYPE=
S}"
+    INITRAMFS_IMAGE:firmware ?=3D "corstone1000-recovery-image"
+    IMAGE_FSTYPES:firmware:pn-corstone1000-recovery-image =3D "${INITRAM=
FS_FSTYPES}"
     IMAGE_NAME_SUFFIX:firmware =3D ""
=20
     # enable mdev/busybox for init
diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-recovery-image.=
bb b/meta-arm-bsp/recipes-bsp/images/corstone1000-recovery-image.bb
new file mode 100644
index 00000000..5ee9adfb
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-recovery-image.bb
@@ -0,0 +1,7 @@
+require recipes-core/images/core-image-minimal.bb
+
+# The core-image-minimal is used for the initramfs bundle for the
+# Corstone1000 but the testimage task caused hanging errors. This is
+# why the core-image-minimal is forked here so the testimage task can
+# be disabled as it is not relevant for the Corstone1000.
+IMAGE_CLASSES:remove =3D "testimage"
--=20
2.25.1


