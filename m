Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF6BC433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 11:20:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.6028.1644578438601283770
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 03:20:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3158C1042
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 03:20:38 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DFF93F73B
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 03:20:37 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: consolidate target in meta-zephyr.yml
Date: Fri, 11 Feb 2022 11:20:35 +0000
Message-Id: <20220211112035.2486405-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 11:20:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2986

Set a default target in meta-zephyr.yml to avoid duplication now that
most configurations build zephyr-kernel-test-all.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/meta-zephyr.yml     | 3 +++
 ci/microbit-v1.yml     | 3 ---
 ci/qemu-cortex-a53.yml | 3 ---
 ci/qemu-cortex-m3.yml  | 3 ---
 ci/qemu-cortex-r5.yml  | 3 ---
 5 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/ci/meta-zephyr.yml b/ci/meta-zephyr.yml
index 20d54649..bdd0e2bb 100644
--- a/ci/meta-zephyr.yml
+++ b/ci/meta-zephyr.yml
@@ -8,3 +8,6 @@ repos:
     url: https://git.yoctoproject.org/git/meta-zephyr
     layers:
       meta-zephyr-core:
+
+target:
+  - zephyr-kernel-test-all
diff --git a/ci/microbit-v1.yml b/ci/microbit-v1.yml
index d00ee6ac..d78af2b2 100644
--- a/ci/microbit-v1.yml
+++ b/ci/microbit-v1.yml
@@ -9,6 +9,3 @@ local_conf_header:
     ZEPHYRTESTS:remove =3D "common"
=20
 machine: microbit-v1
-
-target:
-  - zephyr-kernel-test-all
diff --git a/ci/qemu-cortex-a53.yml b/ci/qemu-cortex-a53.yml
index db8bdd80..3eec5801 100644
--- a/ci/qemu-cortex-a53.yml
+++ b/ci/qemu-cortex-a53.yml
@@ -7,6 +7,3 @@ header:
 # FIXME - testimage fails all tests currently, but all the tests build
=20
 machine: qemu-cortex-a53
-
-target:
-  - zephyr-kernel-test-all
diff --git a/ci/qemu-cortex-m3.yml b/ci/qemu-cortex-m3.yml
index 85bbfc66..8a96037c 100644
--- a/ci/qemu-cortex-m3.yml
+++ b/ci/qemu-cortex-m3.yml
@@ -16,6 +16,3 @@ local_conf_header:
     ZEPHYRTESTS:remove =3D "context pending sleep"
=20
 machine: qemu-cortex-m3
-
-target:
-  - zephyr-kernel-test-all
diff --git a/ci/qemu-cortex-r5.yml b/ci/qemu-cortex-r5.yml
index 474edc2b..cfcb7b93 100644
--- a/ci/qemu-cortex-r5.yml
+++ b/ci/qemu-cortex-r5.yml
@@ -9,6 +9,3 @@ local_conf_header:
     ZEPHYRTESTS:remove =3D "common poll sleep queue device"
=20
 machine: qemu-cortex-r5
-
-target:
-  - zephyr-kernel-test-all
--=20
2.25.1


