Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0ED5CF45C1
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 18:32:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40283.1768242767839941255
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 Jan 2026 10:32:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C2EC497
	for <meta-arm@lists.yoctoproject.org>; Mon, 12 Jan 2026 10:32:40 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E09273F59E
	for <meta-arm@lists.yoctoproject.org>; Mon, 12 Jan 2026 10:32:46 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: work around xen failures until fixed upstream
Date: Mon, 12 Jan 2026 18:32:42 +0000
Message-ID: <20260112183243.3270090-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 12 Jan 2026 18:32:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6837

In master, xen images fail to build as the xt-masquerade module is not
built by the kernel. This has been fixed in the linux-yocto 6.18.3
upgrade but that is not yet merged.

Until it is merged, we can temporarily update the kmeta in our CI.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ci/base.yml b/ci/base.yml
index 87192fba26..8e72310fb3 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -43,6 +43,10 @@ local_conf_header:
   extrapackages: |
     CORE_IMAGE_EXTRA_INSTALL +=3D "perf"
     CORE_IMAGE_EXTRA_INSTALL:append:aarch64 =3D " gator-daemon"
+  fix-xen: |
+    # Temporary workaround until linux-yocto 6.18.3 is merged
+    SRCREV_meta:pn-linux-yocto:qemuarm =3D "83fff3acfc84814b4da0cdb2a63d=
608d376c3cdd"
+    SRCREV_meta:pn-linux-yocto:qemuarm64 =3D "83fff3acfc84814b4da0cdb2a6=
3d608d376c3cdd"
=20
 machine: unset
=20
--=20
2.43.0


