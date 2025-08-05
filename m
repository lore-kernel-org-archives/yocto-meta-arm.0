Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D19EEC87FD2
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 09:48:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.18224.1754387276802445935
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 05 Aug 2025 02:47:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 380C8150C
	for <meta-arm@lists.yoctoproject.org>; Tue,  5 Aug 2025 02:47:48 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D5A403F738
	for <meta-arm@lists.yoctoproject.org>; Tue,  5 Aug 2025 02:47:55 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-bsp/u-boot: remove version 2023.07.02
Date: Tue,  5 Aug 2025 10:47:50 +0100
Message-ID: <20250805094751.2542090-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 05 Aug 2025 09:48:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6653

The use of 2023.07.02 was removed in meta-arm e29c0ee70a
("arm-bsp/u-boot: corstone1000: Add PSA Firmware Update support (DEN0118
v1.0A)").

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2023.07.02.bb | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2023.07.02.bb

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2023.07.02.bb b/meta-=
arm-bsp/recipes-bsp/u-boot/u-boot_2023.07.02.bb
deleted file mode 100644
index d23176ab5f..0000000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2023.07.02.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require recipes-bsp/u-boot/u-boot-common.inc
-require recipes-bsp/u-boot/u-boot.inc
-
-SRCREV =3D "83cdab8b2c6ea0fc0860f8444d083353b47f1d5c"
-SRC_URI =3D "git://source.denx.de/u-boot/u-boot.git;protocol=3Dhttps;bra=
nch=3Du-boot-2023.07.y"
--=20
2.43.0


