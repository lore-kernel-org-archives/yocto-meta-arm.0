Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A49ECC6FD1D
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 16:17:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19594.1678205816472075527
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Mar 2023 08:16:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85AA511FB
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 Mar 2023 08:17:39 -0800 (PST)
Received: from jdm-VirtualBox.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 059A03F67D
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 Mar 2023 08:16:55 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] ci: add external-toolchain to qemuarm-secureboot
Date: Tue,  7 Mar 2023 11:16:50 -0500
Message-Id: <20230307161650.476217-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230307161650.476217-1-jon.mason@arm.com>
References: <20230307161650.476217-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 Mar 2023 16:17:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4478

With the removal of fvp-base-arm32, we no longer have test coverage for
the external Arm toolchain.  Add this to qemuarm-secureboot CI so that
there is coverage again.  Note: it must be a 32bit machine, since there
are currently no aarch64 host toolchains for aarch64

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 9036efbd..7d00c88f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -164,7 +164,7 @@ qemuarm-secureboot:
   extends: .build
   parallel:
     matrix:
-      - TOOLCHAINS: [gcc, clang]
+      - TOOLCHAINS: [gcc, clang, external-gccarm]
         TESTING: testimage
=20
 qemuarm:
--=20
2.25.1


