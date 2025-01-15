Return-Path: <musa.antike@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F6DC02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 13:56:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.21504.1736949385924312940
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Jan 2025 05:56:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: musa.antike@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1A9812FC
	for <meta-arm@lists.yoctoproject.org>; Wed, 15 Jan 2025 05:56:53 -0800 (PST)
Received: from e132696.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D001E3F63F
	for <meta-arm@lists.yoctoproject.org>; Wed, 15 Jan 2025 05:56:24 -0800 (PST)
From: Musa Antike <musa.antike@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/5] kas: Include unattended Debian test
Date: Wed, 15 Jan 2025 13:56:06 +0000
Message-Id: <20250115135606.3820325-5-musa.antike@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250115135606.3820325-1-musa.antike@arm.com>
References: <20250115135606.3820325-1-musa.antike@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 15 Jan 2025 13:56:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6330

Add unattended installation yml to Debian  target

Signed-off-by: Musa Antike <musa.antike@arm.com>
---
 kas/arm-systemready-linux-distros-debian.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kas/arm-systemready-linux-distros-debian.yml b/kas/arm-syste=
mready-linux-distros-debian.yml
index 38cc74b2..a876d671 100644
--- a/kas/arm-systemready-linux-distros-debian.yml
+++ b/kas/arm-systemready-linux-distros-debian.yml
@@ -2,6 +2,7 @@ header:
   version: 13
   includes:
     - kas/arm-systemready-firmware.yml
+    - kas/arm-systemready-linux-distros-unattended-installation.yml
=20
 target:
   - arm-systemready-linux-distros-debian
--=20
2.34.1


