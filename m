Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8198DEB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 18:56:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3236.1689620209964076757
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Jul 2023 11:56:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92EB4C15;
	Mon, 17 Jul 2023 11:57:32 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.87.125])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82E853F67D;
	Mon, 17 Jul 2023 11:56:48 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 1/5] runfvp: Add missing conffile include
Date: Mon, 17 Jul 2023 19:56:22 +0100
Message-Id: <20230717185626.1793017-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 17 Jul 2023 18:56:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4880

From: Peter Hoyes <Peter.Hoyes@arm.com>

Using runfvp without explicitly specifying the fvpconf path currently
fails due to a missing fvp.conffile include.

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 scripts/runfvp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runfvp b/scripts/runfvp
index c2e536c8..0ca3a1b5 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -14,7 +14,7 @@ logger =3D logging.getLogger("RunFVP")
 libdir =3D pathlib.Path(__file__).parents[1] / "meta-arm" / "lib"
 sys.path.insert(0, str(libdir))
=20
-from fvp import terminal, runner
+from fvp import conffile, terminal, runner
=20
 def parse_args(arguments):
     import argparse
--=20
2.34.1


