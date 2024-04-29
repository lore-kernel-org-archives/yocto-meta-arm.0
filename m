Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A103C41513
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 16:39:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.26352.1714408743602718753
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Apr 2024 09:39:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8B382F4;
	Mon, 29 Apr 2024 09:39:29 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 75E5F3F762;
	Mon, 29 Apr 2024 09:39:02 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH v2 1/5] CI: add Kas schema comments
Date: Mon, 29 Apr 2024 16:38:55 +0000
Message-Id: <20240429163859.507226-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Apr 2024 16:39:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5626

Add YAML language server comments so that IDEs know what schema to use
for the Kas files.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/arm-systemready-firmware.yml   | 2 ++
 ci/arm-systemready-ir-acs.yml     | 2 ++
 ci/base.yml                       | 2 ++
 ci/clang.yml                      | 2 ++
 ci/corstone1000-common.yml        | 2 ++
 ci/corstone1000-firmware-only.yml | 3 ++-
 ci/corstone1000-fvp.yml           | 2 ++
 ci/corstone1000-mps3.yml          | 2 ++
 ci/cve.yml                        | 2 ++
 ci/debug.yml                      | 2 ++
 ci/edk2.yml                       | 2 ++
 ci/external-gccarm.yml            | 2 ++
 ci/fvp-base-ts.yml                | 2 ++
 ci/fvp-base.yml                   | 2 ++
 ci/fvp.yml                        | 2 ++
 ci/fvps.yml                       | 2 ++
 ci/gcc.yml                        | 2 ++
 ci/genericarm64.yml               | 2 ++
 ci/glibc.yml                      | 2 ++
 ci/juno.yml                       | 2 ++
 ci/linux-yocto-dev.yml            | 2 ++
 ci/linux-yocto-rt.yml             | 2 ++
 ci/linux-yocto.yml                | 2 ++
 ci/meta-openembedded.yml          | 2 ++
 ci/meta-secure-core.yml           | 2 ++
 ci/meta-virtualization.yml        | 2 ++
 ci/musca-b1.yml                   | 2 ++
 ci/musca-s1.yml                   | 2 ++
 ci/musl.yml                       | 2 ++
 ci/n1sdp-optee.yml                | 2 ++
 ci/n1sdp-ts.yml                   | 2 ++
 ci/n1sdp.yml                      | 2 ++
 ci/poky-tiny.yml                  | 2 ++
 ci/poky.yml                       | 2 ++
 ci/qemuarm-secureboot.yml         | 2 ++
 ci/qemuarm.yml                    | 2 ++
 ci/qemuarm64-secureboot-ts.yml    | 2 ++
 ci/qemuarm64-secureboot.yml       | 2 ++
 ci/qemuarm64.yml                  | 2 ++
 ci/qemuarmv5.yml                  | 2 ++
 ci/sbsa-ref.yml                   | 2 ++
 ci/selftest.yml                   | 2 ++
 ci/sgi575.yml                     | 2 ++
 ci/sstate-mirror.yml              | 2 ++
 ci/testimage.yml                  | 2 ++
 ci/tftf.yml                       | 2 ++
 ci/toolchains.yml                 | 2 ++
 ci/u-boot.yml                     | 2 ++
 ci/xen.yml                        | 2 ++
 49 files changed, 98 insertions(+), 1 deletion(-)

diff --git a/ci/arm-systemready-firmware.yml b/ci/arm-systemready-firmwar=
e.yml
index 1854c2ab..4b975370 100644
--- a/ci/arm-systemready-firmware.yml
+++ b/ci/arm-systemready-firmware.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 11
   includes:
diff --git a/ci/arm-systemready-ir-acs.yml b/ci/arm-systemready-ir-acs.ym=
l
index 6cfead6c..ca4e8b0a 100644
--- a/ci/arm-systemready-ir-acs.yml
+++ b/ci/arm-systemready-ir-acs.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 11
   includes:
diff --git a/ci/base.yml b/ci/base.yml
index 6058b1c2..a3e2c68b 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
=20
diff --git a/ci/clang.yml b/ci/clang.yml
index 953ade2e..9d01858e 100644
--- a/ci/clang.yml
+++ b/ci/clang.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
=20
diff --git a/ci/corstone1000-common.yml b/ci/corstone1000-common.yml
index 7fe9e879..3f47b3a5 100644
--- a/ci/corstone1000-common.yml
+++ b/ci/corstone1000-common.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
   includes:
diff --git a/ci/corstone1000-firmware-only.yml b/ci/corstone1000-firmware=
-only.yml
index 8af0146a..a2298910 100644
--- a/ci/corstone1000-firmware-only.yml
+++ b/ci/corstone1000-firmware-only.yml
@@ -1,4 +1,5 @@
----
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
   includes:
