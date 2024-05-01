Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FDD4C41513
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 12:32:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11414.1714566715580771727
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 May 2024 05:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B59E339
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 May 2024 05:32:21 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1AEAF3F73F
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 May 2024 05:31:55 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/4] arm/boot-wrapper-aarch64: add to fvp-base CI
Date: Wed,  1 May 2024 08:31:52 -0400
Message-Id: <20240501123154.62576-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240501123154.62576-1-jon.mason@arm.com>
References: <20240501123154.62576-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 May 2024 12:32:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5681

Add boot-wrapper-aarch64 to fvp-base CI so that it can be
covered by CI and added to the update-report

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/fvp-base.yml                                               | 4 ++++
 .../boot-wrapper-aarch64/boot-wrapper-aarch64_%.bbappend      | 1 +
 2 files changed, 5 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wr=
apper-aarch64_%.bbappend

diff --git a/ci/fvp-base.yml b/ci/fvp-base.yml
index d71d33e4e449..bbc6c44db3be 100644
--- a/ci/fvp-base.yml
+++ b/ci/fvp-base.yml
@@ -7,3 +7,7 @@ header:
     - ci/fvp.yml
=20
 machine: fvp-base
+
+target:
+  - core-image-sato
+  - boot-wrapper-aarch64
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-a=
arch64_%.bbappend b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wr=
apper-aarch64_%.bbappend
new file mode 100644
index 000000000000..0e2812eab52d
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_=
%.bbappend
@@ -0,0 +1 @@
+COMPATIBLE_MACHINE:fvp-base =3D "fvp-base"
--=20
2.39.3 (Apple Git-146)


