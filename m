Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5034C433FE
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 13:48:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.5507.1648216137744584048
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 25 Mar 2022 06:48:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 290C413D5
	for <meta-arm@lists.yoctoproject.org>; Fri, 25 Mar 2022 06:48:57 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D1C383F73B
	for <meta-arm@lists.yoctoproject.org>; Fri, 25 Mar 2022 06:48:56 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/7] arm/fvp: add more helper variables for the versioning
Date: Fri, 25 Mar 2022 13:48:49 +0000
Message-Id: <20220325134853.3068169-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220325134853.3068169-1-ross.burton@arm.com>
References: <20220325134853.3068169-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 25 Mar 2022 13:48:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3206

Add more helper variables for the FVP version to help construct URLs.

If PV is 1.2.3, then VERSION is 1.2 and BUILD is 3.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-common.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-common.inc b/meta-arm/reci=
pes-devtools/fvp/fvp-common.inc
index cf6cad04..f7cdca80 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-common.inc
+++ b/meta-arm/recipes-devtools/fvp/fvp-common.inc
@@ -15,6 +15,10 @@ def get_real_pv(d):
     # FVP versions are like 11.12_43
     pv =3D d.getVar("PV")
     return "%s.%s_%s" % tuple(pv.split("."))
+
+# If PV is 1.2.3, VERSION=3D1.2, BUILD=3D3, PV_URL=3D1.2_3.
+VERSION =3D "${@oe.utils.trim_version(d.getVar('PV', -1))}"
+BUILD =3D "${@d.getVar('PV').split('.')[-1]}"
 PV_URL =3D "${@get_real_pv(d)}"
=20
 # The directory the FVP is installed into
--=20
2.25.1


