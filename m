Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A83CC3ABAC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 14:13:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.28.1745936001627839923
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 29 Apr 2025 07:13:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AD811515;
	Tue, 29 Apr 2025 07:13:14 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EA5723F66E;
	Tue, 29 Apr 2025 07:13:20 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH scarthgap 1/2] arm/execstack-native: add new recipe
Date: Tue, 29 Apr 2025 10:13:19 -0400
Message-Id: <20250429141320.2609-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 29 Apr 2025 14:13:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6482

From: Ross Burton <ross.burton@arm.com>

Add a recipe for the execstack binary from prelink-cross. This tool is
used to manipulate the GNU_STACK segment in ELF binaries, specifically
to control whether the binary requests an executable stack or not.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-devtools/fvp/execstack-native.bb  | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-arm/recipes-devtools/fvp/execstack-native.bb

diff --git a/meta-arm/recipes-devtools/fvp/execstack-native.bb b/meta-arm=
/recipes-devtools/fvp/execstack-native.bb
new file mode 100644
index 000000000000..055d39ed0646
--- /dev/null
+++ b/meta-arm/recipes-devtools/fvp/execstack-native.bb
@@ -0,0 +1,21 @@
+SUMMARY =3D "execstack tool"
+LICENSE =3D "GPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc93c0550bd3173f4504b2cbd8991e=
50b"
+
+DEPENDS =3D "binutils-native elfutils-native"
+
+SRC_URI =3D "git://git.yoctoproject.org/prelink-cross;protocol=3Dhttps;b=
ranch=3Dmaster"
+SRCREV =3D "ff2561c02ade96c5d4d56ddd4e27ff064840a176"
+PV =3D "1.0+git${SRCPV}"
+
+S =3D "${WORKDIR}/git"
+
+inherit autotools native
+
+do_compile() {
+    oe_runmake -C ${B}/src execstack
+}
+
+do_install() {
+    oe_runmake -C ${B}/src install-binPROGRAMS DESTDIR=3D"${D}"
+}
--=20
2.39.5 (Apple Git-154)


