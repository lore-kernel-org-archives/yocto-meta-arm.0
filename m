Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF09C4345F
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 21:14:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.31772.1712870062793757352
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Apr 2024 14:14:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 895D0113E;
	Thu, 11 Apr 2024 14:14:51 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF27A3F766;
	Thu, 11 Apr 2024 14:14:21 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] arm-bsp/sgi575: upgrade trusted-firmware-a to 2.10
Date: Thu, 11 Apr 2024 21:14:15 +0000
Message-Id: <20240411211416.2806039-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 21:14:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5533

Remove the preferred version so that we track the latest release.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/sgi575.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/ma=
chine/sgi575.conf
index 7f2a285a..3c2c94b6 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -9,7 +9,6 @@ require conf/machine/include/arm/armv8-2a/tune-cortexa75.=
inc
 EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmware"
=20
 EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.9.%"
=20
 KERNEL_IMAGETYPE ?=3D "Image"
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
--=20
2.34.1


