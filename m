Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8420FC433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 11:45:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.6239.1644579931893971050
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 03:45:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 917091042
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 03:45:31 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B9AD3F73B
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 03:45:30 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/4] gem5/linux-yocto: use wildcards in the bbappend
Date: Fri, 11 Feb 2022 11:45:26 +0000
Message-Id: <20220211114527.4157075-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211114527.4157075-1-ross.burton@arm.com>
References: <20220211114527.4157075-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 11:45:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2989

Don't hard-code 5.4, use wildcards instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-kernel/linux/linux-yocto_%.bbappend      | 11 +++++++++++
 .../recipes-kernel/linux/linux-yocto_5.4.bbappend    | 12 ------------
 2 files changed, 11 insertions(+), 12 deletions(-)
 create mode 100644 meta-gem5/recipes-kernel/linux/linux-yocto_%.bbappend

diff --git a/meta-gem5/recipes-kernel/linux/linux-yocto_%.bbappend b/meta=
-gem5/recipes-kernel/linux/linux-yocto_%.bbappend
new file mode 100644
index 00000000..b36ea064
--- /dev/null
+++ b/meta-gem5/recipes-kernel/linux/linux-yocto_%.bbappend
@@ -0,0 +1,11 @@
+FILESEXTRAPATHS:prepend:gem5-arm64 :=3D "${THISDIR}:${THISDIR}/files:"
+
+COMPATIBLE_MACHINE:gem5-arm64 =3D "gem5-arm64"
+KMACHINE:gem5-arm64 =3D "gem5-arm64"
+SRC_URI:append:gem5-arm64 =3D " file://gem5-kmeta;type=3Dkmeta;name=3Dge=
m5-kmeta;destsuffix=3Dgem5-kmeta \
+                              file://dts/gem5-arm64;subdir=3Dadd-files"
+
+do_patch:append:gem5-arm64() {
+    tar -C ${WORKDIR}/add-files/dts -cf - gem5-arm64 | \
+        tar -C arch/arm64/boot/dts -xf -
+}
diff --git a/meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend b/me=
ta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend
index 480c5e23..078b684f 100644
--- a/meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend
+++ b/meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend
@@ -1,13 +1 @@
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}:${THISDIR}/files:"
-
 require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'recip=
es-kernel/linux/linux-yocto_virtualization.inc', '', d)}
-
-COMPATIBLE_MACHINE:gem5-arm64 =3D "gem5-arm64"
-KMACHINE:gem5-arm64 =3D "gem5-arm64"
-SRC_URI:append:gem5-arm64 =3D " file://gem5-kmeta;type=3Dkmeta;name=3Dge=
m5-kmeta;destsuffix=3Dgem5-kmeta \
-                              file://dts/gem5-arm64;subdir=3Dadd-files"
-
-do_patch:append:gem5-arm64() {
-    tar -C ${WORKDIR}/add-files/dts -cf - gem5-arm64 | \
-        tar -C arch/arm64/boot/dts -xf -
-}
--=20
2.25.1


