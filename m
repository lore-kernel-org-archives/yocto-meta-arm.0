Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0992AC4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 05:08:08 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web12.3605.1645765686942416791
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 21:08:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=oBdO9Z0T;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id q10so1529651qtw.4
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 21:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N3kschuUkEDKC2l3vPOjHJtAssXOoz6HmgdX8y7hWMo=;
        b=oBdO9Z0TrSYEHSEFn3INHMpTHL84/2uEELJe66qVei4OHtf95VD80M/aGzXgdlsOLH
         6luPkWMEvSiGSNCAGeKc3sqViLGhTIdID945pRGGppx1RYuEDZaDm2lFQBz6hQq4C+no
         /pDLRk92jkauarfo6qogQpd/i5o4iPXUWnCg7TVXnSisoOgg6Go1UpZVLfvDSARMhZNf
         FNfLwmH+jc6y5NM5k8i9RQvXYawkG0vYO1Q6opGG+iLrcnXbr5W0sw9ePs5A4tPMhNzM
         T21WiGmjxq8+mRd0U/ZnQKk4hQba+awN9yKZ56ThaZic+4+Zx92/pqxLidwZ9N7LUDVE
         HGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N3kschuUkEDKC2l3vPOjHJtAssXOoz6HmgdX8y7hWMo=;
        b=7Xg5SSvUwJMJNkV8vU40gGF0aN+3K+pCiER3nwdfg0QK6kI0ZfdkLCjShFzP+ngpAj
         InHppWKNySaJ4jqs6Hpu5Qf0/t0jx7V9WlsIl5zlzbymMcLTjZ5b497x8MqgX5lyUcgE
         6uzQUf3SrXIvQM4U7GgEXtuwI5nK2pLBrSG/bjdAq65rUOnOQYVhpbZLxlUhL4Uhbb5v
         wOLktSvnLiWcCSdsJ9CS40lw8CrSBu7754XYMP2mnYPfXFAR92xns+HdGIHjB/P8CE4d
         R3v1WFVM03Br9R+409Yqvl5JdFwKZGAaTP6+B2mN+jALC4ay5iy4wTNoGC6sSjMY3ZvJ
         UWfA==
X-Gm-Message-State: AOAM532WBtkruaHly1Zaxbe0odLhB6TlaPga1Oxly3LvS20Xy2Ol+TyC
	ssJtD3gbgjJTjzKK1T1YX7iPq5FHdCjYWA==
X-Google-Smtp-Source: 
 ABdhPJw1bWU+MHEzFLDdZSzusB0wxzVeA7HOybMfn9FVptRTD0JQAJysy/jJNRFpExv5euQVw2NK1Q==
X-Received: by 2002:ac8:5bd0:0:b0:2de:ac9f:9986 with SMTP id
 b16-20020ac85bd0000000b002deac9f9986mr3858447qtb.18.1645765686002;
        Thu, 24 Feb 2022 21:08:06 -0800 (PST)
Received: from localhost ([2605:a601:a665:9200:97ee:8b84:aa35:fed0])
        by smtp.gmail.com with ESMTPSA id
 bp30-20020a05622a1b9e00b002de4d3b119bsm906444qtb.74.2022.02.24.21.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 21:08:05 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH 4/8] CI: apply a patch so that meta-zephyr is compatible with
 kirkstone
Date: Fri, 25 Feb 2022 00:07:59 -0500
Message-Id: <20220225050803.2517279-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225050803.2517279-1-jon.mason@arm.com>
References: <20220225050803.2517279-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 25 Feb 2022 05:08:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3061

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-kirkstone-to-layer-compatible-lists.patch | 49 +++++++++++++++++++
 ci/meta-zephyr.yml                            |  4 ++
 2 files changed, 53 insertions(+)
 create mode 100644 0001-layer.conf-add-kirkstone-to-layer-compatible-lists.patch

