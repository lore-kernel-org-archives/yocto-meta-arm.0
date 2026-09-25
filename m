Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1DF3C9830E
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 13:02:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7650.1790341344726176122
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 25 Sep 2026 06:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=F5ajX+Vx;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 738E9169C
	for <meta-arm@lists.yoctoproject.org>; Fri, 25 Sep 2026 06:02:20 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9995F3F86C
	for <meta-arm@lists.yoctoproject.org>; Fri, 25 Sep 2026 06:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790341343; bh=WNsY/ygE+dIMfkMJUXM2cGBfU8Mejcl4wSX/YTQPe/I=;
	h=From:To:Subject:Date:From;
	b=F5ajX+VxGMNRQxAz/OA8+LdCMnrNXTRvmcjoxm6nHDNX8tIUKPuFlm5i/9ponsk7x
	 aYk/uWhcLmyCCrmX2L/ONi0V+kKhZ28ovnnu/lXOMxq+wJn8drtHghgOsJCoMP0QDq
	 mtpoKtdx0QNPNt7p0URgzs11d9iZQZUPqo03zAGQ=
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: use blacksail branches
Date: Fri, 25 Sep 2026 14:02:22 +0100
Message-ID: <20260925130222.1871104-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 25 Sep 2026 13:02:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7175

OpenEmbedded Core is preparing to release and master has diverged. Until
we have also diverged, stick to the stable branches for oe-core and
bitbake.

meta-oe and meta-secure-core have not yet diverged, so they need to stay
on master for now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml              | 3 ++-
 ci/meta-openembedded.yml | 1 +
 ci/meta-secure-core.yml  | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/ci/base.yml b/ci/base.yml
index 75e87a841cd..6bff09a88c9 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -7,11 +7,12 @@ distro: poky
=20
 defaults:
   repos:
-    branch: master
+    branch: blacksail
=20
 repos:
   bitbake:
     url: https://git.openembedded.org/bitbake
+    branch: "2.20"
     layers:
       bitbake: disabled
=20
diff --git a/ci/meta-openembedded.yml b/ci/meta-openembedded.yml
index 499216bfaa3..3a8e507d4a7 100644
--- a/ci/meta-openembedded.yml
+++ b/ci/meta-openembedded.yml
@@ -6,6 +6,7 @@ header:
 repos:
   meta-openembedded:
     url: https://git.openembedded.org/meta-openembedded
+    branch: master
     layers:
       meta-filesystems:
       meta-networking:
diff --git a/ci/meta-secure-core.yml b/ci/meta-secure-core.yml
index b34562b267c..81280e73757 100644
--- a/ci/meta-secure-core.yml
+++ b/ci/meta-secure-core.yml
@@ -6,6 +6,7 @@ header:
 repos:
   meta-secure-core:
     url: https://github.com/Wind-River/meta-secure-core.git
+    branch: master
     layers:
       meta-secure-core-common:
       meta-signing-key:
--=20
2.43.0


