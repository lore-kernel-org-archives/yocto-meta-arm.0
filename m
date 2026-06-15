Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569E8CD98DE
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 13:17:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.129206.1781529443098971213
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Jun 2026 06:17:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=RZRNtm2T;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C68D416F3
	for <meta-arm@lists.yoctoproject.org>; Mon, 15 Jun 2026 06:17:17 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 606A03F915
	for <meta-arm@lists.yoctoproject.org>; Mon, 15 Jun 2026 06:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781529442; bh=VD0e6rg/4SurIokOOCYxZUjyjaXL5n91HfXnab4tM9w=;
	h=From:To:Subject:Date:From;
	b=RZRNtm2T8iL/WppkXCxWI24L8aAk6EnE9rR64b/r4UVsSZzZcuEr/BJ+QkQaT7144
	 IJ4JadzTPY7JkTsmUqc03fPul+HLXMp1csfTx+S/Ycz7c4ntYwY+P/6Krl4J51vEkO
	 qGk4YOtKbXvJyDraaHicsAlW2yDYcJffsJOkEr7Y=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] CI: use Musca S1 for LTS testing
Date: Mon, 15 Jun 2026 09:17:19 -0400
Message-ID: <20260615131721.55897-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Jun 2026 13:17:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7078

In TF-M 2.3.0, Musca S1 was removed, but B1 is still present.  In an
effort to keep coverage, swapping S1 and B1.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/musca-b1.yml | 5 -----
 ci/musca-s1.yml | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/ci/musca-b1.yml b/ci/musca-b1.yml
index c2c3a986dc97..1437b8ab3764 100644
--- a/ci/musca-b1.yml
+++ b/ci/musca-b1.yml
@@ -6,11 +6,6 @@ header:
     - ci/base.yml
     - ci/meta-openembedded.yml
=20
-local_conf_header:
-  version_for_ci: |
-    # For better CI coverage, use the LTS version of tf-m
-    PREFERRED_VERSION_trusted-firmware-m ?=3D "2.1.%"
-
 machine: musca-b1
=20
 target:
diff --git a/ci/musca-s1.yml b/ci/musca-s1.yml
index a7fa680c4263..57aaa9429769 100644
--- a/ci/musca-s1.yml
+++ b/ci/musca-s1.yml
@@ -6,6 +6,11 @@ header:
     - ci/base.yml
     - ci/meta-openembedded.yml
=20
+local_conf_header:
+  version_for_ci: |
+    # For better CI coverage, use the LTS version of tf-m
+    PREFERRED_VERSION_trusted-firmware-m ?=3D "2.1.%"
+
 machine: musca-s1
=20
 target:
--=20
2.50.1 (Apple Git-155)


