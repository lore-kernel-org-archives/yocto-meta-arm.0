Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5760DC369CA
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 13:10:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11501.1744981804452293435
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Apr 2025 06:10:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43EDC1AC1
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Apr 2025 06:10:01 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0DB693F66E
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Apr 2025 06:10:04 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] CI: add spaces to TS_ENV
Date: Fri, 18 Apr 2025 09:10:02 -0400
Message-Id: <20250418131002.95131-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250418131002.95131-1-jon.mason@arm.com>
References: <20250418131002.95131-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 18 Apr 2025 13:10:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6467

Seeing the warning:
  lack of whitespace around the assignment: 'TS_ENV=3D"sp"'

Add the spaces to address the issue

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/fvp-base-ts.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ci/fvp-base-ts.yml b/ci/fvp-base-ts.yml
index ae74334edfe3..9f13bac7f045 100644
--- a/ci/fvp-base-ts.yml
+++ b/ci/fvp-base-ts.yml
@@ -21,7 +21,7 @@ local_conf_header:
     IMAGE_INSTALL:append =3D " packagegroup-ts-tests-psa"
     CORE_IMAGE_EXTRA_INSTALL +=3D "optee-test"
     # Set the TS environment
-    TS_ENV=3D"sp"
+    TS_ENV =3D "sp"
     # Enable and configure semihosting
     FVP_CONFIG[cluster0.cpu0.semihosting-cwd] =3D "${DEPLOY_DIR_IMAGE}"
     FVP_CONFIG[cluster0.cpu1.semihosting-cwd] =3D "${DEPLOY_DIR_IMAGE}"
--=20
2.39.5 (Apple Git-154)


