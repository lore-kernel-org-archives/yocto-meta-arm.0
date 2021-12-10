Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99FDFC433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 15:22:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.8700.1639149728304227582
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Dec 2021 07:22:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A82C0106F
	for <meta-arm@lists.yoctoproject.org>; Fri, 10 Dec 2021 07:22:07 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3909B3F5A1
	for <meta-arm@lists.yoctoproject.org>; Fri, 10 Dec 2021 07:22:07 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: update for new Kas include semantics
Date: Fri, 10 Dec 2021 15:22:05 +0000
Message-Id: <20211210152205.2699946-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 10 Dec 2021 15:22:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2615

With Kas 2.6 included YAML files need to be relative to the repository,
not the including file:

https://kas.readthedocs.io/en/latest/format-changelog.html#version-11

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/armgcc.yml               | 2 +-
 ci/base.yml                 | 2 +-
 ci/clang.yml                | 2 +-
 ci/corstone1000-fvp.yml     | 6 +++---
 ci/corstone1000-mps3.yml    | 6 +++---
 ci/corstone500.yml          | 4 ++--
 ci/corstone700-fvp.yml      | 4 ++--
 ci/corstone700-mps3.yml     | 4 ++--
 ci/external-gccarm.yml      | 2 +-
 ci/fvp-base-arm32.yml       | 4 ++--
 ci/fvp-base.yml             | 4 ++--
 ci/fvp-baser-aemv8r64.yml   | 4 ++--
 ci/fvps.yml                 | 4 ++--
 ci/gem5-arm64.yml           | 6 +++---
 ci/gem5-atp-arm64.yml       | 4 ++--
 ci/generic-arm64.yml        | 4 ++--
 ci/juno.yml                 | 4 ++--
 ci/meta-openembedded.yml    | 2 +-
 ci/meta-virtualization.yml  | 4 ++--
 ci/meta-zephyr.yml          | 4 ++--
 ci/microbit-v1.yml          | 6 +++---
 ci/musca-b1.yml             | 6 +++---
 ci/musca-s1.yml             | 6 +++---
 ci/musl.yml                 | 2 +-
 ci/n1sdp.yml                | 4 ++--
 ci/qemu-cortex-a53.yml      | 6 +++---
 ci/qemu-cortex-m3.yml       | 6 +++---
 ci/qemu-cortex-r5.yml       | 6 +++---
 ci/qemu-generic-arm64.yml   | 4 ++--
 ci/qemuarm.yml              | 4 ++--
 ci/qemuarm64-secureboot.yml | 4 ++--
 ci/qemuarm64.yml            | 4 ++--
 ci/qemuarmv5.yml            | 4 ++--
 ci/sgi575.yml               | 4 ++--
 ci/tc0.yml                  | 4 ++--
 ci/tc1.yml                  | 4 ++--
 ci/testimage-zephyr.yml     | 2 +-
 ci/testimage.yml            | 2 +-
 ci/toolchains.yml           | 4 ++--
 ci/xen.yml                  | 4 ++--
 40 files changed, 81 insertions(+), 81 deletions(-)

diff --git a/ci/armgcc.yml b/ci/armgcc.yml
index 72274a8b..d63ae240 100644
--- a/ci/armgcc.yml
+++ b/ci/armgcc.yml
@@ -1,5 +1,5 @@
 header:
-  version: 9
+  version: 11
=20
 local_conf_header:
   cc: |
diff --git a/ci/base.yml b/ci/base.yml
index 227dea38..0af0b62d 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -1,5 +1,5 @@
 header:
-  version: 9
+  version: 11
=20
 distro: poky
=20
diff --git a/ci/clang.yml b/ci/clang.yml
index f3524473..a2063f19 100644
--- a/ci/clang.yml
+++ b/ci/clang.yml
@@ -1,5 +1,5 @@
 header:
-  version: 9
+  version: 11
=20
 repos:
   meta-clang:
diff --git a/ci/corstone1000-fvp.yml b/ci/corstone1000-fvp.yml
index 66cdec6e..39a92b3c 100644
--- a/ci/corstone1000-fvp.yml
+++ b/ci/corstone1000-fvp.yml
@@ -1,8 +1,8 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - base.yml
-    - meta-openembedded.yml
+    - ci/base.yml
+    - ci/meta-openembedded.yml
=20
 local_conf_header:
     custom-local-conf: |
