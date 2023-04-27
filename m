Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5ED3C77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 16:07:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.25014.1682611631733174547
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 09:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BC5BC14;
	Thu, 27 Apr 2023 09:07:55 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com [10.1.200.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B4C373F64C;
	Thu, 27 Apr 2023 09:07:10 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH 1/1] arm-bsp/trusted-firmware-a: Update N1SDP to v2.8.0
Date: Thu, 27 Apr 2023 17:06:49 +0100
Message-Id: <20230427160649.21922-2-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230427160649.21922-1-adam.johnston@arm.com>
References: <20230427160649.21922-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Apr 2023 16:07:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4622

From: Adam Johnston <adam.johnston@arm.com>

N1SDP master has now updated to TF-A v2.8.0 so we should do the same.
Remove the SHA override for the N1SDP

Signed-off-by: Adam Johnston <adam.johnston@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a-n1sdp.inc           | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-n1sdp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwa=
re-a-n1sdp.inc
index 9fb567fa..f4ebcc1c 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sd=
p.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sd=
p.inc
@@ -1,9 +1,5 @@
 # N1SDP specific TFA support
=20
-# Align with post-N1SDP-2022.06.22 refresh
-SRCREV_tfa  =3D "1309c6c805190bd376c0561597653f3f8ecd0f58"
-PV .=3D "+git${SRCPV}"
-
 COMPATIBLE_MACHINE =3D "n1sdp"
 TFA_PLATFORM       =3D "n1sdp"
 TFA_BUILD_TARGET   =3D "all fip"
--=20
2.25.1


