Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F819CCFA05
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 14:24:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16824.1762439074878520512
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Nov 2025 06:24:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B28361515
	for <meta-arm@lists.yoctoproject.org>; Thu,  6 Nov 2025 06:24:26 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1CBB83F66E
	for <meta-arm@lists.yoctoproject.org>; Thu,  6 Nov 2025 06:24:33 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/4] arm/trusted-firmware-m: update HOMEPAGE
Date: Thu,  6 Nov 2025 14:24:30 +0000
Message-ID: <20251106142430.614591-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106142430.614591-1-ross.burton@arm.com>
References: <20251106142430.614591-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 06 Nov 2025 14:24:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6755

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
index 06b9390c3d..bf31fc6719 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
@@ -5,7 +5,7 @@
=20
 SUMMARY =3D "Trusted Firmware for Cortex-M"
 DESCRIPTION =3D "Trusted Firmware-M"
-HOMEPAGE =3D "https://git.trustedfirmware.org/trusted-firmware-m.git"
+HOMEPAGE =3D "https://trustedfirmware-m.readthedocs.io/"
 PROVIDES =3D "virtual/trusted-firmware-m"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "^TF-Mv(?P<pver>\d+(\.\d+)+)$"
--=20
2.43.0


