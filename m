Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5558C2BD09
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 14:55:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9826.1720796095240925749
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Jul 2024 07:54:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D559B1007
	for <meta-arm@lists.yoctoproject.org>; Fri, 12 Jul 2024 07:55:19 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5E1603F762
	for <meta-arm@lists.yoctoproject.org>; Fri, 12 Jul 2024 07:54:54 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] CI: remove xorg test removal from edk2
Date: Fri, 12 Jul 2024 10:54:52 -0400
Message-Id: <20240712145453.13569-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 12 Jul 2024 14:55:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5886

The edk file removed xorg from being tested, which is currently working
on qemuarm and qemuarm64.  Also, the section name collies with one in
fvp.yml, which has other things that are removed.  Remove this removal
to get things working as expected.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/edk2.yml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/ci/edk2.yml b/ci/edk2.yml
index d32e3645cd9e..cf2f5851b85d 100644
--- a/ci/edk2.yml
+++ b/ci/edk2.yml
@@ -15,5 +15,3 @@ local_conf_header:
=20
     QB_DEFAULT_BIOS =3D "QEMU_EFI.fd"
     WKS_FILE ?=3D "efi-disk.wks.in"
-  failing_tests: |
-    TEST_SUITES:remove =3D "xorg"
--=20
2.39.3 (Apple Git-146)


