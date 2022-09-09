Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 003AEC6FA82
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 12:11:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.388.1662725476641251418
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 09 Sep 2022 05:11:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B33215DB;
	Fri,  9 Sep 2022 05:11:22 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.88.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE42F3F7B4;
	Fri,  9 Sep 2022 05:11:14 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH] arm/lib: Specify the FVP environment variables explicitly
Date: Fri,  9 Sep 2022 13:12:06 +0100
Message-Id: <20220909121206.3098601-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 09 Sep 2022 12:11:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3755

From: Peter Hoyes <Peter.Hoyes@arm.com>

It is sometimes useful to be able to configure the behavior of FVPs
using environment variables, e.g. for licensing or plugins.

Add a new FVP option: FVP_ENV_PASSTHROUGH, which allows the Bitbake
variables to be passed to the environment to be specified explicitly (in
a similar way to BB_ENV_PASSTHROUGH). This ensures that:

 * FVPs launched via runfvp have a reproducable environment
 * FVPs launched via testimage (which run from an isolated Bitbake task)
   can receive environment variables

Issue-Id: SCM-4964
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: Idf6ac6d41fda4cd5f950bc383c2fc1fa1acdf4e3
---
 documentation/runfvp.md          | 8 ++++++++
 meta-arm/classes/fvpboot.bbclass | 6 ++++++
 meta-arm/lib/fvp/runner.py       | 5 ++++-
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/documentation/runfvp.md b/documentation/runfvp.md
index c792f4e0..01b13693 100644
--- a/documentation/runfvp.md
+++ b/documentation/runfvp.md
@@ -116,6 +116,14 @@ Arbitrary extra arguments that are passed directly t=
o the FVP.  For example:
 FVP_EXTRA_ARGS =3D "--simlimit 60"
 ```
=20
+### `FVP_ENV_PASSTHROUGH`
+
+The FVP is launched with an isolated set of environment variables. Add t=
he name of a Bitbake variable to this list to pass it through to the FVP =
environment. For example:
+
+```
+FVP_ENV_PASSTHROUGH =3D "ARMLMD_LICENSE_FILE FM_TRACE_PLUGINS"
+```
+
=20
 [AEM]: https://developer.arm.com/tools-and-software/simulation-models/fi=
xed-virtual-platforms/arm-ecosystem-models
 [FVP]: https://developer.arm.com/tools-and-software/simulation-models/fi=
xed-virtual-platforms
diff --git a/meta-arm/classes/fvpboot.bbclass b/meta-arm/classes/fvpboot.=
bbclass
index fbdfa965..78dabd73 100644
--- a/meta-arm/classes/fvpboot.bbclass
+++ b/meta-arm/classes/fvpboot.bbclass
@@ -23,6 +23,8 @@ FVP_CONSOLE ?=3D ""
 FVP_CONSOLES[default] ?=3D "${FVP_CONSOLE}"
 # Arbitrary extra arguments
 FVP_EXTRA_ARGS ?=3D ""
+# Bitbake variables to pass to the FVP environment
+FVP_ENV_PASSTHROUGH ?=3D ""
=20
 EXTRA_IMAGEDEPENDS +=3D "${FVP_PROVIDER}"
=20
@@ -66,6 +68,10 @@ python do_write_fvpboot_conf() {
     data["terminals"] =3D getFlags("FVP_TERMINALS")
     data["args"] =3D shlex.split(d.getVar("FVP_EXTRA_ARGS") or "")
=20
+    data["env"] =3D {}
+    for var in d.getVar("FVP_ENV_PASSTHROUGH").split():
+        data["env"][var] =3D d.getVar(var)
+
     os.makedirs(os.path.dirname(conffile), exist_ok=3DTrue)
     with open(conffile, "wt") as f:
         json.dump(data, f)
diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
index 7641cd67..8c6b4cad 100644
--- a/meta-arm/lib/fvp/runner.py
+++ b/meta-arm/lib/fvp/runner.py
@@ -60,7 +60,10 @@ class FVPRunner:
         cli =3D cli_from_config(config, terminal_choice)
         cli +=3D extra_args
         self._logger.debug(f"Constructed FVP call: {cli}")
-        self._fvp_process =3D await asyncio.create_subprocess_exec(*cli,=
 stdin=3Dsubprocess.DEVNULL, stdout=3Dsubprocess.PIPE, stderr=3Dsubproces=
s.STDOUT)
+        self._fvp_process =3D await asyncio.create_subprocess_exec(
+            *cli,
+            stdin=3Dsubprocess.DEVNULL, stdout=3Dsubprocess.PIPE, stderr=
=3Dsubprocess.STDOUT,
+            env=3Dconfig['env'])
=20
         def detect_terminals(line):
             m =3D re.match(r"^(\S+): Listening for serial connection on =
port (\d+)$", line)
--=20
2.25.1


