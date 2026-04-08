Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CEF310F9960
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 17:06:44 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.111582.1775668003528262825
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Apr 2026 10:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Rgc4Q1Rk;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43b95e5b3afso19430f8f.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 08 Apr 2026 10:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775668001; x=1776272801; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AQoj6HAb38IT924LvYf1hDYpnhHBfatwYFWvsArCeQc=;
        b=Rgc4Q1RkfoArqk5uI1Z4vqpc6728Gbqdx9OILnbvaxZ9ST8gXk01zbbILPIfv9yaic
         Y1GAZQZx0sA4U55mNRVJRv1y0K8tUAxbsHHjv/xFt5/GYFq1iAE6t27gmsY+GdllM9CQ
         LQiVgPQ/4C/+KzMltrb7CQ1Ab+c+W+277JoSr318Wkla5dzFUir2etoJd1splXaYZn77
         +zhpwKrIrub4CPq9goDxxeEpvF0KkasWvQB6VESwB27JdmMI6Mt1x/tuixut4/UWAVOt
         qvkipTQnnzfekisBja8XaLrtck96ExrhJlD4tq9BlpXEj0leaAlYTF9ib6JQkRkConxm
         JiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775668001; x=1776272801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQoj6HAb38IT924LvYf1hDYpnhHBfatwYFWvsArCeQc=;
        b=f1mZSwkENb/7kH6OThVIsGkKzyJH5r2xhahAoYbIKOR2SSXLP7qqCeSffcm5yOXlAc
         LWbcF2mDIhjrJGJoa8BzDbA9KF6KXw22cJMUYvnEa3RM7SRWXDuSuGwsUkQaLwu6FGPs
         47nG1bQBy8tekKg1hSzJNKmNjUnEweSeHmE0DEkMkEaMtHJ8A21+ZXhloG8XBv5fRKck
         JJvkQn+KZSVXGKYUDbMVSyI6smoyjSVo7kqE9Ug/C1QKYYuvevd6s1fGtL/YJrZKDWxs
         LXlPWt57ZsZuS9EZOSgTs2nbVUnY7+Ck/5Q6GaaKVPpCQJvJoPSjpx+6jFiwX7jVUwsV
         o1Qg==
X-Gm-Message-State: AOJu0YynqbU6B5n3Pz0qjLuPIv5KXjt7TO6813C3sqmwCr4kAhwBtCzc
	EgdDRzyJJzgYwqBiW4F4z44qVQPxTMoMUD4BAvYOPLnhxaPYe2dCFEpUYuCgSg==
X-Gm-Gg: AeBDieviE+OdaVdEWAeM0+KH2st7BGTqXKqhnX6DJkHaWgbTU7izAwsmHLq5J873W0J
	QvMGC8bpdRbH6Ftu6jHEcezg2Y2fbndD55nzrOJnRgFq5rGquzrebTSca5tuqQ1hYvaUFNqrg0N
	5UigsbpmzTGoVWTDHP1IHO6sKQBo99RUdotzHGqak3zbJ04H2pp5LBB2H053MaKL3dadl+oX5b8
	NlQVrJ08aM9D99KsUFlyZ0T60MAMmrb+YO6JCar/xh+ecizZzo/BENlVnj8vmAfeMlasZsmwd2i
	6/PlBg/zC95Ppcw77n5iakS1ebCzeJL8wak9wRIUB3H6pzCpd2dP2x9QtnWZrXO81ekrWbQWsq5
	BzV+nWmQTjPEwugj0+UeflGqV5yCXPvIJ6eq1fLw2zfI36muwXDCStzoLXGLOHoJtXd4+ewSnqP
	Aq3vINenvX8Ba0A9QR6TbAcYf7jxn3XUDD+udO
X-Received: by 2002:a05:6000:25ca:b0:43b:4f0c:aefd with SMTP id ffacd0b85a97d-43d292cba32mr33159376f8f.23.1775668000983;
        Wed, 08 Apr 2026 10:06:40 -0700 (PDT)
