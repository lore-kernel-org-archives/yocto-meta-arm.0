Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F4DC7EE32
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 20:06:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.481.1685045168618991762
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 25 May 2023 13:06:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93CCA1042
	for <meta-arm@lists.yoctoproject.org>; Thu, 25 May 2023 13:06:52 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 55CE43F67D
	for <meta-arm@lists.yoctoproject.org>; Thu, 25 May 2023 13:06:07 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/5] CI: move FVP license auto-accept to fvp.yml
Date: Thu, 25 May 2023 15:05:58 -0500
Message-Id: <20230525200602.3277592-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 25 May 2023 20:06:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4707

It is only necessary to accept the FVP usage license when using FVPs.
So, move that to the fvp.yml file from the base.yml file to make things
a little cleaner.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/base.yml               | 1 -
 ci/fvp-baser-aemv8r64.yml | 2 +-
 ci/fvp.yml                | 3 ++-
 ci/fvps.yml               | 2 ++
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/ci/base.yml b/ci/base.yml
index a724db65..26fbb602 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -27,7 +27,6 @@ env:
 local_conf_header:
   base: |
     CONF_VERSION =3D "2"
-    LICENSE_FLAGS_ACCEPTED +=3D "Arm-FVP-EULA"
   setup: |
     PACKAGE_CLASSES =3D "package_ipk"
     PACKAGECONFIG:remove:pn-qemu-system-native =3D "gtk+ sdl"
diff --git a/ci/fvp-baser-aemv8r64.yml b/ci/fvp-baser-aemv8r64.yml
index 40818bc6..cfaf9ef2 100644
--- a/ci/fvp-baser-aemv8r64.yml
+++ b/ci/fvp-baser-aemv8r64.yml
@@ -2,6 +2,6 @@ header:
   version: 11
   includes:
     - ci/base.yml
+    - ci/fvp.yml
=20
 machine: fvp-baser-aemv8r64
-
diff --git a/ci/fvp.yml b/ci/fvp.yml
index a8f8dfc0..3803d8ca 100644
--- a/ci/fvp.yml
+++ b/ci/fvp.yml
@@ -3,9 +3,10 @@ header:
=20
 local_conf_header:
   testimagefvp: |
+    LICENSE_FLAGS_ACCEPTED +=3D "Arm-FVP-EULA"
     INHERIT +=3D "fvpboot"
+  failing_tests: |
     # This fails but we can't add to the ignorelist from meta-arm yet
     # https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14604
     TEST_SUITES:remove =3D "parselogs"
-  failing_tests: |
     TEST_SUITES:remove =3D "xorg"
diff --git a/ci/fvps.yml b/ci/fvps.yml
index 58c29d53..44c153ab 100644
--- a/ci/fvps.yml
+++ b/ci/fvps.yml
@@ -8,6 +8,8 @@ header:
 machine: qemuarm64
=20
 local_conf_header:
+  license: |
+    LICENSE_FLAGS_ACCEPTED +=3D "Arm-FVP-EULA"
   sdk: |
     SDKMACHINE =3D "x86_64"
=20
--=20
2.30.2


