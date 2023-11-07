Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E0AC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 17:05:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.236.1699376710623459035
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 09:05:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C218E1476;
	Tue,  7 Nov 2023 09:05:54 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BA0073F6C4;
	Tue,  7 Nov 2023 09:05:09 -0800 (PST)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] CI: use nanbield branch for meta-virtualization
Date: Tue,  7 Nov 2023 17:05:05 +0000
Message-Id: <20231107170505.38990-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 Nov 2023 17:05:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5216

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/meta-virtualization.yml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/ci/meta-virtualization.yml b/ci/meta-virtualization.yml
index 2e1311ee..88f8cdc9 100644
--- a/ci/meta-virtualization.yml
+++ b/ci/meta-virtualization.yml
@@ -6,4 +6,3 @@ header:
 repos:
   meta-virtualization:
     url: git://git.yoctoproject.org/meta-virtualization
-    branch: master
--=20
2.34.1


