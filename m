Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB76C48285
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 18:14:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2134.1706552044685866230
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Jan 2024 10:14:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BC91139F
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Jan 2024 10:14:48 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 004FC3F738
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Jan 2024 10:14:03 -0800 (PST)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] CI: allow the runner to set a NVD API key
Date: Mon, 29 Jan 2024 18:14:01 +0000
Message-Id: <20240129181401.2170364-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129181401.2170364-1-ross.burton@arm.com>
References: <20240129181401.2170364-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Jan 2024 18:14:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5370

From: Ross Burton <ross.burton@arm.com>

Setting an API key means we get higher rate limits. Because keys are
private, the key must be set in the environment of the runner.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 2 ++
 ci/cve.yml     | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4e4c1283..e1b8dd24 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -19,6 +19,8 @@ variables:
   ACS_TEST: 0
   # The list of extra Kas fragments to be used when building
   EXTRA_KAS_FILES: ""
+  # The NVD API key to use when fetching CVEs
+  NVDCVE_API_KEY: ""
=20
 stages:
   - prep
diff --git a/ci/cve.yml b/ci/cve.yml
index 381f8557..e2aca0e1 100644
--- a/ci/cve.yml
+++ b/ci/cve.yml
@@ -5,6 +5,9 @@ local_conf_header:
   cve: |
     INHERIT +=3D "cve-check"
=20
+    # Allow the runner environment to provide an API key
+    NVDCVE_API_KEY =3D "${@d.getVar('BB_ORIGENV').getVar('NVDCVE_API_KEY=
') or ''}"
+
     # Just show the warnings for our layers
     CVE_CHECK_SHOW_WARNINGS =3D "0"
     CVE_CHECK_SHOW_WARNINGS:layer-arm-toolchain =3D "1"
--=20
2.34.1


