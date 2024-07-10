Return-Path: <amr.mohamed@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD2D2C3DA45
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 12:09:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12810.1720613378326545635
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Jul 2024 05:09:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: amr.mohamed@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 002CF106F;
	Wed, 10 Jul 2024 05:10:03 -0700 (PDT)
Received: from e125330.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 00ACE3F762;
	Wed, 10 Jul 2024 05:09:36 -0700 (PDT)
From: amr.mohamed@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Amr Mohamed <amr.mohamed@arm.com>
Subject: [PATCH] arm-systemready/README.md: add ARM_FVP_EULA_ACCEPT
Date: Wed, 10 Jul 2024 13:09:27 +0100
Message-Id: <20240710120927.2204506-1-amr.mohamed@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 10 Jul 2024 12:09:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5879

From: Amr Mohamed <amr.mohamed@arm.com>

Update README.md file to add "ARM_FVP_EULA_ACCEPT=3D1"
with kas build commands.

Signed-off-by: Amr Mohamed <amr.mohamed@arm.com>
---
 meta-arm-systemready/README.md | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-systemready/README.md b/meta-arm-systemready/README=
.md
index 49cfed6e..73cd188d 100644
--- a/meta-arm-systemready/README.md
+++ b/meta-arm-systemready/README.md
@@ -83,18 +83,18 @@ Currently, this layer only supports
 To build the firmware for Arm SystemReady on the supported machines (tak=
e the
 `fvp-base` machine as an example):
=20
-    kas build kas/fvp-base.yml:kas/arm-systemready-firmware.yml
+    ARM_FVP_EULA_ACCEPT=3D1 kas build kas/fvp-base.yml:kas/arm-systemrea=
dy-firmware.yml
=20
=20
 To run the Arm SystemReady ACS tests on the supported machines (take run=
ning
 Arm SystemReady IR on the `fvp-base` machine as an example):
=20
-    kas build kas/fvp-base.yml:kas/arm-systemready-ir-acs.yml
+    ARM_FVP_EULA_ACCEPT=3D1 kas build kas/fvp-base.yml:kas/arm-systemrea=
dy-ir-acs.yml
=20
 To run the Linux distributions installation on the supported machines (t=
ake
 installing openSUSE on the `fvp-base` machine as an example):
=20
-    kas build kas/fvp-base.yml:kas/arm-systemready-linux-distros-opensus=
e.yml
+    ARM_FVP_EULA_ACCEPT=3D1 kas build kas/fvp-base.yml:kas/arm-systemrea=
dy-linux-distros-opensuse.yml
=20
     kas shell \
         kas/fvp-base.yml:kas/arm-systemready-linux-distros-opensuse.yml =
\
--=20
2.25.1


