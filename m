Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C8FC27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 12:55:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.46957.1718888142775218723
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Jun 2024 05:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF5BCDA7
	for <meta-arm@lists.yoctoproject.org>; Thu, 20 Jun 2024 05:56:06 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 186BE3F73B
	for <meta-arm@lists.yoctoproject.org>; Thu, 20 Jun 2024 05:55:42 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/qemuarm64-secureboot: fix qemu parameter
Date: Thu, 20 Jun 2024 08:55:41 -0400
Message-Id: <20240620125541.70574-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Jun 2024 12:55:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5838

QEMU has deprecated the no-acpi parameter, in favor of "acpi=3Doff" machi=
ne
setting.  Modify the machine conf to use the new method.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/conf/machine/qemuarm64-secureboot.conf | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/c=
onf/machine/qemuarm64-secureboot.conf
index 55c4cab457f3..78a39c03c1bd 100644
--- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -7,8 +7,7 @@ KMACHINE =3D "qemuarm64"
 # secure=3Don can't ever use KVM, so force it off
 QEMU_USE_KVM =3D ""
=20
-QB_MACHINE =3D "-machine virt,secure=3Don"
-QB_OPT_APPEND +=3D "-no-acpi"
+QB_MACHINE =3D "-machine virt,secure=3Don,acpi=3Doff"
 QB_MEM =3D "-m 1024"
 QB_DEFAULT_FSTYPE =3D "wic.qcow2"
 QB_DEFAULT_BIOS =3D "flash.bin"
--=20
2.39.3 (Apple Git-146)


