Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7571C44503
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 12:47:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20067.1782823636605554109
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Jun 2026 05:47:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=sCm5SZ0F;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94C7F1D15;
	Tue, 30 Jun 2026 05:47:11 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.29.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C2293F905;
	Tue, 30 Jun 2026 05:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782823636; bh=m+Hv5cjZGTnJVcLy/mBAX9etgVspxhGHgi/o44e3Th8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sCm5SZ0FgVol6zxvgIX+yS4VZ+46vex80+p5XpkEkMd2ltIVZ2J+GMUy7hYKmxCMm
	 NI51SlNZ32m7bEr+8pePx+gckHsPOph3hW9ehu7yZAr46CFOZ8RyPJVkJbFZXyk+j+
	 07+n9on/PvPPnPxmSgIqhdOgAYVUPYCOPRhfQCjg=
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH wrynose 5/5] ci: enable testimage coverage for Corstone-1000 A320 FVP
Date: Tue, 30 Jun 2026 13:47:04 +0100
Message-Id: <20260630124704.301310-6-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630124704.301310-1-harsimransingh.tungal@arm.com>
References: <20260630124704.301310-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Jun 2026 12:47:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7104

Update the Corstone-1000 A320 FVP CI matrix to run testimage jobs.

This enables testimage coverage for both the firmware-only and no-firmwar=
e
entries.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 .gitlab-ci.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 9c56a5c4..b770e45a 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -161,9 +161,9 @@ corstone1000-a320-fvp:
   parallel:
     matrix:
       - FIRMWARE: corstone1000-firmware-only
-        TESTING: [none, tftf]
+        TESTING: [testimage, tftf]
       - FIRMWARE: none
-        TESTING: none
+        TESTING: testimage
=20
 documentation:
   extends: .setup

