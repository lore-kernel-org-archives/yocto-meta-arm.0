Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DFE109B464
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 13:07:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19909.1774962424113745934
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 31 Mar 2026 06:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=gauYx/4b;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D96B3603
	for <meta-arm@lists.yoctoproject.org>; Tue, 31 Mar 2026 06:06:57 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5E8943F7D8
	for <meta-arm@lists.yoctoproject.org>; Tue, 31 Mar 2026 06:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774962423; bh=MMU0tI89XwDuHxfR2XA/BtV/kpzwRyFCjTU6jnFCZIA=;
	h=From:To:Subject:Date:From;
	b=gauYx/4bUOu7cVq+NWQCdMmcFcnKQbDePKR6K2mxGCOfnxWGD7qJRwQ/5hR7hx4pj
	 F2oNuEetI2QQMlqcfGV4vKmKztHh92o9XomLvgyapDkyB7x+LzudQuxGsQwQtTyApC
	 QpQHT9eXQQOquqRgaY05Q7bXMSX7afRx+yBfzgYU=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/6] CI: use core-image-base for faster boot
Date: Tue, 31 Mar 2026 09:06:57 -0400
Message-ID: <20260331130702.56223-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 31 Mar 2026 13:07:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6989

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/fvp.yml    | 2 +-
 ci/sgi575.yml | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/ci/fvp.yml b/ci/fvp.yml
index 62ff0d29c905..0dc1e2602ab1 100644
--- a/ci/fvp.yml
+++ b/ci/fvp.yml
@@ -12,4 +12,4 @@ local_conf_header:
     TEST_SUITES:remove =3D "opkg dnf"
=20
 target:
-  - core-image-full-cmdline
+  - core-image-base
diff --git a/ci/sgi575.yml b/ci/sgi575.yml
index a2555a84b8b7..d6e33894e890 100644
--- a/ci/sgi575.yml
+++ b/ci/sgi575.yml
@@ -12,6 +12,3 @@ local_conf_header:
     COMPATIBLE_MACHINE:pn-ssh-pregen-hostkeys:sgi575 =3D "sgi575"
=20
 machine: sgi575
-
-target:
-  - core-image-base
--=20
2.50.1 (Apple Git-155)


