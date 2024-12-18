Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9422BE77187
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 10:23:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.102242.1734517396750794378
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Dec 2024 02:23:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 440F11063
	for <meta-arm@lists.yoctoproject.org>; Wed, 18 Dec 2024 02:23:44 -0800 (PST)
Received: from e133390.cambridge.arm.com (e133390.arm.com [10.1.26.138])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9244B3F720
	for <meta-arm@lists.yoctoproject.org>; Wed, 18 Dec 2024 02:23:15 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH styhead] arm/lib: Relax "Listening for serial connection" regex
Date: Wed, 18 Dec 2024 10:23:04 +0000
Message-ID: <20241218102304.3034598-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Dec 2024 10:23:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6297

Newer versions of the FVP now contain a full log entry for the
"Listening for serial connection on port" regex of the form:

INFO: FVP_NAME: terminal_uart: Listening for serial connection...

Relax the regex to support this new logging format and change from
re.match to re.search as the regex may not appear at the start of the
line.

This change is backwards-compatible with older versions of the FVP.

Signed-off-by: Peter Hoyes <peter.hoyes@arm.com>
---
 meta-arm/lib/fvp/runner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
index 4e414e99..8dba545a 100644
--- a/meta-arm/lib/fvp/runner.py
+++ b/meta-arm/lib/fvp/runner.py
@@ -57,7 +57,7 @@ class ConsolePortParser:
         while True:
             try:
                 line =3D next(self._lines).strip().decode(errors=3D'igno=
re')
-                m =3D re.match(r"^(\S+): Listening for serial connection=
 on port (\d+)$", line)
+                m =3D re.search(r"(\S+): Listening for serial connection=
 on port (\d+)$", line)
                 if m:
                     matched_console =3D m.group(1)
                     matched_port =3D int(m.group(2))
--=20
2.43.0


