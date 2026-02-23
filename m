Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C45DFEA4FC2
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 13:52:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35383.1771854743439046177
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 05:52:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 942FD339
	for <meta-arm@lists.yoctoproject.org>; Mon, 23 Feb 2026 05:52:16 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A85113F59E
	for <meta-arm@lists.yoctoproject.org>; Mon, 23 Feb 2026 05:52:22 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm-bsp/sgi575: change target image for CI
Date: Mon, 23 Feb 2026 08:52:19 -0500
Message-ID: <20260223135221.4381-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 23 Feb 2026 13:52:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6913

For some reason, sgi575 won't boot to shell with
core-image-full-cmdline, but it will with other images.  Since we're
going to drop this machine soon (as it has been EOL'ed), modify the
image type for CI to core-image-base (As that one appears to boot
faster).

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/sgi575.yml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ci/sgi575.yml b/ci/sgi575.yml
index d6e33894e890..a2555a84b8b7 100644
--- a/ci/sgi575.yml
+++ b/ci/sgi575.yml
@@ -12,3 +12,6 @@ local_conf_header:
     COMPATIBLE_MACHINE:pn-ssh-pregen-hostkeys:sgi575 =3D "sgi575"
=20
 machine: sgi575
+
+target:
+  - core-image-base
--=20
2.50.1 (Apple Git-155)


