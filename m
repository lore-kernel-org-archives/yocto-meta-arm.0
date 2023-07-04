Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6CAEB64DA
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 09:19:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.54773.1688462340808907539
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Jul 2023 02:19:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C24F5C14;
	Tue,  4 Jul 2023 02:19:42 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ED42F3F73F;
	Tue,  4 Jul 2023 02:18:59 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/3] CI: update to Kas format 14
Date: Tue,  4 Jul 2023 10:18:56 +0100
Message-Id: <20230704091857.3645929-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230704091857.3645929-1-ross.burton@arm.com>
References: <20230704091857.3645929-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Jul 2023 09:19:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4853

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml                    | 2 +-
 ci/clang.yml                   | 2 +-
 ci/corstone1000-common.yml     | 2 +-
 ci/corstone1000-fvp.yml        | 2 +-
 ci/corstone1000-mps3.yml       | 2 +-
 ci/corstone500.yml             | 2 +-
 ci/debug.yml                   | 2 +-
 ci/edk2.yml                    | 2 +-
 ci/external-gccarm.yml         | 2 +-
 ci/fvp-base.yml                | 2 +-
 ci/fvp-baser-aemv8r64.yml      | 2 +-
 ci/fvp.yml                     | 2 +-
 ci/fvps.yml                    | 2 +-
 ci/gcc.yml                     | 2 +-
 ci/generic-arm64.yml           | 2 +-
 ci/glibc.yml                   | 2 +-
 ci/juno.yml                    | 2 +-
 ci/linux-yocto-dev.yml         | 2 +-
 ci/linux-yocto-rt.yml          | 2 +-
 ci/linux-yocto.yml             | 2 +-
 ci/meta-openembedded.yml       | 2 +-
 ci/meta-virtualization.yml     | 2 +-
 ci/musca-b1.yml                | 2 +-
 ci/musca-s1.yml                | 2 +-
 ci/musl.yml                    | 2 +-
 ci/n1sdp-ts.yml                | 2 +-
 ci/n1sdp.yml                   | 2 +-
 ci/poky-tiny.yml               | 2 +-
 ci/poky.yml                    | 2 +-
 ci/qemu-generic-arm64.yml      | 2 +-
 ci/qemuarm-secureboot.yml      | 2 +-
 ci/qemuarm.yml                 | 2 +-
 ci/qemuarm64-secureboot-ts.yml | 2 +-
 ci/qemuarm64-secureboot.yml    | 2 +-
 ci/qemuarm64.yml               | 2 +-
 ci/qemuarmv5.yml               | 2 +-
 ci/selftest.yml                | 2 +-
 ci/sgi575.yml                  | 2 +-
 ci/tc1.yml                     | 2 +-
 ci/testimage.yml               | 2 +-
 ci/tftf.yml                    | 2 +-
 ci/toolchains.yml              | 2 +-
 ci/u-boot.yml                  | 2 +-
 ci/xen.yml                     | 2 +-
 44 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/ci/base.yml b/ci/base.yml
index 92fa7074..05142361 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
=20
 distro: poky
=20
diff --git a/ci/clang.yml b/ci/clang.yml
index eeee7852..ecfd73b2 100644
--- a/ci/clang.yml
+++ b/ci/clang.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
=20
 repos:
   meta-clang:
diff --git a/ci/corstone1000-common.yml b/ci/corstone1000-common.yml
index d856cfe7..a4c9ca3f 100644
--- a/ci/corstone1000-common.yml
+++ b/ci/corstone1000-common.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
   includes:
     - ci/base.yml
     - ci/meta-openembedded.yml
diff --git a/ci/corstone1000-fvp.yml b/ci/corstone1000-fvp.yml
index 7d21b984..25f8edf8 100644
--- a/ci/corstone1000-fvp.yml
+++ b/ci/corstone1000-fvp.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
   includes:
     - ci/corstone1000-common.yml
     - ci/fvp.yml
diff --git a/ci/corstone1000-mps3.yml b/ci/corstone1000-mps3.yml
index 2df7d976..7a1fc9ef 100644
--- a/ci/corstone1000-mps3.yml
+++ b/ci/corstone1000-mps3.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
   includes:
     - ci/corstone1000-common.yml
=20
diff --git a/ci/corstone500.yml b/ci/corstone500.yml
index 0f9592e3..2172bc1f 100644
--- a/ci/corstone500.yml
+++ b/ci/corstone500.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
   includes:
     - ci/base.yml
     - ci/fvp.yml
diff --git a/ci/debug.yml b/ci/debug.yml
index 757f6d1d..6ca1a072 100644
--- a/ci/debug.yml
+++ b/ci/debug.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
=20
 # Add universally helpful features when testing boards
 local_conf_header:
diff --git a/ci/edk2.yml b/ci/edk2.yml
index 1261bf10..3a5c4ce9 100644
--- a/ci/edk2.yml
+++ b/ci/edk2.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
=20
 local_conf_header:
   bootfirmware: |
