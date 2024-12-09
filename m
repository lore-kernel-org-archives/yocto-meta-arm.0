Return-Path: <gabor.abonyi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF73E7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 13:26:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.101255.1733750771357926463
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Dec 2024 05:26:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gabor.abonyi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C66FF113E;
	Mon,  9 Dec 2024 05:26:38 -0800 (PST)
Received: from gababo0-01.budapest.arm.com (ubul2.budapest.arm.com [10.45.25.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 404D13F720;
	Mon,  9 Dec 2024 05:26:10 -0800 (PST)
From: Gabor Abonyi <gabor.abonyi@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gabor Abonyi <gabor.abonyi@arm.com>
Subject: [PATCH] lib/fvp: add name to terminal title in FVP runner
Date: Mon,  9 Dec 2024 13:25:29 +0000
Message-ID: <20241209132529.619713-1-gabor.abonyi@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 09 Dec 2024 13:26:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6281

Currently, terminal title is %title, which is populated with the
component name by the FVP. This commit prepends it with {name},
which is already a mandatory parameter for terminals to be launched.
E.g. FVP_TERMINALS[terminal_uart] ?=3D "My Name" will launch a terminal
with a title "My Name - terminal_uart".

Signed-off-by: Gabor Abonyi <gabor.abonyi@arm.com>
---
 meta-arm/lib/fvp/runner.py   | 3 +--
 meta-arm/lib/fvp/terminal.py | 6 +++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
index 4e414e99..c7c9ad27 100644
--- a/meta-arm/lib/fvp/runner.py
+++ b/meta-arm/lib/fvp/runner.py
@@ -29,8 +29,7 @@ def cli_from_config(config, terminal_choice):
         if terminal_choice !=3D "none" and name:
             # TODO if raw mode
             # cli.extend(["--parameter", f"{terminal}.mode=3Draw"])
-            # TODO put name into terminal title
-            cli.extend(["--parameter", f"{terminal}.terminal_command=3D{=
terminals[terminal_choice].command}"])
+            cli.extend(["--parameter", f"{terminal}.terminal_command=3D{=
terminals[terminal_choice].command.format(name=3Dname)}"])
         else:
             # Disable terminal
             cli.extend(["--parameter", f"{terminal}.start_telnet=3D0"])
diff --git a/meta-arm/lib/fvp/terminal.py b/meta-arm/lib/fvp/terminal.py
index 243d4fb1..2f123110 100644
--- a/meta-arm/lib/fvp/terminal.py
+++ b/meta-arm/lib/fvp/terminal.py
@@ -53,7 +53,7 @@ class Terminals:
 terminals =3D Terminals()
 # TODO: option to switch between telnet and netcat
 connect_command =3D "telnet localhost %port"
-terminals.add_terminal(2, "tmux", f"tmux new-window -n \"%title\" \"{con=
nect_command}\"")
-terminals.add_terminal(2, "gnome-terminal", f"gnome-terminal --window --=
title \"%title\" --command \"{connect_command}\"")
-terminals.add_terminal(1, "xterm", f"xterm -title \"%title\" -e {connect=
_command}")
+terminals.add_terminal(2, "tmux", f"tmux new-window -n \"{{name}} - %tit=
le\" \"{connect_command}\"")
+terminals.add_terminal(2, "gnome-terminal", f"gnome-terminal --window --=
title \"{{name}} - %title\" --command \"{connect_command}\"")
+terminals.add_terminal(1, "xterm", f"xterm -title \"{{name}} - %title\" =
-e {connect_command}")
 terminals.add_terminal(0, "none", None)