Received: from toster.lan ([185.228.162.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d282esm59713640f8f.18.2026.04.08.10.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 10:06:39 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: [PATCH] wic: move to files/wic
Date: Wed,  8 Apr 2026 18:06:35 +0100
Message-ID: <20260408170635.2390098-1-jose.quaresma@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 Apr 2026 17:06:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7008

Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
---
 .../{ => files}/wic/corstone1000-flash-firmware-fvp.wks.in        | 0
 .../{ => files}/wic/corstone1000-flash-firmware-mps3.wks.in       | 0
 meta-arm-bsp/{ => files}/wic/efi-disk-esp-only.wks.in             | 0
 meta-arm-bsp/{ => files}/wic/efi-disk-no-swap.wks.in              | 0
 meta-arm/{ => files}/wic/efi-disk.wks.in                          | 0
 meta-arm/{ => files}/wic/qemu-efi-disk.wks.in                     | 0
 meta-arm/{ => files}/wic/qemuarm.cfg                              | 0
 meta-arm/{ => files}/wic/qemuarm.wks                              | 0
 meta-arm/{ => files}/wic/qemuarm64.cfg                            | 0
 meta-arm/{ => files}/wic/qemuarm64.wks                            | 0
 10 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-arm-bsp/{ => files}/wic/corstone1000-flash-firmware-fvp.wks.in (100%)
 rename meta-arm-bsp/{ => files}/wic/corstone1000-flash-firmware-mps3.wks.in (100%)
 rename meta-arm-bsp/{ => files}/wic/efi-disk-esp-only.wks.in (100%)
 rename meta-arm-bsp/{ => files}/wic/efi-disk-no-swap.wks.in (100%)
 rename meta-arm/{ => files}/wic/efi-disk.wks.in (100%)
 rename meta-arm/{ => files}/wic/qemu-efi-disk.wks.in (100%)
 rename meta-arm/{ => files}/wic/qemuarm.cfg (100%)
 rename meta-arm/{ => files}/wic/qemuarm.wks (100%)
 rename meta-arm/{ => files}/wic/qemuarm64.cfg (100%)
 rename meta-arm/{ => files}/wic/qemuarm64.wks (100%)

diff --git a/meta-arm-bsp/wic/corstone1000-flash-firmware-fvp.wks.in b/meta-arm-bsp/files/wic/corstone1000-flash-firmware-fvp.wks.in
similarity index 100%
rename from meta-arm-bsp/wic/corstone1000-flash-firmware-fvp.wks.in
rename to meta-arm-bsp/files/wic/corstone1000-flash-firmware-fvp.wks.in
diff --git a/meta-arm-bsp/wic/corstone1000-flash-firmware-mps3.wks.in b/meta-arm-bsp/files/wic/corstone1000-flash-firmware-mps3.wks.in
similarity index 100%
rename from meta-arm-bsp/wic/corstone1000-flash-firmware-mps3.wks.in
rename to meta-arm-bsp/files/wic/corstone1000-flash-firmware-mps3.wks.in
diff --git a/meta-arm-bsp/wic/efi-disk-esp-only.wks.in b/meta-arm-bsp/files/wic/efi-disk-esp-only.wks.in
similarity index 100%
rename from meta-arm-bsp/wic/efi-disk-esp-only.wks.in
rename to meta-arm-bsp/files/wic/efi-disk-esp-only.wks.in
diff --git a/meta-arm-bsp/wic/efi-disk-no-swap.wks.in b/meta-arm-bsp/files/wic/efi-disk-no-swap.wks.in
similarity index 100%
rename from meta-arm-bsp/wic/efi-disk-no-swap.wks.in
rename to meta-arm-bsp/files/wic/efi-disk-no-swap.wks.in
diff --git a/meta-arm/wic/efi-disk.wks.in b/meta-arm/files/wic/efi-disk.wks.in
similarity index 100%
rename from meta-arm/wic/efi-disk.wks.in
rename to meta-arm/files/wic/efi-disk.wks.in
diff --git a/meta-arm/wic/qemu-efi-disk.wks.in b/meta-arm/files/wic/qemu-efi-disk.wks.in
similarity index 100%
rename from meta-arm/wic/qemu-efi-disk.wks.in
rename to meta-arm/files/wic/qemu-efi-disk.wks.in
diff --git a/meta-arm/wic/qemuarm.cfg b/meta-arm/files/wic/qemuarm.cfg
similarity index 100%
rename from meta-arm/wic/qemuarm.cfg
rename to meta-arm/files/wic/qemuarm.cfg
diff --git a/meta-arm/wic/qemuarm.wks b/meta-arm/files/wic/qemuarm.wks
similarity index 100%
rename from meta-arm/wic/qemuarm.wks
rename to meta-arm/files/wic/qemuarm.wks
diff --git a/meta-arm/wic/qemuarm64.cfg b/meta-arm/files/wic/qemuarm64.cfg
similarity index 100%
rename from meta-arm/wic/qemuarm64.cfg
rename to meta-arm/files/wic/qemuarm64.cfg
diff --git a/meta-arm/wic/qemuarm64.wks b/meta-arm/files/wic/qemuarm64.wks
similarity index 100%
rename from meta-arm/wic/qemuarm64.wks
rename to meta-arm/files/wic/qemuarm64.wks
-- 
2.53.0


