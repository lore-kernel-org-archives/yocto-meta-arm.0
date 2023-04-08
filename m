Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13BE4C7619A
	for <webhook@archiver.kernel.org>; Sat,  8 Apr 2023 08:12:13 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.6903.1680941523201651954
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 08 Apr 2023 01:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SFqz8TUN;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: peron.clem@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id d9so628619wrb.11
        for <meta-arm@lists.yoctoproject.org>; Sat, 08 Apr 2023 01:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680941521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5q+blT60VkFVwUoMc6ps+Ve5jNFGXTq2DhzJY3KhgRs=;
        b=SFqz8TUNNZ9Dj49FLSSomRZx3109Ge7BBEJ5AdBcxFqiA29bF2uBnOUMwJI2tNZBw5
         6ma9e9UZuKcOgGkxkw6ZT2CPMACqynT+Vy+GIw17VUkkZ0CV+ExVhuhqoOLpSIe23PB1
         fb4KqUKui2+8Mb6y5oidIHK9+JO0uUp/vBEt0PWTEaSkWFyrYklHbhv9ymTEowvsMC37
         0DIs+XMQIucKGWoUtjisfTFvEdjDCQ+12IhsDD8HP0yiyMez1gpR2rykSXbCLCZiZRhI
         7/BbPlu7N/qKUKLbyU3GhXUOcahq2wEFJXhSyf3mz1v1p9qjw9Dp4YYo5RhGMWQemB+J
         tY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680941521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5q+blT60VkFVwUoMc6ps+Ve5jNFGXTq2DhzJY3KhgRs=;
        b=JpoITGmiahqQGsXtm9C+q2mO11zRH/06/nRwYd2Iq+kQ2JJOWTiVHEV3niCUVKOJfD
         fZV0P3sxB3jrXTJWPV97qf7kiBmoJTuA2aBRoD+fI2LzUQ1T7M7obs9WxOLhmj0aR7TU
         xwhtJV9VD/Ya1wKOUdtDWFxM7PqSgAPlVipqVeAN+RJaTamXkDF8B3k/M09rLnFAas3h
         ybz2+ETmyzEPCU+Jyn7XU2eVd8UysSMIr+TDQapCFVGasG5YNKrm0WgkI4XBEsmHRFiE
         iUmDrYLr2E8TtqQGO2NxzEj81WuM6LS9phi5lZBujxk8oDyby5C4h5aDA56D+ARVxMgY
         IY2g==
X-Gm-Message-State: AAQBX9cyK/4mUqjJ5zUKB2uy3aIcL9GMmav9pLdfo/IKwEnll0nrXfuA
	UTpmd9laH+ptVxNtGBbX/acrcK2BoaA=
X-Google-Smtp-Source: AKy350YdPeC1z04gcRduHEigeMoaw2MG6hHxcYYCYGrEImMWfjxE0zDXIjoIYzviZiyN7dTzN4JTyA==
X-Received: by 2002:a5d:6045:0:b0:2d0:d739:f901 with SMTP id j5-20020a5d6045000000b002d0d739f901mr784551wrt.20.1680941520999;
        Sat, 08 Apr 2023 01:12:00 -0700 (PDT)
Received: from Clement-Blade14.home (2a01cb000c0d3d0050367cd0f13dd5cf.ipv6.abo.wanadoo.fr. [2a01:cb00:c0d:3d00:5036:7cd0:f13d:d5cf])
        by smtp.gmail.com with ESMTPSA id c18-20020a5d4f12000000b002efabc778d2sm4290608wru.112.2023.04.08.01.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Apr 2023 01:12:00 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 1/2] arm/lib: pass the PATH to fvp runner
Date: Sat,  8 Apr 2023 10:11:57 +0200
Message-Id: <20230408081158.7575-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 08 Apr 2023 08:12:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4565

When running an FVP machine the model executable need to be found
in the PATH environement.

At the moment the script doesn't provide any PATH to the subprocess.

Add PATH to the allowed environement variable to be forwaded.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 meta-arm/lib/fvp/runner.py                 | 2 +-
 meta-arm/lib/oeqa/selftest/cases/runfvp.py | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
index c52cdc1c..d957e780 100644
--- a/meta-arm/lib/fvp/runner.py
+++ b/meta-arm/lib/fvp/runner.py
@@ -91,7 +91,7 @@ class FVPRunner:
         # Pass through environment variables needed for GUI applications, such
         # as xterm, to work.
         env = config['env']
-        for name in ('DISPLAY', 'WAYLAND_DISPLAY', 'XAUTHORITY'):
+        for name in ('DISPLAY', 'PATH', 'WAYLAND_DISPLAY', 'XAUTHORITY'):
             if name in os.environ:
                 env[name] = os.environ[name]
 
diff --git a/meta-arm/lib/oeqa/selftest/cases/runfvp.py b/meta-arm/lib/oeqa/selftest/cases/runfvp.py
index 5cc8660f..7e0d7808 100644
--- a/meta-arm/lib/oeqa/selftest/cases/runfvp.py
+++ b/meta-arm/lib/oeqa/selftest/cases/runfvp.py
@@ -108,7 +108,7 @@ class RunnerTests(OESelftestTestCase):
                 stderr=unittest.mock.ANY,
                 env={"FOO":"BAR"})
 
-    @unittest.mock.patch.dict(os.environ, {"DISPLAY": ":42", "WAYLAND_DISPLAY": "wayland-42"})
+    @unittest.mock.patch.dict(os.environ, {"DISPLAY": ":42", "WAYLAND_DISPLAY": "wayland-42", "PATH": "/path-42:/usr/sbin:/usr/bin:/sbin:/bin"})
     def test_env_passthrough(self):
         from fvp import runner
         with self.create_mock() as m:
@@ -128,4 +128,4 @@ class RunnerTests(OESelftestTestCase):
                 stdin=unittest.mock.ANY,
                 stdout=unittest.mock.ANY,
                 stderr=unittest.mock.ANY,
-                env={"DISPLAY":":42", "FOO": "BAR", "WAYLAND_DISPLAY": "wayland-42"})
+                env={"DISPLAY":":42", "FOO": "BAR", "WAYLAND_DISPLAY": "wayland-42", "PATH": "/path-42:/usr/sbin:/usr/bin:/sbin:/bin"})
-- 
2.34.1


