Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD96C4332F
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 19:56:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.15407.1633377378265485511
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 04 Oct 2021 12:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2761D6E
	for <meta-arm@lists.yoctoproject.org>; Mon,  4 Oct 2021 12:56:17 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A7FB3F70D
	for <meta-arm@lists.yoctoproject.org>; Mon,  4 Oct 2021 12:56:17 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 6/8] arm: add recipe for gn
Date: Mon,  4 Oct 2021 20:56:10 +0100
Message-Id: <20211004195612.188487-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004195612.188487-1-ross.burton@arm.com>
References: <20211004195612.188487-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 04 Oct 2021 19:56:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2246

This is a Google build tool used by Hafnium. It will end up in meta-oe
eventually, but until then it can live here.

Change-Id: I7a3df84624664117a6a72e2d93e86036cb483c39
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/gn/gn_git.bb | 34 ++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-arm/recipes-devtools/gn/gn_git.bb

diff --git a/meta-arm/recipes-devtools/gn/gn_git.bb b/meta-arm/recipes-de=
vtools/gn/gn_git.bb
new file mode 100644
index 00000000..5962b2d5
--- /dev/null
+++ b/meta-arm/recipes-devtools/gn/gn_git.bb
@@ -0,0 +1,34 @@
+SUMMARY =3D "GN is a meta-build system that generates build files for Ni=
nja"
+DEPENDS +=3D "ninja-native"
+
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0fca02217a5d49a14dfe2d11837bb=
34d"
+
+SRC_URI =3D "git://gn.googlesource.com/gn;protocol=3Dhttps;branch=3Dmain=
"
+SRCREV =3D "69ec4fca1fa69ddadae13f9e6b7507efa0675263"
+PV =3D "0+git${SRCPV}"
+
+S =3D "${WORKDIR}/git"
+B =3D "${WORKDIR}/build"
+
+# TODO: os map like meson. mingw32 -> mingw
+
+do_configure[cleandirs] +=3D "${B}"
+do_configure() {
+    python3 ${S}/build/gen.py \
+        --platform=3D${TARGET_OS} \
+        --host=3D${HOST_OS} \
+        --out-path=3D${B} \
+        --no-strip
+}
+
+do_compile() {
+    ninja -C ${B} --verbose
+}
+
+do_install() {
+    install -d ${D}${bindir}
+    install ${B}/gn ${D}${bindir}
+}
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


