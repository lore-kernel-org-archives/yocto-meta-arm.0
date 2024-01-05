Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE2DC3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 16:24:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.27490.1704471875437376392
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Jan 2024 08:24:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CE23FEC;
	Fri,  5 Jan 2024 08:25:21 -0800 (PST)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 527CF3F64C;
	Fri,  5 Jan 2024 08:24:34 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 1/1] arm-bsp/linux-yocto: corstone1000: bump to v6.6%
Date: Fri,  5 Jan 2024 16:24:26 +0000
Message-Id: <20240105162426.811390-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240105162426.811390-1-emekcan.aras@arm.com>
References: <20240105162426.811390-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 05 Jan 2024 16:24:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5313

From: Emekcan Aras <emekcan.aras@arm.com>

Upgrade the kernel to v6.6%

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 meta-arm-bsp/conf/machine/include/corstone1000.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 063a315b..381eaaf3 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -52,7 +52,7 @@ EXTRA_IMAGEDEPENDS +=3D "external-system"
=20
 # Linux kernel
 PREFERRED_PROVIDER_virtual/kernel:forcevariable =3D "linux-yocto"
-PREFERRED_VERSION_linux-yocto =3D "6.5%"
+PREFERRED_VERSION_linux-yocto =3D "6.6.%"
 KERNEL_IMAGETYPE =3D "Image.gz"
=20
 INITRAMFS_IMAGE_BUNDLE ?=3D "1"
--=20
2.25.1


