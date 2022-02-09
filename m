Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E02CC433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 17:46:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.30020.1644428789516332770
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Feb 2022 09:46:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A652113E
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Feb 2022 09:46:29 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE47D3F70D
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Feb 2022 09:46:28 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/5] arm-bsp/sgi575: use the default linux-yocto version
Date: Wed,  9 Feb 2022 17:46:21 +0000
Message-Id: <20220209174624.3824874-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209174624.3824874-1-ross.burton@arm.com>
References: <20220209174624.3824874-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 09 Feb 2022 17:46:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2970

Instead of pinning the kernel to 5.7, use the latest default version.
There are no patches, so this shouldn't be a problem.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/sgi575.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/ma=
chine/sgi575.conf
index a384caa5..3c2c94b6 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -12,7 +12,6 @@ EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
=20
 KERNEL_IMAGETYPE ?=3D "Image"
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?=3D "5.7%"
 SERIAL_CONSOLES =3D "115200;ttyAMA0"
=20
 #grub-efi
--=20
2.25.1


