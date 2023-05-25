Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE31C77B7A
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 18:26:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19100.1685039179587927359
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 25 May 2023 11:26:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 322031042;
	Thu, 25 May 2023 11:27:04 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8CDAB3F6C4;
	Thu, 25 May 2023 11:26:18 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] arm/lib/fvp: remove redundant trailing commas
Date: Thu, 25 May 2023 19:26:14 +0100
Message-Id: <20230525182615.515627-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 25 May 2023 18:26:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4703

From: Ross Burton <ross.burton@arm.com>

These were left behind in a refactor.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/lib/fvp/terminal.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm/lib/fvp/terminal.py b/meta-arm/lib/fvp/terminal.py
index 6f408153..243d4fb1 100644
--- a/meta-arm/lib/fvp/terminal.py
+++ b/meta-arm/lib/fvp/terminal.py
@@ -53,7 +53,7 @@ class Terminals:
 terminals =3D Terminals()
 # TODO: option to switch between telnet and netcat
 connect_command =3D "telnet localhost %port"
-terminals.add_terminal(2, "tmux", f"tmux new-window -n \"%title\" \"{con=
nect_command}\""),
-terminals.add_terminal(2, "gnome-terminal", f"gnome-terminal --window --=
title \"%title\" --command \"{connect_command}\""),
-terminals.add_terminal(1, "xterm", f"xterm -title \"%title\" -e {connect=
_command}"),
+terminals.add_terminal(2, "tmux", f"tmux new-window -n \"%title\" \"{con=
nect_command}\"")
+terminals.add_terminal(2, "gnome-terminal", f"gnome-terminal --window --=
title \"%title\" --command \"{connect_command}\"")
+terminals.add_terminal(1, "xterm", f"xterm -title \"%title\" -e {connect=
_command}")
 terminals.add_terminal(0, "none", None)
--=20
2.34.1


