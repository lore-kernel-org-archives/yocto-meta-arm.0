Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B36C5321C
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 18:37:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15591.1785091040855440933
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 26 Jul 2026 11:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=h/fskgtj;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B2DE1477
	for <meta-arm@lists.yoctoproject.org>; Sun, 26 Jul 2026 11:37:16 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3BB913F66F
	for <meta-arm@lists.yoctoproject.org>; Sun, 26 Jul 2026 11:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785091040; bh=BIAQ/xW4l0s9PaPlWhAXZrQnJwVvQZIygDPe8dJgUyg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=h/fskgtjEYHkwqmfPdf5MJo1necMwaR1O95nZaQpHyYcmWUWLoxO7I3u0TbA8rQkY
	 OQkSdJe924HBt6XHl3+yxlHbZLnvNJcGZIcqqFKgCoappv1LWPPSYf1vdC+bl3rAR6
	 O61ze+ty06vicdLNqgkt+SxFxbCPprMNMk2DM6YY=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm-bsp/external-system: update HOMEPAGE
Date: Sun, 26 Jul 2026 14:37:18 -0400
Message-ID: <20260726183718.76060-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260726183718.76060-1-jon.mason@arm.com>
References: <20260726183718.76060-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 26 Jul 2026 18:37:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7130

The HOMEPAGE variable was not updated when the SRC_URI was and it no
longer points to a valid webpage.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/recipes-bsp/external-system/external-system_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-bsp/external-system/external-system_git=
.bb b/meta-arm-bsp/recipes-bsp/external-system/external-system_git.bb
index 87a8a34886b8..576bd50c1840 100644
--- a/meta-arm-bsp/recipes-bsp/external-system/external-system_git.bb
+++ b/meta-arm-bsp/recipes-bsp/external-system/external-system_git.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "External system Cortex-M3 Firmware"
 DESCRIPTION =3D "Firmware to be loaded and run in External System Harnes=
s in\
                support to the main application CPU."
-HOMEPAGE =3D "https://git.linaro.org/landing-teams/working/arm/external-=
system.git"
+HOMEPAGE =3D "https://gitlab.arm.com/arm-reference-solutions/corstone100=
0/external_system/rtx"
 DEPENDS =3D "gcc-arm-none-eabi-native"
 INHIBIT_DEFAULT_DEPS =3D "1"
 LICENSE =3D "Apache-2.0 AND BSD-3-Clause"
--=20
2.50.1 (Apple Git-155)


