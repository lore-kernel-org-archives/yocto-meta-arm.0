Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF78C6FA90
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 10:32:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.26880.1664188350307183099
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 03:32:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99E5A106F;
	Mon, 26 Sep 2022 03:32:36 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com
 [10.1.194.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CBE23F73B;
	Mon, 26 Sep 2022 03:32:29 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH 3/3] arm-bsp/trusted-firmware-a: Update TF-A version for N1SDP
Date: Mon, 26 Sep 2022 11:32:03 +0100
Message-Id: <20220926103203.1196752-4-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220926103203.1196752-1-adam.johnston@arm.com>
References: <20220926103203.1196752-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 26 Sep 2022 10:32:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3834

From: Adam Johnston <adam.johnston@arm.com>

Update TF-A version to align with post-N1SDP-2022.06.22 refresh

Signed-off-by: Adam Johnston <adam.johnston@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a-n1sdp.inc            | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-n1sdp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwa=
re-a-n1sdp.inc
index 034dac30..9fb567fa 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sd=
p.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sd=
p.inc
@@ -1,6 +1,7 @@
 # N1SDP specific TFA support
=20
-SRCREV_tfa  =3D "1d867c14cb41c1171d16fa7e395a4eaed3d572b2"
+# Align with post-N1SDP-2022.06.22 refresh
+SRCREV_tfa  =3D "1309c6c805190bd376c0561597653f3f8ecd0f58"
 PV .=3D "+git${SRCPV}"
=20
 COMPATIBLE_MACHINE =3D "n1sdp"
--=20
2.37.3


