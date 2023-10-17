Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F32CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 14:06:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.216627.1697551581935432373
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 07:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3266D2F4
	for <meta-arm@lists.yoctoproject.org>; Tue, 17 Oct 2023 07:07:02 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7E7C73F762
	for <meta-arm@lists.yoctoproject.org>; Tue, 17 Oct 2023 07:06:21 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/linux-yocto: remove PHYS_VIRT config frag
Date: Tue, 17 Oct 2023 08:25:48 -0500
Message-Id: <20231017132548.3907869-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Oct 2023 14:06:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5134

The PHYS_VIRT config fragment is no longer needed for qemuarm

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-kernel/linux/files/qemuarm-phys-virt.cfg | 1 -
 meta-arm/recipes-kernel/linux/linux-yocto%.bbappend       | 1 -
 2 files changed, 2 deletions(-)
 delete mode 100644 meta-arm/recipes-kernel/linux/files/qemuarm-phys-virt=
.cfg

diff --git a/meta-arm/recipes-kernel/linux/files/qemuarm-phys-virt.cfg b/=
meta-arm/recipes-kernel/linux/files/qemuarm-phys-virt.cfg
deleted file mode 100644
index b014e7f6..00000000
--- a/meta-arm/recipes-kernel/linux/files/qemuarm-phys-virt.cfg
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_ARM_PATCH_PHYS_VIRT=3Dy
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend b/meta-a=
rm/recipes-kernel/linux/linux-yocto%.bbappend
index 0a42ce4a..c4e351bb 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
@@ -27,7 +27,6 @@ SRC_URI:append:qemuarm64 =3D " file://efi.cfg"
 FILESEXTRAPATHS:prepend:qemuarm =3D "${ARMFILESPATHS}"
 SRC_URI:append:qemuarm =3D " \
     file://efi.cfg \
-    file://qemuarm-phys-virt.cfg \
     "
=20
 FFA_TRANSPORT_INCLUDE =3D "${@bb.utils.contains('MACHINE_FEATURES', 'arm=
-ffa', 'arm-ffa-transport.inc', '' , d)}"
--=20
2.30.2


