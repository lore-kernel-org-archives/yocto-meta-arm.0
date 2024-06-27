Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80623C2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 08:17:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.3247.1719476248757338769
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Jun 2024 01:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99DFC367
	for <meta-arm@lists.yoctoproject.org>; Thu, 27 Jun 2024 01:17:52 -0700 (PDT)
Received: from e133390.cambridge.arm.com (unknown [10.1.36.164])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 396723F6A8
	for <meta-arm@lists.yoctoproject.org>; Thu, 27 Jun 2024 01:17:27 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/fvpboot: Revert "Disable timing annotation by default"
Date: Thu, 27 Jun 2024 09:17:18 +0100
Message-Id: <20240627081718.2092820-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Jun 2024 08:17:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5845

Fast Models 11.26 now print the following warning if the env var
FASTSIM_DISABLE_TA is set:

  Warning: /ARM/FastModels/deprecated: the use of FASTSIM_DISABLE_TA
  environment variable is deprecated and will beremoved in a future
  release.

Remove the env var from the default env passthrough vars in the fvpboot
bbclass.

This reverts commit 735f560aeb5518e67ceec8f10024a5d8ba7a9f57.

Signed-off-by: Peter Hoyes <peter.hoyes@arm.com>
---
 meta-arm/classes/fvpboot.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-arm/classes/fvpboot.bbclass b/meta-arm/classes/fvpboot.=
bbclass
index 3159cd43..3d8536fc 100644
--- a/meta-arm/classes/fvpboot.bbclass
+++ b/meta-arm/classes/fvpboot.bbclass
@@ -24,10 +24,8 @@ FVP_CONSOLES[default] ?=3D "${FVP_CONSOLE}"
 # Arbitrary extra arguments
 FVP_EXTRA_ARGS ?=3D ""
 # Bitbake variables to pass to the FVP environment
-FVP_ENV_PASSTHROUGH ?=3D "FASTSIM_DISABLE_TA ARMLMD_LICENSE_FILE"
+FVP_ENV_PASSTHROUGH ?=3D "ARMLMD_LICENSE_FILE"
 FVP_ENV_PASSTHROUGH[vardeps] =3D "${FVP_ENV_PASSTHROUGH}"
-# Disable timing annotation by default
-FASTSIM_DISABLE_TA ?=3D "1"
=20
 EXTRA_IMAGEDEPENDS +=3D "${FVP_PROVIDER}"
=20
--=20
2.34.1


