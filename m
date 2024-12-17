Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06466E77184
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 15:06:19 +0000 (UTC)
Received: from smtp-bc0c.mail.infomaniak.ch (smtp-bc0c.mail.infomaniak.ch [45.157.188.12])
 by mx.groups.io with SMTP id smtpd.web10.83592.1734447976750177762
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 07:06:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.12, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YCKrk53JvzshM;
	Tue, 17 Dec 2024 16:06:14 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4YCKrk16kPz3tw;
	Tue, 17 Dec 2024 16:06:14 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 17 Dec 2024 16:05:59 +0100
Subject: [PATCH] arm/trusted-firmware-a: add support for 2.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-tf-a-2-12-v1-1-cca762965260@cherry.de>
X-B4-Tracking: v=1; b=H4sIAFaTYWcC/x3MQQqAIBBA0avIrBvQSSi6SrSQnKnZWGhEEN49a
 fng818onJULTOaFzLcWPVKD6wyse0gbo8ZmIEvekRvwEgxI6AiJR2t98CKxh9afmUWf/zUvtX4
 FxWFfWwAAAA==
X-Change-ID: 20241217-tf-a-2-12-2e8004a4ffd3
To: meta-arm@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Trevor Woerner <twoerner@gmail.com>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Dec 2024 15:06:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6296

From: Quentin Schulz <quentin.schulz@cherry.de>

Add support for TF-A version v2.12.0 and mbedtls 3.6.1.

GCC-compiled boot tested on RK3588 Tiger, RK3399 Puma and PX30 Ringneck.

0001-fix-zynqmp-handle-secure-SGI-at-EL1-for-OP-TEE.patch is merged in
2.12.0 so no need to have it in SRC_URI as for 2.11.0 and earlier
recipes.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
This is interesting for meta-rockchip since it now has support for
RK3588 and initial/incomplete support for RK356x (see
https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/31265 for
missing patch). I do not own RK356x devices so cannot test their
support.

Cc Trevor as maintainer of meta-rockchip as he could have interest
making upstream TF-A the default for RK3588(s) instead of using
Rockchip's blob.

Cc: Trevor Woerner <twoerner@gmail.com>

Tested on master branch of poky, meta-arm, meta-openembedded and
meta-rockchip.
---
 .../trusted-firmware-a/trusted-firmware-a_2.12.0.bb   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.12.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.12.0.bb
new file mode 100644
index 0000000000000000000000000000000000000000..ceaac263fc7504a6c876eb7c217027936a2889f9
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.12.0.bb
@@ -0,0 +1,19 @@
+require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+
+# TF-A v2.12.0
+SRCREV_tfa = "4ec2948fe3f65dba2f19e691e702f7de2949179c"
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

---
base-commit: b2c43dbf9b4e7c22038bdd5d01633962afe8f18f
change-id: 20241217-tf-a-2-12-2e8004a4ffd3

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


