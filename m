Return-Path: <anusmita.duttamazumder@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2936CCA0FE4
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 16:36:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.266.1693586202578135317
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 01 Sep 2023 09:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: anusmita.duttamazumder@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E92E5152B;
	Fri,  1 Sep 2023 09:37:20 -0700 (PDT)
Received: from PW04GXMM.arm.com (unknown [10.57.64.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BE393F844;
	Fri,  1 Sep 2023 09:36:41 -0700 (PDT)
From: anusmita.duttamazumder@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
Subject: [PATCH 1/2] arm-bsp/n1sdp: Enable tests with pseudo trusted application
Date: Fri,  1 Sep 2023 17:36:25 +0100
Message-Id: <20230901163626.152-2-anusmita.duttamazumder@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230901163626.152-1-anusmita.duttamazumder@arm.com>
References: <20230901163626.152-1-anusmita.duttamazumder@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 01 Sep 2023 16:36:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5015

From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>

Add the config needed to run the embedded tests with pseudo trusted appli=
cation. Without this config, the optee-xtests with pseudo TA get skipped =
with =E2=80=9Cskip test, pseudo TA not found=E2=80=9D message.

Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
---
 meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc b/met=
a-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc
index a40c93dc..80a11b53 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc
@@ -27,3 +27,5 @@ EXTRA_OEMAKE +=3D " CFG_DT=3Dy"
 EXTRA_OEMAKE +=3D " CFG_SECURE_PARTITION=3Dy"
=20
 EXTRA_OEMAKE +=3D " CFG_MAP_EXT_DT_SECURE=3Dy"
+
+EXTRA_OEMAKE +=3D " CFG_ENABLE_EMBEDDED_TESTS=3Dy"
--=20
2.34.1


