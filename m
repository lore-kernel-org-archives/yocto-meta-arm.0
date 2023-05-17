Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CEDC77B75
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 09:40:58 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.45436.1684316453071784448
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 May 2023 02:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=q0cyblfB;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3f50020e0f8so56362445e9.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 17 May 2023 02:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684316451; x=1686908451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Tv8b2NK/U7U5e/XMUJ4UL/th5tyka3V646pANKlfJA=;
        b=q0cyblfBZFKqwO+5qWGutB4ICQ4mqbBgdlb8JnoUHE76IGtbWB2V5ed8O8nZ6Nkzhc
         5zv0AVQdrhgp7iLocz3f1n189TiHG7PJ0y9oZjX+lY0Rsuwsf1GTQiBywk1s5DRFfmgs
         RT6rEMo2g95rqWVflQVdnWPYFseMCNVCFdcjlcWq5NqXXxVafqY5YQ+EFFWA5ZOzdx7Y
         G7prUHiUUjV8KlL+ssK0Lta9D6ZFef/0txtZ7b41/QXkMQGX2xxuMMF1SEVor/9V6IHK
         UhSyZws2Ct/9us1mIJ7olTukzYOybOEhlkUkgagPy0a2tcyMpaE9qJXglICNsZwXcpuM
         VW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684316451; x=1686908451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Tv8b2NK/U7U5e/XMUJ4UL/th5tyka3V646pANKlfJA=;
        b=iSEfgUjIhIMrIXAgP0S1lfEpMwZ8pX8Atmap68hsRPHptjMk+4uc/XdBQfG/Cx/k8O
         1JnymvLa4zdKbS+z321omcCy9bXGIS3JAcVW8kWwmgzq/yQ7aqmKbxtf7DAiShH44F7H
         fw6AjwTBhjgJOJQaRMPuegEyINB2qfCJOlr2fN9HHiuVi7h5kyv8jS68CJShbIlr0+UG
         asKg4WXjGxJ8SJIo1uoX63W3zJ3W27HOidVmvEy6K+t3bLxxIH4Mc1WLfSG0Vx79hldc
         VZ7eg4Jq3LmmbK4i05DkY9zDGmV9vRgaljkRk7flncdfvMYGQ9cqEltHtqNYdmjCvdi4
         0ikw==
X-Gm-Message-State: AC+VfDy5SGUxjFIcV70Beih9hQ2J59Scvg6IlnTxkP3bEKkdAG3UAVRT
	D2iRKCN2ei9q7El6Aq6g0qLOB0baaUYnBQ==
X-Google-Smtp-Source: ACHHUZ7W7Ici5e2xIUSPJunc2JnjeySmAP/nHfLrGcJN6YYe8/c9IBagqXTnJ2+gJpeOM42SRJHbhA==
X-Received: by 2002:a1c:4c19:0:b0:3f4:2775:b45c with SMTP id z25-20020a1c4c19000000b003f42775b45cmr1212801wmf.3.1684316450889;
        Wed, 17 May 2023 02:40:50 -0700 (PDT)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id n16-20020a1c7210000000b003f19b3d89e9sm1590811wmc.33.2023.05.17.02.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 02:40:50 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v4 1/2] arm/lib: pass the PATH to fvp runner
Date: Wed, 17 May 2023 11:40:43 +0200
Message-Id: <20230517094044.84867-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 May 2023 09:40:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4659

When running an FVP machine the model executable need to be found
in the PATH environement.

At the moment the script doesn't provide any PATH to the subprocess.

Add PATH to the allowed environement variable to be forwaded.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 meta-arm/lib/fvp/runner.py                 | 2 +-
 meta-arm/lib/oeqa/selftest/cases/runfvp.py | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

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
index 5cc8660f..46941ca9 100644
--- a/meta-arm/lib/oeqa/selftest/cases/runfvp.py
+++ b/meta-arm/lib/oeqa/selftest/cases/runfvp.py
@@ -83,6 +83,7 @@ class RunnerTests(OESelftestTestCase):
     def create_mock(self):
         return unittest.mock.patch("subprocess.Popen")
 
+    @unittest.mock.patch.dict(os.environ, {"PATH": "/path-42:/usr/sbin:/usr/bin:/sbin:/bin"})
     def test_start(self):
         from fvp import runner
         with self.create_mock() as m:
@@ -106,9 +107,9 @@ class RunnerTests(OESelftestTestCase):
                 stdin=unittest.mock.ANY,
                 stdout=unittest.mock.ANY,
                 stderr=unittest.mock.ANY,
-                env={"FOO":"BAR"})
+                env={"FOO":"BAR", "PATH": "/path-42:/usr/sbin:/usr/bin:/sbin:/bin"})
 
-    @unittest.mock.patch.dict(os.environ, {"DISPLAY": ":42", "WAYLAND_DISPLAY": "wayland-42"})
+    @unittest.mock.patch.dict(os.environ, {"DISPLAY": ":42", "WAYLAND_DISPLAY": "wayland-42", "PATH": "/path-42:/usr/sbin:/usr/bin:/sbin:/bin"})
     def test_env_passthrough(self):
         from fvp import runner
         with self.create_mock() as m:
@@ -128,4 +129,4 @@ class RunnerTests(OESelftestTestCase):
                 stdin=unittest.mock.ANY,
                 stdout=unittest.mock.ANY,
                 stderr=unittest.mock.ANY,
-                env={"DISPLAY":":42", "FOO": "BAR", "WAYLAND_DISPLAY": "wayland-42"})
+                env={"DISPLAY":":42", "FOO": "BAR", "WAYLAND_DISPLAY": "wayland-42", "PATH": "/path-42:/usr/sbin:/usr/bin:/sbin:/bin"})
-- 
2.40.1


