Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB5C8C04E69
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 19:32:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.4085.1689622334596250244
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Jul 2023 12:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1C8213D5;
	Mon, 17 Jul 2023 12:32:57 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 107633F67D;
	Mon, 17 Jul 2023 12:32:14 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH 4/9] arm-bsp/linux-yocto: fix Upstream-Status
Date: Mon, 17 Jul 2023 14:32:02 -0500
Message-Id: <20230717193207.3562364-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230717193207.3562364-1-jon.mason@arm.com>
References: <20230717193207.3562364-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 17 Jul 2023 19:32:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4888

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../files/corstone1000/0002-Add-external-system-driver.patch    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0002-Ad=
d-external-system-driver.patch b/meta-arm-bsp/recipes-kernel/linux/files/=
corstone1000/0002-Add-external-system-driver.patch
index b68edbc1..5af041ef 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0002-Add-exter=
nal-system-driver.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0002-Add-exter=
nal-system-driver.patch
@@ -7,7 +7,7 @@ Adds external system driver to control it
 from user-space. It provides run and reset
 functionality at the moment.
=20
-Upstream-Status: Pending[Not submitted to upstream yet]
+Upstream-Status: Pending [Not submitted to upstream yet]
 Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
--=20
2.30.2


