Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD23C38142
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 13:50:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.42759.1674481827084805775
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Jan 2023 05:50:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A0B9C14;
	Mon, 23 Jan 2023 05:51:08 -0800 (PST)
Received: from e125920.arm.com (unknown [10.57.89.9])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D74F53F64C;
	Mon, 23 Jan 2023 05:50:25 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 1/4] arm/lib: Add XAUTHORITY to runfvp environment
Date: Mon, 23 Jan 2023 13:50:15 +0000
Message-Id: <20230123135018.3793393-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 23 Jan 2023 13:50:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4310

From: Peter Hoyes <Peter.Hoyes@arm.com>

aa89fe3f ensured environment variables necessary for GUI applications
are passed through to the model despite runfvp env var restrictions. Add
XAUTHORITY to this list. This is useful when doing X-forwarding with
Kas, which creates its own home directory.

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 meta-arm/lib/fvp/runner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
index 4fd624ba..c52cdc1c 100644
--- a/meta-arm/lib/fvp/runner.py
+++ b/meta-arm/lib/fvp/runner.py
@@ -91,7 +91,7 @@ class FVPRunner:
         # Pass through environment variables needed for GUI applications=
, such
         # as xterm, to work.
         env =3D config['env']
-        for name in ('DISPLAY', 'WAYLAND_DISPLAY'):
+        for name in ('DISPLAY', 'WAYLAND_DISPLAY', 'XAUTHORITY'):
             if name in os.environ:
                 env[name] =3D os.environ[name]
=20
--=20
2.34.1