diff --git a/ci/corstone1000-fvp.yml b/ci/corstone1000-fvp.yml
index c4e57379..c2bf9459 100644
--- a/ci/corstone1000-fvp.yml
+++ b/ci/corstone1000-fvp.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
   includes:
diff --git a/ci/corstone1000-mps3.yml b/ci/corstone1000-mps3.yml
index 7a1fc9ef..9b87b259 100644
--- a/ci/corstone1000-mps3.yml
+++ b/ci/corstone1000-mps3.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
   includes:
diff --git a/ci/cve.yml b/ci/cve.yml
index e2aca0e1..d060d299 100644
--- a/ci/cve.yml
+++ b/ci/cve.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
=20
diff --git a/ci/debug.yml b/ci/debug.yml
index 6ca1a072..371035a1 100644
--- a/ci/debug.yml
+++ b/ci/debug.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
=20
diff --git a/ci/edk2.yml b/ci/edk2.yml
index 3a5c4ce9..d32e3645 100644
--- a/ci/edk2.yml
+++ b/ci/edk2.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
=20
diff --git a/ci/external-gccarm.yml b/ci/external-gccarm.yml
index a3313d89..b55d0c96 100644
--- a/ci/external-gccarm.yml
+++ b/ci/external-gccarm.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
=20
diff --git a/ci/fvp-base-ts.yml b/ci/fvp-base-ts.yml
index e2e7ada2..04fed0fb 100644
--- a/ci/fvp-base-ts.yml
+++ b/ci/fvp-base-ts.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
   includes:
diff --git a/ci/fvp-base.yml b/ci/fvp-base.yml
index 7441ea42..d71d33e4 100644
--- a/ci/fvp-base.yml
+++ b/ci/fvp-base.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
   includes:
diff --git a/ci/fvp.yml b/ci/fvp.yml
index e9f3fa94..2bf1cef0 100644
--- a/ci/fvp.yml
+++ b/ci/fvp.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
=20
diff --git a/ci/fvps.yml b/ci/fvps.yml
index c6516148..8f1de177 100644
--- a/ci/fvps.yml
+++ b/ci/fvps.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 # Simple target to build the FVPs that are publically available
=20
 header:
diff --git a/ci/gcc.yml b/ci/gcc.yml
index 260199ae..1f368c24 100644
--- a/ci/gcc.yml
+++ b/ci/gcc.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
=20
diff --git a/ci/genericarm64.yml b/ci/genericarm64.yml
index fd66bd40..320cfae7 100644
--- a/ci/genericarm64.yml
+++ b/ci/genericarm64.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
   includes:
diff --git a/ci/glibc.yml b/ci/glibc.yml
index 3c9f9eb7..0bfe0261 100644
--- a/ci/glibc.yml
+++ b/ci/glibc.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
=20
diff --git a/ci/juno.yml b/ci/juno.yml
index 552e325f..e812ec80 100644
--- a/ci/juno.yml
+++ b/ci/juno.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
   includes:
diff --git a/ci/linux-yocto-dev.yml b/ci/linux-yocto-dev.yml
index 5ee7afbb..1b8d9768 100644
--- a/ci/linux-yocto-dev.yml
+++ b/ci/linux-yocto-dev.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
=20
diff --git a/ci/linux-yocto-rt.yml b/ci/linux-yocto-rt.yml
index 65a276c1..9430cce5 100644
--- a/ci/linux-yocto-rt.yml
+++ b/ci/linux-yocto-rt.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
=20
diff --git a/ci/linux-yocto.yml b/ci/linux-yocto.yml
index e9ccdcb2..22d57f25 100644
--- a/ci/linux-yocto.yml
+++ b/ci/linux-yocto.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
=20
diff --git a/ci/meta-openembedded.yml b/ci/meta-openembedded.yml
index 743fdde5..499216bf 100644
--- a/ci/meta-openembedded.yml
+++ b/ci/meta-openembedded.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
=20
diff --git a/ci/meta-secure-core.yml b/ci/meta-secure-core.yml
index 2d9fc2c5..b34562b2 100644
--- a/ci/meta-secure-core.yml
+++ b/ci/meta-secure-core.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
=20
diff --git a/ci/meta-virtualization.yml b/ci/meta-virtualization.yml
index f0f6280e..c0ba70ba 100644
--- a/ci/meta-virtualization.yml
+++ b/ci/meta-virtualization.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
   includes:
diff --git a/ci/musca-b1.yml b/ci/musca-b1.yml
index db2adc9b..1437b8ab 100644
--- a/ci/musca-b1.yml
+++ b/ci/musca-b1.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
   includes:
