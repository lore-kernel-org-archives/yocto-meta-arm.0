Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C03C3ABCE
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 00:04:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9853.1726531446687654889
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 Sep 2024 17:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8873B11FB;
	Mon, 16 Sep 2024 17:04:35 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D86013F66E;
	Mon, 16 Sep 2024 17:04:05 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH v2 2/3] arm-bsp/linux-yocto: corstone1000: bump to v6.10
Date: Mon, 16 Sep 2024 20:04:03 -0400
Message-Id: <20240917000404.24807-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240917000404.24807-1-jon.mason@arm.com>
References: <20240917000404.24807-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Sep 2024 00:04:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6075

From: Bence Balogh <bence.balogh@arm.com>

This commit updates the linux-yocto version to the latest availabe one.
No additional work was needed to make it work in Corstone-1000.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/include/corstone1000.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index db1880e56a59..d65906362d54 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -34,7 +34,7 @@ IMAGE_CMD:wic[vardeps] +=3D "GRUB_LINUX_APPEND"
=20
 # Linux kernel
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?=3D "6.6.%"
+PREFERRED_VERSION_linux-yocto ?=3D "6.10.%"
 KERNEL_IMAGETYPE =3D "Image"
 KERNEL_IMAGETYPE:firmware =3D "Image.gz"
 # add FF-A support in the kernel
--=20
2.39.3 (Apple Git-146)


