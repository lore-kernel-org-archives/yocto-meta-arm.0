Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84180C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 13:49:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.5508.1648216138111208929
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 25 Mar 2022 06:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9331412FC
	for <meta-arm@lists.yoctoproject.org>; Fri, 25 Mar 2022 06:48:59 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4719C3F73B
	for <meta-arm@lists.yoctoproject.org>; Fri, 25 Mar 2022 06:48:59 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 7/7] CI: run testimage on fvp-base-arm32
Date: Fri, 25 Mar 2022 13:48:53 +0000
Message-Id: <20220325134853.3068169-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220325134853.3068169-1-ross.burton@arm.com>
References: <20220325134853.3068169-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 25 Mar 2022 13:49:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3211

Now that virtio networking is up, testimage works.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml        |  3 +++
 ci/fvp-base-arm32.yml | 10 ++++++++++
 2 files changed, 13 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7883d35f..6d24e0d9 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -92,6 +92,9 @@ fvp-base-arm32:
   parallel:
     matrix:
       - TOOLCHAINS: [gcc, external-gccarm]
+        TESTING: testimage
+  tags:
+    - x86_64
=20
 fvp-baser-aemv8r64:
   extends: .build
diff --git a/ci/fvp-base-arm32.yml b/ci/fvp-base-arm32.yml
index 162c2f6f..85e56307 100644
--- a/ci/fvp-base-arm32.yml
+++ b/ci/fvp-base-arm32.yml
@@ -4,3 +4,13 @@ header:
     - ci/base.yml
=20
 machine: fvp-base-arm32
+
+local_conf_header:
+  testimagefvp: |
+    INHERIT =3D "fvpboot"
+    # This fails but we can't add to the ignorelist from meta-arm yet
+    # https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14604
+    TEST_SUITES:remove =3D "parselogs"
+    # Tell testimage to connect to localhost:8122, and forward that to S=
SH in the FVP.
+    TEST_TARGET_IP =3D "127.0.0.1:8122"
+    FVP_CONFIG[bp.virtio_net.hostbridge.userNetPorts] =3D "8122=3D22"
--=20
2.25.1


