Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B03AC433F5
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 17:34:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.15012.1637861644578454363
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 25 Nov 2021 09:34:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E71D21042
	for <meta-arm@lists.yoctoproject.org>; Thu, 25 Nov 2021 09:34:03 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88ADC3F73B
	for <meta-arm@lists.yoctoproject.org>; Thu, 25 Nov 2021 09:34:03 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] CI: build optee-test in qemuarm64-secureboot
Date: Thu, 25 Nov 2021 17:34:00 +0000
Message-Id: <20211125173400.1285847-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125173400.1285847-1-ross.burton@arm.com>
References: <20211125173400.1285847-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 25 Nov 2021 17:34:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2458

This recipe doesn't get built through dependencies, so add it explicitly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/qemuarm64-secureboot.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
index b7f3cb44..6ea2064f 100644
--- a/ci/qemuarm64-secureboot.yml
+++ b/ci/qemuarm64-secureboot.yml
@@ -14,3 +14,4 @@ target:
   - core-image-base
   - perf
   - optee-examples
+  - optee-test
--=20
2.25.1


