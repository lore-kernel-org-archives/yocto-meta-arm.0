Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C44C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 12:50:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20140.1782823829395890127
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Jun 2026 05:50:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=IHPcI5mQ;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E3212EDF;
	Tue, 30 Jun 2026 05:50:24 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.29.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7513E3F905;
	Tue, 30 Jun 2026 05:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782823829; bh=hi/mUOi+ZkNkk1tubQKj2CIjADQzrWe7TDoNeg5guUQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IHPcI5mQU/FtF/x7hi48KjdonRu4Xj/2JvuCsyvmVnF+I4AhCv068JZdwBDWFMyvq
	 BDGEoVnqegL+HKgbZNQuBBvQk71x0N95HUE7TjcIfZE6I/27eguZuxeyeY46isj+tW
	 gLZn751+oW7NjDWg3t0N/Go6raHuKIAEsU6SfklY=
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 4/4] ci: enable testimage coverage for Corstone-1000 A320 FVP
Date: Tue, 30 Jun 2026 13:50:14 +0100
Message-Id: <20260630125014.312288-5-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630125014.312288-1-harsimransingh.tungal@arm.com>
References: <20260630125014.312288-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Jun 2026 12:50:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7109

Update the Corstone-1000 A320 FVP CI matrix to run testimage jobs.

This enables testimage coverage for both the firmware-only and no-firmwar=
e
entries.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 .gitlab-ci.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 5059699e..9279ef56 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -165,9 +165,9 @@ corstone1000-a320-fvp:
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

