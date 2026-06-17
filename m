Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C97E0CD98F1
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 12:43:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14666.1781700221792612302
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Jun 2026 05:43:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=El1cepDc;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFF1B4800
	for <meta-arm@lists.yoctoproject.org>; Wed, 17 Jun 2026 05:43:36 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EF6143F905
	for <meta-arm@lists.yoctoproject.org>; Wed, 17 Jun 2026 05:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781700221; bh=NGrY4FoWBisjKaIfUg4bRTnT0fnBikn5GH9ruEQjU0o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=El1cepDcg1BkkyKrLockjS8YJLLAuwL0A9CyXKG6fcUU1575/hblepABLYUIOxsKw
	 kW3H277RzTzom2Lc/TQYCjSQig+Q7h0IT41HUlLtggLYDYpn6r8Rn9MGI+wKIGPGAf
	 sjZdMqys21uL0b8Vq9Ya/kviop1Yf0VQ+67AFlf8=
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/4] CI: default CACHE_DIR to CI_PROJECT_DIR
Date: Wed, 17 Jun 2026 13:43:31 +0100
Message-ID: <20260617124333.437665-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617124333.437665-1-ross.burton@arm.com>
References: <20260617124333.437665-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 Jun 2026 12:43:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7081

Set the default cache directory to be the build tree so we don't assume
anything about the runner environment by default.

After this change, runners that don't set CACHE_DIR will need to set it
explicltly in their variables.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 577935366e..5861dcf408 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -9,8 +9,10 @@ variables:
   CPU_REQUEST: ""
   # The default machine tag for the build jobs
   DEFAULT_TAG: ""
-  # The directory to use as the persistent cache (the root for DL_DIR, S=
STATE_DIR, etc)
-  CACHE_DIR: $CI_BUILDS_DIR/persist
+  # The directory to use as the persistent cache (the root for DL_DIR,
+  # SSTATE_DIR, etc). The default is the build tree which will not be
+  # persistent, so this should be set in the runner.
+  CACHE_DIR: $CI_PROJECT_DIR
   # The container mirror to use
   MIRROR_GHCR: ghcr.io
   # The list of extra Kas fragments to be used when building
--=20
2.43.0


