Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C0DD277FA
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 16:52:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11914.1768063964807372382
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 10 Jan 2026 08:52:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49EC21692
	for <meta-arm@lists.yoctoproject.org>; Sat, 10 Jan 2026 08:52:37 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E54FB3F6A8
	for <meta-arm@lists.yoctoproject.org>; Sat, 10 Jan 2026 08:52:43 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/5] arm/machine-summary: remove gn
Date: Sat, 10 Jan 2026 11:52:40 -0500
Message-ID: <20260110165242.38662-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260110165242.38662-1-jon.mason@arm.com>
References: <20260110165242.38662-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 10 Jan 2026 16:52:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6833

gn was moved to oe-core.  So, we no longer need to track it as part of
the meta-arm CI machine-report

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 scripts/machine-summary.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/machine-summary.py b/scripts/machine-summary.py
index 325d8a65c469..c9c9242af9dc 100755
--- a/scripts/machine-summary.py
+++ b/scripts/machine-summary.py
@@ -141,7 +141,6 @@ def harvest_data(machines, recipes):
 recipes =3D ("boot-wrapper-aarch64",
            "edk2-firmware",
            "gator-daemon",
-           "gn",
            "hafnium",
            "opencsd",
            "optee-ftpm",
--=20
2.50.1 (Apple Git-155)


