Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52991C636CC
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 16:11:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.13836.1676563897465276993
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 08:11:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D450B113E;
	Thu, 16 Feb 2023 08:12:19 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ADCD23F881;
	Thu, 16 Feb 2023 08:11:36 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] CI/machine-summary: add missing recipes
Date: Thu, 16 Feb 2023 16:11:33 +0000
Message-Id: <20230216161133.3488226-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216161133.3488226-1-ross.burton@arm.com>
References: <20230216161133.3488226-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Feb 2023 16:11:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4409

Add missing recipes to the update report.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/machine-summary.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/machine-summary.py b/scripts/machine-summary.py
index 8bd0fa78..0f5d1d99 100755
--- a/scripts/machine-summary.py
+++ b/scripts/machine-summary.py
@@ -145,6 +145,10 @@ recipes =3D ("virtual/kernel",
            "edk2-firmware",
            "u-boot",
            "optee-os",
+           "hafnium",
+           "boot-wrapper-aarch64",
+           "gator-daemon",
+           "opencsd",
            "gcc-aarch64-none-elf-native",
            "gcc-arm-none-eabi-native")
=20
--=20
2.34.1


