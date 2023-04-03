Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D3AC76188
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 15:43:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.74578.1680536600569830380
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Apr 2023 08:43:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1C331063;
	Mon,  3 Apr 2023 08:44:04 -0700 (PDT)
Received: from E123523.Arm.com (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74D1C3F6C4;
	Mon,  3 Apr 2023 08:43:19 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH 1/1] arm-bsp/optee: Update OP-TEE TA devkit to 3.20 for N1SDP
Date: Mon,  3 Apr 2023 16:43:06 +0100
Message-Id: <20230403154306.3422-2-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230403154306.3422-1-adam.johnston@arm.com>
References: <20230403154306.3422-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Apr 2023 15:43:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4535

From: Adam Johnston <adam.johnston@arm.com>

As optee-os for the N1SDP has been updated to 3.20 we need to do the
same for optee-os-tavdekit. Otherwise errors will be seen if/when
optee-os-tavdekit is built.

Signed-off-by: Adam Johnston <adam.johnston@arm.com>
---
 .../optee/optee-os-tadevkit_3.18.0.bbappend   |  1 -
 .../optee/optee-os-tadevkit_3.20.0.bbappend   |  6 +++++
 .../optee/optee-os-tadevkit_3.20.0.bb         | 24 +++++++++++++++++++
 3 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-tadevkit=
_3.20.0.bbappend
 create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_3.2=
0.0.bb

diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0=
.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.=
bbappend
index 9a210832..6a22d47e 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.bbappe=
nd
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.bbappe=
nd
@@ -2,6 +2,5 @@
=20
 MACHINE_OPTEE_OS_TADEVKIT_REQUIRE ?=3D ""
 MACHINE_OPTEE_OS_TADEVKIT_REQUIRE:tc =3D "optee-os-generic-tc.inc"
-MACHINE_OPTEE_OS_TADEVKIT_REQUIRE:n1sdp =3D "optee-os-n1sdp.inc"
=20
 require ${MACHINE_OPTEE_OS_TADEVKIT_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.20.0=
.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.20.0.=
bbappend
new file mode 100644
index 00000000..e09c4a5e
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.20.0.bbappe=
nd
@@ -0,0 +1,6 @@
+# Machine specific configurations
+
+MACHINE_OPTEE_OS_TADEVKIT_REQUIRE ?=3D ""
+MACHINE_OPTEE_OS_TADEVKIT_REQUIRE:n1sdp =3D "optee-os-n1sdp.inc"
+
+require ${MACHINE_OPTEE_OS_TADEVKIT_REQUIRE}
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.20.0.bb =
b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.20.0.bb
new file mode 100644
index 00000000..202caa54
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.20.0.bb
@@ -0,0 +1,24 @@
+require optee-os_3.20.0.bb
+
+SUMMARY =3D "OP-TEE Trusted OS TA devkit"
+DESCRIPTION =3D "OP-TEE TA devkit for build TAs"
+HOMEPAGE =3D "https://www.op-tee.org/"
+
+DEPENDS +=3D "python3-pycryptodome-native"
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
+
+# Build paths are currently embedded
+INSANE_SKIP:${PN}-dev +=3D "buildpaths"
--=20
2.38.1


