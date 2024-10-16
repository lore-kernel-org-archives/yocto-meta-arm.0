Return-Path: <ben.cownley@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C5FCD1AD3E
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 10:04:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19595.1729073070148720733
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 03:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ben.cownley@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74D7AFEC;
	Wed, 16 Oct 2024 03:04:59 -0700 (PDT)
Received: from e125927.manchester.arm.com (unknown [10.32.102.196])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 086653F71E;
	Wed, 16 Oct 2024 03:04:28 -0700 (PDT)
From: Ben <Ben.Cownley@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ben Cownley <ben.cownley@arm.com>
Subject: [PATCH styhead 3/3] kas: Include unattended openSUSE test
Date: Wed, 16 Oct 2024 11:04:12 +0100
Message-Id: <20241016100412.9691-3-Ben.Cownley@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016100412.9691-1-Ben.Cownley@arm.com>
References: <20241016100412.9691-1-Ben.Cownley@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 16 Oct 2024 10:04:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6200

Add unattended installation class to openSUSE target

Signed-off-by: Ben Cownley <ben.cownley@arm.com>
---
 kas/arm-systemready-linux-distros-opensuse.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kas/arm-systemready-linux-distros-opensuse.yml b/kas/arm-sys=
temready-linux-distros-opensuse.yml
index cffbdb92..d2d75fa2 100644
--- a/kas/arm-systemready-linux-distros-opensuse.yml
+++ b/kas/arm-systemready-linux-distros-opensuse.yml
@@ -2,6 +2,7 @@ header:
   version: 13
   includes:
     - kas/arm-systemready-firmware.yml
+    - kas/arm-systemready-linux-distros-unattended-installation.yml
=20
 target:
   - arm-systemready-linux-distros-opensuse
--=20
2.34.1


