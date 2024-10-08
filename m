Return-Path: <ben.cownley@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E803BCEF17A
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 13:58:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9915.1728395878512759157
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Oct 2024 06:57:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ben.cownley@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87799DA7;
	Tue,  8 Oct 2024 06:58:27 -0700 (PDT)
Received: from e125927.manchester.arm.com (e125927.arm.com [10.32.102.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D76C3F58B;
	Tue,  8 Oct 2024 06:57:57 -0700 (PDT)
From: Ben <Ben.Cownley@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ben Cownley <ben.cownley@arm.com>
Subject: [PATCH 3/3] kas: Include unattended openSUSE test
Date: Tue,  8 Oct 2024 14:57:30 +0100
Message-Id: <20241008135730.58464-3-Ben.Cownley@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008135730.58464-1-Ben.Cownley@arm.com>
References: <20241008135730.58464-1-Ben.Cownley@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Oct 2024 13:58:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6185

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


