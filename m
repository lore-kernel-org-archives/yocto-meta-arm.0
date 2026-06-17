Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F9ECD98F0
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 12:43:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14665.1781700221411505930
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Jun 2026 05:43:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=pNoGrya7;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F23274794
	for <meta-arm@lists.yoctoproject.org>; Wed, 17 Jun 2026 05:43:35 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 478E43F905
	for <meta-arm@lists.yoctoproject.org>; Wed, 17 Jun 2026 05:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781700220; bh=JqedAcuI270Rh9wsVhso+HeasH1vRRJtyAHRGka1AVg=;
	h=From:To:Subject:Date:From;
	b=pNoGrya7hs86LbPcwB7eh4sA9zGZXkCIQGdzKkof5sTGd01eko069yJiMsx2q2OS4
	 E7M0OP09xQQ9hTwMitGUrfvR1NOdObptSQyYEfzrRa5H89PDQn0W3vcOyiGmdHxqtb
	 bKSOUNymUACwOhj7jBYsWY09udfn5JcyEppcpGfk=
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/4] CI: remove cve.yml and NVDCVE_API_KEY
Date: Wed, 17 Jun 2026 13:43:30 +0100
Message-ID: <20260617124333.437665-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 Jun 2026 12:43:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7082

This yml fragment wasn't actually used by our CI, and the cve-check class
no longer exists.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml |  2 --
 ci/cve.yml     | 20 --------------------
 2 files changed, 22 deletions(-)
 delete mode 100644 ci/cve.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index c5bb96c997..577935366e 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -15,8 +15,6 @@ variables:
   MIRROR_GHCR: ghcr.io
   # The list of extra Kas fragments to be used when building
   EXTRA_KAS_FILES: ""
-  # The NVD API key to use when fetching CVEs
-  NVDCVE_API_KEY: ""
=20
 stages:
   - prep
diff --git a/ci/cve.yml b/ci/cve.yml
deleted file mode 100644
index 5ac2e41241..0000000000
--- a/ci/cve.yml
+++ /dev/null
@@ -1,20 +0,0 @@
-# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
-
-header:
-  version: 14
-
-local_conf_header:
-  cve: |
-    INHERIT +=3D "cve-check"
-
-    # Allow the runner environment to provide an API key
-    NVDCVE_API_KEY =3D "${@d.getVar('BB_ORIGENV').getVar('NVDCVE_API_KEY=
') or ''}"
-
-    # Just show the warnings for our layers
-    CVE_CHECK_SHOW_WARNINGS =3D "0"
-    CVE_CHECK_SHOW_WARNINGS:layer-arm-toolchain =3D "1"
-    CVE_CHECK_SHOW_WARNINGS:layer-meta-arm =3D "1"
-    CVE_CHECK_SHOW_WARNINGS:layer-meta-arm-bsp =3D "1"
-
-    # Ignore the kernel, we sometime carry kernels in meta-arm
-    CVE_CHECK_SHOW_WARNINGS:pn-linux-yocto =3D "0"
--=20
2.43.0


