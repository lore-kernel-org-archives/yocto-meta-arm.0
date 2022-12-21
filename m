Return-Path: <mohamed.omarasaker@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38601C4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 12:33:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17289.1671626001369229413
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Dec 2022 04:33:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mohamed.omarasaker@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F08E72F4;
	Wed, 21 Dec 2022 04:34:01 -0800 (PST)
Received: from e126544.arm.com (unknown [10.57.74.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9583E3F703;
	Wed, 21 Dec 2022 04:33:18 -0800 (PST)
From: mohamed.omarasaker@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
Subject: [PATCH 4/5] arm-bsp/musca_b1: Edit the platform name
Date: Wed, 21 Dec 2022 12:32:35 +0000
Message-Id: <20221221123236.342413-5-mohamed.omarasaker@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221221123236.342413-1-mohamed.omarasaker@arm.com>
References: <20221221123236.342413-1-mohamed.omarasaker@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Dec 2022 12:33:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4213

From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>

The Platform name in TFM has changed
from arm/musca_b1/sse_200 to arm/musca_b1

Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
---
 meta-arm-bsp/conf/machine/musca-b1.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/musca-b1.conf b/meta-arm-bsp/conf/=
machine/musca-b1.conf
index c5ef3233..4e9cf829 100644
--- a/meta-arm-bsp/conf/machine/musca-b1.conf
+++ b/meta-arm-bsp/conf/machine/musca-b1.conf
@@ -20,4 +20,4 @@ QB_GRAPHICS =3D "-nographic -vga none"
 QB_MEM =3D "512k"
 QB_RNG =3D ""
=20
-TFM_PLATFORM =3D "arm/musca_b1/sse_200"
+TFM_PLATFORM =3D "arm/musca_b1"
--=20
2.25.1


