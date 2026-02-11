Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB5EECD6C0
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 15:58:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22412.1770825490745088887
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 07:58:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C063339
	for <meta-arm@lists.yoctoproject.org>; Wed, 11 Feb 2026 07:58:03 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B3C003F632
	for <meta-arm@lists.yoctoproject.org>; Wed, 11 Feb 2026 07:58:09 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] CI/fvp: made the default target core-image-full-cmdline
Date: Wed, 11 Feb 2026 10:58:07 -0500
Message-ID: <20260211155809.6450-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 11 Feb 2026 15:58:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6902

No need to have the full graphics stack for FVP images.  Slim the image
down by default.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/fvp.yml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ci/fvp.yml b/ci/fvp.yml
index 30b09e40dc58..62ff0d29c905 100644
--- a/ci/fvp.yml
+++ b/ci/fvp.yml
@@ -10,3 +10,6 @@ local_conf_header:
   networking_failing_tests: |
     # These tests currently fail as the wrong IP for the build host is u=
sed
     TEST_SUITES:remove =3D "opkg dnf"
+
+target:
+  - core-image-full-cmdline
--=20
2.50.1 (Apple Git-155)


