Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75781C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 10:56:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.5827.1644576973020084783
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 02:56:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B1D71042
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 02:56:12 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF2A23F73B
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 02:56:11 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/5] CI: build perf via CORE_IMAGE_EXTRA_INSTALL
Date: Fri, 11 Feb 2022 10:56:04 +0000
Message-Id: <20220211105608.2483647-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 10:56:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2981

Instead of adding perf to the target: list, add it to
CORE_IMAGE_EXTRA_INSTALL. This means that machine configurations which
need to change the target don't need to also build perf explicitly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml                 | 4 ++--
 ci/gem5-arm64.yml           | 1 -
 ci/qemu-generic-arm64.yml   | 1 -
 ci/qemuarm64-secureboot.yml | 1 -
 ci/tc0.yml                  | 1 -
 ci/tc1.yml                  | 1 -
 6 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/ci/base.yml b/ci/base.yml
index 795bd11f..6c2f8df1 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -40,9 +40,9 @@ local_conf_header:
     DISTRO_FEATURES:remove =3D "ptest"
   kvm: |
     QEMU_USE_KVM =3D ""
-
+  perf: |
+    CORE_IMAGE_EXTRA_INSTALL +=3D "perf"
 machine: unset
=20
 target:
   - core-image-base
-  - perf
diff --git a/ci/gem5-arm64.yml b/ci/gem5-arm64.yml
index 8b8e66ba..90913f37 100644
--- a/ci/gem5-arm64.yml
+++ b/ci/gem5-arm64.yml
@@ -13,5 +13,4 @@ machine: gem5-arm64
=20
 target:
   - core-image-minimal
-  - perf
   - gem5-aarch64-native
diff --git a/ci/qemu-generic-arm64.yml b/ci/qemu-generic-arm64.yml
index 2b7b839c..87cbd2f8 100644
--- a/ci/qemu-generic-arm64.yml
+++ b/ci/qemu-generic-arm64.yml
@@ -11,5 +11,4 @@ machine: qemu-generic-arm64
=20
 target:
   - core-image-base
-  - perf
   - sbsa-acs
diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
index d06514d0..acc65303 100644
--- a/ci/qemuarm64-secureboot.yml
+++ b/ci/qemuarm64-secureboot.yml
@@ -12,7 +12,6 @@ local_conf_header:
=20
 target:
   - core-image-base
-  - perf
   - optee-examples
   - optee-test
   - optee-spdevkit
diff --git a/ci/tc0.yml b/ci/tc0.yml
index dd94d874..b2f75d55 100644
--- a/ci/tc0.yml
+++ b/ci/tc0.yml
@@ -7,4 +7,3 @@ machine: tc0
=20
 target:
   - tc-artifacts-image
-  - perf
diff --git a/ci/tc1.yml b/ci/tc1.yml
index 987e5248..fd9acbd2 100644
--- a/ci/tc1.yml
+++ b/ci/tc1.yml
@@ -7,4 +7,3 @@ machine: tc1
=20
 target:
   - tc-artifacts-image
-  - perf
--=20
2.25.1


