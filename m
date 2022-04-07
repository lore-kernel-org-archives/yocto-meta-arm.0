Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64375C46467
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.404.1649347770159843561
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Apr 2022 09:09:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBF1212FC
	for <meta-arm@lists.yoctoproject.org>; Thu,  7 Apr 2022 09:09:30 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89B0E3F73B
	for <meta-arm@lists.yoctoproject.org>; Thu,  7 Apr 2022 09:09:30 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 7/7] CI: run more tests for qemuarm64-secureboot
Date: Thu,  7 Apr 2022 17:09:25 +0100
Message-Id: <20220407160925.3809765-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407160925.3809765-1-ross.burton@arm.com>
References: <20220407160925.3809765-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3261

Not that we're not forcing TAP networking the SSH connections work, so
we can run the full test suite.

We have to skip parselogs currently as there is an error:

  software IO TLB: Cannot allocate buffer

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/qemuarm64-secureboot.yml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
index acc65303..7e15a76b 100644
--- a/ci/qemuarm64-secureboot.yml
+++ b/ci/qemuarm64-secureboot.yml
@@ -6,13 +6,13 @@ header:
 machine: qemuarm64-secureboot
=20
 local_conf_header:
-  bugs: |
-    # Only ping until errors can be resolved
-    TEST_SUITES =3D "ping"
+  failing_tests: |
+    # software IO TLB: Cannot allocate buffer
+    DEFAULT_TEST_SUITES:remove =3D "parselogs"
=20
 target:
   - core-image-base
   - optee-examples
   - optee-test
   - optee-spdevkit
-  - optee-os-tadevkit
\ No newline at end of file
+  - optee-os-tadevkit
--=20
2.25.1