diff --git a/ci/external-gccarm.yml b/ci/external-gccarm.yml
index 2af8b5e8..fe8fa6ca 100644
--- a/ci/external-gccarm.yml
+++ b/ci/external-gccarm.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
=20
 local_conf_header:
   cc: |
diff --git a/ci/fvp-base.yml b/ci/fvp-base.yml
index fbba6984..7441ea42 100644
--- a/ci/fvp-base.yml
+++ b/ci/fvp-base.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
   includes:
     - ci/base.yml
     - ci/fvp.yml
diff --git a/ci/fvp-baser-aemv8r64.yml b/ci/fvp-baser-aemv8r64.yml
index cfaf9ef2..fd906250 100644
--- a/ci/fvp-baser-aemv8r64.yml
+++ b/ci/fvp-baser-aemv8r64.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
   includes:
     - ci/base.yml
     - ci/fvp.yml
diff --git a/ci/fvp.yml b/ci/fvp.yml
index 3803d8ca..81a5caa6 100644
--- a/ci/fvp.yml
+++ b/ci/fvp.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
=20
 local_conf_header:
   testimagefvp: |
diff --git a/ci/fvps.yml b/ci/fvps.yml
index 44c153ab..cf4103ed 100644
--- a/ci/fvps.yml
+++ b/ci/fvps.yml
@@ -1,7 +1,7 @@
 # Simple target to build the FVPs that are publically available
=20
 header:
-  version: 11
+  version: 14
   includes:
     - ci/base.yml
=20
diff --git a/ci/gcc.yml b/ci/gcc.yml
index a3943680..260199ae 100644
--- a/ci/gcc.yml
+++ b/ci/gcc.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
=20
 #NOTE: This is the default for poky.  This is only being added for compl=
eteness/clarity
 local_conf_header:
diff --git a/ci/generic-arm64.yml b/ci/generic-arm64.yml
index 873c9fd1..5d944ef1 100644
--- a/ci/generic-arm64.yml
+++ b/ci/generic-arm64.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
   includes:
     - ci/base.yml
=20
diff --git a/ci/glibc.yml b/ci/glibc.yml
index adc85a76..3c9f9eb7 100644
--- a/ci/glibc.yml
+++ b/ci/glibc.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
=20
 #NOTE: This is the default for poky.  This is only being added for compl=
eteness/clarity
 local_conf_header:
diff --git a/ci/juno.yml b/ci/juno.yml
index b2ee60a7..552e325f 100644
--- a/ci/juno.yml
+++ b/ci/juno.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
   includes:
     - ci/base.yml
=20
diff --git a/ci/linux-yocto-dev.yml b/ci/linux-yocto-dev.yml
index a6fadce1..5ee7afbb 100644
--- a/ci/linux-yocto-dev.yml
+++ b/ci/linux-yocto-dev.yml
@@ -1,5 +1,5 @@
 header:
-  version: 9
+  version: 14
=20
 local_conf_header:
   kernel: |
diff --git a/ci/linux-yocto-rt.yml b/ci/linux-yocto-rt.yml
index 69d768c5..65a276c1 100644
--- a/ci/linux-yocto-rt.yml
+++ b/ci/linux-yocto-rt.yml
@@ -1,5 +1,5 @@
 header:
-  version: 9
+  version: 14
=20
 local_conf_header:
   kernel: |
diff --git a/ci/linux-yocto.yml b/ci/linux-yocto.yml
index 359fea5a..e9ccdcb2 100644
--- a/ci/linux-yocto.yml
+++ b/ci/linux-yocto.yml
@@ -1,5 +1,5 @@
 header:
-  version: 9
+  version: 14
=20
 #NOTE: This is the default for poky.  This is only being added for compl=
eteness/clarity
 local_conf_header:
diff --git a/ci/meta-openembedded.yml b/ci/meta-openembedded.yml
index bed338da..e1e16c8f 100644
--- a/ci/meta-openembedded.yml
+++ b/ci/meta-openembedded.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
=20
 repos:
   meta-openembedded:
diff --git a/ci/meta-virtualization.yml b/ci/meta-virtualization.yml
index 8791fc3b..5fba0481 100644
--- a/ci/meta-virtualization.yml
+++ b/ci/meta-virtualization.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
   includes:
     - ci/meta-openembedded.yml
=20
diff --git a/ci/musca-b1.yml b/ci/musca-b1.yml
index b38dd1e4..db2adc9b 100644
--- a/ci/musca-b1.yml
+++ b/ci/musca-b1.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
   includes:
     - ci/base.yml
     - ci/meta-openembedded.yml
diff --git a/ci/musca-s1.yml b/ci/musca-s1.yml
index 29f289a3..974badf4 100644
--- a/ci/musca-s1.yml
+++ b/ci/musca-s1.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
   includes:
     - ci/base.yml
     - ci/meta-openembedded.yml
diff --git a/ci/musl.yml b/ci/musl.yml
index ee7905ec..641c4709 100644
--- a/ci/musl.yml
+++ b/ci/musl.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
=20
 local_conf_header:
   libc: |
