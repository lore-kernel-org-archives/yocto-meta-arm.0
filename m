Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00485C47DDF
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 16:43:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2834.1706287427904363055
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Jan 2024 08:43:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 008A2FEC
	for <meta-arm@lists.yoctoproject.org>; Fri, 26 Jan 2024 08:44:32 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 33CA53F762
	for <meta-arm@lists.yoctoproject.org>; Fri, 26 Jan 2024 08:43:47 -0800 (PST)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] CI/cve.yml: add a CVE-checking Kas fragment
Date: Fri, 26 Jan 2024 16:43:41 +0000
Message-Id: <20240126164341.2846181-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240126164341.2846181-1-ross.burton@arm.com>
References: <20240126164341.2846181-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 26 Jan 2024 16:43:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5365

From: Ross Burton <ross.burton@arm.com>

Add a Kas fragment to enable the CVE checker.  Disable warnings by
default but show them for the layers in meta-arm, because we only care
about meta-arm issues in this CI.

Explicitly hide kernel warnings as the kernel typically has tens of open
CVEs, and if we're carrying a kernel explicitly then it's typically an
interim kernel between releases.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/cve.yml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 ci/cve.yml

diff --git a/ci/cve.yml b/ci/cve.yml
new file mode 100644
index 00000000..381f8557
--- /dev/null
+++ b/ci/cve.yml
@@ -0,0 +1,16 @@
+header:
+  version: 14
+
+local_conf_header:
+  cve: |
+    INHERIT +=3D "cve-check"
+
+    # Just show the warnings for our layers
+    CVE_CHECK_SHOW_WARNINGS =3D "0"
+    CVE_CHECK_SHOW_WARNINGS:layer-arm-toolchain =3D "1"
+    CVE_CHECK_SHOW_WARNINGS:layer-meta-arm =3D "1"
+    CVE_CHECK_SHOW_WARNINGS:layer-meta-arm-bsp =3D "1"
+    CVE_CHECK_SHOW_WARNINGS:layer-meta-arm-systemready =3D "1"
+
+    # Ignore the kernel, we sometime carry kernels in meta-arm
+    CVE_CHECK_SHOW_WARNINGS:pn-linux-yocto =3D "0"
--=20
2.34.1


