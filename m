Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C45ABEA4FC1
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 13:52:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35399.1771854744242007753
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 05:52:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 755F5150C
	for <meta-arm@lists.yoctoproject.org>; Mon, 23 Feb 2026 05:52:17 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 89DB73F59E
	for <meta-arm@lists.yoctoproject.org>; Mon, 23 Feb 2026 05:52:23 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] CI/musca-b1: use LTS tf-m
Date: Mon, 23 Feb 2026 08:52:21 -0500
Message-ID: <20260223135221.4381-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260223135221.4381-1-jon.mason@arm.com>
References: <20260223135221.4381-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 23 Feb 2026 13:52:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6915

We currently don't have coverage for trusted-firmware-m 2.1.x, which is
the LTS.  Since musca-b1 and musca-s1 are essentially the same, use b1
for the LTS coverage.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/musca-b1.yml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/ci/musca-b1.yml b/ci/musca-b1.yml
index 1437b8ab3764..c2c3a986dc97 100644
--- a/ci/musca-b1.yml
+++ b/ci/musca-b1.yml
@@ -6,6 +6,11 @@ header:
     - ci/base.yml
     - ci/meta-openembedded.yml
=20
+local_conf_header:
+  version_for_ci: |
+    # For better CI coverage, use the LTS version of tf-m
+    PREFERRED_VERSION_trusted-firmware-m ?=3D "2.1.%"
+
 machine: musca-b1
=20
 target:
--=20
2.50.1 (Apple Git-155)


