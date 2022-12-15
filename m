Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1714C4167B
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 16:16:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.138301.1671120971915653665
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Dec 2022 08:16:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40BE31424;
	Thu, 15 Dec 2022 08:16:52 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 253A63F73B;
	Thu, 15 Dec 2022 08:16:11 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH][kirkstone 5/8] CI: define DEFAULT_TAG
Date: Thu, 15 Dec 2022 16:16:03 +0000
Message-Id: <20221215161606.1194188-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221215161606.1194188-1-ross.burton@arm.com>
References: <20221215161606.1194188-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 15 Dec 2022 16:16:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4189

From: Jon Mason <jon.mason@arm.com>

DEFAULT_TAG is being used to help with internal Gitlab pipeline setups
know which type of machines to run on, but has not value outside of Arm
Corp.  Gitlab CI allows for variables to be overridden by default.  So,
we can give it a default value of NULL/empty and have everything work
internally and externally by default.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7c4a354b..706cfada 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -25,6 +25,7 @@ stages:
     TOOLCHAIN_DIR: $CI_BUILDS_DIR/persist/toolchains
     IMAGE_DIR: $CI_PROJECT_DIR/work/build/tmp/deploy/images
     TOOLCHAIN_LINK_DIR: $CI_PROJECT_DIR/work/build/toolchains
+    DEFAULT_TAG: ""
   before_script:
     - echo KAS_WORK_DIR =3D $KAS_WORK_DIR
     - echo SSTATE_DIR =3D $SSTATE_DIR
--=20
2.34.1


