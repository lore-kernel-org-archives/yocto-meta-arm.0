Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD78C54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 17:20:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.78790.1673284828390558299
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Jan 2023 09:20:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F21C51042;
	Mon,  9 Jan 2023 09:21:09 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B9F53F587;
	Mon,  9 Jan 2023 09:20:27 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 4/4] CI: don't pin fvp-base jobs to x86-64
Date: Mon,  9 Jan 2023 17:20:22 +0000
Message-Id: <20230109172022.2280271-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109172022.2280271-1-ross.burton@arm.com>
References: <20230109172022.2280271-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 09 Jan 2023 17:20:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4247

Now that the FVP is available for both aarch64 and x86-64, don't set a
tag so this can run on both architectures.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 29254b92..09ca8c41 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -97,8 +97,6 @@ fvp-base:
   parallel:
     matrix:
       - TESTING: testimage
-  tags:
-    - x86_64
=20
 fvp-base-arm32:
   extends: .build
@@ -106,8 +104,6 @@ fvp-base-arm32:
     matrix:
       - TOOLCHAINS: [gcc, external-gccarm]
         TESTING: testimage
-  tags:
-    - x86_64
=20
 fvp-baser-aemv8r64:
   extends: .build
--=20
2.34.1


