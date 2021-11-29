Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F4AEC433EF
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 14:25:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.61552.1638195905473139517
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Nov 2021 06:25:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24C611063
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 06:25:05 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8C8B3F766
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 06:25:04 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] CI: build optee-spdevkit for qemuarm64
Date: Mon, 29 Nov 2021 14:25:02 +0000
Message-Id: <20211129142502.4019213-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129142502.4019213-1-ross.burton@arm.com>
References: <20211129142502.4019213-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 14:25:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2479

To ensure that optee-spdevkit works in all configurations, but it in the
CI for qemuarm64 not just corstone1000.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/qemuarm64-secureboot.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
index 6ea2064f..31f195dd 100644
--- a/ci/qemuarm64-secureboot.yml
+++ b/ci/qemuarm64-secureboot.yml
@@ -15,3 +15,5 @@ target:
   - perf
   - optee-examples
   - optee-test
+  - optee-spdevkit
+  - optee-os-tadevkit
\ No newline at end of file
--=20
2.25.1


