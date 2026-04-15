Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 084D4F433C2
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 21:10:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5765.1776287422508832426
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Apr 2026 14:10:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=EyK2alam;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CC8B2BCB
	for <meta-arm@lists.yoctoproject.org>; Wed, 15 Apr 2026 14:10:16 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 628473F7B4
	for <meta-arm@lists.yoctoproject.org>; Wed, 15 Apr 2026 14:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776287421; bh=R1yH6gxIS5pNiyCw0QemFO2DZIvmm6AuA2m8CtcTQLI=;
	h=From:To:Subject:Date:From;
	b=EyK2alambTLaswVXKE1Z6GnlVZxqacqh7qlMMBv3mVq26n3bLezrH+25bs5lK+E4K
	 +rAuxFWYPXGk5/4BzUvAyAmQ6r6E585bqO3BW1nTKjI3HEzsdXEf8VmDVYVoIA+Q8m
	 2IWp3u0XhVG5cGew7gf1j42S7wQi5t5vi4oEnocE=
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] CI: remove Xen jobs
Date: Wed, 15 Apr 2026 22:10:16 +0100
Message-ID: <20260415211017.2408020-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 15 Apr 2026 21:10:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7016

We originally added Xen builds to our CI to exercise Xen on Arm. Now
that the Yocto autobuilder has jobs that test Xen on qemuarm/qemuarm64
we no longer need the builds in meta-arm as they don't provide any more
coverage.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml |  3 ---
 ci/xen.yml     | 16 ----------------
 2 files changed, 19 deletions(-)
 delete mode 100644 ci/xen.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 2950e873df..1e492cd4f4 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -127,7 +127,6 @@ update-repos:
 #  TS: [none, trusted-services]
 #  TESTING: testimage
 #  SECUREDEBUG: [none, secure-debug]
-#  VIRT: [none, xen]
=20
 # Validate layers are Yocto Project Compatible
 check-layers:
@@ -272,7 +271,6 @@ qemuarm64:
       - DISTRO: poky-tiny
         FIRMWARE: [u-boot, edk2]
         TESTING: testimage
-      - VIRT: xen
=20
 qemuarm-secureboot:
   extends: .build
@@ -294,7 +292,6 @@ qemuarm:
         TESTING: testimage
       - DISTRO: poky-tiny
         TESTING: testimage
-      - VIRT: xen
=20
 qemuarmv5:
   extends: .build
diff --git a/ci/xen.yml b/ci/xen.yml
deleted file mode 100644
index 9b08d01d62..0000000000
--- a/ci/xen.yml
+++ /dev/null
@@ -1,16 +0,0 @@
-# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
-
-header:
-  version: 14
-  includes:
-    - ci/meta-virtualization.yml
-    - ci/poky-altcfg.yml
-
-local_conf_header:
-  meta-virt: |
-    DISTRO_FEATURES:append =3D " virtualization xen"
-  sshd: |
-    IMAGE_FEATURES:append =3D " ssh-server-openssh"
-
-target:
-  - xen-image-minimal
--=20
2.43.0