diff --git a/0001-layer.conf-add-kirkstone-to-layer-compatible-lists.patch b/0001-layer.conf-add-kirkstone-to-layer-compatible-lists.patch
new file mode 100644
index 000000000000..8476e0ac37bb
--- /dev/null
+++ b/0001-layer.conf-add-kirkstone-to-layer-compatible-lists.patch
@@ -0,0 +1,49 @@
+From b49ad47797c6364b351ffdac6ff8c627368962c3 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 23 Feb 2022 13:39:39 +0000
+Subject: [meta-zephyr][PATCH] layer.conf: add kirkstone to layer compatible
+ lists
+
+Add Kirkstone to the layer compatbility list now that oe-core master
+only support kirkstone.
+
+Many variables were renamed in oe-core, but as none of them are used in
+meta-zephyr this layer can remain compatible with older layers too.
+
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ meta-zephyr-bsp/conf/layer.conf  | 4 ++--
+ meta-zephyr-core/conf/layer.conf | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/meta-zephyr-bsp/conf/layer.conf b/meta-zephyr-bsp/conf/layer.conf
+index d5d478c..507374f 100644
+--- a/meta-zephyr-bsp/conf/layer.conf
++++ b/meta-zephyr-bsp/conf/layer.conf
+@@ -15,6 +15,6 @@ LAYERVERSION_zephyrbsp = "1"
+ 
+ LAYERDEPENDS_zephyrbsp = "zephyrcore core meta-python"
+ 
+-LAYERSERIES_COMPAT_zephyrbsp = "dunfell gatesgarth hardknott honister"
++LAYERSERIES_COMPAT_zephyrbsp = "dunfell gatesgarth hardknott honister kirkstone"
+ 
+-X86_TUNE_DIR = "${@bb.utils.contains('LAYERSERIES_CORENAMES', 'honister', 'include/x86', 'include', d)}"
++X86_TUNE_DIR = "${@bb.utils.contains_any('LAYERSERIES_CORENAMES', 'honister kirkstone', 'include/x86', 'include', d)}"
+diff --git a/meta-zephyr-core/conf/layer.conf b/meta-zephyr-core/conf/layer.conf
+index d3ac10e..20c8fdf 100644
+--- a/meta-zephyr-core/conf/layer.conf
++++ b/meta-zephyr-core/conf/layer.conf
+@@ -15,8 +15,8 @@ LAYERVERSION_zephyrcore = "1"
+ 
+ LAYERDEPENDS_zephyrcore = "core meta-python"
+ 
+-LAYERSERIES_COMPAT_zephyrcore = "dunfell gatesgarth hardknott honister"
++LAYERSERIES_COMPAT_zephyrcore = "dunfell gatesgarth hardknott honister kirkstone"
+ 
+-X86_TUNE_DIR = "${@bb.utils.contains('LAYERSERIES_CORENAMES', 'honister', 'include/x86', 'include', d)}"
++X86_TUNE_DIR = "${@bb.utils.contains_any('LAYERSERIES_CORENAMES', 'honister kirkstone', 'include/x86', 'include', d)}"
+ 
+ PYTHON3_NATIVE_SITEPACKAGES_DIR = "${libdir_native}/${PYTHON3_DIR}/site-packages"
+-- 
+2.25.1
+
diff --git a/ci/meta-zephyr.yml b/ci/meta-zephyr.yml
index bdd0e2bbb9c6..5675cc0eb4f9 100644
--- a/ci/meta-zephyr.yml
+++ b/ci/meta-zephyr.yml
@@ -8,6 +8,10 @@ repos:
     url: https://git.yoctoproject.org/git/meta-zephyr
     layers:
       meta-zephyr-core:
+    patches:
+      kirkstone:
+        repo: meta-arm
+        path: 0001-layer.conf-add-kirkstone-to-layer-compatible-lists.patch
 
 target:
   - zephyr-kernel-test-all
-- 
2.30.2


