Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3724ECA1002
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 17:11:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.266.1757005856017675212
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Sep 2025 10:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 178821596
	for <meta-arm@lists.yoctoproject.org>; Thu,  4 Sep 2025 10:10:47 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 017463F6A8
	for <meta-arm@lists.yoctoproject.org>; Thu,  4 Sep 2025 10:10:54 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] CI: move network test skips to fvp.yml
Date: Thu,  4 Sep 2025 18:10:49 +0100
Message-ID: <20250904171050.2370998-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 04 Sep 2025 17:11:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6687

testimage.yml was skipping the opkg tests, but we also need to skip the
dnf tests for when PACKAGE_CLASSES=3D"package_rpm".

These skips are FVP-specific as they are due to the wrong IP being used
by the test suite. This should be fixed in the FVP test harness, but
for now move the exclusions into fvp.yml so they're isolated.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/fvp.yml       | 3 +++
 ci/testimage.yml | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/ci/fvp.yml b/ci/fvp.yml
index 667bb64109..30b09e40dc 100644
--- a/ci/fvp.yml
+++ b/ci/fvp.yml
@@ -7,3 +7,6 @@ local_conf_header:
   testimagefvp: |
     LICENSE_FLAGS_ACCEPTED +=3D "Arm-FVP-EULA"
     IMAGE_CLASSES +=3D "fvpboot"
+  networking_failing_tests: |
+    # These tests currently fail as the wrong IP for the build host is u=
sed
+    TEST_SUITES:remove =3D "opkg dnf"
diff --git a/ci/testimage.yml b/ci/testimage.yml
index a9b13d9a78..afc53ed45c 100644
--- a/ci/testimage.yml
+++ b/ci/testimage.yml
@@ -17,5 +17,3 @@ local_conf_header:
     IMAGE_FEATURES +=3D "ssh-server-dropbear"
   sshkeys: |
     CORE_IMAGE_EXTRA_INSTALL +=3D "ssh-pregen-hostkeys"
-  universally_failing_tests: |
-    TEST_SUITES:remove =3D "opkg"
--=20
2.43.0


