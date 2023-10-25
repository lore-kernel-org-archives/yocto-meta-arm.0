Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9EA9C0032E
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 14:00:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.174148.1698242398697667651
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Oct 2023 06:59:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D64952F4;
	Wed, 25 Oct 2023 07:00:39 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C9D193F64C;
	Wed, 25 Oct 2023 06:59:57 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp/u-boot: remove 2023.01
Date: Wed, 25 Oct 2023 14:59:56 +0100
Message-Id: <20231025135956.60268-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 25 Oct 2023 14:00:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5171

From: Ross Burton <ross.burton@arm.com>

This was made redundant when Corstone 500 upgraded in bddec6c.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2023.01.bb | 4 ----
 1 file changed, 4 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2023.01.bb

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2023.01.bb b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_2023.01.bb
deleted file mode 100644
index 2dd5e04a..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2023.01.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require recipes-bsp/u-boot/u-boot-common.inc
-require recipes-bsp/u-boot/u-boot.inc
-
-SRCREV =3D "62e2ad1ceafbfdf2c44d3dc1b6efc81e768a96b9"
--=20
2.34.1