diff --git a/ci/corstone1000-mps3.yml b/ci/corstone1000-mps3.yml
index fc06440d..21635938 100644
--- a/ci/corstone1000-mps3.yml
+++ b/ci/corstone1000-mps3.yml
@@ -1,8 +1,8 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - base.yml
-    - meta-openembedded.yml
+    - ci/base.yml
+    - ci/meta-openembedded.yml
=20
 local_conf_header:
     custom-local-conf: |
diff --git a/ci/corstone500.yml b/ci/corstone500.yml
index c348101d..510a2ffb 100644
--- a/ci/corstone500.yml
+++ b/ci/corstone500.yml
@@ -1,6 +1,6 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - base.yml
+    - ci/base.yml
=20
 machine: corstone500
diff --git a/ci/corstone700-fvp.yml b/ci/corstone700-fvp.yml
index e69fc4c0..3c062f2a 100644
--- a/ci/corstone700-fvp.yml
+++ b/ci/corstone700-fvp.yml
@@ -1,7 +1,7 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - base.yml
+    - ci/base.yml
=20
 machine: corstone700-fvp
=20
diff --git a/ci/corstone700-mps3.yml b/ci/corstone700-mps3.yml
index 3fa1a503..4ce03e8b 100644
--- a/ci/corstone700-mps3.yml
+++ b/ci/corstone700-mps3.yml
@@ -1,6 +1,6 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - corstone700-fvp.yml
+    - ci/corstone700-fvp.yml
=20
 machine: corstone700-mps3
diff --git a/ci/external-gccarm.yml b/ci/external-gccarm.yml
index 0ce47952..e1754f74 100644
--- a/ci/external-gccarm.yml
+++ b/ci/external-gccarm.yml
@@ -1,5 +1,5 @@
 header:
-  version: 9
+  version: 11
=20
 local_conf_header:
   cc: |
diff --git a/ci/fvp-base-arm32.yml b/ci/fvp-base-arm32.yml
index bb83a725..162c2f6f 100644
--- a/ci/fvp-base-arm32.yml
+++ b/ci/fvp-base-arm32.yml
@@ -1,6 +1,6 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - base.yml
+    - ci/base.yml
=20
 machine: fvp-base-arm32
diff --git a/ci/fvp-base.yml b/ci/fvp-base.yml
index 47d123e3..43b2f190 100644
--- a/ci/fvp-base.yml
+++ b/ci/fvp-base.yml
@@ -1,7 +1,7 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - base.yml
+    - ci/base.yml
=20
 machine: fvp-base
=20
diff --git a/ci/fvp-baser-aemv8r64.yml b/ci/fvp-baser-aemv8r64.yml
index 9e3e2deb..40818bc6 100644
--- a/ci/fvp-baser-aemv8r64.yml
+++ b/ci/fvp-baser-aemv8r64.yml
@@ -1,7 +1,7 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - base.yml
+    - ci/base.yml
=20
 machine: fvp-baser-aemv8r64
=20
diff --git a/ci/fvps.yml b/ci/fvps.yml
index a3df9cd3..6ed00122 100644
--- a/ci/fvps.yml
+++ b/ci/fvps.yml
@@ -1,9 +1,9 @@
 # Simple target to build the FVPs that are publically available
=20
 header:
-  version: 9
+  version: 11
   includes:
-    - base.yml
+    - ci/base.yml
=20
 machine: qemuarm64
=20
diff --git a/ci/gem5-arm64.yml b/ci/gem5-arm64.yml
index 6d348fc7..8b8e66ba 100644
--- a/ci/gem5-arm64.yml
+++ b/ci/gem5-arm64.yml
@@ -1,8 +1,8 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - base.yml
-    - meta-openembedded.yml
+    - ci/base.yml
+    - ci/meta-openembedded.yml
=20
 repos:
   meta-arm:
diff --git a/ci/gem5-atp-arm64.yml b/ci/gem5-atp-arm64.yml
index 95bec610..626947b5 100644
--- a/ci/gem5-atp-arm64.yml
+++ b/ci/gem5-atp-arm64.yml
@@ -1,7 +1,7 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - gem5-arm64.yml
+    - ci/gem5-arm64.yml
=20
 repos:
   meta-arm:
diff --git a/ci/generic-arm64.yml b/ci/generic-arm64.yml
index a7365b86..873c9fd1 100644
--- a/ci/generic-arm64.yml
+++ b/ci/generic-arm64.yml
@@ -1,6 +1,6 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - base.yml
+    - ci/base.yml
=20
 machine: generic-arm64
