Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1756AC77B75
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 11:24:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.23149.1684495477318146289
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 May 2023 04:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2D5D1FB;
	Fri, 19 May 2023 04:25:21 -0700 (PDT)
Received: from R91284ZP.arm.com (unknown [10.57.21.254])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 345E73F762;
	Fri, 19 May 2023 04:24:36 -0700 (PDT)
From: Gyorgy Szing <Gyorgy.Szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 15/16] arm-bps/corstone1000: setup trusted service proxy configuration
Date: Fri, 19 May 2023 13:23:59 +0200
Message-Id: <20230519112400.340-15-Gyorgy.Szing@arm.com>
X-Mailer: git-send-email 2.39.1.windows.1
In-Reply-To: <20230519112400.340-1-Gyorgy.Szing@arm.com>
References: <20230519112400.340-1-Gyorgy.Szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 19 May 2023 11:24:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4679

From: Rui Miguel Silva <rui.silva@linaro.org>

Make sure we setup the new variable for the configuration
of the SE-Proxy service for our machine. This will trigger
the right configuration building trusted services and all
psa-arch test pass as before.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 meta-arm-bsp/conf/machine/include/corstone1000.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 3915d18b..198c7ec8 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -43,6 +43,7 @@ OPTEE_BINARY =3D "tee-pager_v2.bin"
 # Include smm-gateway and se-proxy SPs into optee-os binary
 MACHINE_FEATURES +=3D "ts-smm-gateway ts-se-proxy"
 TS_PLATFORM =3D "arm/corstone1000"
+TS_SP_SE_PROXY_CONFIG =3D "corstone1000"
=20
 # External System(Cortex-M3)
 EXTRA_IMAGEDEPENDS +=3D "external-system"
--=20
2.39.1.windows.1


