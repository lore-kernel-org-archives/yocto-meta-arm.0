Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 865871062882
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 12:12:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19947.1773231165942196920
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Mar 2026 05:12:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 411C2169C
	for <meta-arm@lists.yoctoproject.org>; Wed, 11 Mar 2026 05:12:39 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 50E8A3F836
	for <meta-arm@lists.yoctoproject.org>; Wed, 11 Mar 2026 05:12:45 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/5] arm-bsp/trusted-firmware-a: remove unnecessary FILESEXTRAPATHS
Date: Wed, 11 Mar 2026 08:12:40 -0400
Message-ID: <20260311121244.72838-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260311121244.72838-1-jon.mason@arm.com>
References: <20260311121244.72838-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 11 Mar 2026 12:12:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6947

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a_%.bbappend            | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_%.bbappend
index 01ce095ef225..5b4043e87bea 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bb=
append
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bb=
append
@@ -1,5 +1,3 @@
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/:"
-
 # Machine specific TFAs
=20
 MACHINE_TFA_REQUIRE ?=3D ""
--=20
2.50.1 (Apple Git-155)


