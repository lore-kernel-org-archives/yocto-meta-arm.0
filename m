Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB796C87FD1
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 09:48:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17802.1754387277299086903
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 05 Aug 2025 02:47:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8BEC2BC2
	for <meta-arm@lists.yoctoproject.org>; Tue,  5 Aug 2025 02:47:48 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 862603F738
	for <meta-arm@lists.yoctoproject.org>; Tue,  5 Aug 2025 02:47:56 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm-bsp/u-boot: add a U-Boot 2025.04 recipe for Corstone1000
Date: Tue,  5 Aug 2025 10:47:51 +0100
Message-ID: <20250805094751.2542090-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250805094751.2542090-1-ross.burton@arm.com>
References: <20250805094751.2542090-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 05 Aug 2025 09:48:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6654

Until Corstone1000 can be updated to use 2025.07, keep an older release
of u-boot in meta-arm-bsp for it to use.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2025.04.bb | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2025.04.bb

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2025.04.bb b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_2025.04.bb
new file mode 100644
index 0000000000..aee5b42c16
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2025.04.bb
@@ -0,0 +1,7 @@
+require recipes-bsp/u-boot/u-boot-common.inc
+require recipes-bsp/u-boot/u-boot.inc
+
+DEPENDS +=3D "bc-native dtc-native gnutls-native python3-pyelftools-nati=
ve"
+
+SRCREV =3D "34820924edbc4ec7803eb89d9852f4b870fa760a"
+SRC_URI =3D "git://source.denx.de/u-boot/u-boot.git;protocol=3Dhttps;bra=
nch=3Dmaster"
--=20
2.43.0


