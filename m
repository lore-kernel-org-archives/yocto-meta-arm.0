Return-Path: <drew.reed@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 608A0C54787
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 15:47:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16340.1708444073580574667
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Feb 2024 07:47:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: drew.reed@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40D55FEC;
	Tue, 20 Feb 2024 07:48:32 -0800 (PST)
Received: from C02DP1BVML7H.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E8BD3F73F;
	Tue, 20 Feb 2024 07:47:52 -0800 (PST)
From: drew.reed@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Drew Reed <Drew.Reed@arm.com>
Subject: [PATCH 4/4] ci: Add back testing of firmware only builds
Date: Tue, 20 Feb 2024 15:47:41 +0000
Message-ID: <20240220154741.66754-5-drew.reed@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240220154741.66754-1-drew.reed@arm.com>
References: <20240220154741.66754-1-drew.reed@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 20 Feb 2024 15:47:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5391

From: Drew Reed <Drew.Reed@arm.com>

Signed-off-by: Drew Reed <Drew.Reed@arm.com>
---
 .gitlab-ci.yml | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e1b8dd24..15cf4ecd 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -123,14 +123,18 @@ corstone1000-fvp:
   extends: .build
   parallel:
     matrix:
-      - TESTING: [testimage, tftf]
+      - FIRMWARE: corstone1000-firmware-only
+        TESTING: [testimage, tftf]
+      - FIRMWARE: none
+        TESTING: testimage
=20
 corstone1000-mps3:
   extends: .build
   parallel:
     matrix:
-      - TESTING: [none, tftf]
-
+      - FIRMWARE: corstone1000-firmware-only
+        TESTING: [none, tftf]
+      - FIRMWARE: none
=20
 fvp-base:
   extends: .build
--=20
2.43.0


