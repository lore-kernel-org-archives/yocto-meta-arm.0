Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0590EC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 16:31:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.426.1667838681392257071
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Nov 2022 08:31:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B0821FB;
	Mon,  7 Nov 2022 08:31:27 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FA303F534;
	Mon,  7 Nov 2022 08:31:20 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm/linux-arm64-ack: fix buildpaths in the perf Python module
Date: Mon,  7 Nov 2022 16:31:15 +0000
Message-Id: <20221107163115.3896537-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Nov 2022 16:31:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4108

Use --prefix instead of --root when installing the Python modules to
ensure that build paths are not embedded in the compiled .pyc files.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...ge-root-to-prefix-for-python-install.patch | 34 +++++++++++++++++++
 .../linux/linux-arm64-ack_5.15.bb             |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-arm/recipes-kernel/linux/linux-arm64-ack/0001-pe=
rf-change-root-to-prefix-for-python-install.patch

diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack/0001-perf-chan=
ge-root-to-prefix-for-python-install.patch b/meta-arm/recipes-kernel/linu=
x/linux-arm64-ack/0001-perf-change-root-to-prefix-for-python-install.patc=
h
new file mode 100644
index 00000000..637d90ae
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-arm64-ack/0001-perf-change-root=
-to-prefix-for-python-install.patch
@@ -0,0 +1,34 @@
+Take a patch from linux-yocto to fix buildpaths in perf's python module.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From b8cd0e429bf75b673c438a8277d4bc74327df992 Mon Sep 17 00:00:00 2001
+From: Tom Zanussi <tom.zanussi@intel.com>
+Date: Tue, 3 Jul 2012 13:07:23 -0500
+Subject: [PATCH] perf: change --root to --prefix for python install
+
+Otherwise we get the sysroot path appended to the build path, not what
+we want.
+
+Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
+---
+ tools/perf/Makefile.perf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
+index 8f738e11356d..ee945d8e3996 100644
+--- a/tools/perf/Makefile.perf
++++ b/tools/perf/Makefile.perf
+@@ -1022,7 +1022,7 @@ install-bin: install-tools install-tests install-t=
raceevent-plugins
+ install: install-bin try-install-man
+=20
+ install-python_ext:
+-	$(PYTHON_WORD) util/setup.py --quiet install --root=3D'/$(DESTDIR_SQ)'
++	$(PYTHON_WORD) util/setup.py --quiet install --prefix=3D'$(DESTDIR_SQ)=
/usr'
+=20
+ # 'make install-doc' should call 'make -C Documentation install'
+ $(INSTALL_DOC_TARGETS):
+--=20
+2.34.1
+
diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.15.bb b/meta=
-arm/recipes-kernel/linux/linux-arm64-ack_5.15.bb
index c3c9b4dc..804c068f 100644
--- a/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.15.bb
+++ b/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.15.bb
@@ -8,6 +8,7 @@ SRC_URI =3D " \
     git://android.googlesource.com/kernel/common.git;protocol=3Dhttps;br=
anch=3Dandroid13-5.15-lts \
     file://0001-lib-build_OID_registry-fix-reproducibility-issues.patch =
\
     file://0002-vt-conmakehash-improve-reproducibility.patch \
+    file://0001-perf-change-root-to-prefix-for-python-install.patch \
     "
=20
 # tag: ASB-2022-05-05_13-5.15-93-ge8b3f31d7a60
--=20
2.34.1


