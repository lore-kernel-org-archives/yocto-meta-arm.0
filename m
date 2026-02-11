Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FBEEF0705
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 15:58:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22214.1770825490741857788
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 07:58:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E453E143D
	for <meta-arm@lists.yoctoproject.org>; Wed, 11 Feb 2026 07:58:03 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 27D4F3F632
	for <meta-arm@lists.yoctoproject.org>; Wed, 11 Feb 2026 07:58:10 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm/fvps: reorganize CI into segments
Date: Wed, 11 Feb 2026 10:58:09 -0500
Message-ID: <20260211155809.6450-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260211155809.6450-1-jon.mason@arm.com>
References: <20260211155809.6450-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 11 Feb 2026 15:58:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6901

The downloads page for FVPs is broken down into sub-pages for each
"Ecosystem".  Organize this file to match that.  Also, rename fvp-v3-r1
to "rd" to make more obvious what this refers to.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/fvps.yml                                   | 32 +++++++++++++------
 .../fvp/{fvp-v3-r1.bb =3D> fvp-rd-v3-r1.bb}     |  0
 2 files changed, 23 insertions(+), 9 deletions(-)
 rename meta-arm/recipes-devtools/fvp/{fvp-v3-r1.bb =3D> fvp-rd-v3-r1.bb}=
 (100%)

diff --git a/ci/fvps.yml b/ci/fvps.yml
index 1ef3e0fa0b9a..f64885a35c9a 100644
--- a/ci/fvps.yml
+++ b/ci/fvps.yml
@@ -17,17 +17,31 @@ local_conf_header:
=20
 target:
   # Target packages to test aarch64
-  - fvp-base-a-aem
-  - fvp-corstone1000
-  - fvp-corstone1000-a320
-  - fvp-rd1-ae
-  - fvp-v3-r1
   # Nativesdk to test x86-64
+
+  # Architecture Envelope Models (AEM) FVPs
+  - fvp-base-a-aem
   - nativesdk-fvp-base-a-aem
-  - nativesdk-fvp-corstone1000
-  - nativesdk-fvp-corstone1000-a320
+
+  # Arm Lumex CSS (Total Compute) FVPs
+  # These are x86 only... :(
+  - nativesdk-fvp-tc3
+
+  # Automotive FVPs
+  - fvp-rd1-ae
   - nativesdk-fvp-rd1-ae
-  - nativesdk-fvp-v3-r1
+
+  # Infrastructure FVPs
+  - fvp-rd-v3-r1
+  - nativesdk-fvp-rd-v3-r1
   # These are x86 only... :(
   - nativesdk-fvp-sgi575
-  - nativesdk-fvp-tc3
+
+  # IoT FVPs
+  - fvp-corstone1000
+  - nativesdk-fvp-corstone1000
+  - fvp-corstone1000-a320
+  - nativesdk-fvp-corstone1000-a320
+
+  # Morello FVPs
+  # TBD
diff --git a/meta-arm/recipes-devtools/fvp/fvp-v3-r1.bb b/meta-arm/recipe=
s-devtools/fvp/fvp-rd-v3-r1.bb
similarity index 100%
rename from meta-arm/recipes-devtools/fvp/fvp-v3-r1.bb
rename to meta-arm/recipes-devtools/fvp/fvp-rd-v3-r1.bb
--=20
2.50.1 (Apple Git-155)


