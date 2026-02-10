Return-Path: <frazer.carsley@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F63EB26F1
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 17:13:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24721.1770743589654134848
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Feb 2026 09:13:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: frazer.carsley@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DA52497;
	Tue, 10 Feb 2026 09:13:01 -0800 (PST)
Received: from e138143.cambridge.arm.com (e138143.arm.com [10.1.30.169])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFBCE3F63F;
	Tue, 10 Feb 2026 09:13:06 -0800 (PST)
From: Frazer Carsley <frazer.carsley@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Frazer Carsley <frazer.carsley@arm.com>
Subject: [PATCH 3/3] arm-bsp/u-boot: Remove v2025.04 recipe
Date: Tue, 10 Feb 2026 17:12:42 +0000
Message-ID: <20260210171242.196332-4-frazer.carsley@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210171242.196332-1-frazer.carsley@arm.com>
References: <20260210171242.196332-1-frazer.carsley@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 10 Feb 2026 17:13:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6899

Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
---
 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2025.04.bb | 7 -------
 1 file changed, 7 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2025.04.bb

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2025.04.bb b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_2025.04.bb
deleted file mode 100644
index aee5b42c..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2025.04.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require recipes-bsp/u-boot/u-boot-common.inc
-require recipes-bsp/u-boot/u-boot.inc
-
-DEPENDS +=3D "bc-native dtc-native gnutls-native python3-pyelftools-nati=
ve"
-
-SRCREV =3D "34820924edbc4ec7803eb89d9852f4b870fa760a"
-SRC_URI =3D "git://source.denx.de/u-boot/u-boot.git;protocol=3Dhttps;bra=
nch=3Dmaster"

