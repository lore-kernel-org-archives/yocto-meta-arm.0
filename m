Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67643C77B72
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 12:52:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6976.1681995159287042096
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Apr 2023 05:52:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC20B1480;
	Thu, 20 Apr 2023 05:53:22 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 771333F587;
	Thu, 20 Apr 2023 05:52:38 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 6/6] CI: add TF-M to TC build
Date: Thu, 20 Apr 2023 13:52:33 +0100
Message-Id: <20230420125233.1918925-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420125233.1918925-1-ross.burton@arm.com>
References: <20230420125233.1918925-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Apr 2023 12:52:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4598

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/tc1.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ci/tc1.yml b/ci/tc1.yml
index fd9acbd2..d9a7cbfc 100644
--- a/ci/tc1.yml
+++ b/ci/tc1.yml
@@ -2,8 +2,10 @@ header:
   version: 11
   includes:
     - ci/base.yml
+    - ci/meta-openembedded.yml
=20
 machine: tc1
=20
 target:
   - tc-artifacts-image
+  - trusted-firmware-m
--=20
2.34.1


