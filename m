Return-Path: <hugo.lhostis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B39FEC433FE
	for <webhook@archiver.kernel.org>; Tue,  5 Oct 2021 12:50:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.43.1633438203420662099
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 05 Oct 2021 05:50:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugo.lhostis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFE786D;
	Tue,  5 Oct 2021 05:50:02 -0700 (PDT)
Received: from e126543.cambridge.arm.com (unknown [10.1.37.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01BF33F70D;
	Tue,  5 Oct 2021 05:50:01 -0700 (PDT)
From: Hugo L'Hostis <hugo.lhostis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/3] arm-bsp/fvp-baser-aemv8r64: Update to linux-yocto 5.14
Date: Tue,  5 Oct 2021 13:49:30 +0100
Message-Id: <20211005124930.3490492-3-hugo.lhostis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005124930.3490492-1-hugo.lhostis@arm.com>
References: <20211005124930.3490492-1-hugo.lhostis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 05 Oct 2021 12:50:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2252

Updating the linux kernel version to 5.14 for fvp-baser-aemv8r64.

Signed-off-by: Hugo L'Hostis <hugo.lhostis@arm.com>
Change-Id: Iad76939460a32d8e34212e86a45905ffd51deb60
---
 meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf | 4 ++--
 meta-arm-bsp/documentation/fvp-baser-aemv8r64.md  | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm=
-bsp/conf/machine/fvp-baser-aemv8r64.conf
index f7651c0..b20bc58 100644
--- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -9,8 +9,8 @@ require conf/machine/include/arm/armv8r/arch-armv8r64.inc
 EXTRA_IMAGEDEPENDS +=3D "boot-wrapper-aarch64"
=20
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?=3D "5.10%"
-PREFERRED_VERSION_linux-yocto-rt ?=3D "5.10%"
+PREFERRED_VERSION_linux-yocto ?=3D "5.14%"
+PREFERRED_VERSION_linux-yocto-rt ?=3D "5.14%"
=20
 KERNEL_IMAGETYPE =3D "Image"
 KERNEL_DEVICETREE =3D "arm/fvp-baser-aemv8r64.dtb"
diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index 97a88ff..ef68fe4 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -28,8 +28,8 @@ where either a standard or Real-Time Linux kernel (PREE=
MPT\_RT) can be built
 and run:
=20
  - boot-wrapper-aarch64: provides PSCI support
- - Linux kernel: linux-yocto-5.10
- - Linux kernel with PREEMPT\_RT support: linux-yocto-rt-5.10
+ - Linux kernel: linux-yocto-5.14
+ - Linux kernel with PREEMPT\_RT support: linux-yocto-rt-5.14
=20
 Note that the Real-Time Linux kernel (PREEMPT\_RT) does not use the real=
-time
 architectural extensions of the Armv8-R feature set.
@@ -200,6 +200,8 @@ Known Issues and Limitations
 Change Log
 ----------
=20
+- Updated Linux kernel version from 5.10 to 5.14 for both standard and
+Real-Time (PREEMPT\_RT) builds.
 - Enabled SMP support via boot-wrapper-aarch64 providing the PSCI CPU_ON=
 and
   CPU_OFF functions.
 - Introduced Armv8-R64 compiler flags.
--=20
2.25.1


