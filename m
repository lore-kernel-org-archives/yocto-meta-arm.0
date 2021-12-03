Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1BFEC433FE
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 13:26:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.11602.1638537971226786539
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 05:26:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF56F1477
	for <meta-arm@lists.yoctoproject.org>; Fri,  3 Dec 2021 05:26:10 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81EF73F5A1
	for <meta-arm@lists.yoctoproject.org>; Fri,  3 Dec 2021 05:26:10 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2 3/3] CI: also build qemu-generic-arm64 for clang
Date: Fri,  3 Dec 2021 13:26:07 +0000
Message-Id: <20211203132607.2648640-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211203132607.2648640-1-ross.burton@arm.com>
References: <20211203132607.2648640-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 03 Dec 2021 13:26:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2528

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index be522fc8..b2a4c438 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -177,7 +177,8 @@ qemu-generic-arm64:
   extends: .build
   parallel:
     matrix:
-      - TESTING: testimage
+      - TOOLCHAINS: [gcc, clang]
+        TESTING: testimage
=20
 qemuarm64-secureboot:
   extends: .build
--=20
2.25.1


