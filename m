Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C85C5C7EE29
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 20:06:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.480.1685045168448565524
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 25 May 2023 13:06:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0920E1650
	for <meta-arm@lists.yoctoproject.org>; Thu, 25 May 2023 13:06:53 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C1B0A3F67D
	for <meta-arm@lists.yoctoproject.org>; Thu, 25 May 2023 13:06:07 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/5] arm/qemuarm-secureboot: add musl testing
Date: Thu, 25 May 2023 15:06:00 -0500
Message-Id: <20230525200602.3277592-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230525200602.3277592-1-jon.mason@arm.com>
References: <20230525200602.3277592-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 25 May 2023 20:06:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4706

Add musl testing to have qemuarm-secureboot match qemuarm64-secureboot.
Since the Arm GCC binary toolchain cannot work with musl, move that out
into it's own testing.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index df1f0f5a..0344de58 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -188,7 +188,10 @@ qemuarm-secureboot:
   parallel:
     matrix:
       - KERNEL: [linux-yocto, linux-yocto-dev, linux-yocto-rt]
-        TOOLCHAINS: [gcc, clang, external-gccarm]
+        TOOLCHAINS: [gcc, clang]
+        TCLIBC: [glibc, musl]
+        TESTING: testimage
+      - TOOLCHAINS: external-gccarm
         TESTING: testimage
=20
 qemuarm:
--=20
2.30.2


