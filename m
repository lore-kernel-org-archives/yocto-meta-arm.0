Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5560C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:21:11 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web08.20585.1646058070639952436
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 28 Feb 2022 06:21:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=DTmh1lUi;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.171,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f171.google.com with SMTP id b13so10344639qkj.12
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 28 Feb 2022 06:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0WFDU1q/TsW9pjm9VIBuxkXxCVzh9cCieIqagC8abGM=;
        b=DTmh1lUiso3YkE8uyj1Ai1utzdqOmOTPgt6aLxjVyimWji/S700EWoKUsWvvFaOFmD
         D46+8kJoRxDu+gM7eXRG8gCTm9M9TpmypeJnpN7f0Pu1NDhnKXcNH+24gFKxhVeUgWQG
         Z1C/2EY7c6L12GG+SqPww9rVmjz/Ht4xH4mRmcU8rijrWLsFwyZx5nwxca6yhUIuMYhq
         IwIayR3xvICHcDqOrX7/v1nyN+hnKhHKopzF2POHuxskQW0/7MGXRiwGCkfiCNcPXg73
         9tBUm+2XmVj8EdnxK9kzG19oLAntIIGmc6/tLH7s41Ll0coJ7E42y1nnuIVKCrRDtBXx
         UE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0WFDU1q/TsW9pjm9VIBuxkXxCVzh9cCieIqagC8abGM=;
        b=Yh24ncoGe4KaUHA/JGs7bGdMnkehdKLmx+EFRNPzQ8vF+qWwANstle+l8AGNWaOG8h
         knYuqUCH8nBY6+JsPz/n5nGWYnpWN+GGYGT9b/0sth+wlCy4ay0cvpC7mlkRD9+ylPNC
         PbyCP0zFk05miri+/Gysyx+E5prcJ3mc638OUhKAT7C0EnY29OzQM+2Jm+1daSgBQJMT
         ZykP8w6zaCSCwMzQjo6c61qrC9NnXkgLAGE0uKexMFP8rAskKodDNL19oidXWf0Bi2mp
         Iu67g4C3vBgl5kXwBsAU8+v2q58fl1QEvDrHehxBfc6TtJ1BSM/tuD1TlQHre7LDrJg+
         scAw==
X-Gm-Message-State: AOAM533oHCfyBtf3NqjNDcOGB9HUsDvlB/cgNusMp80vXDaT04fmQHBq
	fc1svAbvFPk8qBE5YSmNgsMKEPdtr+H3gA==
X-Google-Smtp-Source: 
 ABdhPJyVJ8++r2RiI9UqrW/gxYNfS24kBx6+5tZlCwmehf+J/1LZ9RIBSlXn8KNSh7wM5/I7nqNsVQ==
X-Received: by 2002:a37:9dd6:0:b0:662:ef54:5647 with SMTP id
 g205-20020a379dd6000000b00662ef545647mr2903820qke.636.1646058069523;
        Mon, 28 Feb 2022 06:21:09 -0800 (PST)
Received: from localhost ([2605:a601:a665:9200:919c:55a6:55ad:dbe7])
        by smtp.gmail.com with ESMTPSA id
 n8-20020a05620a152800b00648e52be61bsm4977381qkk.37.2022.02.28.06.21.09
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 06:21:09 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] Revert "CI: apply a patch so that meta-zephyr is compatible
 with kirkstone"
Date: Mon, 28 Feb 2022 09:21:08 -0500
Message-Id: <20220228142108.1930507-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 28 Feb 2022 14:21:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3074

This reverts commit 7dd00e4d71b74d4af8c0c01dcadf766e51b308a6.
---
 ...-kirkstone-to-layer-compatible-lists.patch | 49 -------------------
 ci/meta-zephyr.yml                            |  4 --
 2 files changed, 53 deletions(-)
 delete mode 100644 0001-layer.conf-add-kirkstone-to-layer-compatible-lists.patch

