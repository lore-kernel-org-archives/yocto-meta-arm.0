Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12803C7618D
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 15:29:26 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.161503.1680794962190377680
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Apr 2023 08:29:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Tti1CkgY;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: peron.clem@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id d17so39888139wrb.11
        for <meta-arm@lists.yoctoproject.org>; Thu, 06 Apr 2023 08:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680794960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5q+blT60VkFVwUoMc6ps+Ve5jNFGXTq2DhzJY3KhgRs=;
        b=Tti1CkgYAJ/JDPeGHgPfDUMSzUhLnRRxx/nQ82wpW/OMq9hgiumn+g1FLhYZeEPME/
         BfeUQNPhepKDlNC3zOO0FnYV0m1eRtd2ey/4kDjAbL2mPVyvBejPMjl7fWfdjthhWf5c
         Nqtf5FMv+rbAqfzaxFeJIgxGPXWFsmDu2A0liyWhaJKHsAzjiweA+aWc5wcK4igy1beX
         M/cIc1Id/er8vXAZTd0nWqbw01U6J/CTg7JAcDYOTeth3G40mumSa6bzGJyUfKdszExm
         tNH1OyQnuER9QS9K2g7icssMP4s4gATD7/z1zkwMVmH7yNKTKqJhcTJh79syFos8yc3z
         /qUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680794960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5q+blT60VkFVwUoMc6ps+Ve5jNFGXTq2DhzJY3KhgRs=;
        b=q6UfaoIXXOlcRv2kFXrwZLfb3oFVhnXeOaq9QS/RCmGS8h4PGvPGFw6Sei30Ok4KPu
         yhJww9zAYHiZ81/qLLSZ95WlhhKE+sG6wQ0QPtTyYBGwYWSpE+OYOz5yyl1CiV00yciC
         HAu3Bzt8EjqLMEK+6HgqaGKGwqAWSds9KilSIOpdRXLLyfJgx0uMlLxh/sll59b/fvnS
         ord+JdzIM7tta3LVO3vEeACfba5wHdMX+1laHPY8MUnl99TLRuPjxXqMoVwzfn8HOJ9l
         wrWBMMSwmRquKZ+yGtXtYwga5xn7BsOzL0FtjV/0999DwNOg77CWdY6z2FrAqC/5HpQu
         s5Ng==
X-Gm-Message-State: AAQBX9czr/e441ze1y389030VbnEQUyxi5W6I5c5rh7lICE70Q0Z+Iuq
	7ML/ahjOGizFcx7BpAC653KM0IpbR1A=
X-Google-Smtp-Source: AKy350ZyrUr1PD0NStbH46rQHuyuEejFZckq5SbrXEslPLTfPbd2sc3KYqU/jnLdEfb33uM1dkSSaw==
X-Received: by 2002:a05:6000:8a:b0:2de:a953:6b05 with SMTP id m10-20020a056000008a00b002dea9536b05mr6316238wrx.67.1680794960266;
        Thu, 06 Apr 2023 08:29:20 -0700 (PDT)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id n5-20020a5d4845000000b002e5f6f8fc4fsm2006729wrs.100.2023.04.06.08.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 08:29:19 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v2 1/2] arm/lib: pass the PATH to fvp runner
Date: Thu,  6 Apr 2023 17:29:07 +0200
Message-Id: <20230406152908.224075-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 06 Apr 2023 15:29:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4560

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


