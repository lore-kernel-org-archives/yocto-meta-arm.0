Return-Path: <davidson.kumaresan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0BA7C32771
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 14:53:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.8977.1664376838841669905
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Sep 2022 07:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: davidson.kumaresan@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C34723A;
	Wed, 28 Sep 2022 07:54:05 -0700 (PDT)
Received: from usa.arm.com (unknown [10.162.16.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 647E63F73D;
	Wed, 28 Sep 2022 07:53:57 -0700 (PDT)
From: Davidson K <davidson.kumaresan@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Davidson K <davidson.kumaresan@arm.com>
Subject: [PATCH 1/2] arm-bsp/u-boot: add gnutls-native as dependency
Date: Wed, 28 Sep 2022 20:23:45 +0530
Message-Id: <20220928145346.48077-1-davidson.kumaresan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 28 Sep 2022 14:53:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3861

Since U-Boot 2022.04 the host tool mkeficapsule requires gnutls.
Thus adding it to the dependency.

Signed-off-by: Davidson K <davidson.kumaresan@arm.com>
Change-Id: I8eff2e9bb9752bea5b885fcf3a69bf79c4f0c215
---
 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2022.04.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2022.04.bb b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_2022.04.bb
index bc2d6d42..46f92446 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2022.04.bb
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2022.04.bb
@@ -23,4 +23,4 @@ do_configure[cleandirs] =3D "${B}"
=20
 require recipes-bsp/u-boot/u-boot.inc
=20
-DEPENDS +=3D "bc-native dtc-native"
+DEPENDS +=3D "bc-native dtc-native gnutls-native"
--=20
2.34.1


