Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E583CCA482
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 20:14:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.45579.1658261637095596287
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 Jul 2022 13:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00FD21576;
	Tue, 19 Jul 2022 13:13:57 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 078753F766;
	Tue, 19 Jul 2022 13:13:55 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/9] CI: use apt-get instead of apt wrapper
Date: Tue, 19 Jul 2022 21:13:45 +0100
Message-Id: <20220719201353.1467716-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 19 Jul 2022 20:14:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3574

When used in a non-interactive context, apt prints a warning:

WARNING: apt does not have a stable CLI interface. Use with caution in sc=
ripts.

Use apt-get directly to avoid putting warnings in the logs.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f91d678a..f3ca24d3 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -25,7 +25,7 @@ stages:
     - mkdir --verbose --parents $KAS_WORK_DIR $KAS_REPO_REF_DIR $SSTATE_=
DIR $DL_DIR $TOOLCHAIN_DIR $TOOLCHAIN_LINK_DIR
     # Must do this here, as it's the only way to make sure the toolchain=
 is installed on the same builder
     - ./ci/get-binary-toolchains $DL_DIR $TOOLCHAIN_DIR $TOOLCHAIN_LINK_=
DIR
-    - sudo apt update && sudo apt install --yes telnet python3-subunit
+    - sudo apt-get update && sudo apt-get install --yes telnet python3-s=
ubunit
=20
 # Generalised fragment to do a Kas build
 .build:
--=20
2.34.1


