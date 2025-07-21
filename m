Return-Path: <frazer.carsley@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDBFAC83F26
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 11:45:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.38313.1753098321187908228
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Jul 2025 04:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: frazer.carsley@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E87731595;
	Mon, 21 Jul 2025 04:45:14 -0700 (PDT)
Received: from e138143.arm.com (unknown [10.57.53.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2AF073F6A8;
	Mon, 21 Jul 2025 04:45:20 -0700 (PDT)
From: Frazer Carsley <frazer.carsley@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Frazer Carsley <frazer.carsley@arm.com>
Subject: [PATCH 2/3] arm-bsp/optee: Updates upstream status
Date: Mon, 21 Jul 2025 12:45:04 +0100
Message-ID: <20250721114506.120457-3-frazer.carsley@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250721114506.120457-1-frazer.carsley@arm.com>
References: <20250721114506.120457-1-frazer.carsley@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Jul 2025 11:45:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6618

Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
---
 .../0001-plat-corstone1000-increase-CFG_TZDRAM_SIZE.patch       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1=
000/0001-plat-corstone1000-increase-CFG_TZDRAM_SIZE.patch b/meta-arm-bsp/=
recipes-security/optee/files/optee-os/corstone1000/0001-plat-corstone1000=
-increase-CFG_TZDRAM_SIZE.patch
index 851e2cd2..e18dd783 100644
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/000=
1-plat-corstone1000-increase-CFG_TZDRAM_SIZE.patch
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/000=
1-plat-corstone1000-increase-CFG_TZDRAM_SIZE.patch
@@ -8,7 +8,7 @@ but the first 0x2000 bytes are reserved for future use. `=
CFG_TZDRAM_SIZE`
 can be increased to `0x360000` so OP-TEE has more RAM.
=20
 Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/OP-TEE/optee_os/pull/7470=
]
 ---
  core/arch/arm/plat-corstone1000/conf.mk | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

