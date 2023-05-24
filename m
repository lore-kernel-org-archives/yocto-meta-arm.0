Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE02C7EE2C
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 14:08:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9825.1684937306567704745
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 May 2023 07:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BBBE1FB;
	Wed, 24 May 2023 07:09:11 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9794C3F762;
	Wed, 24 May 2023 07:08:25 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] arm/lib/fvp: remove redundant trailing commas
Date: Wed, 24 May 2023 15:08:22 +0100
Message-Id: <20230524140823.3624031-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 24 May 2023 14:08:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4690

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


