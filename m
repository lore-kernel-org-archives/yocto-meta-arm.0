Return-Path: <alex.chapman@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2659CD4F3D
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 13:44:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12552.1779284651861317769
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 20 May 2026 06:44:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=AEqd30QQ;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: alex.chapman@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B09F525E9;
	Wed, 20 May 2026 06:44:05 -0700 (PDT)
Received: from e142473.cambridge.arm.com (e142473.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2CBF13F632;
	Wed, 20 May 2026 06:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779284650; bh=uX5KHhZb2YCGtBbCIrGjCDuikJMv7pWCIhB5lpRDO0I=;
	h=From:To:Cc:Subject:Date:From;
	b=AEqd30QQC1pCL9CHbejFzp8Z4JmsHbmrzqwz9zYt0tb9F9m4kmFG5t6YW6XbA+32f
	 oOYJiP5KikEO90HIsaAqIXGSK3Ih6mE94kHTcdK1EV2c6guvmzgGg3G1FMAEgmHTHW
	 BLfp8Ubc6s8VssjlP7l6Fkh+M93PZRNDm9XPjAmc=
From: Alex Chapman <alex.chapman@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Alex Chapman <alex.chapman@arm.com>
Subject: [PATCH] arm/edk2-basetools-native: Add missing libuuid dependency
Date: Wed, 20 May 2026 14:43:54 +0100
Message-ID: <20260520134354.554617-1-alex.chapman@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 20 May 2026 13:44:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7057

GenFv requires libuuid in the native sysroot.

Add util-linux-libuuid-native and pass required flags through to the
BaseTools makefiles. This can be missed on machines with libuuid
headers installed, as the build may find the host copy instead.

Signed-off-by: Alex Chapman <alex.chapman@arm.com>
---
 .../recipes-bsp/uefi/edk2-basetools-native_202602.bb  | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202602.bb b/=
meta-arm/recipes-bsp/uefi/edk2-basetools-native_202602.bb
index e2d927e2..28bd0dba 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202602.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202602.bb
@@ -27,6 +27,17 @@ inherit native
=20
 RDEPENDS:${PN} +=3D "python3-core"
=20
+DEPENDS +=3D "util-linux-libuuid-native"
+
+EXTRA_OEMAKE +=3D "\
+    CC=3D'${BUILD_CC}' \
+    CXX=3D'${BUILD_CXX}' \
+    AR=3D'${BUILD_AR}' \
+    LINKER=3D'${BUILD_CC}' \
+    EXTRA_OPTFLAGS=3D'${BUILD_CFLAGS}' \
+    EXTRA_LDFLAGS=3D'${BUILD_LDFLAGS}' \
+"
+
 do_compile() {
     BASE_C=3D"${S}/BaseTools/Source/C"
=20

