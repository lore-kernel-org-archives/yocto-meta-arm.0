Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4CEAC6FD1F
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 13:20:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14903.1678195196669704768
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Mar 2023 05:19:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 138282F4
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 Mar 2023 05:20:39 -0800 (PST)
Received: from jdm-VirtualBox.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 83B513F71A
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 Mar 2023 05:19:55 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] CI: add yml files for defaults
Date: Mon,  6 Mar 2023 15:50:45 -0500
Message-Id: <20230306205046.472156-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 Mar 2023 13:20:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4476

Make things more obvious by adding yml files for the poky defaults
instead of disregarding them in the jobs-to-kas script

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml | 11 ++++++-----
 ci/clang.yml   |  2 +-
 ci/gcc.yml     |  7 +++++++
 ci/glibc.yml   |  7 +++++++
 ci/jobs-to-kas |  2 +-
 ci/u-boot.yml  |  8 ++++++++
 6 files changed, 30 insertions(+), 7 deletions(-)
 create mode 100644 ci/gcc.yml
 create mode 100644 ci/glibc.yml
 create mode 100644 ci/u-boot.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 75d36094..d5c82dd1 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -72,7 +72,8 @@ update-repos:
 # Available options for building are
 #  TOOLCHAINS: [gcc, clang, armgcc, external-gccarm]
 #  TCLIBC: [glibc, musl]
-#  FIRMWARE: [uboot, edk2]
+#  FIRMWARE: [u-boot, edk2]
+#  TS: [none, trusted-services]
 #  VIRT: [none, xen]
 #  TESTING: testimage
=20
@@ -88,7 +89,7 @@ corstone1000-fvp:
   extends: .build
   parallel:
     matrix:
-      - TESTING: [testimage,tftf]
+      - TESTING: [testimage, tftf]
   tags:
     - x86_64
=20
@@ -127,7 +128,7 @@ juno:
   parallel:
     matrix:
       - TOOLCHAINS: [gcc, clang]
-        FIRMWARE: [uboot, edk2]
+        FIRMWARE: [u-boot, edk2]
=20
 musca-b1:
   extends: .build
@@ -163,7 +164,7 @@ qemuarm64:
   parallel:
     matrix:
       - TOOLCHAINS: [gcc, clang]
-        EFI: [uboot, edk2]
+        FIRMWARE: [u-boot, edk2]
         TESTING: testimage
       - VIRT: xen
=20
@@ -179,7 +180,7 @@ qemuarm:
   parallel:
     matrix:
       - TOOLCHAINS: [gcc, clang]
-        EFI: [uboot, edk2]
+        FIRMWARE: [u-boot, edk2]
         TESTING: testimage
       - VIRT: xen
=20
diff --git a/ci/clang.yml b/ci/clang.yml
index a2063f19..7559f6b0 100644
--- a/ci/clang.yml
+++ b/ci/clang.yml
@@ -6,5 +6,5 @@ repos:
     url: https://github.com/kraj/meta-clang
=20
 local_conf_header:
-  clang: |
+  toolchain: |
     TOOLCHAIN =3D "clang"
diff --git a/ci/gcc.yml b/ci/gcc.yml
new file mode 100644
index 00000000..a3943680
--- /dev/null
+++ b/ci/gcc.yml
@@ -0,0 +1,7 @@
+header:
+  version: 11
+
+#NOTE: This is the default for poky.  This is only being added for compl=
eteness/clarity
+local_conf_header:
+  toolchain: |
+    TOOLCHAIN =3D "gcc"
diff --git a/ci/glibc.yml b/ci/glibc.yml
new file mode 100644
index 00000000..adc85a76
--- /dev/null
+++ b/ci/glibc.yml
@@ -0,0 +1,7 @@
+header:
+  version: 11
+
+#NOTE: This is the default for poky.  This is only being added for compl=
eteness/clarity
+local_conf_header:
+  libc: |
+    TCLIBC =3D "glibc"
diff --git a/ci/jobs-to-kas b/ci/jobs-to-kas
index d6896b77..b8615a5f 100755
--- a/ci/jobs-to-kas
+++ b/ci/jobs-to-kas
@@ -18,7 +18,7 @@ for i in $(echo $1 | cut -s -d ':' -f 2 | sed 's/[][,]/=
/g'); do
 	# defaults, we can simply ignore those parameters.  They are necessary
 	# to pass in so that matrix can correctly setup all of the permutations
 	# of each individual run.
-	if [[ $i =3D=3D 'none' || $i =3D=3D 'gcc' || $i =3D=3D 'glibc' || $i =3D=
=3D 'uboot' ]]; then
+	if [[ $i =3D=3D 'none' ]]; then
 		continue
 	fi
 	FILES+=3D":ci/$i.yml"
diff --git a/ci/u-boot.yml b/ci/u-boot.yml
new file mode 100644
index 00000000..76bdd23e
--- /dev/null
+++ b/ci/u-boot.yml
@@ -0,0 +1,8 @@
+header:
+  version: 11
+
+local_conf_header:
+  bootfirmware: |
+    PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot"
+    TFA_UBOOT =3D "1"
+    TFA_UEFI =3D "0"
--=20
2.25.1


