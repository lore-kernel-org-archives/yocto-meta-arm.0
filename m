Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C64CA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 13:21:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13172.1791811265878340161
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 Oct 2026 06:21:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=hlujUfUJ;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B75BC1650
	for <meta-arm@lists.yoctoproject.org>; Mon, 12 Oct 2026 06:21:01 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9BB3F3F882
	for <meta-arm@lists.yoctoproject.org>; Mon, 12 Oct 2026 06:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791811265; bh=0D3kF2UJk6b8l0pnA4Ef2K4Srnahr5apxEEkQd7de0Q=;
	h=From:To:Subject:Date:From;
	b=hlujUfUJsauRYfOeuBo31zYII27k/OXzeZ71uXGgjwncQN06Qwz/BcD3qgXFsh0WI
	 akMotFmpbnnPQhesfglVkUmY+NszHmBXokXTi71InUHW/GXYtRNxJVuihUc2Vti2vO
	 jhR1YN4J6VLLyKx9pw+ysQds1hK2b+cxpKUCmSOM=
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: move meta-oe to use blacksail branch
Date: Mon, 12 Oct 2026 14:20:59 +0100
Message-ID: <20261012132059.3801511-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 12 Oct 2026 13:21:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7187

This now has a blacksail branch.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/meta-openembedded.yml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/ci/meta-openembedded.yml b/ci/meta-openembedded.yml
index 3a8e507d4a7..499216bfaa3 100644
--- a/ci/meta-openembedded.yml
+++ b/ci/meta-openembedded.yml
@@ -6,7 +6,6 @@ header:
 repos:
   meta-openembedded:
     url: https://git.openembedded.org/meta-openembedded
-    branch: master
     layers:
       meta-filesystems:
       meta-networking:
--=20
2.43.0


