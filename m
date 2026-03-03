Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B0A7EC143D
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 13:31:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18250.1772544659944892163
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 05:31:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8EFA497
	for <meta-arm@lists.yoctoproject.org>; Tue,  3 Mar 2026 05:30:52 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BF88F3F73B
	for <meta-arm@lists.yoctoproject.org>; Tue,  3 Mar 2026 05:30:58 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/python3-pydevicetree: don't install non-namespaced tests
Date: Tue,  3 Mar 2026 13:30:54 +0000
Message-ID: <20260303133054.3311741-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 03 Mar 2026 13:31:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6933

The wheel includes the tests which are in a non-namespaced module, and
will then conflict with other recipes (such as python3-cryptography) that
also install non-namespaced tests.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-pydevicetree_0.0.13.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-arm/recipes-devtools/python/python3-pydevicetree_0.0.13=
.bb b/meta-arm/recipes-devtools/python/python3-pydevicetree_0.0.13.bb
index 7a1ba71730..aeaf5f4fcb 100644
--- a/meta-arm/recipes-devtools/python/python3-pydevicetree_0.0.13.bb
+++ b/meta-arm/recipes-devtools/python/python3-pydevicetree_0.0.13.bb
@@ -7,4 +7,11 @@ inherit pypi setuptools3
=20
 SRC_URI[sha256sum] =3D "5700c05df89bad8fd729c11aa6f764a3323bcb3796f13b32=
481ae34445cfc1b7"
=20
+do_install:append() {
+    # This package installs test cases into an un-namespaced "tests" dir=
ectory,
+    # remove it so it doesn't conflict with other recipes that do the sa=
me.
+    # https://github.com/sifive/pydevicetree/issues/57
+    rm -rf ${D}/${PYTHON_SITEPACKAGES_DIR}/tests
+}
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


