Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E61FC035D
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:38:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.570.1776958676668260694
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Apr 2026 08:37:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=LNeu3n9u;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C0631A9A;
	Thu, 23 Apr 2026 08:37:50 -0700 (PDT)
Received: from gyoszi01-yocto.budapest.arm.com (ubul2.budapest.arm.com [10.42.55.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7C5A63F7B4;
	Thu, 23 Apr 2026 08:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776958676; bh=0SZXE+lNbElHoC4V813fZyTHPk8PpMux/6im5HT4Nfs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LNeu3n9uJh+Ks0VAWYVqCs5zK6KJlNtVwW4zLPzaKi3nWAUXcz6jaw0xRQmsO/o0o
	 56Tr6LD6rc7P8XEKntXapyJyhilwGMUqcLotdTvVyMBSc7XJw20WTAd/k8Ek4ENXP9
	 vNaOzI94+v3diQ7memlxL9TQBf4vEyjjg+cTa37Q=
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <gyorgy.szing@arm.com>
Subject: [PATCH 3/3] scripts/runfvp: fix exception handling
Date: Thu, 23 Apr 2026 17:37:21 +0200
Message-ID: <20260423153721.1275354-3-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423153721.1275354-1-gyorgy.szing@arm.com>
References: <20260423153721.1275354-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 Apr 2026 15:38:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7022

Returning from the finally block at the end of the start_fvp() function
is discarding exceptions. Since start_fvp() is near to the top off the
call tree, this hides uncaught exceptions thrown by most of the code,
which makes detecting and debugging issues hard.

This is resolved by removing the return statement from the finally
block, allowing exceptions to propagate normally.

Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
---
 scripts/runfvp | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/runfvp b/scripts/runfvp
index 8e6fe655..10a8ad1c 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -86,8 +86,9 @@ def start_fvp(args, fvpconf, extra_args):
     except FileNotFoundError as e:
         logger.error(f"FVP executable not found ({e})")
     finally:
-        return fvp.stop()
+        rv=3Dfvp.stop()
=20
+    return rv
=20
 def runfvp(cli_args):
     args, extra_args =3D parse_args(cli_args)
--=20
2.43.0


