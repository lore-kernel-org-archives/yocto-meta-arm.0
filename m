Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web12.2971.1628285790836767878
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 06 Aug 2021 14:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=RfJYPbhX;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.45, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f45.google.com with SMTP id m12so5669409qvt.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 06 Aug 2021 14:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=w3ASJTMYOQsQKBrfKWReTLv2eDBYVXfw+l1hbmWEspM=;
        b=RfJYPbhX6t0Qd7qD6zm7kB5mGg6x9lG0GA0lovizCh+UzQKsEH0GyR5ipMOskG52gb
         HwOAZA230K9ppLmxjI9UeImPoWFF7szTIFbZNJoNOJwLyCRSyzN3qKrPle+i1VQyrG2S
         QGfLy95KX3oavj25FRLB/67QfMec14UzT/DwFS7ecPfZwnLFo8J/ClysFGmjk+xckwvG
         qWTr4kfsp0KglFhnaVPNb1GnPw/1OQQ61SC2aCJws0FFP1bE1NYPqG0Q2HzhnPGD5Dn2
         Jot90xrEJwfJ6p4OTyGDd9dFnSqoJ5RTSj43g6LeMX7CG++N5U+zg86yT2+a7bAAEtvh
         9xsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w3ASJTMYOQsQKBrfKWReTLv2eDBYVXfw+l1hbmWEspM=;
        b=rl5dmw+h3vp9cosZahLorayZNLtbCnlQJIN57dRuTorlkcc7JEYCZnHE8NTW16wj0Z
         kf5yVBRmee0P3OQGpqfyTUzA2dMwR7+81fe7JC7gdqNizproBStrGUEtvq7hWWRfjWWv
         +ummQR5UFg/qeXxjd7TY2bq2RztTQN0nrNyqFzGJKaEFqhS0cPg5iwgWa4HOHMZ9yizM
         iNIOtW6G4qisyTTUp7owTvmgOjJXTgB+ED0woj/yZtgrPeiYxvmNuL63gDKjxt9SHTF7
         ZN+qKdDi0QVnZD26ES45T5sAzgHvzQwgLQobB9bNGHyS7iSAx9h2b/8mVKxQDkVj13/a
         5eXQ==
X-Gm-Message-State: AOAM5332yzYjgYh30jVdkvumwr4IGnVSA6ojZv/YoEz4nw1NGt/JQ20Q
	x5b+R5tk/19gjYa/4jjzq7ka+JosccgFVQ==
X-Google-Smtp-Source: ABdhPJy2IPz2Zh8gDVHAqCDMntwcBu6iltZ7JsPWVg2Z0luOJD54MAd0fNiN8MJLKzEk6H/PoJejbQ==
X-Received: by 2002:a05:6214:14e6:: with SMTP id k6mr2010446qvw.53.1628285789928;
        Fri, 06 Aug 2021 14:36:29 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a632:4e00:59e3:c3e7:7bac:fd79])
        by smtp.gmail.com with ESMTPSA id bl26sm5139602qkb.34.2021.08.06.14.36.29
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 14:36:29 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 7/7] CI: move xen specific changes out of gem5-arm64-xen.yml
Date: Fri,  6 Aug 2021 17:36:24 -0400
Message-Id: <20210806213624.22981-8-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210806213624.22981-1-jon.mason@arm.com>
References: <20210806213624.22981-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the xen specific changes out of gem5-arm64-xen.yml.  This allows
for other xen machines in the CI.  Adding Xen machines for qemuarm and
qemuarm64 allows for more testing, which should be expanded when the Xen
Test Framework in meta-virtualization is expanded to work on arm
machines.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml             | 20 +++++++++++++-------
 ci/gem5-arm64-xen.yml      | 24 ------------------------
 ci/meta-arm-autonomy.yml   |  4 +---
 ci/meta-virtualization.yml |  9 +++++++++
 ci/qemuarm64.yml           |  6 ++++++
 ci/xen.yml                 | 11 +++++++++++
 6 files changed, 40 insertions(+), 34 deletions(-)
 delete mode 100644 ci/gem5-arm64-xen.yml
 create mode 100644 ci/meta-virtualization.yml
 create mode 100644 ci/qemuarm64.yml
 create mode 100644 ci/xen.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 98a790878d39..bbd4c916892e 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -112,7 +112,7 @@ fvp-baser-aemv8r64:
 gem5-arm64:
   extends: .build
 
