Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C11C4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 16:30:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20466.1714494612994832513
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 09:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CF7F2F4;
	Tue, 30 Apr 2024 09:30:39 -0700 (PDT)
Received: from e126835.cambridge.arm.com (e126835.cambridge.arm.com [10.1.29.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3ABF73F73F;
	Tue, 30 Apr 2024 09:30:12 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Drew Reed <Drew.Reed@arm.com>
Subject: [PATCH 6/6] ci: Add Corstone-1000 to the SystemReady ACS build
Date: Tue, 30 Apr 2024 17:29:57 +0100
Message-Id: <20240430162957.94499-7-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240430162957.94499-1-emekcan.aras@arm.com>
References: <20240430162957.94499-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 16:30:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5671

From: Drew Reed <Drew.Reed@arm.com>

Added the Corstone-1000 FVP platform to the ACS test build as well as
adding the arm-systemready-firmware variant to the Corstone-1000 FVP
build.

Signed-off-by: Drew Reed <Drew.Reed@arm.com>
---
 .gitlab-ci.yml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d7876daa..3adea45e 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -151,6 +151,7 @@ corstone1000-fvp:
         TESTING: [testimage, tftf]
       - FIRMWARE: none
         TESTING: testimage
+      - SYSTEMREADY_FIRMWARE: arm-systemready-firmware
=20
 corstone1000-mps3:
   extends: .build
@@ -192,6 +193,19 @@ fvp-base:
       - FIRMWARE: edk2
       - SYSTEMREADY_FIRMWARE: arm-systemready-firmware
=20
+arm-systemready-ir-acs:
+  extends: .build
+  timeout: 12h
+  parallel:
+    matrix:
+      # arm-systemready-ir-acs must be specified after fvp-base for orde=
ring
+      # purposes for the jobs-to-kas output. It is not enough to just ha=
ve it
+      # in the job name because fvp-base.yml overwrites the target.
+      - PLATFORM: [fvp-base, corstone1000-fvp]
+        ARM_SYSTEMREADY_IR_ACS: arm-systemready-ir-acs
+  tags:
+    - ${ACS_TAG}
+
 fvps:
   extends: .build
=20
--=20
2.25.1


