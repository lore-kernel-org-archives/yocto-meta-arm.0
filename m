Return-Path: <ali.oezaslan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6989BCDD1C0
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 15:49:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.72544.1727452172767578114
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Sep 2024 08:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ali.oezaslan@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2D99150C;
	Fri, 27 Sep 2024 08:50:01 -0700 (PDT)
Received: from PW05BKJD.arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9E413F6A8;
	Fri, 27 Sep 2024 08:49:31 -0700 (PDT)
From: ali.oezaslan@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Ali Can Ozaslan <ali.oezaslan@arm.com>
Subject: [PATCH 1/1] arm-bsp/optee: corstone1000: Update upstream status
Date: Fri, 27 Sep 2024 16:49:16 +0100
Message-Id: <20240927154916.13427-2-ali.oezaslan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240927154916.13427-1-ali.oezaslan@arm.com>
References: <20240927154916.13427-1-ali.oezaslan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Sep 2024 15:49:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6131

From: Ali Can Ozaslan <ali.oezaslan@arm.com>=0D

The patch with pending status was submitted to the upstream OP-TEE=0D
repo.=0D
=0D
Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>=0D
---=0D
 .../files/optee-os/corstone1000/0002-increase-tzdram-size.patch | 2 +-=0D
 1 file changed, 1 insertion(+), 1 deletion(-)=0D
=0D
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone100=
0/0002-increase-tzdram-size.patch b/meta-arm-bsp/recipes-security/optee/fil=
es/optee-os/corstone1000/0002-increase-tzdram-size.patch=0D
index c499a163b..0c89bd0e8 100644=0D
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0002-=
increase-tzdram-size.patch=0D
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0002-=
increase-tzdram-size.patch=0D
@@ -3,7 +3,7 @@ From: Emekcan Aras <Emekcan.Aras@arm.com>=0D
 Date: Wed, 3 Apr 2024 16:05:07 +0100=0D
 Subject: [PATCH] increase tzdram size=0D
 =0D
-Upstream-Status: Pending=0D
+Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/commit/258b7=
2d242cd1a8ae56c87f9572a0624084785c7]=0D
 Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>=0D
 Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>=0D
 ---=0D
-- =0D
2.34.1=0D
=0D

