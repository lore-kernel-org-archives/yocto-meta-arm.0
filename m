Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E5F6CFB43F
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 14:11:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.54034.1728310271361329250
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Oct 2024 07:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9764DA7
	for <meta-arm@lists.yoctoproject.org>; Mon,  7 Oct 2024 07:11:39 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 19BB43F64C
	for <meta-arm@lists.yoctoproject.org>; Mon,  7 Oct 2024 07:11:10 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: Rework qemuarm64-secureboot matrix
Date: Mon,  7 Oct 2024 10:11:09 -0400
Message-Id: <20241007141109.11362-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Oct 2024 14:11:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6177

qemuarm64-secureboot is using systemd for uefi-secureboot, which has
warnings with musl (and fails to compile with clang and musl).  So,
modify the matrix to keep the coverage of everything else but musl.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fcdae9f4ab8c..f211ea97c708 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -263,6 +263,9 @@ qemuarm64-secureboot:
       - KERNEL: [linux-yocto, linux-yocto-rt]
         TOOLCHAINS: [gcc, clang]
         TCLIBC: [glibc, musl]
+        TS: [none, qemuarm64-secureboot-ts]
+        TESTING: testimage
+      - TOOLCHAINS: [gcc, clang]
         TS: [none, qemuarm64-secureboot-ts]
         UEFISB: [none, uefi-secureboot]
         TESTING: testimage
--=20
2.39.5 (Apple Git-154)


