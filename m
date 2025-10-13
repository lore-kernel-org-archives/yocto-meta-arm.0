Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017D7CCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 15:04:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.46105.1760367861115375234
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Oct 2025 08:04:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C916E113E
	for <meta-arm@lists.yoctoproject.org>; Mon, 13 Oct 2025 08:04:12 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4A6673F66E
	for <meta-arm@lists.yoctoproject.org>; Mon, 13 Oct 2025 08:04:20 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/trusted-firmware-m: add missing trusted-firmware-m-scripts-native 2.2.1
Date: Mon, 13 Oct 2025 16:04:14 +0100
Message-ID: <20251013150415.3173432-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Oct 2025 15:04:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6731

This was accidentally missed in the TF-M upgrade to 2.2.1.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-m-scripts-native_2.2.1.bb                  | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m-scripts-native_2.2.1.bb

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-s=
cripts-native_2.2.1.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-=
firmware-m-scripts-native_2.2.1.bb
new file mode 100644
index 0000000000..d50d886f60
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-=
native_2.2.1.bb
@@ -0,0 +1,2 @@
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m-${PV}-src.inc
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-native=
.inc
--=20
2.43.0


