Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C24C7EE31
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 13:49:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14154.1751032191817583382
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 06:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 171C51007
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Jun 2025 06:49:34 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E27513F66E
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Jun 2025 06:49:50 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][kirkstone 3/6] CI: remove obsolete installation of python3-subunit
Date: Fri, 27 Jun 2025 14:49:43 +0100
Message-ID: <20250627134946.154438-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250627134946.154438-1-ross.burton@arm.com>
References: <20250627134946.154438-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Jun 2025 13:49:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6587

This is in the Kas image from 3.2, so this is now obsolete.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 9c9eb74191..2a07ea08be 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -40,8 +40,6 @@ stages:
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
2.43.0


