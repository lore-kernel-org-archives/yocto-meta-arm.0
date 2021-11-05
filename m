Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4410BC433F5
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 10:43:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.3730.1636109000336300210
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Nov 2021 03:43:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE09C1FB
	for <meta-arm@lists.yoctoproject.org>; Fri,  5 Nov 2021 03:43:18 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88FB53F7B4
	for <meta-arm@lists.yoctoproject.org>; Fri,  5 Nov 2021 03:43:18 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] gem5/gem5: fix the build with Python 3.10
Date: Fri,  5 Nov 2021 10:43:16 +0000
Message-Id: <20211105104316.4012028-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 05 Nov 2021 10:43:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2342

gem5 imported collections.Mapping, but this was deprecated in 3.3 and
removed in 3.10.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/gem5/files/mapping.patch | 37 +++++++++++++++++++
 .../recipes-devtools/gem5/gem5-source_20.inc  |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-gem5/recipes-devtools/gem5/files/mapping.patch

diff --git a/meta-gem5/recipes-devtools/gem5/files/mapping.patch b/meta-g=
em5/recipes-devtools/gem5/files/mapping.patch
new file mode 100644
index 00000000..5eb34d82
--- /dev/null
+++ b/meta-gem5/recipes-devtools/gem5/files/mapping.patch
@@ -0,0 +1,37 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 89958f7f30ec722e30e1bcffdeab547c874fa475 Mon Sep 17 00:00:00 2001
+From: Adrian Herrera <adrian.herrera@arm.com>
+Date: Mon, 15 Mar 2021 13:14:44 +0000
+Subject: [PATCH] python: debug, fix Mapping import
+
+Change "collections.Mapping" to "collections.abc.Mapping".
+"collections.Mapping" was an alias, it is deprecated starting from Pytho=
n 3.3, and it will be removed in Python 3.10.
+
+Change-Id: Ic257e3c5206eb3d48d4eed85a93fac48bd3b8dc4
+Signed-off-by: Adrian Herrera <adrian.herrera@arm.com>
+Reviewed-on: https://gem5-review.googlesource.com/c/public/gem5/+/43023
+Reviewed-by: Jason Lowe-Power <power.jg@gmail.com>
+Maintainer: Jason Lowe-Power <power.jg@gmail.com>
+Tested-by: kokoro <noreply+kokoro@google.com>
+---
+ src/python/m5/debug.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/python/m5/debug.py b/src/python/m5/debug.py
+index d808850cc..787a39ece 100644
+--- a/src/python/m5/debug.py
++++ b/src/python/m5/debug.py
+@@ -24,7 +24,7 @@
+ # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ # OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+=20
+-from collections import Mapping
++from collections.abc import Mapping
+=20
+ import _m5.debug
+ from _m5.debug import SimpleFlag, CompoundFlag
+--=20
+2.25.1
+
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-source_20.inc b/meta-ge=
m5/recipes-devtools/gem5/gem5-source_20.inc
index aafc54be..bf448fef 100644
--- a/meta-gem5/recipes-devtools/gem5/gem5-source_20.inc
+++ b/meta-gem5/recipes-devtools/gem5/gem5-source_20.inc
@@ -1,7 +1,8 @@
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d9514d69d8abf88b6e9125e759bf=
0ab \
                     file://LICENSE;md5=3Da585e2893cee63d16a1d8bc16c6297e=
c"
=20
-SRC_URI =3D "git://gem5.googlesource.com/public/gem5;protocol=3Dhttps;no=
branch=3D1"
+SRC_URI =3D "git://gem5.googlesource.com/public/gem5;protocol=3Dhttps;no=
branch=3D1 \
+           file://mapping.patch"
 RELEASE_TAG =3D "v20.1.0.5"
 SRCREV =3D "31cd81fdec46bae4b48d4f3788776936389dbdec"
=20
--=20
2.25.1


