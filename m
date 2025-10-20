Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D44C9CCD193
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 15:09:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.21447.1760972969320061924
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Oct 2025 08:09:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F8DC1063
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Oct 2025 08:09:21 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 899613F66E
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Oct 2025 08:09:28 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/5] arm/sgi575: force gcc for tf-a
Date: Mon, 20 Oct 2025 16:09:24 +0100
Message-ID: <20251020150924.84223-5-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251020150924.84223-1-jon.mason@arm.com>
References: <20251020150924.84223-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 20 Oct 2025 15:09:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6743

trusted-firmware a has a compile error when building with clang.  Since
this platform is EOL'ed and we're not currently building this platform
with clang in CI, the best option is to force GCC for it.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a-sgi575.inc       | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-sgi575.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a-sgi575.inc
index 01cc67bb32e3..c1f16d5499e8 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-sgi5=
75.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-sgi5=
75.inc
@@ -17,3 +17,10 @@ EXTRA_OEMAKE +=3D "TRUSTED_BOARD_BOOT=3D1 GENERATE_COT=
=3D1 ARM_ROTPK_LOCATION=3Ddevel_rs
 # the provided cot-dt2c.
 EXTRA_OEMAKE +=3D "POETRY=3D''"
 DEPENDS +=3D "cot-dt2c-native"
+
+# When compiling tf-a with clang, multiple errors are being seen in the
+# ASM files:
+#   error: instruction requires: fp-armv8
+# Given that this is platform is EOLed, forcing it to use GCC and not
+# reporting upstream
+TOOLCHAIN =3D "gcc"
--=20
2.50.1 (Apple Git-155)


