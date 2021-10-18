Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8987C433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 15:41:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.38775.1634571666700921486
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 08:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD2B51FB
	for <meta-arm@lists.yoctoproject.org>; Mon, 18 Oct 2021 08:40:59 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88BBE3F694
	for <meta-arm@lists.yoctoproject.org>; Mon, 18 Oct 2021 08:40:59 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/6] arm/oeqa: add FVP testimage controller target
Date: Mon, 18 Oct 2021 16:40:52 +0100
Message-Id: <20211018154056.1552230-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018154056.1552230-1-ross.burton@arm.com>
References: <20211018154056.1552230-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 Oct 2021 15:41:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2280

Add a new oeqa.core.target.OETarget subclass for testimage which starts
a FVP using runfvp. This uses --console to connect to the console so
telnet is needed on the host.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitignore                                |  1 +
 meta-arm/lib/oeqa/controllers/__init__.py |  0
 meta-arm/lib/oeqa/controllers/fvp.py      | 87 +++++++++++++++++++++++
 3 files changed, 88 insertions(+)
 create mode 100644 .gitignore
 create mode 100644 meta-arm/lib/oeqa/controllers/__init__.py
 create mode 100644 meta-arm/lib/oeqa/controllers/fvp.py

diff --git a/.gitignore b/.gitignore
new file mode 100644
index 00000000..bee8a64b
--- /dev/null
+++ b/.gitignore
@@ -0,0 +1 @@
+__pycache__
diff --git a/meta-arm/lib/oeqa/controllers/__init__.py b/meta-arm/lib/oeq=
a/controllers/__init__.py
new file mode 100644
index 00000000..e69de29b
diff --git a/meta-arm/lib/oeqa/controllers/fvp.py b/meta-arm/lib/oeqa/con=
trollers/fvp.py
new file mode 100644
index 00000000..1e26a519
--- /dev/null
+++ b/meta-arm/lib/oeqa/controllers/fvp.py
@@ -0,0 +1,87 @@
+import asyncio
+import os
+import pathlib
+import signal
+import subprocess
+
+import oeqa.core.target.ssh
+
+class OEFVPTarget(oeqa.core.target.ssh.OESSHTarget):
+
+    # meta-arm/scripts isn't on PATH, so work out where it is
+    metaarm =3D pathlib.Path(__file__).parents[4]
+
+    def __init__(self, logger, target_ip, server_ip, timeout=3D300, user=
=3D'root',
+                 port=3DNone, server_port=3D0, dir_image=3DNone, rootfs=3D=
None, bootlog=3DNone,
+                 **kwargs):
+        super().__init__(logger, target_ip, server_ip, timeout, user, po=
rt)
+        image_dir =3D pathlib.Path(dir_image)
+        basename =3D pathlib.Path(rootfs).stem
+        self.fvpconf =3D image_dir / (basename + ".fvpconf")
+
+        if not self.fvpconf.exists():
+            raise FileNotFoundError(f"Cannot find {self.fvpconf}")
+        # FVPs boot slowly, so allow ten minutes
+        self.boot_timeout =3D 10 * 60
+
+        self.logfile =3D bootlog and open(bootlog, "wb") or None
+
+    async def boot_fvp(self):
+        cmd =3D [OEFVPTarget.metaarm / "scripts" / "runfvp", "--console"=
, "--verbose", self.fvpconf]
+        # Python 3.7 needs the command items to be str
+        cmd =3D [str(c) for c in cmd]
+        self.logger.debug(f"Starting {cmd}")
+
+        # TODO: refactor runfvp so this can import it and directly hook =
to the
+        # console callback, then use telnetlib directly to access the co=
nsole.
+
+        # As we're using --console, telnet expects stdin to be readable =
too.
+        self.fvp =3D await asyncio.create_subprocess_exec(*cmd, stdout=3D=
subprocess.PIPE, stderr=3Dsubprocess.STDOUT, stdin=3Dsubprocess.PIPE)
+        self.logger.debug(f"Started runfvp PID {self.fvp.pid}")
+
+        async def wait_for_login():
+            bootlog =3D bytearray()
+            while True:
+                line =3D await self.fvp.stdout.read(1024)
+                if not line:
+                    self.logger.debug("runfvp terminated")
+                    return False, bootlog
+
+                self.logger.debug(f"Read line [{line}]")
+
+                bootlog +=3D line
+                if self.logfile:
+                    self.logfile.write(line)
+
+                if b" login:" in bootlog:
+                    self.logger.debug("Found login prompt")
+                    return True, bootlog
+            return False, bootlog
+
+        try:
+            found, bootlog =3D await asyncio.wait_for(wait_for_login(), =
self.boot_timeout)
+            if found:
+                return
+        except asyncio.TimeoutError:
+            self.logger.info("Timed out waiting for login prompt.")
+        self.logger.info(b"".join(bootlog.splitlines()[-20:]).decode("ut=
f-8", errors=3D"replace"))
+        raise RuntimeError("Failed to start FVP.")
+
+    def start(self, **kwargs):
+        # When we can assume Py3.7+, this can simply be asyncio.run()
+        loop =3D asyncio.get_event_loop()
+        loop.run_until_complete(asyncio.gather(self.boot_fvp()))
+
+    def stop(self, **kwargs):
+        loop =3D asyncio.get_event_loop()
+
+        # Kill the process group so that the telnet and FVP die too
+        gid =3D os.getpgid(self.fvp.pid)
+
+        try:
+            self.logger.debug(f"Sending SIGTERM to {gid}")
+            os.killpg(gid, signal.SIGTERM)
+            loop.run_until_complete(asyncio.wait_for(self.fvp.wait(), 10=
))
+        except TimeoutError:
+            self.logger.debug(f"Timed out, sending SIGKILL to {gid}")
+            os.killpg(gid, signal.SIGKILL)
--=20
2.25.1


