Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9746DC38147
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 15:41:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.18770.1674056488427450484
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Jan 2023 07:41:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCC8D16F8;
	Wed, 18 Jan 2023 07:42:09 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 383F73F67D;
	Wed, 18 Jan 2023 07:41:27 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/3] CI: remove obsolete install
Date: Wed, 18 Jan 2023 15:41:23 +0000
Message-Id: <20230118154123.2936427-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118154123.2936427-1-ross.burton@arm.com>
References: <20230118154123.2936427-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Jan 2023 15:41:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4295

Kas 3.2 ships python3-subunit, so we don't need to try to install that
anymore.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 0abf7e8d..d61443df 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -35,8 +35,6 @@ stages:
     - mkdir --verbose --parents $KAS_WORK_DIR $KAS_REPO_REF_DIR $SSTATE_=
DIR $DL_DIR $TOOLCHAIN_DIR $TOOLCHAIN_LINK_DIR
     # Must do this here, as it's the only way to make sure the toolchain=
 is installed on the same builder
     - ./ci/get-binary-toolchains $DL_DIR $TOOLCHAIN_DIR $TOOLCHAIN_LINK_=
DIR
-    # This can be removed with Kas 3.2
-    - sudo apt-get update && sudo apt-get install --yes python3-subunit
=20
 # Generalised fragment to do a Kas build
 .build:
--=20
2.34.1