diff --git a/ci/juno.yml b/ci/juno.yml
index 0badddd4..b2ee60a7 100644
--- a/ci/juno.yml
+++ b/ci/juno.yml
@@ -1,6 +1,6 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - base.yml
+    - ci/base.yml
=20
 machine: juno
diff --git a/ci/meta-openembedded.yml b/ci/meta-openembedded.yml
index 4b95217b..bed338da 100644
--- a/ci/meta-openembedded.yml
+++ b/ci/meta-openembedded.yml
@@ -1,5 +1,5 @@
 header:
-  version: 9
+  version: 11
=20
 repos:
   meta-openembedded:
diff --git a/ci/meta-virtualization.yml b/ci/meta-virtualization.yml
index 1218f0e9..1cd0e21a 100644
--- a/ci/meta-virtualization.yml
+++ b/ci/meta-virtualization.yml
@@ -1,7 +1,7 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - meta-openembedded.yml
+    - ci/meta-openembedded.yml
=20
 repos:
   meta-virtualization:
diff --git a/ci/meta-zephyr.yml b/ci/meta-zephyr.yml
index d8fae2ef..2f23f2bc 100644
--- a/ci/meta-zephyr.yml
+++ b/ci/meta-zephyr.yml
@@ -1,7 +1,7 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - meta-openembedded.yml
+    - ci/meta-openembedded.yml
=20
 repos:
   meta-zephyr:
diff --git a/ci/microbit-v1.yml b/ci/microbit-v1.yml
index 4c0f4e19..7475748b 100644
--- a/ci/microbit-v1.yml
+++ b/ci/microbit-v1.yml
@@ -1,8 +1,8 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - base.yml
-    - meta-zephyr.yml
+    - ci/base.yml
+    - ci/meta-zephyr.yml
=20
 local_conf_header:
   nonbuilding_tests: |
diff --git a/ci/musca-b1.yml b/ci/musca-b1.yml
index 4f5f02d8..0e3ab797 100644
--- a/ci/musca-b1.yml
+++ b/ci/musca-b1.yml
@@ -1,8 +1,8 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - base.yml
-    - meta-zephyr.yml
+    - ci/base.yml
+    - ci/meta-zephyr.yml
=20
 machine: musca-b1
=20
diff --git a/ci/musca-s1.yml b/ci/musca-s1.yml
index 4d31a682..29f289a3 100644
--- a/ci/musca-s1.yml
+++ b/ci/musca-s1.yml
@@ -1,8 +1,8 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - base.yml
-    - meta-openembedded.yml
+    - ci/base.yml
+    - ci/meta-openembedded.yml
=20
 machine: musca-s1
=20
diff --git a/ci/musl.yml b/ci/musl.yml
index cd58df79..ee7905ec 100644
--- a/ci/musl.yml
+++ b/ci/musl.yml
@@ -1,5 +1,5 @@
 header:
-  version: 9
+  version: 11
=20
 local_conf_header:
   libc: |
diff --git a/ci/n1sdp.yml b/ci/n1sdp.yml
index 9e0d26a2..797a5225 100644
--- a/ci/n1sdp.yml
+++ b/ci/n1sdp.yml
@@ -1,6 +1,6 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - base.yml
+    - ci/base.yml
=20
 machine: n1sdp
diff --git a/ci/qemu-cortex-a53.yml b/ci/qemu-cortex-a53.yml
index 536dcda1..631a9d4a 100644
--- a/ci/qemu-cortex-a53.yml
+++ b/ci/qemu-cortex-a53.yml
@@ -1,8 +1,8 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - base.yml
-    - meta-zephyr.yml
+    - ci/base.yml
+    - ci/meta-zephyr.yml
=20
 local_conf_header:
   nonbuilding_tests: |
diff --git a/ci/qemu-cortex-m3.yml b/ci/qemu-cortex-m3.yml
index 9333db2e..ab6d5c73 100644
--- a/ci/qemu-cortex-m3.yml
+++ b/ci/qemu-cortex-m3.yml
@@ -1,8 +1,8 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - base.yml
-    - meta-zephyr.yml
+    - ci/base.yml
+    - ci/meta-zephyr.yml
=20
 local_conf_header:
   tclibc: |
