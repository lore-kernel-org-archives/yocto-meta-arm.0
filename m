Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF46BCE9D4C
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 15:21:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92159.1767712860937540120
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Jan 2026 07:21:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A4E0497
	for <meta-arm@lists.yoctoproject.org>; Tue,  6 Jan 2026 07:20:53 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CCF4D3F5A1
	for <meta-arm@lists.yoctoproject.org>; Tue,  6 Jan 2026 07:20:59 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][whinlatter] CI: use whinlatter branches
Date: Tue,  6 Jan 2026 15:20:46 +0000
Message-ID: <20260106152046.578426-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 06 Jan 2026 15:21:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6813

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/ci/base.yml b/ci/base.yml
index 87192fba26..41300c5a0f 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -7,11 +7,12 @@ distro: poky
=20
 defaults:
   repos:
-    branch: master
+    branch: whinlatter
=20
 repos:
   bitbake:
     url: https://git.openembedded.org/bitbake
+    branch: "2.14"
     layers:
       bitbake: disabled
=20
--=20
2.43.0


