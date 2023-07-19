Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC6EEB64DD
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 01:22:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4389.1689729767482706452
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jul 2023 18:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66DD41424
	for <meta-arm@lists.yoctoproject.org>; Tue, 18 Jul 2023 18:23:30 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F06113F67D
	for <meta-arm@lists.yoctoproject.org>; Tue, 18 Jul 2023 18:22:46 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2 7/8] arm-bsp/machine: work around rootfs name issue
Date: Tue, 18 Jul 2023 20:22:39 -0500
Message-Id: <20230719012240.3567881-7-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230719012240.3567881-1-jon.mason@arm.com>
References: <20230719012240.3567881-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Jul 2023 01:22:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4901

Upstream change 26d97acc71379ab6702fa54a23b6542a3f51779c changed the
IMAGE_LINK_NAME to have IMAGE_NAME_SUFFIX and breaks the automatic
finding of the image by name.  Work around here until upstream fix can
be added.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/corstone500.conf         | 2 ++
 meta-arm-bsp/conf/machine/fvp-base.conf            | 1 +
 meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf  | 2 ++
 meta-arm-bsp/conf/machine/include/corstone1000.inc | 1 +
 meta-arm-bsp/conf/machine/include/tc.inc           | 1 +
 meta-arm-bsp/conf/machine/juno.conf                | 1 +
 6 files changed, 8 insertions(+)

diff --git a/meta-arm-bsp/conf/machine/corstone500.conf b/meta-arm-bsp/co=
nf/machine/corstone500.conf
index 978d4edb..6d2294c2 100644
--- a/meta-arm-bsp/conf/machine/corstone500.conf
+++ b/meta-arm-bsp/conf/machine/corstone500.conf
@@ -45,3 +45,5 @@ FVP_TERMINALS[css.terminal_1] ?=3D ""
=20
 # Disable openssl in kmod to shink the initramfs size
 PACKAGECONFIG:remove:pn-kmod =3D "openssl"
+
+IMAGE_NAME_SUFFIX =3D ""
diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/=
machine/fvp-base.conf
index 39d6e68b..3a923bad 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -15,3 +15,4 @@ UBOOT_MACHINE =3D "vexpress_aemv8a_semi_defconfig"
 KERNEL_IMAGETYPE =3D "Image"
=20
 FVP_CONFIG[bp.virtio_rng.enabled] ?=3D "1"
+IMAGE_NAME_SUFFIX =3D ""
diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm=
-bsp/conf/machine/fvp-baser-aemv8r64.conf
index b5900b4e..25ba3c84 100644
--- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -24,6 +24,8 @@ WKS_FILE ?=3D "efi-disk.wks.in"
 EFI_PROVIDER ?=3D "grub-efi"
 MACHINE_FEATURES:append =3D " efi"
=20
+IMAGE_NAME_SUFFIX =3D ""
+
 # As this is a virtual target that will not be used in the real world th=
ere is
 # no need for real SSH keys.
 MACHINE_EXTRA_RRECOMMENDS +=3D "ssh-pregen-hostkeys"
diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 198c7ec8..8a2e2a02 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -57,6 +57,7 @@ INITRAMFS_IMAGE_BUNDLE ?=3D "1"
=20
 #telling the build system which image is responsible of the generation o=
f the initramfs rootfs
 INITRAMFS_IMAGE =3D "corstone1000-initramfs-image"
+IMAGE_NAME_SUFFIX =3D ""
=20
 # add FF-A support in the kernel
 MACHINE_FEATURES +=3D "arm-ffa"
diff --git a/meta-arm-bsp/conf/machine/include/tc.inc b/meta-arm-bsp/conf=
/machine/include/tc.inc
index 14ec7205..f6674ba4 100644
--- a/meta-arm-bsp/conf/machine/include/tc.inc
+++ b/meta-arm-bsp/conf/machine/include/tc.inc
@@ -25,6 +25,7 @@ KERNEL_CLASSES =3D " kernel-fitimage "
=20
 IMAGE_FSTYPES +=3D "cpio.gz"
 INITRAMFS_IMAGE ?=3D "core-image-minimal"
+IMAGE_NAME_SUFFIX =3D ""
=20
 SERIAL_CONSOLES =3D "115200;ttyAMA0"
=20
diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/mach=
ine/juno.conf
index 43d6b3e3..6c666efc 100644
--- a/meta-arm-bsp/conf/machine/juno.conf
+++ b/meta-arm-bsp/conf/machine/juno.conf
@@ -27,3 +27,4 @@ UBOOT_MACHINE =3D "vexpress_aemv8a_juno_defconfig"
=20
 INITRAMFS_IMAGE_BUNDLE ?=3D "1"
 INITRAMFS_IMAGE =3D "core-image-minimal"
+IMAGE_NAME_SUFFIX =3D ""
--=20
2.30.2


