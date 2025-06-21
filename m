Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B154AC71157
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 13:27:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7210.1750512460511815391
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 21 Jun 2025 06:27:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB3971692;
	Sat, 21 Jun 2025 06:27:20 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A41E93F673;
	Sat, 21 Jun 2025 06:27:39 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: "Robert P . J . Day" <rpjday@crashcourse.ca>
Subject: [PATCH 2/2] arm-bsp/trusted-firmware-a: fvp-base prepend fixes
Date: Sat, 21 Jun 2025 09:27:38 -0400
Message-Id: <20250621132738.83559-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250621132738.83559-1-jon.mason@arm.com>
References: <20250621132738.83559-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 21 Jun 2025 13:27:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6576

FILESEXTRAPATHS that have a prepend should have a trailing ':' to allow
for the follow-on modifications to the string.  Add it here where
necessary.

Signed-off-by: Jon Mason <jon.mason@arm.com>
Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
---
 .../trusted-firmware-a/trusted-firmware-a-fvp-base.inc          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-fvp-base.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a-fvp-base.inc
index bdf51f641e51..32e9dd7d9511 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-=
base.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-=
base.inc
@@ -4,7 +4,7 @@
 # Armv8-A Base Platform FVP
 #
=20
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/:${THISDIR}/files/fvp-bas=
e"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/:${THISDIR}/files/fvp-bas=
e:"
=20
 SRC_URI:append =3D " \
     file://optee_spmc_maifest.dts;subdir=3Dgit/plat/arm/board/fvp/fdts \
--=20
2.39.5 (Apple Git-154)


