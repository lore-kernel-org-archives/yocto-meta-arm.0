Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B01C369D0
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 13:12:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11290.1744981943831776933
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Apr 2025 06:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACE9D150C
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Apr 2025 06:12:20 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 778453F66E
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Apr 2025 06:12:23 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/4] arm/trusted-firmware-a: correct broken git version
Date: Fri, 18 Apr 2025 09:12:20 -0400
Message-Id: <20250418131222.95241-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250418131222.95241-1-jon.mason@arm.com>
References: <20250418131222.95241-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 18 Apr 2025 13:12:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6473

Add UPSTREAM_VERSION_UNKNOWN to avoid the "UNKNOWN_BORKEN" when running
`devtool check-upgrade-status`

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_g=
it.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
index 62a5927e8fb4..953f8bf3e878 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
@@ -20,3 +20,4 @@ SRC_URI +=3D "\
=20
 # Not a release recipe, try our hardest to not pull this in implicitly
 DEFAULT_PREFERENCE =3D "-1"
+UPSTREAM_CHECK_COMMITS =3D "1"
--=20
2.39.5 (Apple Git-154)


