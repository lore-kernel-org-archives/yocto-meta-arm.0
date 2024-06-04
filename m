Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD535C25B7E
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 08:25:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16326.1717489531749083714
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Jun 2024 01:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C907E1063;
	Tue,  4 Jun 2024 01:25:55 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.71.5])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC00C3F792;
	Tue,  4 Jun 2024 01:25:30 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH scarthgap 1/1] kas: corstone1000: remove Arm-FVP-EULA flag
Date: Tue,  4 Jun 2024 10:25:22 +0200
Message-Id: <20240604082522.193772-2-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240604082522.193772-1-bence.balogh@arm.com>
References: <20240604082522.193772-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Jun 2024 08:25:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5782

From: Bence Balogh <bence.balogh@arm.com>

This flag should not be set here and the ARM_FVP_EULA_ACCEPT
should be set to True manually before building for the FVP, as it is
mentioned in the Corstone-1000 User guide:
export ARM_FVP_EULA_ACCEPT=3D"True"

Fixes: 6e2a54748 ("kas: Corstone-1000 kas files updated")
Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 kas/corstone1000-fvp.yml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kas/corstone1000-fvp.yml b/kas/corstone1000-fvp.yml
index 0d6d5fee..527fd1d8 100644
--- a/kas/corstone1000-fvp.yml
+++ b/kas/corstone1000-fvp.yml
@@ -13,7 +13,6 @@ env:
=20
 local_conf_header:
   testimagefvp: |
-    LICENSE_FLAGS_ACCEPTED +=3D "Arm-FVP-EULA"
     IMAGE_CLASSES +=3D "fvpboot"
=20
   mass-storage: |
--=20
2.25.1