diff --git a/ci/n1sdp-ts.yml b/ci/n1sdp-ts.yml
index e8e9298d..641d3766 100644
--- a/ci/n1sdp-ts.yml
+++ b/ci/n1sdp-ts.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
   includes:
     - ci/meta-openembedded.yml
=20
diff --git a/ci/n1sdp.yml b/ci/n1sdp.yml
index f6883079..c1b654d4 100644
--- a/ci/n1sdp.yml
+++ b/ci/n1sdp.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
   includes:
     - ci/base.yml
=20
diff --git a/ci/poky-tiny.yml b/ci/poky-tiny.yml
index cf252a0e..d869c557 100644
--- a/ci/poky-tiny.yml
+++ b/ci/poky-tiny.yml
@@ -1,5 +1,5 @@
 header:
-  version: 9
+  version: 14
=20
 distro: poky-tiny
=20
diff --git a/ci/poky.yml b/ci/poky.yml
index d4bcfebf..d6887a9c 100644
--- a/ci/poky.yml
+++ b/ci/poky.yml
@@ -1,4 +1,4 @@
 header:
-  version: 9
+  version: 14
=20
 distro: poky
diff --git a/ci/qemu-generic-arm64.yml b/ci/qemu-generic-arm64.yml
index 32c4b981..43ae2563 100644
--- a/ci/qemu-generic-arm64.yml
+++ b/ci/qemu-generic-arm64.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
   includes:
     - ci/generic-arm64.yml
=20
diff --git a/ci/qemuarm-secureboot.yml b/ci/qemuarm-secureboot.yml
index 044661cd..97e99039 100644
--- a/ci/qemuarm-secureboot.yml
+++ b/ci/qemuarm-secureboot.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
   includes:
     - ci/base.yml
=20
diff --git a/ci/qemuarm.yml b/ci/qemuarm.yml
index 4155847c..18fef52e 100644
--- a/ci/qemuarm.yml
+++ b/ci/qemuarm.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
   includes:
     - ci/base.yml
=20
diff --git a/ci/qemuarm64-secureboot-ts.yml b/ci/qemuarm64-secureboot-ts.=
yml
index 5f28dd3c..e18ce1a9 100644
--- a/ci/qemuarm64-secureboot-ts.yml
+++ b/ci/qemuarm64-secureboot-ts.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
   includes:
     - ci/meta-openembedded.yml
=20
diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
index f617dfc5..c4943cb6 100644
--- a/ci/qemuarm64-secureboot.yml
+++ b/ci/qemuarm64-secureboot.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
   includes:
     - ci/base.yml
=20
diff --git a/ci/qemuarm64.yml b/ci/qemuarm64.yml
index 66390344..cd03e942 100644
--- a/ci/qemuarm64.yml
+++ b/ci/qemuarm64.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
   includes:
     - ci/base.yml
=20
diff --git a/ci/qemuarmv5.yml b/ci/qemuarmv5.yml
index 18c7a15a..c2ff6c84 100644
--- a/ci/qemuarmv5.yml
+++ b/ci/qemuarmv5.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
   includes:
     - ci/base.yml
=20
diff --git a/ci/selftest.yml b/ci/selftest.yml
index 9a587354..e519851c 100644
--- a/ci/selftest.yml
+++ b/ci/selftest.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
=20
 local_conf_header:
   setup: |
diff --git a/ci/sgi575.yml b/ci/sgi575.yml
index 1895fc52..faab716d 100644
--- a/ci/sgi575.yml
+++ b/ci/sgi575.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
   includes:
     - ci/base.yml
=20
diff --git a/ci/tc1.yml b/ci/tc1.yml
index f2de9a4e..66c5ab99 100644
--- a/ci/tc1.yml
+++ b/ci/tc1.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
   includes:
     - ci/base.yml
     - ci/fvp.yml
diff --git a/ci/testimage.yml b/ci/testimage.yml
index 5d402f0f..f496ec1c 100644
--- a/ci/testimage.yml
+++ b/ci/testimage.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
   includes:
     - ci/debug.yml
=20
diff --git a/ci/tftf.yml b/ci/tftf.yml
index 6e42d9c6..260ceab0 100644
--- a/ci/tftf.yml
+++ b/ci/tftf.yml
@@ -1,5 +1,5 @@
 header:
-  version: 9
+  version: 14
=20
 local_conf_header:
   tftf: |
diff --git a/ci/toolchains.yml b/ci/toolchains.yml
index 080d8d97..72ce5582 100644
--- a/ci/toolchains.yml
+++ b/ci/toolchains.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
   includes:
     - ci/base.yml
=20
diff --git a/ci/u-boot.yml b/ci/u-boot.yml
index 76bdd23e..c693b8b0 100644
--- a/ci/u-boot.yml
+++ b/ci/u-boot.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
=20
 local_conf_header:
   bootfirmware: |
diff --git a/ci/xen.yml b/ci/xen.yml
index d8b75d44..f4a8f9a4 100644
--- a/ci/xen.yml
+++ b/ci/xen.yml
@@ -1,5 +1,5 @@
 header:
-  version: 11
+  version: 14
   includes:
     - ci/meta-virtualization.yml
=20
--=20
2.34.1


