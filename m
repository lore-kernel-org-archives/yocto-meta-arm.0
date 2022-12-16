Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33CDDC4332F
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 11:18:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10803.1671189523621503770
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 16 Dec 2022 03:18:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F092A1042;
	Fri, 16 Dec 2022 03:19:23 -0800 (PST)
Received: from e125920.arm.com (unknown [10.57.88.145])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 97BA33F73B;
	Fri, 16 Dec 2022 03:18:42 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH][langdale] arm/fvpboot: Disable timing annotation by default
Date: Fri, 16 Dec 2022 11:19:41 +0000
Message-Id: <20221216111941.1369079-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 16 Dec 2022 11:18:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4196

From: Peter Hoyes <Peter.Hoyes@arm.com>

Timing Annotation is a feature of the model that enables high-level
performance estimations to be made [1]. It is not needed to demonstrate
a functioning software stack so set FASTSIM_DISABLE_TA to 1 in the model
environment to disable this feature. This also improves model
performance.

[1] https://developer.arm.com/documentation/100965/1119/Timing-Annotation

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 meta-arm/classes/fvpboot.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arm/classes/fvpboot.bbclass b/meta-arm/classes/fvpboot.=
bbclass
index 78dabd73..508deb29 100644
--- a/meta-arm/classes/fvpboot.bbclass
+++ b/meta-arm/classes/fvpboot.bbclass
@@ -24,7 +24,9 @@ FVP_CONSOLES[default] ?=3D "${FVP_CONSOLE}"
 # Arbitrary extra arguments
 FVP_EXTRA_ARGS ?=3D ""
 # Bitbake variables to pass to the FVP environment
-FVP_ENV_PASSTHROUGH ?=3D ""
+FVP_ENV_PASSTHROUGH ?=3D "FASTSIM_DISABLE_TA"
+# Disable timing annotation by default
+FASTSIM_DISABLE_TA ?=3D "1"
=20
 EXTRA_IMAGEDEPENDS +=3D "${FVP_PROVIDER}"
=20
--=20
2.25.1


