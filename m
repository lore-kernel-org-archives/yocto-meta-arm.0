Return-Path: <debbie.martin@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 868AEC4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 09:50:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.46329.1699005006701576651
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Nov 2023 02:50:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: debbie.martin@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEB242F4
	for <meta-arm@lists.yoctoproject.org>; Fri,  3 Nov 2023 02:50:48 -0700 (PDT)
Received: from e127725.arm.com (unknown [10.57.2.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8141B3F64C
	for <meta-arm@lists.yoctoproject.org>; Fri,  3 Nov 2023 02:50:05 -0700 (PDT)
From: Debbie Martin <Debbie.Martin@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/5] arm/fvp-base: Update the default testsuites
Date: Fri,  3 Nov 2023 09:49:35 +0000
Message-Id: <20231103094939.1290558-1-Debbie.Martin@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 03 Nov 2023 09:50:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5198

For fvp-base, update the DEFAULT_TEST_SUITES to include
fvp_boot and fvp_devices. This is only the default behaviour;
individual recipes can override this using the TEST_SUITES
variable.

Signed-off-by: Debbie Martin <Debbie.Martin@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/=
machine/fvp-base.conf
index d202a79f..4e17a3cc 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -33,7 +33,7 @@ MACHINE_EXTRA_RRECOMMENDS +=3D "ssh-pregen-hostkeys"
=20
 TEST_TARGET =3D "OEFVPTarget"
 TEST_TARGET_IP =3D "127.0.0.1:2222"
-TEST_SUITES:append =3D " fvp_boot fvp_devices"
+DEFAULT_TEST_SUITES:append =3D " fvp_boot fvp_devices"
 TEST_FVP_DEVICES ?=3D "rtc watchdog networking virtiorng cpu_hotplug"
=20
 FVP_PROVIDER ?=3D "fvp-base-a-aem-native"
--=20
2.25.1


