Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3564DC7EE2A
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 10:09:29 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.45622.1684318162401809917
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 May 2023 03:09:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=O7moEUPM;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f41dceb9c9so4068395e9.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 17 May 2023 03:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684318160; x=1686910160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6q9G71dZDBXu4EGfPC+udRsMuRSSr98wykzJd2y+8I0=;
        b=O7moEUPMrc6AEVKoHeJI+LJ6J7sr8OgW/u1nKdRkdz5+y4G+88xSHQKFkiB6d7t26J
         WELjU+rxiHreJlT4KwQlg6rrLfFbmEEGoBgKaC9MOlehteeOMWCstlt3Em4l8CSUxs94
         OIOy4eMBFC4vjYmGt9uMNigVC+XX32En4zIVZpmSIKfmYAPjZehX44QOPXzKgvNmTRjn
         MvszH5C9xnmr+yIE3SkGVKa5hJ0zuxZtrD5y8cwaowJC4eFcTHpn0gnLDIIyLlgUZyPo
         9V6o3M2qzeVJW7FM7HCvAMFgvAelIc2FMX+QJz+GT+d12b37NB5Ex3hBL1iL+hFtrR3u
         tO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684318160; x=1686910160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6q9G71dZDBXu4EGfPC+udRsMuRSSr98wykzJd2y+8I0=;
        b=fVyTRbxjgJR/BAaLL/i9k1Wp7/3MZmRKv8yvPYBmms+M86gRScPA42wdgECgtEjP/4
         iAFFDJpKweTSN0k2cwgdy8TM5Sm1+yAgOv5fcjhJu4KS4vGYVyfLPjCgF3YUOrrD6S8Z
         r6zLdNsvlO8jPrxeUf6Z7xo2TBOG4iMXXAoLhk84aCgmZFPoLJKhNLyuhN7eN318ztlR
         3bKZrudf7aeeJNMEoWBQBF0Q1X6JRZKrWBRc/ax09NJTADT+WDN7x56ke9xFf6bK8F3O
         6d6/j4kuM/lK7XjtO7Q9QDGs52R8DUdU/LZtPd1/cHNMWjEQVpE+NwnBNrZfjFFyOzJF
         kGtw==
X-Gm-Message-State: AC+VfDyV/ZMw3ILxxAx/pkeW8wgHl3NMvqExhvJH48qd/qBXIVSeWKqb
	67AbTWCauoJ1tnTvQOSAXR9nyz/pkURBWg==
X-Google-Smtp-Source: ACHHUZ5dLGaP2AeitBTewBDRwlxWOujZv1qXTW1p11lNAPgaUvto6rViSfTF5fhxfvHjAMzRHHqdCg==
X-Received: by 2002:a1c:7412:0:b0:3f4:298f:4d01 with SMTP id p18-20020a1c7412000000b003f4298f4d01mr20895377wmc.26.1684318160258;
        Wed, 17 May 2023 03:09:20 -0700 (PDT)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id l5-20020a7bc445000000b003f42e008c8dsm1770392wmi.44.2023.05.17.03.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 03:09:20 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [RFC PATCH v2 2/3] fvp: runner: execute fvp process in the same working directory as fvpconf
Date: Wed, 17 May 2023 12:09:12 +0200
Message-Id: <20230517100913.96055-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230517100913.96055-1-peron.clem@gmail.com>
References: <20230517100913.96055-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 May 2023 10:09:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4662

In Order to be able to have filepath relative to fvpconf, execute the
fvp process in the same working directory.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 meta-arm/lib/fvp/runner.py                 | 7 ++++++-
 meta-arm/lib/oeqa/selftest/cases/runfvp.py | 8 ++++++--
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
index 4f5f88ca..7ca3673d 100644
--- a/meta-arm/lib/fvp/runner.py
+++ b/meta-arm/lib/fvp/runner.py
@@ -99,11 +99,16 @@ class FVPRunner:
             if name in os.environ:
                 env[name] = os.environ[name]
 
+        # Allow filepath to be relative to fvp configuration file
+        cwd = os.path.dirname(fvpconf)
+        self._logger.debug(f"FVP call will be executed in working directory: {cwd}")
+
         self._logger.debug(f"Constructed FVP call: {shlex_join(cli)}")
         self._fvp_process = subprocess.Popen(
             cli,
             stdin=subprocess.DEVNULL, stdout=stdout, stderr=subprocess.STDOUT,
-            env=env)
+            env=env,
+            cwd=cwd)
 
     def stop(self):
         if self._fvp_process:
diff --git a/meta-arm/lib/oeqa/selftest/cases/runfvp.py b/meta-arm/lib/oeqa/selftest/cases/runfvp.py
index 2d2cdc80..d60aa3c4 100644
--- a/meta-arm/lib/oeqa/selftest/cases/runfvp.py
+++ b/meta-arm/lib/oeqa/selftest/cases/runfvp.py
@@ -102,6 +102,7 @@ class RunnerTests(OESelftestTestCase):
             with tempfile.NamedTemporaryFile('w') as fvpconf:
                 json.dump(config, fvpconf)
                 fvpconf.flush()
+                cwd_mock = os.path.dirname(fvpconf.name)
                 fvp.start(fvpconf.name)
 
             m.assert_called_once_with(['/usr/bin/FVP_Binary',
@@ -112,7 +113,8 @@ class RunnerTests(OESelftestTestCase):
                 stdin=unittest.mock.ANY,
                 stdout=unittest.mock.ANY,
                 stderr=unittest.mock.ANY,
-                env={"FOO":"BAR", "PATH": "/path-42:/usr/sbin:/usr/bin:/sbin:/bin"})
+                env={"FOO":"BAR", "PATH": "/path-42:/usr/sbin:/usr/bin:/sbin:/bin"},
+                cwd=cwd_mock)
 
     @unittest.mock.patch.dict(os.environ, {"DISPLAY": ":42", "WAYLAND_DISPLAY": "wayland-42", "PATH": "/path-42:/usr/sbin:/usr/bin:/sbin:/bin"})
     def test_env_passthrough(self):
@@ -132,10 +134,12 @@ class RunnerTests(OESelftestTestCase):
             with tempfile.NamedTemporaryFile('w') as fvpconf:
                 json.dump(config, fvpconf)
                 fvpconf.flush()
+                cwd_mock = os.path.dirname(fvpconf.name)
                 fvp.start(fvpconf.name)
 
             m.assert_called_once_with(['/usr/bin/FVP_Binary'],
                 stdin=unittest.mock.ANY,
                 stdout=unittest.mock.ANY,
                 stderr=unittest.mock.ANY,
-                env={"DISPLAY":":42", "FOO": "BAR", "WAYLAND_DISPLAY": "wayland-42", "PATH": "/path-42:/usr/sbin:/usr/bin:/sbin:/bin"})
+                env={"DISPLAY":":42", "FOO": "BAR", "WAYLAND_DISPLAY": "wayland-42", "PATH": "/path-42:/usr/sbin:/usr/bin:/sbin:/bin"},
+                cwd=cwd_mock)
-- 
2.40.1


