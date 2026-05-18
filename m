Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6E2CD4F3C
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 15:30:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11100.1779118226804725612
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 May 2026 08:30:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=XQ8JbHct;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3B431756
	for <meta-arm@lists.yoctoproject.org>; Mon, 18 May 2026 08:30:20 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 96DA93F85F
	for <meta-arm@lists.yoctoproject.org>; Mon, 18 May 2026 08:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779118226; bh=VN0J4jwO1vI0WPe7mKFuZ01vq32/izODvSHrT2QJiHU=;
	h=From:To:Subject:Date:From;
	b=XQ8JbHctMIXc2ylqIr9tOzhMxaZbSh0OR2PFMiLaloM98DNRPw+wiyljpGHe90S59
	 vXfGLWGjQwK3ck+nnJuQTtkDXQomirJWngZnKqiRg1ZlvqFbCJ9rzvlW0r3E/ZCcZ2
	 rf8p+j+3wGPovRoG2KGIzUxZolcDI4os7hi9QvjA=
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: use kas 5.2
Date: Mon, 18 May 2026 16:30:21 +0100
Message-ID: <20260518153021.1001495-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 May 2026 15:30:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7041

Upgrade to the latest version of Kas.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e40ae84d2d..f77a2853f8 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,4 +1,4 @@
-image: ${MIRROR_GHCR}/siemens/kas/kas:4.7
+image: ${MIRROR_GHCR}/siemens/kas/kas:5.2
=20
 variables:
   # These are needed as the k8s executor doesn't respect the container
--=20
2.43.0


