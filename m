Return-Path: <debbie.martin@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D4CC41535
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 09:50:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.46733.1699005023134492102
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Nov 2023 02:50:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: debbie.martin@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6355D2F4
	for <meta-arm@lists.yoctoproject.org>; Fri,  3 Nov 2023 02:51:05 -0700 (PDT)
Received: from e127725.arm.com (unknown [10.57.2.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1CE923F64C
	for <meta-arm@lists.yoctoproject.org>; Fri,  3 Nov 2023 02:50:21 -0700 (PDT)
From: Debbie Martin <Debbie.Martin@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/5] ci: Add fvpboot to IMAGE_CLASSES
Date: Fri,  3 Nov 2023 09:49:39 +0000
Message-Id: <20231103094939.1290558-5-Debbie.Martin@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231103094939.1290558-1-Debbie.Martin@arm.com>
References: <20231103094939.1290558-1-Debbie.Martin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 03 Nov 2023 09:50:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5202

Use IMAGE_CLASSES rather than a direct INHERIT for fvpboot.
This is Yocto best practice as it is used to enable
functionality across all image recipes.

Signed-off-by: Debbie Martin <Debbie.Martin@arm.com>
---
 ci/fvp.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ci/fvp.yml b/ci/fvp.yml
index 81a5caa6..e9f3fa94 100644
--- a/ci/fvp.yml
+++ b/ci/fvp.yml
@@ -4,7 +4,7 @@ header:
 local_conf_header:
   testimagefvp: |
     LICENSE_FLAGS_ACCEPTED +=3D "Arm-FVP-EULA"
-    INHERIT +=3D "fvpboot"
+    IMAGE_CLASSES +=3D "fvpboot"
   failing_tests: |
     # This fails but we can't add to the ignorelist from meta-arm yet
     # https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14604
--=20
2.25.1


