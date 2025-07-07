Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE9F9C83F0A
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 18:30:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.521.1751913049970541424
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Jul 2025 11:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF428168F
	for <meta-arm@lists.yoctoproject.org>; Mon,  7 Jul 2025 11:30:36 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DA3303F694
	for <meta-arm@lists.yoctoproject.org>; Mon,  7 Jul 2025 11:30:48 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/5] CI: don't force testimage in fvp-base-ts
Date: Mon,  7 Jul 2025 19:30:38 +0100
Message-ID: <20250707183042.1299783-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Jul 2025 18:30:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6598

The caller should (and does) use ci/testimage.yml explicitly instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/fvp-base-ts.yml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/ci/fvp-base-ts.yml b/ci/fvp-base-ts.yml
index 21757c6cf5..112b092460 100644
--- a/ci/fvp-base-ts.yml
+++ b/ci/fvp-base-ts.yml
@@ -5,7 +5,6 @@ header:
   includes:
     - ci/fvp-base.yml
     - ci/meta-openembedded.yml
-    - ci/testimage.yml
=20
 local_conf_header:
   trusted_services: |
--=20
2.43.0


