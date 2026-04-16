Return-Path: <roger.knecht@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A7AFFA0C4E
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 07:54:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8387.1776326041629519901
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Apr 2026 00:54:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=e+l2+j+i;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: roger.knecht@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 112A81C14;
	Thu, 16 Apr 2026 00:53:55 -0700 (PDT)
Received: from upstream.. (e141374.arm.com [10.34.128.225])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FF003F641;
	Thu, 16 Apr 2026 00:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776326040; bh=PhYlOJKgazXYbyRhaxinKz4FvwuRGLzp7zAwhFG+UDg=;
	h=From:To:Cc:Subject:Date:From;
	b=e+l2+j+ieyWk2BnZvypX5isKOlrD3jm6pEU9lXJsdtFmgg7g+hjtcNCko39mK/7QH
	 BghpKmeDj6y5pGb0MlC+ydw+JenWUBBEkf5f2u0AHWhouwmJ6zUIOhgqemQqLnOntL
	 Wk+u2nCjmt32p6TkVf3JSZDjWjrIDbMIzj32QxUk=
From: Roger Knecht <roger.knecht@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Roger Knecht <roger.knecht@arm.com>
Subject: [PATCH] scripts/runfvp: fix silent failure when FVP is missing
Date: Thu, 16 Apr 2026 07:53:28 +0000
Message-ID: <20260416075328.959-1-roger.knecht@arm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Apr 2026 07:54:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7018

Print an error message if the FVP binary cannot be found, instead of
failing silently.

Signed-off-by: Roger Knecht <roger.knecht@arm.com>
---
 scripts/runfvp | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/runfvp b/scripts/runfvp
index 135cf04d..ceae18ae 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -77,7 +77,8 @@ def start_fvp(args, fvpconf, extra_args):
         else:
             for line in fvp.stdout:
                 print(line.strip().decode(errors=3D'ignore'))
-
+    except FileNotFoundError as e:
+        logger.error(f"FVP executable not found ({e})")
     finally:
         return fvp.stop()
=20

