Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F14C4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 11:44:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16405.1713786245686986902
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Apr 2024 04:44:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82A2E339;
	Mon, 22 Apr 2024 04:44:33 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF5A73F7BD;
	Mon, 22 Apr 2024 04:44:04 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm/classes/wic_nopt: remove unused class
Date: Mon, 22 Apr 2024 11:44:03 +0000
Message-Id: <20240422114403.75657-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 22 Apr 2024 11:44:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5577

This class is no longer used by any machines, so remove it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/classes/wic_nopt.bbclass | 9 ---------
 1 file changed, 9 deletions(-)
 delete mode 100644 meta-arm/classes/wic_nopt.bbclass

diff --git a/meta-arm/classes/wic_nopt.bbclass b/meta-arm/classes/wic_nop=
t.bbclass
deleted file mode 100644
index 529bf138..00000000
--- a/meta-arm/classes/wic_nopt.bbclass
+++ /dev/null
@@ -1,9 +0,0 @@
-# This class removes the empty partition table header
-# in the WIC file when --no-table WKS option is used
-
-IMAGE_TYPES:append =3D " wic.nopt"
-
-CONVERSIONTYPES +=3D "nopt"
-
-# 1024 bytes are skipped which corresponds to the size of the partition =
table header to remove
-CONVERSION_CMD:nopt =3D "tail -c +1025 ${IMAGE_NAME}.${type} >  ${IMAGE_=
NAME}.${type}.nopt"
--=20
2.34.1


