Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF015C83010
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 13:49:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14158.1751032194009062241
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 06:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 693651007
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Jun 2025 06:49:36 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 40AE53F66E
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Jun 2025 06:49:53 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][kirkstone 6/6] CI: fix meta-virtualization URL
Date: Fri, 27 Jun 2025 14:49:46 +0100
Message-ID: <20250627134946.154438-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250627134946.154438-1-ross.burton@arm.com>
References: <20250627134946.154438-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Jun 2025 13:49:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6590

Use https: so that Kas premirroring can work.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/meta-virtualization.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ci/meta-virtualization.yml b/ci/meta-virtualization.yml
index 1cd0e21a89..157e21e2a7 100644
--- a/ci/meta-virtualization.yml
+++ b/ci/meta-virtualization.yml
@@ -5,4 +5,4 @@ header:
=20
 repos:
   meta-virtualization:
-    url: git://git.yoctoproject.org/meta-virtualization
+    url: https://git.yoctoproject.org/meta-virtualization
--=20
2.43.0