diff --git a/ci/qemu-cortex-r5.yml b/ci/qemu-cortex-r5.yml
index 1c4e0133..e3b4c6f9 100644
--- a/ci/qemu-cortex-r5.yml
+++ b/ci/qemu-cortex-r5.yml
@@ -1,8 +1,8 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - base.yml
-    - meta-zephyr.yml
+    - ci/base.yml
+    - ci/meta-zephyr.yml
=20
 machine: qemu-cortex-r5
=20
diff --git a/ci/qemu-generic-arm64.yml b/ci/qemu-generic-arm64.yml
index 07196ada..2b7b839c 100644
--- a/ci/qemu-generic-arm64.yml
+++ b/ci/qemu-generic-arm64.yml
@@ -1,7 +1,7 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - generic-arm64.yml
+    - ci/generic-arm64.yml
=20
 local_conf_header:
   failing_tests: |
diff --git a/ci/qemuarm.yml b/ci/qemuarm.yml
index 8ea539cd..4155847c 100644
--- a/ci/qemuarm.yml
+++ b/ci/qemuarm.yml
@@ -1,6 +1,6 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - base.yml
+    - ci/base.yml
=20
 machine: qemuarm
diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
index 31f195dd..d06514d0 100644
--- a/ci/qemuarm64-secureboot.yml
+++ b/ci/qemuarm64-secureboot.yml
@@ -1,7 +1,7 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - base.yml
+    - ci/base.yml
=20
 machine: qemuarm64-secureboot
=20
diff --git a/ci/qemuarm64.yml b/ci/qemuarm64.yml
index cc29c750..66390344 100644
--- a/ci/qemuarm64.yml
+++ b/ci/qemuarm64.yml
@@ -1,6 +1,6 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - base.yml
+    - ci/base.yml
=20
 machine: qemuarm64
diff --git a/ci/qemuarmv5.yml b/ci/qemuarmv5.yml
index b1ff4463..18c7a15a 100644
--- a/ci/qemuarmv5.yml
+++ b/ci/qemuarmv5.yml
@@ -1,6 +1,6 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - base.yml
+    - ci/base.yml
=20
 machine: qemuarmv5
diff --git a/ci/sgi575.yml b/ci/sgi575.yml
index 43ee4b59..1895fc52 100644
--- a/ci/sgi575.yml
+++ b/ci/sgi575.yml
@@ -1,6 +1,6 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - base.yml
+    - ci/base.yml
=20
 machine: sgi575
diff --git a/ci/tc0.yml b/ci/tc0.yml
index d8fccf7b..dd94d874 100644
--- a/ci/tc0.yml
+++ b/ci/tc0.yml
@@ -1,7 +1,7 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - base.yml
+    - ci/base.yml
=20
 machine: tc0
=20
diff --git a/ci/tc1.yml b/ci/tc1.yml
index f4f1ad08..987e5248 100644
--- a/ci/tc1.yml
+++ b/ci/tc1.yml
@@ -1,7 +1,7 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - base.yml
+    - ci/base.yml
=20
 machine: tc1
=20
diff --git a/ci/testimage-zephyr.yml b/ci/testimage-zephyr.yml
index 242320c8..7ef051b5 100644
--- a/ci/testimage-zephyr.yml
+++ b/ci/testimage-zephyr.yml
@@ -1,5 +1,5 @@
 header:
-  version: 9
+  version: 11
=20
 local_conf_header:
   testimage: |
diff --git a/ci/testimage.yml b/ci/testimage.yml
index 2f7b8e95..0ffaaa2d 100644
--- a/ci/testimage.yml
+++ b/ci/testimage.yml
@@ -1,5 +1,5 @@
 header:
-  version: 9
+  version: 11
=20
 local_conf_header:
   testimage: |
diff --git a/ci/toolchains.yml b/ci/toolchains.yml
index 6a8ebb13..d99b1314 100644
--- a/ci/toolchains.yml
+++ b/ci/toolchains.yml
@@ -1,7 +1,7 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - base.yml
+    - ci/base.yml
=20
 # Target is arm64 and SDK is x86-64 to ensure that we exercise both
 # architectures
diff --git a/ci/xen.yml b/ci/xen.yml
index ae650623..d8b75d44 100644
--- a/ci/xen.yml
+++ b/ci/xen.yml
@@ -1,7 +1,7 @@
 header:
-  version: 9
+  version: 11
   includes:
-    - meta-virtualization.yml
+    - ci/meta-virtualization.yml
=20
 local_conf_header:
   meta-virt: |
--=20
2.25.1


