Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C43C04FFE
	for <webhook@archiver.kernel.org>; Fri, 26 Apr 2024 13:45:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.14300.1714139112000566162
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Apr 2024 06:45:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9454F11FB;
	Fri, 26 Apr 2024 06:45:39 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E49F3F793;
	Fri, 26 Apr 2024 06:45:10 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] CI: temporarily backport the procps fix
Date: Fri, 26 Apr 2024 13:45:06 +0000
Message-Id: <20240426134506.3084899-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240426134506.3084899-1-ross.burton@arm.com>
References: <20240426134506.3084899-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 26 Apr 2024 13:45:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5612

This patch will be merged upstream soon, apply it locally to unblock CI.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-with-new-glibc-but-old-kernel-heade.patch | 62 +++++++++++++++++++
 ci/base.yml                                   |  4 ++
 2 files changed, 66 insertions(+)
 create mode 100644 0001-procps-fix-build-with-new-glibc-but-old-kernel-h=
eade.patch

diff --git a/0001-procps-fix-build-with-new-glibc-but-old-kernel-heade.pa=
tch b/0001-procps-fix-build-with-new-glibc-but-old-kernel-heade.patch
new file mode 100644
index 00000000..dc6cc063
--- /dev/null
+++ b/0001-procps-fix-build-with-new-glibc-but-old-kernel-heade.patch
@@ -0,0 +1,62 @@
+From ac2b9eac4a0e7c3097627939d91ce7970fadcd1a Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Fri, 26 Apr 2024 10:38:28 +0000
+Subject: [PATCH] procps: fix build with new glibc but old kernel headers
+
+If you're building procps with a newer glibc (with pidfd_open()) but
+older kernel headers (say 4.x, before __NR_pidfd_open) then procps will
+fail to build because of a typo in configure.ac.
+
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ .../procps/procps/pidfd.patch                 | 25 +++++++++++++++++++
+ meta/recipes-extended/procps/procps_4.0.4.bb  |  1 +
+ 2 files changed, 26 insertions(+)
+ create mode 100644 meta/recipes-extended/procps/procps/pidfd.patch
+
+diff --git a/meta/recipes-extended/procps/procps/pidfd.patch b/meta/reci=
pes-extended/procps/procps/pidfd.patch
+new file mode 100644
+index 00000000000..4c19043496b
+--- /dev/null
++++ b/meta/recipes-extended/procps/procps/pidfd.patch
+@@ -0,0 +1,25 @@
++From c8f625e085b8249cc009e8b19c3a19100217eb35 Mon Sep 17 00:00:00 2001
++From: Ross Burton <ross.burton@arm.com>
++Date: Thu, 25 Apr 2024 13:33:15 +0000
++Subject: [PATCH] Fix pidfd_open detection
++
++This check for pidfd_open uses AC_CHECK_FUNC which just runs the specif=
ied code, but=20
++src/pgrep.c checks HAVE_PIDFD_OPEN which will only be defined by AC_CHE=
CK_FUNCS.
++
++Upstream-Status: Pending
++Signed-off-by: Ross Burton <ross.burton@arm.com>
++---
++
++diff --git a/configure.ac b/configure.ac
++index fec27e3f..024731c7 100644
++--- a/configure.ac
+++++ b/configure.ac
++@@ -170,7 +170,7 @@ AC_TRY_COMPILE([#include <errno.h>],
++ 		AC_MSG_RESULT(yes),
++ 		AC_MSG_RESULT(no))
++=20
++-AC_CHECK_FUNC([pidfd_open], [enable_pidwait=3Dyes], [
+++AC_CHECK_FUNCS([pidfd_open], [enable_pidwait=3Dyes], [
++   AC_MSG_CHECKING([for __NR_pidfd_open])
++   AC_COMPILE_IFELSE([AC_LANG_SOURCE([
++ #include <sys/syscall.h>
+diff --git a/meta/recipes-extended/procps/procps_4.0.4.bb b/meta/recipes=
-extended/procps/procps_4.0.4.bb
+index 800384f22f7..ec8c4b0261b 100644
+--- a/meta/recipes-extended/procps/procps_4.0.4.bb
++++ b/meta/recipes-extended/procps/procps_4.0.4.bb
+@@ -14,6 +14,7 @@ inherit autotools gettext pkgconfig update-alternative=
s
+=20
+ SRC_URI =3D "git://gitlab.com/procps-ng/procps.git;protocol=3Dhttps;bra=
nch=3Dmaster \
+            file://sysctl.conf \
++           file://pidfd.patch \
+            "
+ SRCREV =3D "4ddcef2fd843170c8e2d59a83042978f41037a2b"
+=20
+--=20
+2.34.1
+
diff --git a/ci/base.yml b/ci/base.yml
index a3e2c68b..863159e1 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -21,6 +21,10 @@ repos:
     layers:
       meta:
       meta-poky:
+    patches:
+      procps:
+        path: 0001-procps-fix-build-with-new-glibc-but-old-kernel-heade.=
patch
+        repo: meta-arm
=20
 env:
   BB_LOGCONFIG: ""
--=20
2.34.1


