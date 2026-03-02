Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA9AEA4E33
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 16:06:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.164049.1772467596624045209
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 08:06:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3A89152B
	for <meta-arm@lists.yoctoproject.org>; Mon,  2 Mar 2026 08:06:29 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 076333F85F
	for <meta-arm@lists.yoctoproject.org>; Mon,  2 Mar 2026 08:06:35 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] CI: add LTS versions for testing
Date: Mon,  2 Mar 2026 11:06:34 -0500
Message-ID: <20260302160634.41221-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260302160634.41221-1-jon.mason@arm.com>
References: <20260302160634.41221-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 02 Mar 2026 16:06:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6930

Add a CI test for the LTS versions of recipes currently supported.
Use fvp-base, since that provides good coverage and is being used for
the latest version testing.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml       |  2 ++
 ci/lts-revisions.yml | 10 ++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 ci/lts-revisions.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 3d2c3e11e5f1..f1a4fdc38240 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -190,6 +190,8 @@ fvp-base:
         TESTING: testimage
       - FIRMWARE: [u-boot, edk2]
         TESTING: testimage
+      - LTS: lts-revisions
+        TESTING: testimage
       - KERNEL: linux-yocto-dev
         LATEST: latest-revisions
         TESTING: testimage
diff --git a/ci/lts-revisions.yml b/ci/lts-revisions.yml
new file mode 100644
index 000000000000..2cb7a6bc3411
--- /dev/null
+++ b/ci/lts-revisions.yml
@@ -0,0 +1,10 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
+header:
+  version: 14
+
+local_conf_header:
+  latest_revisions: |
+    PREFERRED_VERSION_trusted-firmware-a ?=3D "2.10.%"
+    PREFERRED_VERSION_tf-a-tests ?=3D "2.10.%"
+    PREFERRED_VERSION_trusted-firmware-m ?=3D "2.1.%"
--=20
2.50.1 (Apple Git-155)


