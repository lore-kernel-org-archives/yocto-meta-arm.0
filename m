Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FDDC77B7E
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 20:06:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.482.1685045168793109534
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 25 May 2023 13:06:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C833915BF
	for <meta-arm@lists.yoctoproject.org>; Thu, 25 May 2023 13:06:52 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 894EF3F67D
	for <meta-arm@lists.yoctoproject.org>; Thu, 25 May 2023 13:06:07 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/5] CI/corstone: remove debug-tweaks usage
Date: Thu, 25 May 2023 15:05:59 -0500
Message-Id: <20230525200602.3277592-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230525200602.3277592-1-jon.mason@arm.com>
References: <20230525200602.3277592-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 25 May 2023 20:06:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4710

debug-tweaks is useful in testing and internal usage, but is a massive
security hole (as it allow password-less root login).  Remove the
default enablement on machine files and in kas base yml.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/base.yml                                                     | 1 -
 ci/testimage.yml                                                | 1 +
 meta-arm-bsp/conf/machine/corstone500.conf                      | 1 -
 meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image.bb | 2 --
 4 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/ci/base.yml b/ci/base.yml
index 26fbb602..92fa7074 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -30,7 +30,6 @@ local_conf_header:
   setup: |
     PACKAGE_CLASSES =3D "package_ipk"
     PACKAGECONFIG:remove:pn-qemu-system-native =3D "gtk+ sdl"
-    EXTRA_IMAGE_FEATURES:append =3D " debug-tweaks"
     PACKAGECONFIG:append:pn-perf =3D " coresight"
     INHERIT +=3D "rm_work"
     DISTRO_FEATURES:remove =3D "ptest"
diff --git a/ci/testimage.yml b/ci/testimage.yml
index d7de7d06..b4b5599b 100644
--- a/ci/testimage.yml
+++ b/ci/testimage.yml
@@ -3,6 +3,7 @@ header:
=20
 local_conf_header:
   testimage: |
+    EXTRA_IMAGE_FEATURES:append =3D " debug-tweaks"
     IMAGE_CLASSES +=3D "testimage"
     TESTIMAGE_AUTO =3D "1"
   kvm: |
diff --git a/meta-arm-bsp/conf/machine/corstone500.conf b/meta-arm-bsp/co=
nf/machine/corstone500.conf
index c13c86c0..4794028a 100644
--- a/meta-arm-bsp/conf/machine/corstone500.conf
+++ b/meta-arm-bsp/conf/machine/corstone500.conf
@@ -17,7 +17,6 @@ PREFERRED_VERSION_linux-yocto ?=3D "6.1%"
 EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a u-boot"
=20
 IMAGE_CLASSES +=3D "wic_nopt"
-IMAGE_FEATURES +=3D "debug-tweaks"
 IMAGE_FSTYPES:forcevariable =3D "cpio.gz squashfs wic wic.nopt"
=20
 SERIAL_CONSOLES =3D "115200;ttyAMA0"
diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image=
.bb b/meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image.bb
index 46427b74..884d4b3b 100644
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image.bb
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image.bb
@@ -15,8 +15,6 @@ inherit core-image
=20
 inherit image-buildinfo
=20
-IMAGE_FEATURES +=3D "debug-tweaks"
-
 #package management is not supported in corstone1000
 IMAGE_FEATURES:remove =3D "package-management"
=20
--=20
2.30.2


