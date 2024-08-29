Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D62C8303F
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 11:05:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10179.1724929518897663547
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Aug 2024 04:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D726BDA7;
	Thu, 29 Aug 2024 04:05:44 -0700 (PDT)
Received: from e126523.budapest.arm.com (e126523.budapest.arm.com [10.45.26.188])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED6983F66E;
	Thu, 29 Aug 2024 04:05:17 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 3/3] CI: Add secure debug build for Corstone-1000
Date: Thu, 29 Aug 2024 13:05:05 +0200
Message-Id: <20240829110505.55826-4-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240829110505.55826-1-bence.balogh@arm.com>
References: <20240829110505.55826-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Aug 2024 11:05:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6009

From: Bence Balogh <bence.balogh@arm.com>

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 .gitlab-ci.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7354bf35..e8627731 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -119,6 +119,7 @@ update-repos:
 #  TS: [none, trusted-services]
 #  VIRT: [none, xen]
 #  TESTING: testimage
+#  SECUREDEBUG: [none, secure-debug]
=20
 arm-systemready-ir-acs:
   extends: .build
@@ -160,6 +161,7 @@ corstone1000-mps3:
       - FIRMWARE: corstone1000-firmware-only
         TESTING: [none, tftf]
       - FIRMWARE: none
+        SECUREDEBUG: [none, secure-debug]
=20
 documentation:
   extends: .setup
--=20
2.25.1