-gem5-arm64-xen:
+gem5-arm64/xen:
   extends: .build
 
 gem5-atp-arm64:
@@ -145,12 +145,6 @@ n1sdp/armgcc:
 qemu-cortex-a53:
   extends: .build
 
-qemuarm/testimage:
-  extends: .build
-
-qemuarm/clang/testimage:
-  extends: .build
-
 qemuarm64-sbsa:
   extends: .build
 
@@ -166,6 +160,18 @@ qemuarm64-secureboot/clang/musl/testimage:
 qemuarm64-secureboot/musl/testimage:
   extends: .build
 
+qemuarm64/xen:
+  extends: .build
+
+qemuarm/clang/testimage:
+  extends: .build
+
+qemuarm/testimage:
+  extends: .build
+
+qemuarm/xen:
+  extends: .build
+
 qemuarmv5/testimage:
   extends: .build
 
diff --git a/ci/gem5-arm64-xen.yml b/ci/gem5-arm64-xen.yml
deleted file mode 100644
index f71ffca33ffe..000000000000
--- a/ci/gem5-arm64-xen.yml
+++ /dev/null
@@ -1,24 +0,0 @@
-
-header:
-  version: 9
-  includes:
-    - base.yml
-    - meta-openembedded.yml
-
-repos:
-  meta-arm:
-    layers:
-      meta-gem5:
-  meta-virtualization:
-    url: git://git.yoctoproject.org/meta-virtualization
-    #FIXME - remove after master branch has overrides syntax conversion patch
-    refspec: master-next
-
-machine: gem5-arm64
-
-local_conf_header:
-  meta-virt:
-    DISTRO_FEATURES:append = " virtualization xen"
-
-target:
-  - xen-image-minimal
diff --git a/ci/meta-arm-autonomy.yml b/ci/meta-arm-autonomy.yml
index 4402b968a383..260750af5374 100644
--- a/ci/meta-arm-autonomy.yml
+++ b/ci/meta-arm-autonomy.yml
@@ -2,11 +2,9 @@ header:
   version: 9
   includes:
     - meta-openembedded.yml
+    - meta-virtualization.yml
 
 repos:
-  meta-virtualization:
-    url: https://git.yoctoproject.org/git/meta-virtualization
-
   meta-arm:
     layers:
       meta-arm-autonomy:
diff --git a/ci/meta-virtualization.yml b/ci/meta-virtualization.yml
new file mode 100644
index 000000000000..b7e15b2abb4e
--- /dev/null
+++ b/ci/meta-virtualization.yml
@@ -0,0 +1,9 @@
+header:
+  version: 9
+  includes:
+    - meta-openembedded.yml
+
+repos:
+  meta-virtualization:
+    url: git://git.yoctoproject.org/meta-virtualization
+    refspec: master-next
diff --git a/ci/qemuarm64.yml b/ci/qemuarm64.yml
new file mode 100644
index 000000000000..cc29c75062ab
--- /dev/null
+++ b/ci/qemuarm64.yml
@@ -0,0 +1,6 @@
+header:
+  version: 9
+  includes:
+    - base.yml
+
+machine: qemuarm64
diff --git a/ci/xen.yml b/ci/xen.yml
new file mode 100644
index 000000000000..d0c1765ee386
--- /dev/null
+++ b/ci/xen.yml
@@ -0,0 +1,11 @@
+header:
+  version: 9
+  includes:
+    - meta-virtualization.yml
+
+local_conf_header:
+  meta-virt:
+    DISTRO_FEATURES:append = " virtualization xen"
+
+target:
+  - xen-image-minimal
-- 
2.20.1