diff --git a/ci/musca-s1.yml b/ci/musca-s1.yml
index 974badf4..a7fa680c 100644
--- a/ci/musca-s1.yml
+++ b/ci/musca-s1.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
   includes:
diff --git a/ci/musl.yml b/ci/musl.yml
index 641c4709..e20a4af4 100644
--- a/ci/musl.yml
+++ b/ci/musl.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
=20
diff --git a/ci/n1sdp-optee.yml b/ci/n1sdp-optee.yml
index f2b50abf..6de4abae 100644
--- a/ci/n1sdp-optee.yml
+++ b/ci/n1sdp-optee.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
=20
diff --git a/ci/n1sdp-ts.yml b/ci/n1sdp-ts.yml
index 641d3766..b100e240 100644
--- a/ci/n1sdp-ts.yml
+++ b/ci/n1sdp-ts.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
   includes:
diff --git a/ci/n1sdp.yml b/ci/n1sdp.yml
index c1b654d4..2a85d00b 100644
--- a/ci/n1sdp.yml
+++ b/ci/n1sdp.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
   includes:
diff --git a/ci/poky-tiny.yml b/ci/poky-tiny.yml
index f1763010..41f9a39e 100644
--- a/ci/poky-tiny.yml
+++ b/ci/poky-tiny.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
=20
diff --git a/ci/poky.yml b/ci/poky.yml
index d6887a9c..db139dfd 100644
--- a/ci/poky.yml
+++ b/ci/poky.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
=20
diff --git a/ci/qemuarm-secureboot.yml b/ci/qemuarm-secureboot.yml
index 97e99039..c5e855e8 100644
--- a/ci/qemuarm-secureboot.yml
+++ b/ci/qemuarm-secureboot.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
   includes:
diff --git a/ci/qemuarm.yml b/ci/qemuarm.yml
index 18fef52e..31192aee 100644
--- a/ci/qemuarm.yml
+++ b/ci/qemuarm.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
   includes:
diff --git a/ci/qemuarm64-secureboot-ts.yml b/ci/qemuarm64-secureboot-ts.=
yml
index e18ce1a9..adf1f2f8 100644
--- a/ci/qemuarm64-secureboot-ts.yml
+++ b/ci/qemuarm64-secureboot-ts.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
   includes:
diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
index c4943cb6..723f0e65 100644
--- a/ci/qemuarm64-secureboot.yml
+++ b/ci/qemuarm64-secureboot.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
   includes:
diff --git a/ci/qemuarm64.yml b/ci/qemuarm64.yml
index cd03e942..9c696365 100644
--- a/ci/qemuarm64.yml
+++ b/ci/qemuarm64.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
   includes:
diff --git a/ci/qemuarmv5.yml b/ci/qemuarmv5.yml
index c2ff6c84..b0a8bbd2 100644
--- a/ci/qemuarmv5.yml
+++ b/ci/qemuarmv5.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
   includes:
diff --git a/ci/sbsa-ref.yml b/ci/sbsa-ref.yml
index 23680bd1..99e4ed71 100644
--- a/ci/sbsa-ref.yml
+++ b/ci/sbsa-ref.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
   includes:
diff --git a/ci/selftest.yml b/ci/selftest.yml
index e519851c..e36d62c5 100644
--- a/ci/selftest.yml
+++ b/ci/selftest.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
=20
diff --git a/ci/sgi575.yml b/ci/sgi575.yml
index faab716d..e4313820 100644
--- a/ci/sgi575.yml
+++ b/ci/sgi575.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
   includes:
diff --git a/ci/sstate-mirror.yml b/ci/sstate-mirror.yml
index c31b9075..6e4a97eb 100644
--- a/ci/sstate-mirror.yml
+++ b/ci/sstate-mirror.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
=20
diff --git a/ci/testimage.yml b/ci/testimage.yml
index 4b71a5e1..a9b13d9a 100644
--- a/ci/testimage.yml
+++ b/ci/testimage.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
   includes:
diff --git a/ci/tftf.yml b/ci/tftf.yml
index 33a8a4f5..af1c4864 100644
--- a/ci/tftf.yml
+++ b/ci/tftf.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
=20
diff --git a/ci/toolchains.yml b/ci/toolchains.yml
index 056269b2..c323fbe7 100644
--- a/ci/toolchains.yml
+++ b/ci/toolchains.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
   includes:
diff --git a/ci/u-boot.yml b/ci/u-boot.yml
index c693b8b0..be59543b 100644
--- a/ci/u-boot.yml
+++ b/ci/u-boot.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
=20
diff --git a/ci/xen.yml b/ci/xen.yml
index f4a8f9a4..d855369a 100644
--- a/ci/xen.yml
+++ b/ci/xen.yml
@@ -1,3 +1,5 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
 header:
   version: 14
   includes:
--=20
2.34.1


