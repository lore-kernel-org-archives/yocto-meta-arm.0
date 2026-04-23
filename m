Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49FC6FC035A
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:38:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.566.1776958673027355854
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Apr 2026 08:37:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=bvBxBMbp;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E79511A9A;
	Thu, 23 Apr 2026 08:37:46 -0700 (PDT)
Received: from gyoszi01-yocto.budapest.arm.com (ubul2.budapest.arm.com [10.42.55.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CF2163F7B4;
	Thu, 23 Apr 2026 08:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776958672; bh=NSe7PXFLzD4hbJp/nHzKJICC0+EmkFJuUpes2eQfo/Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bvBxBMbpEYjTI+9QXzrGBSfXY4lOYAvvMOqV4r7heQIxMGHX4iYC1hiN/sT1mHnym
	 SH2xAQr8Sgozc09hfsy2mqwjMx8L60dth8oW9KuWMBUb96wlSWEQR9FrT5AhL+i3ZA
	 gM7rea0LJuQjdt17rCBCCW6D4tlund00gukRiBFM=
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <gyorgy.szing@arm.com>
Subject: [PATCH 2/3] scripts/runfvp: add Screen support
Date: Thu, 23 Apr 2026 17:37:20 +0200
Message-ID: <20260423153721.1275354-2-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423153721.1275354-1-gyorgy.szing@arm.com>
References: <20260423153721.1275354-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 Apr 2026 15:38:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7021

Add support for Screen the GNU terminal multiplexer. The -t/--terminal
option now accepts "screen" as a terminal type. When selected, the tool
must be run from within an existing Screen session, and each FVP
terminal is opened in a new Screen window.

Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
---
 documentation/runfvp.md      |  3 +++
 meta-arm/lib/fvp/terminal.py | 17 ++++++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/documentation/runfvp.md b/documentation/runfvp.md
index aed99971..8c9b5f40 100644
--- a/documentation/runfvp.md
+++ b/documentation/runfvp.md
@@ -33,6 +33,8 @@ The tool attempts to automatically select a suitable te=
rminal type. To see which
 `runfvp` determines availability by checking for required executables in=
 your PATH as well as environment variables specific to each terminal typ=
e. If any of these checks fail, the corresponding terminal type is disabl=
ed.
 The --help output also lists all currently available terminal types.
=20
+When using `-terminals=3Dscreen`, `runfvp` must be launched from within =
an existing [`screen`][screen] session. Normally, screen sets the `STY` e=
nvironment variable to reference the current session. However, if the ses=
sion is renamed or if `kas` is started from within the screen session, th=
is value may become invalid or be lost. In such cases, `STY` must be set =
manually. Use `screen -ls` to view the list of currently attached session=
s.
+
 The default terminal can also be configured by writing a [INI-style][INI=
] configuration file to `~/.config/runfvp.conf`:
=20
 ```
@@ -144,3 +146,4 @@ FVP_ENV_PASSTHROUGH =3D "ARMLMD_LICENSE_FILE FM_TRACE=
_PLUGINS"
 [FVP]: https://developer.arm.com/tools-and-software/simulation-models/fi=
xed-virtual-platforms
 [tmux]: https://tmux.github.io/
 [INI]: https://docs.python.org/3/library/configparser.html
+[screen]: https://www.gnu.org/software/screen/
diff --git a/meta-arm/lib/fvp/terminal.py b/meta-arm/lib/fvp/terminal.py
index c0087fa1..fb6050d6 100644
--- a/meta-arm/lib/fvp/terminal.py
+++ b/meta-arm/lib/fvp/terminal.py
@@ -1,4 +1,3 @@
-import shutil
 import collections
 import pathlib
 import os
@@ -37,6 +36,20 @@ def check_executable(*cmd) -> bool:
     return exitcode =3D=3D 0
=20
=20
+def screen_is_ready(*, silent: bool =3D False) -> bool:
+    log_print =3D (lambda *_args, **_kwargs: None) if silent else logger=
.error
+
+    if not check_executable("screen", "--version"):
+        log_print("--terminal screen requires screen to be available and=
 runnable, but startup failed.")
+        return False
+
+    if not os.environ.get("STY"):
+        log_print("--terminal screen requires runfvp to be started from =
a screen session.\n\tEnsure $STY is set in the environment.")
+        return False
+
+    return True
+
+
 def tmux_is_ready(*, silent: bool =3D False) -> bool:
     log_print =3D (lambda *_args, **_kwargs: None) if silent else logger=
.error
=20
@@ -126,6 +139,8 @@ class Terminals:
 terminals =3D Terminals()
 # TODO: option to switch between telnet and netcat
 connect_command =3D "telnet localhost %port"
+sty =3D os.environ.get("STY")
+terminals.add_terminal(2, "screen", f'screen -S "{sty}" -X screen -t "{{=
name}} - %title" -L {connect_command}', screen_is_ready)
 terminals.add_terminal(2, "tmux", f'tmux new-window -n "{{name}}" "{conn=
ect_command}"', tmux_is_ready)
 terminals.add_terminal(2, "gnome-terminal", f'gnome-terminal --window --=
title "{{name}} - %title" --command "{connect_command}"', gterm_is_ready)
 terminals.add_terminal(1, "xterm", f'xterm -title "{{name}} - %title" -e=
 {connect_command}', xterm_is_ready)
--=20
2.43.0


