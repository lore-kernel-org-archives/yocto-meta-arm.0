Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8528FCEACDD
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 15:10:00 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web11.84279.1727795390895648594
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Oct 2024 08:09:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=nukx55P2;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.181, mailfrom: jdmason@kudzu.us)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e251eda7f03so4645181276.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 01 Oct 2024 08:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1727795390; x=1728400190; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/wUPPW5ly/bZ6n58nmQjyKgR5yla4YDhrWIuZWk/qRA=;
        b=nukx55P2uj1sbuL4rkCeNWWB0tNlxlpua9kjqr0PvFEtq96y2Q/wfZTorzrQzluEU5
         agalYFM04Ej0TIq/Sz/4HtyXn1HFOQDryXjqKgfkvEHpP8YyIQtpYz2nlzbpwG8MUaQZ
         QAaAmKJuykcKrEiKlDCJVU6uKM1gvH1hbCfAjpBaBsp8Aah4wfKDmP63nT0onEf/DliP
         c1XqKqVMrrlNWblKON9MUvMUda3p269k9eDtEf/xwfEpLYuITgThbAeLIXWDJP4S8qMS
         fBzwclc1AjO9mgoPrG7O5EmbTPmMZQjAUdpKl6HiFwON9QljLZGP9IYDijqkq8cUP4rU
         rJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727795390; x=1728400190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/wUPPW5ly/bZ6n58nmQjyKgR5yla4YDhrWIuZWk/qRA=;
        b=gqy9HMgIeBX3J5XsbzGdSCFnGHePnKTelWNSnNchngnzvddG3hHUb9kKvtOlwd7y/N
         XWUHtngXgXBqQz1AT8u+H/aYEpO9esuXyXFlgyyRuDEsoLA6YrWEFcKInJruZ4+whC/H
         TVe/xjm3XLvHii8saRm9GAi4ufUJlKcsq410+t5eok3fsP8+pM9sMdaW2rSCyc+mKLds
         rk7wFLjL/gZkP6qRizQEzDI30ZjHgpwGBXiQi63WCiYmqwuMPWT8M6J6bnQ8+xgfu437
         cHYzydSmdX7PG8AYf7+D2wHrHlwc9JY+3oGY8ph3YU9ofNPN2hRRgWlkv/2nv8cNiZA5
         EyqA==
X-Gm-Message-State: AOJu0YwN4gZLfde9ajAXB6ysJlt1pp++oqZQpndj5RxZwec92y1pKhOI
	8q8Q9yjh0ytOo+ItqPtmryhyAUz/6+hc/dJUBwdQPff8cg0dqTRXbkSjuYldTZ8Lkp1IHaj33tQ
	=
X-Google-Smtp-Source: AGHT+IH9+8yu7hdcaaao0AooTbmXpvZD+b+aV+W4bcXMPyMjrGGuYfP9Pc1FQ76ft8hUhPa7htv7Gg==
X-Received: by 2002:a25:d893:0:b0:e20:2da6:ed88 with SMTP id 3f1490d57ef6-e262c07f8famr2866026276.24.1727795389698;
        Tue, 01 Oct 2024 08:09:49 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e25e6294af6sm3213652276.49.2024.10.01.08.09.49
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 08:09:49 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] Revert "CI: switch to building against styhead branches where possible"
Date: Tue,  1 Oct 2024 11:09:48 -0400
Message-Id: <20241001150948.3543360-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 01 Oct 2024 15:10:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6154

This reverts commit 2b1348d74f9fb4e49ece3a8a0107307ec432f392.

Revert to allow the meta-arm master branch to use the master branch of
other layers.
---
 ci/base.yml                | 2 +-
 ci/clang.yml               | 1 -
 ci/meta-secure-core.yml    | 1 -
 ci/meta-virtualization.yml | 1 -
 4 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/ci/base.yml b/ci/base.yml
index 7b550dbfa283..d1c933d027ae 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -7,7 +7,7 @@ distro: poky
 
 defaults:
   repos:
-    branch: styhead
+    branch: master
 
 repos:
   meta-arm:
diff --git a/ci/clang.yml b/ci/clang.yml
index 7dd5d522a162..402292a6b86d 100644
--- a/ci/clang.yml
+++ b/ci/clang.yml
@@ -6,7 +6,6 @@ header:
 repos:
   meta-clang:
     url: https://github.com/kraj/meta-clang
-    branch: master
 
 local_conf_header:
   toolchain: |
diff --git a/ci/meta-secure-core.yml b/ci/meta-secure-core.yml
index 81280e737575..b34562b267cc 100644
--- a/ci/meta-secure-core.yml
+++ b/ci/meta-secure-core.yml
@@ -6,7 +6,6 @@ header:
 repos:
   meta-secure-core:
     url: https://github.com/Wind-River/meta-secure-core.git
-    branch: master
     layers:
       meta-secure-core-common:
       meta-signing-key:
diff --git a/ci/meta-virtualization.yml b/ci/meta-virtualization.yml
index d699d70a7fa3..c0ba70ba8e52 100644
--- a/ci/meta-virtualization.yml
+++ b/ci/meta-virtualization.yml
@@ -8,4 +8,3 @@ header:
 repos:
   meta-virtualization:
     url: https://git.yoctoproject.org/meta-virtualization
-    branch: master
-- 
2.39.5


