Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA5D6E9E2FB
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 12:17:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17669.1770812256000980731
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 04:17:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE5E3339
	for <meta-arm@lists.yoctoproject.org>; Wed, 11 Feb 2026 04:17:28 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9F0103F632
	for <meta-arm@lists.yoctoproject.org>; Wed, 11 Feb 2026 04:17:34 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] lib/fvp: remove FVP buit-in portion of the terminal name
Date: Wed, 11 Feb 2026 12:17:24 +0000
Message-ID: <20260211121724.1412943-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 11 Feb 2026 12:17:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6900

From: Filipe Rinaldi <filipe.rinaldi@arm.com>

This patch ignores the built-in FVP UART name when setting the terminal
names on tmux.
The rationale is that appending FVP UART name takes a lot of space
making it unusable on complex platforms with many terminals.

Signed-off-by: Filipe Rinaldi <filipe.rinaldi@arm.com>
---
 meta-arm/lib/fvp/terminal.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/lib/fvp/terminal.py b/meta-arm/lib/fvp/terminal.py
index 2f12311003..280fb349d5 100644
--- a/meta-arm/lib/fvp/terminal.py
+++ b/meta-arm/lib/fvp/terminal.py
@@ -53,7 +53,7 @@ class Terminals:
 terminals =3D Terminals()
 # TODO: option to switch between telnet and netcat
 connect_command =3D "telnet localhost %port"
-terminals.add_terminal(2, "tmux", f"tmux new-window -n \"{{name}} - %tit=
le\" \"{connect_command}\"")
+terminals.add_terminal(2, "tmux", f"tmux new-window -n \"{{name}}\" \"{c=
onnect_command}\"")
 terminals.add_terminal(2, "gnome-terminal", f"gnome-terminal --window --=
title \"{{name}} - %title\" --command \"{connect_command}\"")
 terminals.add_terminal(1, "xterm", f"xterm -title \"{{name}} - %title\" =
-e {connect_command}")
 terminals.add_terminal(0, "none", None)
--=20
2.43.0


