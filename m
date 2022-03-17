Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32158C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 16:10:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.12335.1647533446528444321
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Mar 2022 09:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CA191424;
	Thu, 17 Mar 2022 09:10:45 -0700 (PDT)
Received: from e126835.arm.com (unknown [10.57.41.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B6FC3F7B4;
	Thu, 17 Mar 2022 09:10:43 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 1/1] arm-bsp/corstone1000: remove the need for meta-arm-image
Date: Thu, 17 Mar 2022 16:10:33 +0000
Message-Id: <20220317161033.3099761-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317161033.3099761-1-emekcan.aras@arm.com>
References: <20220317161033.3099761-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Mar 2022 16:10:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3182

From: Emekcan Aras <Emekcan.Aras@arm.com>

This commit remove meta-arm-image from the yml file and adds
necessary image configuration to meta-arm-bsp/recipes-bsp/images.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 ci/corstone1000-common.yml                    | 10 ++-----
 .../recipes-bsp/images/corstone1000-image.bb  | 11 ++++++++
 .../images/corstone1000-initramfs-image.bb    | 28 +++++++++++++++++++
 .../wic/corstone1000-image.corstone1000.wks   | 15 ++++++++++
 4 files changed, 57 insertions(+), 7 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb
 create mode 100644 meta-arm-bsp/recipes-bsp/images/corstone1000-initramf=
s-image.bb
 create mode 100644 meta-arm-bsp/wic/corstone1000-image.corstone1000.wks

diff --git a/ci/corstone1000-common.yml b/ci/corstone1000-common.yml
index faa1d08..6599d97 100644
--- a/ci/corstone1000-common.yml
+++ b/ci/corstone1000-common.yml
@@ -3,15 +3,11 @@ header:
   includes:
     - ci/base.yml
     - ci/meta-openembedded.yml
-
 local_conf_header:
-  image: |
-    INITRAMFS_IMAGE_BUNDLE =3D "0"
-    INITRAMFS_IMAGE:remove =3D "corstone1000-initramfs-image"
-    CORE_IMAGE_EXTRA_INSTALL +=3D "optee-client"
-    CORE_IMAGE_EXTRA_INSTALL +=3D "ffa-debugfs-mod"
+    perf: |
=20
 distro: poky-tiny
=20
 target:
-  - core-image-minimal
+  - perf
+  - corstone1000-image
diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb b/meta=
-arm-bsp/recipes-bsp/images/corstone1000-image.bb
new file mode 100644
index 0000000..d91d457
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb
@@ -0,0 +1,11 @@
+SUMARY =3D "Corstone1000 platform Image"
+DESCRIPTION =3D "This is the main image which is the container of all th=
e binaries \
+               generated for the Corstone1000 platform."
+LICENSE =3D "MIT"
+
+inherit image
+inherit wic_nopt
+
+PACKAGE_INSTALL =3D ""
+
+IMAGE_FSTYPES +=3D "wic wic.nopt"
diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image=
.bb b/meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image.bb
new file mode 100644
index 0000000..a11de1e
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image.bb
@@ -0,0 +1,28 @@
+SUMARY =3D "Corstone1000 platform Initramfs Image"
+DESCRIPTION =3D "This is the main Linux image which includes an initramf=
s kernel/rootfs bundle."
+
+LICENSE =3D "MIT"
+
+IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
+
+inherit core-image
+
+# By default all basic packages required for a bootable system are insta=
lled
+# by core-image . These packages are: packagegroup-core-boot and
+# packagegroup-base-extended
+
+inherit image-buildinfo
+
+IMAGE_FEATURES +=3D "debug-tweaks"
+
+#package management is not supported in corstone1000
+IMAGE_FEATURES:remove =3D "package-management"
+
+# all optee packages
+IMAGE_INSTALL +=3D "optee-client"
+
+# FF-A Debugfs driver
+IMAGE_INSTALL +=3D "ffa-debugfs-mod"
+
+# psa-arch-tests linux userspace application
+IMAGE_INSTALL +=3D "secure-partitions-psa-api-tests"
diff --git a/meta-arm-bsp/wic/corstone1000-image.corstone1000.wks b/meta-=
arm-bsp/wic/corstone1000-image.corstone1000.wks
new file mode 100644
index 0000000..c58d7d6
--- /dev/null
+++ b/meta-arm-bsp/wic/corstone1000-image.corstone1000.wks
@@ -0,0 +1,15 @@
+# WIC partitioning for corstone1000
+# Layout and maximum sizes (to be defined):
+#
+
+part --source rawcopy --sourceparams=3D"file=3Dbl2_signed.bin" --align 1=
 --no-table --fixed-size 100k
+part --source rawcopy --sourceparams=3D"file=3Dbl2_signed.bin" --align 1=
 --no-table --fixed-size 100k
+
+part --source rawcopy --sourceparams=3D"file=3Dtfm_s_signed.bin" --align=
 1 --no-table --fixed-size 376k
+part --source rawcopy --sourceparams=3D"file=3Dtfm_s_signed.bin" --align=
 1 --no-table --fixed-size 376k
+
+# Rawcopy of the FIP binary
+part --source rawcopy --sourceparams=3D"file=3Dsigned_fip-corstone1000.b=
in" --align 1 --no-table --fixed-size 2
+
+# Rawcopy of kernel with initramfs
+part --source rawcopy --sourceparams=3D"file=3DImage-initramfs-${MACHINE=
}.bin" --no-table --fixed-size 12
--=20
2.25.1


