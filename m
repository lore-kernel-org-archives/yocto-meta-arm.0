Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B53C433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 18:03:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.55413.1638813798032504236
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Dec 2021 10:03:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DE9A12FC
	for <meta-arm@lists.yoctoproject.org>; Mon,  6 Dec 2021 10:03:16 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 26DA53F73B
	for <meta-arm@lists.yoctoproject.org>; Mon,  6 Dec 2021 10:03:16 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/scp-firmware: upgrade to 2.9
Date: Mon,  6 Dec 2021 18:03:11 +0000
Message-Id: <20211206180312.1712721-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Dec 2021 18:03:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2550

Drop a patch which was backported and is now included in 2.9.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...and-length-volatile-for-mod_smt_memo.patch | 47 -------------------
 ...irmware_2.8.0.bb =3D> scp-firmware_2.9.0.bb} |  8 ++--
 2 files changed, 3 insertions(+), 52 deletions(-)
 delete mode 100644 meta-arm/recipes-bsp/scp-firmware/files/0001-smt-Make=
-status-and-length-volatile-for-mod_smt_memo.patch
 rename meta-arm/recipes-bsp/scp-firmware/{scp-firmware_2.8.0.bb =3D> scp=
-firmware_2.9.0.bb} (90%)

diff --git a/meta-arm/recipes-bsp/scp-firmware/files/0001-smt-Make-status=
-and-length-volatile-for-mod_smt_memo.patch b/meta-arm/recipes-bsp/scp-fi=
rmware/files/0001-smt-Make-status-and-length-volatile-for-mod_smt_memo.pa=
tch
deleted file mode 100644
index a4b08ed8..00000000
--- a/meta-arm/recipes-bsp/scp-firmware/files/0001-smt-Make-status-and-le=
ngth-volatile-for-mod_smt_memo.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From d13b4f81287ef957365c3fe68c3d8e17427cb364 Mon Sep 17 00:00:00 2001
-From: Nicola Mazzucato <nicola.mazzucato@arm.com>
-Date: Wed, 12 May 2021 15:20:58 +0100
-Subject: [PATCH] smt: Make status and length volatile for mod_smt_memory
-
-There is an intermittent error on TF-A side when reading the mailbox.
-The error is due to the mailbox message length not matching the expectat=
ion:
-    ASSERT: drivers/arm/css/scmi/scmi_pwr_dmn_proto.c:48
-
-This is due to a race between SCP writing the data and TF-A reading them=
.
-
-Effectively, the compiler seems to perform some minor optimisations with=
 the
-local mod_smt_memory resulting in the expected writing sequence to be al=
tered.
-This is seen in smt_respond().
-
-To remove such optimisations, force the length and status to be volatile=
.
-With this patch the sequence of writing into smt is restored and the err=
or
-in TF-A disappears.
-
-Change-Id: I0127b9aa3cd1b54643ffdb2ca5ddce9fc9569bea
-Signed-off-by: Nicola Mazzucato <nicola.mazzucato@arm.com>
-Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
-Upstream-Status: Backport
----
- module/smt/include/internal/smt.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/module/smt/include/internal/smt.h b/module/smt/include/inte=
rnal/smt.h
-index 1a615a36..d9f3f423 100644
---- a/module/smt/include/internal/smt.h
-+++ b/module/smt/include/internal/smt.h
-@@ -12,10 +12,10 @@
-=20
- struct mod_smt_memory {
-     uint32_t reserved0;
--    uint32_t status;
-+    volatile uint32_t status;
-     uint64_t reserved1;
-     uint32_t flags;
--    uint32_t length; /* message_header + payload */
-+    volatile uint32_t length; /* message_header + payload */
-     uint32_t message_header;
-     uint32_t payload[];
- };
---=20
-2.17.1
-
diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb b/me=
ta-arm/recipes-bsp/scp-firmware/scp-firmware_2.9.0.bb
similarity index 90%
rename from meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb
rename to meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.9.0.bb
index 40648aa4..89d4a34f 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.9.0.bb
@@ -6,11 +6,9 @@ LICENSE =3D "BSD-3-Clause & Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://license.md;beginline=3D5;md5=3D9db9e3d2fb8d=
9300a6c3d15101b19731 \
                     file://contrib/cmsis/git/LICENSE.txt;md5=3De3fc50a88=
d0a364313df4b21ef20c29e"
=20
-SRC_URI =3D "\
-    gitsm://github.com/ARM-software/SCP-firmware.git;protocol=3Dhttps;br=
anch=3Dmaster \
-    file://0001-smt-Make-status-and-length-volatile-for-mod_smt_memo.pat=
ch \
-"
-SRCREV  =3D "043de77f220a0b4b0ec3aa367bd515a9e9df2a29"
+SRC_URI =3D "gitsm://github.com/ARM-software/SCP-firmware.git;protocol=3D=
https;branch=3Dmaster"
+
+SRCREV  =3D "77ffab90a9f6071850475087cc5d40610c621126"
=20
 PROVIDES +=3D "virtual/control-processor-firmware"
=20
--=20
2.25.1


