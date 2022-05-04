Return-Path: <arunachalam.ganapathy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E85C4332F
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 16:58:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.598.1651683510483219099
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 May 2022 09:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: arunachalam.ganapathy@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 779FE1042;
	Wed,  4 May 2022 09:58:29 -0700 (PDT)
Received: from ts710.cambridge.arm.com (ts710.cambridge.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D953C3FA27;
	Wed,  4 May 2022 09:58:28 -0700 (PDT)
From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 01/10] arm/optee: Add optee 3.14 recipes
Date: Wed,  4 May 2022 17:58:11 +0100
Message-Id: <20220504165820.882784-1-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 May 2022 16:58:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3357

Add back v3.14 optee-examples, optee-test, and optee-os-tadevkit for
TC platform compatibility. These files were removed as part of v3.16
upgrade.

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: Ia12774125909e7f8bfc20a9797c25b04dd850ae7
---
 .../optee/optee-examples_3.14.0.bb            |  4 ++++
 .../optee/optee-os-tadevkit_3.14.0.bb         | 20 +++++++++++++++++++
 .../optee/optee-test_3.14.0.bb                |  3 +++
 3 files changed, 27 insertions(+)
 create mode 100644 meta-arm/recipes-security/optee/optee-examples_3.14.0=
.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_3.1=
4.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-test_3.14.0.bb

diff --git a/meta-arm/recipes-security/optee/optee-examples_3.14.0.bb b/m=
eta-arm/recipes-security/optee/optee-examples_3.14.0.bb
new file mode 100644
index 00000000..f2b5f7dd
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-examples_3.14.0.bb
@@ -0,0 +1,4 @@
+require optee-examples.inc
+
+SRCREV =3D "e9c870525af8f7e7fccf575a0ca5394ce55adcec"
+
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb =
b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
new file mode 100644
index 00000000..0d37a528
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
@@ -0,0 +1,20 @@
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/optee-os:"
+require optee-os_3.14.0.bb
+
+SUMMARY =3D "OP-TEE Trusted OS TA devkit"
+DESCRIPTION =3D "OP-TEE TA devkit for build TAs"
+HOMEPAGE =3D "https://www.op-tee.org/"
+
+do_install() {
+    #install TA devkit
+    install -d ${D}${includedir}/optee/export-user_ta/
+    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
+        cp -aR $f ${D}${includedir}/optee/export-user_ta/
+    done
+}
+
+do_deploy() {
+	echo "Do not inherit do_deploy from optee-os."
+}
+
+FILES:${PN} =3D "${includedir}/optee/"
diff --git a/meta-arm/recipes-security/optee/optee-test_3.14.0.bb b/meta-=
arm/recipes-security/optee/optee-test_3.14.0.bb
new file mode 100644
index 00000000..6367c276
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test_3.14.0.bb
@@ -0,0 +1,3 @@
+require optee-test.inc
+
+SRCREV =3D "f2eb88affbb7f028561b4fd5cbd049d5d704f741"
--=20
2.30.2