diff --git a/0001-layer.conf-add-kirkstone-to-layer-compatible-lists.patch b/0001-layer.conf-add-kirkstone-to-layer-compatible-lists.patch
deleted file mode 100644
index 8476e0ac37bb..000000000000
--- a/0001-layer.conf-add-kirkstone-to-layer-compatible-lists.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From b49ad47797c6364b351ffdac6ff8c627368962c3 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Wed, 23 Feb 2022 13:39:39 +0000
-Subject: [meta-zephyr][PATCH] layer.conf: add kirkstone to layer compatible
- lists
-
-Add Kirkstone to the layer compatbility list now that oe-core master
-only support kirkstone.
-
-Many variables were renamed in oe-core, but as none of them are used in
-meta-zephyr this layer can remain compatible with older layers too.
-
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- meta-zephyr-bsp/conf/layer.conf  | 4 ++--
- meta-zephyr-core/conf/layer.conf | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/meta-zephyr-bsp/conf/layer.conf b/meta-zephyr-bsp/conf/layer.conf
-index d5d478c..507374f 100644
---- a/meta-zephyr-bsp/conf/layer.conf
-+++ b/meta-zephyr-bsp/conf/layer.conf
-@@ -15,6 +15,6 @@ LAYERVERSION_zephyrbsp = "1"
- 
- LAYERDEPENDS_zephyrbsp = "zephyrcore core meta-python"
- 
--LAYERSERIES_COMPAT_zephyrbsp = "dunfell gatesgarth hardknott honister"
-+LAYERSERIES_COMPAT_zephyrbsp = "dunfell gatesgarth hardknott honister kirkstone"
- 
--X86_TUNE_DIR = "${@bb.utils.contains('LAYERSERIES_CORENAMES', 'honister', 'include/x86', 'include', d)}"
-+X86_TUNE_DIR = "${@bb.utils.contains_any('LAYERSERIES_CORENAMES', 'honister kirkstone', 'include/x86', 'include', d)}"
-diff --git a/meta-zephyr-core/conf/layer.conf b/meta-zephyr-core/conf/layer.conf
-index d3ac10e..20c8fdf 100644
---- a/meta-zephyr-core/conf/layer.conf
-+++ b/meta-zephyr-core/conf/layer.conf
-@@ -15,8 +15,8 @@ LAYERVERSION_zephyrcore = "1"
- 
- LAYERDEPENDS_zephyrcore = "core meta-python"
- 
--LAYERSERIES_COMPAT_zephyrcore = "dunfell gatesgarth hardknott honister"
-+LAYERSERIES_COMPAT_zephyrcore = "dunfell gatesgarth hardknott honister kirkstone"
- 
--X86_TUNE_DIR = "${@bb.utils.contains('LAYERSERIES_CORENAMES', 'honister', 'include/x86', 'include', d)}"
-+X86_TUNE_DIR = "${@bb.utils.contains_any('LAYERSERIES_CORENAMES', 'honister kirkstone', 'include/x86', 'include', d)}"
- 
- PYTHON3_NATIVE_SITEPACKAGES_DIR = "${libdir_native}/${PYTHON3_DIR}/site-packages"
--- 
-2.25.1
-
diff --git a/ci/meta-zephyr.yml b/ci/meta-zephyr.yml
index 5675cc0eb4f9..bdd0e2bbb9c6 100644
--- a/ci/meta-zephyr.yml
+++ b/ci/meta-zephyr.yml
@@ -8,10 +8,6 @@ repos:
     url: https://git.yoctoproject.org/git/meta-zephyr
     layers:
       meta-zephyr-core:
-    patches:
-      kirkstone:
-        repo: meta-arm
-        path: 0001-layer.conf-add-kirkstone-to-layer-compatible-lists.patch
 
 target:
   - zephyr-kernel-test-all
-- 
2.30.2


