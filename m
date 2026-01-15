Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCFC4D46624
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 21:01:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.659.1768510891263155358
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Jan 2026 13:01:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB2BA1515
	for <meta-arm@lists.yoctoproject.org>; Thu, 15 Jan 2026 13:01:23 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1F6883F59E
	for <meta-arm@lists.yoctoproject.org>; Thu, 15 Jan 2026 13:01:30 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] Revert "CI: work around xen failures until fixed upstream"
Date: Thu, 15 Jan 2026 21:01:25 +0000
Message-ID: <20260115210126.3358750-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 15 Jan 2026 21:01:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6851

The kernel upgrades are now in oe-core, so we can drop this workaround.

This reverts commit 341a0fd9762012622699aa1431b96a50a65bf16c.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/ci/base.yml b/ci/base.yml
index 8e72310fb3..87192fba26 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -43,10 +43,6 @@ local_conf_header:
   extrapackages: |
     CORE_IMAGE_EXTRA_INSTALL +=3D "perf"
     CORE_IMAGE_EXTRA_INSTALL:append:aarch64 =3D " gator-daemon"
-  fix-xen: |
-    # Temporary workaround until linux-yocto 6.18.3 is merged
-    SRCREV_meta:pn-linux-yocto:qemuarm =3D "83fff3acfc84814b4da0cdb2a63d=
608d376c3cdd"
-    SRCREV_meta:pn-linux-yocto:qemuarm64 =3D "83fff3acfc84814b4da0cdb2a6=
3d608d376c3cdd"
=20
 machine: unset
=20
--=20
2.43.0


