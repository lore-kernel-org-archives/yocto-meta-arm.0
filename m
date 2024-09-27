Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0682DCEBF9B
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 11:34:34 +0000 (UTC)
Received: from smtp-42ad.mail.infomaniak.ch (smtp-42ad.mail.infomaniak.ch [84.16.66.173])
 by mx.groups.io with SMTP id smtpd.web11.67035.1727436870258369572
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Sep 2024 04:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.173, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4XFSzm385Hz7Z8;
	Fri, 27 Sep 2024 13:34:28 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4XFSzl5xFKzggT;
	Fri, 27 Sep 2024 13:34:27 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 27 Sep 2024 13:33:48 +0200
Subject: [PATCH] arm/trusted-firmware-a: add recipe for
 more-recent-but-not-yet-released source code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-tf-a-master-v1-1-733c925c80e4@cherry.de>
X-B4-Tracking: v=1; b=H4sIABuY9mYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDSyNz3ZI03UTd3MTiktQiXWNLQ1MTC6MkY3MDEyWgjoKi1LTMCrBp0bG
 1tQCBW1gfXQAAAA==
To: meta-arm@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.0
X-Infomaniak-Routing: alpha
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Sep 2024 11:34:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6129

From: Quentin Schulz <quentin.schulz@cherry.de>

The point of this recipe is to allow people to quickly test more recent
commits that aren't yet part of any release just yet.

One should really not use it in any product, but it's nice for CI and
development purposes.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
AUTOREV is specifically not used as having it in the recipe would
trigger a network access all the time, even when the recipe is not used.
We may want to add support for this in CI via local.conf modifications
thanks to kas yml files added by the GitLab CI setup, but this doesn't
need to be done in this commit.

Boot tested on RK3588 board on master (styhead) from sometime yesterday.
---
 .../trusted-firmware-a/trusted-firmware-a_git.bb   | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
new file mode 100644
index 00000000..91e0f86d
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
@@ -0,0 +1,22 @@
+require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+
+# TF-A master
+SRCREV_tfa = "bcce173da397f776fc0ec14e9dac03c13ddeb722"
+SRCBRANCH = "master"
+
+LIC_FILES_CHKSUM += "file://docs/license.rst;md5=83b7626b8c7a37263c6a58af8d19bee1"
+
+# in TF-A src, docs/getting_started/prerequisites.rst lists the expected version mbedtls
+# mbedtls-3.6.1
+SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls;branch=mbedtls-3.6"
+SRCREV_mbedtls = "71c569d44bf3a8bd53d874c81ee8ac644dd6e9e3"
+
+LIC_FILES_CHKSUM_MBEDTLS = "file://mbedtls/LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
+
+# continue to boot also without TPM
+SRC_URI += "\
+    file://0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.patch \
+"
+
+# Not a release recipe, try our hardest to not pull this in implicitly
+DEFAULT_PREFERENCE = "-1"

---
base-commit: 139e87e119489ad2d10d6389ca2ff913589df4c1
change-id: 20240927-tf-a-master-3915482b3704

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


