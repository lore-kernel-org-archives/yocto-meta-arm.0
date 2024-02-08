Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC97C4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 09:40:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.14329.1707385209143670463
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 08 Feb 2024 01:40:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E017E1FB;
	Thu,  8 Feb 2024 01:40:50 -0800 (PST)
Received: from e132995.arm.com (unknown [10.57.8.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 038A43F762;
	Thu,  8 Feb 2024 01:40:07 -0800 (PST)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH nanbield 1/1] Corstone1000:arm-bsp: fix tftf tests nanbield
Date: Thu,  8 Feb 2024 09:39:58 +0000
Message-Id: <20240208093958.35600-2-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240208093958.35600-1-harsimransingh.tungal@arm.com>
References: <20240208093958.35600-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 08 Feb 2024 09:40:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5376

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

The tftf tests are getting stuck on nanbield for corstone1000
due to incompatible optee version. The optee version on nanbield
needs to be upgraded to fix the tftf tests. To avoid that upgrade
on the release branch, some tftf tests are skipped for corstone1000
platform to make the tftf tests work.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 .../0001-corstone1000-skip-tftf-tests.patch   | 33 +++++++++++++++++++
 .../trusted-firmware-a/tf-a-tests_%.bbappend  |  5 +++
 2 files changed, 38 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/000=
1-corstone1000-skip-tftf-tests.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/0001-corst=
one1000-skip-tftf-tests.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware=
-a/files/0001-corstone1000-skip-tftf-tests.patch
new file mode 100644
index 00000000..341d2802
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/0001-corstone1000=
-skip-tftf-tests.patch
@@ -0,0 +1,33 @@
+From 27300daa2397c89e13aa648db30aa5c6acb06bcc Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Fri, 2 Feb 2024 11:58:33 +0000
+Subject: [PATCH] corstone1000: skip tftf tests
+
+Skip some tests for platform corstone1000 which make the tftf tests
+hanged when use with optee v3.22
+
+Upstream-Status: Pending
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ plat/arm/corstone1000/tests_to_skip.txt | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/plat/arm/corstone1000/tests_to_skip.txt b/plat/arm/corstone=
1000/tests_to_skip.txt
+index fdab230..c5eaac0 100644
+--- a/plat/arm/corstone1000/tests_to_skip.txt
++++ b/plat/arm/corstone1000/tests_to_skip.txt
+@@ -13,3 +13,11 @@ Timer framework Validation/Verify the timer interrupt=
 generation
+ CPU Hotplug/CPU hotplug
+ PSCI CPU Suspend
+ PSCI STAT/for valid composite state CPU suspend
++FF-A Direct messaging/FF-A Request SP-to-SP direct messaging
++FF-A Direct messaging/FF-A Request SP-to-SP direct messaging deadlock
++FF-A Memory Sharing/Share Memory with Secure World
++FF-A Memory Sharing/Request Donate Memory SP-to-SP
++FF-A Memory Sharing/Request Share Memory SP-to-VM
++SIMD,SVE Registers context/Check that SIMD registers context is preserv=
ed
++FF-A Interrupt/Test NS interrupts
++SMMUv3 tests
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bba=
ppend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappend
index eef21b93..d047a1eb 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappend
@@ -1,9 +1,14 @@
 # Machine specific TFAs
=20
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
+
 COMPATIBLE_MACHINE:corstone1000 =3D "corstone1000"
 SRCREV:corstone1000 =3D "5f591f67738a1bbe6b262c53d9dad46ed8bbcd67"
 EXTRA_OEMAKE:append:corstone1000 =3D " DEBUG=3D0"
 EXTRA_OEMAKE:append:corstone1000 =3D " LOG_LEVEL=3D30"
 TFTF_MODE:corstone1000 =3D "release"
+SRC_URI:append:corstone1000 =3D " \
+			file://0001-corstone1000-skip-tftf-tests.patch \
+			"
=20
 COMPATIBLE_MACHINE:n1sdp =3D "n1sdp"
--=20
2.25.1


