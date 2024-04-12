Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C7BCC4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 13:57:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.47642.1712930235940152967
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Apr 2024 06:57:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3805339;
	Fri, 12 Apr 2024 06:57:44 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12AE93F766;
	Fri, 12 Apr 2024 06:57:14 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp/linux-yocto-dev: add bbappend to enable this kernel for our BSPs
Date: Fri, 12 Apr 2024 13:57:10 +0000
Message-Id: <20240412135710.229421-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 12 Apr 2024 13:57:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5539

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-kernel/linux/linux-yocto-dev.bbappend | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-dev.bba=
ppend

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-dev.bbappend b=
/meta-arm-bsp/recipes-kernel/linux/linux-yocto-dev.bbappend
new file mode 100644
index 00000000..db850eab
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-dev.bbappend
@@ -0,0 +1,3 @@
+# Add support for Arm Platforms (boards or simulators)
+
+require linux-arm-platforms.inc
--=20
2.34.1


