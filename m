Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6745EC369A1
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 17:34:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3087.1743788091029828643
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Apr 2025 10:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96B561515
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Apr 2025 10:34:52 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 078843F63F
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Apr 2025 10:34:49 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/execstack-native: add new recipe
Date: Fri,  4 Apr 2025 18:34:44 +0100
Message-ID: <20250404173445.3901440-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Apr 2025 17:34:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6446

Add a recipe for the execstack binary from prelink-cross. This tool is
used to manipulate the GNU_STACK segment in ELF binaries, specifically
to control whether the binary requests an executable stack or not.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/fvp/execstack-native.bb  | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-arm/recipes-devtools/fvp/execstack-native.bb

diff --git a/meta-arm/recipes-devtools/fvp/execstack-native.bb b/meta-arm=
/recipes-devtools/fvp/execstack-native.bb
new file mode 100644
index 00000000..055d39ed
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
2.43.0


