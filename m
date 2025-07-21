Return-Path: <frazer.carsley@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4141C83F25
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 11:45:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.38312.1753098320346909948
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Jul 2025 04:45:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: frazer.carsley@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5957153B;
	Mon, 21 Jul 2025 04:45:13 -0700 (PDT)
Received: from e138143.arm.com (unknown [10.57.53.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 02C4A3F6A8;
	Mon, 21 Jul 2025 04:45:18 -0700 (PDT)
From: Frazer Carsley <frazer.carsley@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Frazer Carsley <frazer.carsley@arm.com>
Subject: [PATCH 1/3] arm/optee: Updates upstream status.
Date: Mon, 21 Jul 2025 12:45:03 +0100
Message-ID: <20250721114506.120457-2-frazer.carsley@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250721114506.120457-1-frazer.carsley@arm.com>
References: <20250721114506.120457-1-frazer.carsley@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Jul 2025 11:45:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6617

Patch "0003-optee-enable-clang-support" is no longer appropriate as the
feature the patch provides is no longer required.

Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
---
 .../0001-tee-supplicant-update-udev-systemd-install-code.patch  | 2 +-
 .../optee/optee-os/0003-optee-enable-clang-support.patch        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee-client/0001-tee-suppli=
cant-update-udev-systemd-install-code.patch b/meta-arm/recipes-security/o=
ptee/optee-client/0001-tee-supplicant-update-udev-systemd-install-code.pa=
tch
index d243f297..cd367124 100644
--- a/meta-arm/recipes-security/optee/optee-client/0001-tee-supplicant-up=
date-udev-systemd-install-code.patch
+++ b/meta-arm/recipes-security/optee/optee-client/0001-tee-supplicant-up=
date-udev-systemd-install-code.patch
@@ -10,7 +10,7 @@ Subject: [PATCH 1/1] tee-supplicant: update udev & syst=
emd install code
=20
 Changes are backwards compatible and the default operation is unchanged.
=20
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/OP-TEE/optee_client/pull/=
402]
=20
 Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
 ---
diff --git a/meta-arm/recipes-security/optee/optee-os/0003-optee-enable-c=
lang-support.patch b/meta-arm/recipes-security/optee/optee-os/0003-optee-=
enable-clang-support.patch
index 253a01db..abc6d13e 100644
--- a/meta-arm/recipes-security/optee/optee-os/0003-optee-enable-clang-su=
pport.patch
+++ b/meta-arm/recipes-security/optee/optee-os/0003-optee-enable-clang-su=
pport.patch
@@ -7,7 +7,7 @@ When compiling with clang, the LIBGCC_LOCATE_CFLAG variab=
le used
 to provide a sysroot wasn't included, which results in not locating
 compiler-rt. This is mitigated by including the variable as ammended.
=20
-Upstream-Status: Pending
+Upstream-Status: Inappropriate
 ChangeId: 8ba69a4b2eb8ebaa047cb266c9aa6c2c3da45701
 Signed-off-by: Brett Warren <brett.warren@arm.com>
 ---

