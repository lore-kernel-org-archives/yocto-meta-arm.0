Return-Path: <christophe.thiblot@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BBACC87FCB
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 11:48:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19460.1754394525822444669
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 05 Aug 2025 04:48:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: christophe.thiblot@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EFC8150C;
	Tue,  5 Aug 2025 04:48:37 -0700 (PDT)
Received: from H61H6MR7GJ.emea.arm.com (H61H6MR7GJ.nice.arm.com [10.34.124.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAF8A3F673;
	Tue,  5 Aug 2025 04:48:44 -0700 (PDT)
From: Christophe Thiblot <christophe.thiblot@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Christophe Thiblot <christophe.thiblot@arm.com>
Subject: [PATCH 1/1] arm-bsp/trusted-firmware-a: exclude boot requirement test for Corstone-1000
Date: Tue,  5 Aug 2025 13:48:24 +0200
Message-Id: <20250805114824.78122-1-christophe.thiblot@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 05 Aug 2025 11:48:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6655

A test compares the value of the Generic Timer register CNTFRQ visible in
two frames CNTBaseN and CNTCTLBase that are linked in Armv8-A and reflect
the same value.

An issue in Corstone-1000 (errata 2142118) makes the CNTFRQ views
inconsistents and the then test fails. There is no workaround and
the test is skipped.

Errata: https://developer.arm.com/documentation/sden2142076/0002/?lang=3D=
en
Signed-off-by: Christophe Thiblot <christophe.thiblot@arm.com>
---
 ...-requirement-tests-for-Corstone-1000.patch | 33 +++++++++++++++++++
 .../trusted-firmware-a/tf-a-tests_%.bbappend  |  5 +++
 2 files changed, 38 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/tf-a-tests/0001-fix-exclude-Boot-requirement-tests-for-Corstone=
-1000.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/tf-a-tests/0001-fix-exclude-Boot-requirement-tests-for-Corstone-1000.p=
atch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/tf-=
a-tests/0001-fix-exclude-Boot-requirement-tests-for-Corstone-1000.patch
new file mode 100644
index 00000000..8df0e8cf
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/tf-a=
-tests/0001-fix-exclude-Boot-requirement-tests-for-Corstone-1000.patch
@@ -0,0 +1,33 @@
+From 328bfd8cd95bb0973e4966dcb4e3efa05d62f3f9 Mon Sep 17 00:00:00 2001
+From: Christophe Thiblot <christophe.thiblot@arm.com>
+Date: Wed, 2 Jul 2025 15:03:55 +0000
+Subject: [PATCH] fix: exclude Boot requirement tests for Corstone-1000
+
+A test compares the value of the Generic Timer register CNTFRQ visible i=
n
+two frames CNTBaseN and CNTCTLBase that are linked in Armv8-A and reflec=
t
+the same value.
+   =20
+An issue in Corstone-1000 (errata 2142118) makes the CNTFRQ views
+inconsistents and the then test fails. There is no workaround and
+the test is skipped.
+   =20
+Errata: https://developer.arm.com/documentation/sden2142076/0002/?lang=3D=
en
+
+Signed-off-by: Christophe Thiblot <christophe.thiblot@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-A/tf=
-a-tests/+/40810]
+---
+ plat/arm/corstone1000/tests_to_skip.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/plat/arm/corstone1000/tests_to_skip.txt b/plat/arm/corstone=
1000/tests_to_skip.txt
+index d937e42..afa3992 100644
+--- a/plat/arm/corstone1000/tests_to_skip.txt
++++ b/plat/arm/corstone1000/tests_to_skip.txt
+@@ -16,3 +16,4 @@ PSCI CPU Suspend in OSI mode
+ PSCI STAT/for valid composite state CPU suspend
+ FF-A Setup and Discovery/FF-A RXTX remap unmapped region success
+ FF-A Memory Sharing/Normal World VM retrieve request into SPMC
++Boot requirement tests
+--=20
+2.43.0
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bba=
ppend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappend
index 8cb5a4c5..344c9f8b 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappend
@@ -4,3 +4,8 @@ COMPATIBLE_MACHINE:corstone1000 =3D "corstone1000"
 EXTRA_OEMAKE:append:corstone1000 =3D " DEBUG=3D0"
 EXTRA_OEMAKE:append:corstone1000 =3D " LOG_LEVEL=3D30"
 TFTF_MODE:corstone1000 =3D "release"
+
+FILESEXTRAPATHS:prepend:corstone1000 :=3D "${THISDIR}/files/corstone1000=
/tf-a-tests:"
+SRC_URI:append:corstone1000 =3D " \
+        file://0001-fix-exclude-Boot-requirement-tests-for-Corstone-1000=
.patch \
+        "

