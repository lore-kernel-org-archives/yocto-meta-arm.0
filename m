Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4548BCCF9EB
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 15:41:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.36550.1761579671680249368
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 08:41:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 766381063
	for <meta-arm@lists.yoctoproject.org>; Mon, 27 Oct 2025 08:41:03 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DBC5D3F673
	for <meta-arm@lists.yoctoproject.org>; Mon, 27 Oct 2025 08:41:10 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/arm-systemready-acs: fix order confusing in FILESEXTRAPATHS
Date: Mon, 27 Oct 2025 15:41:06 +0000
Message-ID: <20251027154106.2032750-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 27 Oct 2025 15:41:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6745

This bbappend was _appending_ to FILESEXTRAPATHS but putting the colon
separator _after_, so it actually constructed an invalid path.

Change the assignment to be prepend, so the separator is in the right
place.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../arm-systemready-acs/arm-systemready-ir-acs-fvp-base.inc     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/dynamic-layers/meta-arm-systemready/recipes-tes=
t/arm-systemready-acs/arm-systemready-ir-acs-fvp-base.inc b/meta-arm-bsp/=
dynamic-layers/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-=
systemready-ir-acs-fvp-base.inc
index 376f623a8d..83208770ff 100644
--- a/meta-arm-bsp/dynamic-layers/meta-arm-systemready/recipes-test/arm-s=
ystemready-acs/arm-systemready-ir-acs-fvp-base.inc
+++ b/meta-arm-bsp/dynamic-layers/meta-arm-systemready/recipes-test/arm-s=
ystemready-acs/arm-systemready-ir-acs-fvp-base.inc
@@ -1,2 +1,2 @@
-FILESEXTRAPATHS:append :=3D "${THISDIR}/files/${MACHINE}:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/${MACHINE}:"
 SRC_URI:append =3D " file://report.txt"
--=20
2.43.0


