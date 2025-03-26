Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ECA4C36011
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 18:12:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.29795.1743012733105792436
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 Mar 2025 11:12:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C0661424
	for <meta-arm@lists.yoctoproject.org>; Wed, 26 Mar 2025 11:12:18 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 54C7F3F58B
	for <meta-arm@lists.yoctoproject.org>; Wed, 26 Mar 2025 11:12:12 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/4] ci: show KAS_PREMIRRORS in preamble
Date: Wed, 26 Mar 2025 18:12:05 +0000
Message-ID: <20250326181206.1287342-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326181206.1287342-1-ross.burton@arm.com>
References: <20250326181206.1287342-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 26 Mar 2025 18:12:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6416

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 08f6a388..6d613e45 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -47,6 +47,7 @@ stages:
     - echo KAS_WORK_DIR =3D $KAS_WORK_DIR
     - echo SSTATE_DIR =3D $SSTATE_DIR
     - echo DL_DIR =3D $DL_DIR
+    - echo KAS_PREMIRRORS =3D $KAS_PREMIRRORS
     - rm -rf $KAS_WORK_DIR
     - mkdir --verbose --parents $KAS_WORK_DIR $KAS_REPO_REF_DIR $SSTATE_=
DIR $DL_DIR $TOOLCHAIN_DIR $TOOLCHAIN_LINK_DIR
=20
--=20
2.43.0


