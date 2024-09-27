Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F0CBCDD1C9
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 15:57:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.72754.1727452629431239609
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Sep 2024 08:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9385214BF
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Sep 2024 08:57:38 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B87B73F6A8
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Sep 2024 08:57:08 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] CI: remove duplicate arm-systemready-ir-acs
Date: Fri, 27 Sep 2024 16:57:04 +0100
Message-Id: <20240927155705.1121586-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240927155705.1121586-1-ross.burton@arm.com>
References: <20240927155705.1121586-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Sep 2024 15:57:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6133

We had two instances of the same job, so consolidate them into one.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index bca957fe..01f3539f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -130,7 +130,7 @@ arm-systemready-ir-acs:
       # arm-systemready-ir-acs must be specified after fvp-base for orde=
ring
       # purposes for the jobs-to-kas output. It is not enough to just ha=
ve it
       # in the job name because fvp-base.yml overwrites the target.
-      - PLATFORM: fvp-base
+      - PLATFORM: [fvp-base, corstone1000-fvp]
         ARM_SYSTEMREADY_IR_ACS: arm-systemready-ir-acs
   tags:
     - ${ACS_TAG}
@@ -197,19 +197,6 @@ fvp-base:
         TESTING: testimage
       - SYSTEMREADY_FIRMWARE: arm-systemready-firmware
=20
-arm-systemready-ir-acs:
-  extends: .build
-  timeout: 12h
-  parallel:
-    matrix:
-      # arm-systemready-ir-acs must be specified after fvp-base for orde=
ring
-      # purposes for the jobs-to-kas output. It is not enough to just ha=
ve it
-      # in the job name because fvp-base.yml overwrites the target.
-      - PLATFORM: [fvp-base, corstone1000-fvp]
-        ARM_SYSTEMREADY_IR_ACS: arm-systemready-ir-acs
-  tags:
-    - ${ACS_TAG}
-
 fvps:
   extends: .build
=20
--=20
2.34.1


