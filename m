Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD027C3DA4A
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 13:43:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.19662.1724161400147625681
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Aug 2024 06:43:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC733FEC
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Aug 2024 06:43:45 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 598523F66E
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Aug 2024 06:43:19 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/arm-tstee: pin kernel to 6.6 to workaround issue
Date: Tue, 20 Aug 2024 09:43:17 -0400
Message-Id: <20240820134317.3438-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240820134317.3438-1-jon.mason@arm.com>
References: <20240820134317.3438-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 20 Aug 2024 13:43:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5982

arm-tstee doesn't compile on 6.8 or newer kernels.  Temporarily pin the
kernels of machines using this package back to 6.6 while developing a
fix.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base.conf         | 2 ++
 meta-arm/conf/machine/qemuarm64-secureboot.conf | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/=
machine/fvp-base.conf
index 353024e26b72..2fc49fc7bfe2 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -23,6 +23,8 @@ PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
 KERNEL_DTB_NAME =3D "fvp-base-revc.dtb"
 KERNEL_DEVICETREE =3D "arm/${KERNEL_DTB_NAME}"
 KERNEL_IMAGETYPE =3D "Image"
+#FIXME - Working around arm-tstee not compiling on kernels greater than =
6.8
+PREFERRED_VERSION_linux-yocto ?=3D "6.6.%"
=20
 EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
=20
diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/c=
onf/machine/qemuarm64-secureboot.conf
index 78a39c03c1bd..cfc6ff7706fb 100644
--- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -3,6 +3,9 @@ MACHINEOVERRIDES =3D. "qemuarm64:"
 require ${COREBASE}/meta/conf/machine/qemuarm64.conf
=20
 KMACHINE =3D "qemuarm64"
+#FIXME - Working around arm-tstee not compiling on kernels greater than =
6.8
+PREFERRED_VERSION_linux-yocto ?=3D "6.6.%"
+PREFERRED_VERSION_linux-yocto-rt ?=3D "6.6.%"
=20
 # secure=3Don can't ever use KVM, so force it off
 QEMU_USE_KVM =3D ""
--=20
2.39.3 (Apple Git-146)


