Return-Path: <floss@jetm.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51586C624D4
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 22:03:35 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7159.1788386613958499567
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Sep 2026 15:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@peridio.com header.s=google header.b=SOG3UEy1;
 spf=pass (domain: peridio.com, ip: 209.85.221.174, mailfrom: javier@peridio.com)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5bf88d3fc8fso68705e0c.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 02 Sep 2026 15:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=peridio.com; s=google; t=1788386613; x=1788991413; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+R2Li2DC1U81cwJiHLbjw2tyFcdkLfEtjK1ccnbseSA=;
        b=SOG3UEy1AH4gWeS1d9yVsAd/EG6W9xQgiH+YSNET7xkgo0lAJhOv6mkiTJRUn4QQUU
         c3MFaupSLb3Lvo8Jpues2vBJ/fh7wU4chyaH2vuaGIJxlPgiIF8OC1Rc4s6FX6jzLixS
         inmyt7J8b9eE2ZISVfMPPpzOvplVs2GlMZJREcQpMvVZWpBEaRqvyyjh5vkcMNWDRusI
         jUWy+wJLsbCD3h1+8iMjmcSDw/d9lVtcgyaejZDRXRmdx1KyBRoez283YyKDnWzVz1Yu
         tiCop6tERxt7B60gFEuceYd0MnzlUQuUmzQudHDb2Y7EBv712W1KRpYjitDg3NJqP8/k
         2qrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788386613; x=1788991413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+R2Li2DC1U81cwJiHLbjw2tyFcdkLfEtjK1ccnbseSA=;
        b=AoCe+7iYfDC01ozgxF0uKDapibGGX6hUQ0yVKN4BdnKfR5wXw4LpccYtZqLfgFljX5
         RwOuWy32RZDLSv2ua5iiWAJg1SLzLaFKk9vO0vOYv1m9dduodGNSh27Cw9K9XZrpAtAy
         5FrR1ioeymQGsKRclh7VSYL7oE/BIitfMLvmYApiEbXDWoUUxbLCB8GPjfrdDJAINuGq
         ysccmW/EQYa2JcRFCuWGIRrMV9/wYmLlfBKAr/hzc3Gla/S7m5T3gq1N4T1vafBXSow0
         gdz6JDy7HR5WbzlGQ+dQI+f/tQm6lRbBqPRXVCvMOWAS8qMMhaVcggnZbLLbJS/hohYu
         RGuA==
X-Gm-Message-State: AFuF++nbggKqGjWu6p+o7IsopzP17O7H96dBmUgiWvgC0s4TIJiAocLY
	OesVozl5siupFtN33G0BJRm6zpVE6gRMS9byLcSPmMjDrLaClLA17ywuVVKVVh1DZEYAq+QUYLg
	Zom6jqx8=
X-Gm-Gg: AYBFou3kgtEh0bE5zzwU9HKLP2iyRauKJFOzPs6UK1ZLXQuLuFEFEujXRoC2Ts5q+QY
	137AFiK4crl0EEoRyOotyeo4N9fahYak/st2U4RZHDNb18q01ecB4y9i5oLs4zPOn10sBUgbnWt
	ybHPQag/VwBqfWiYfqF1hO1oiLGtw59m+lHoWzMt6IoTR9tLVgsuj0btXgkh9Te+O0o1W82MjBM
	5bYwa7AM6OQUyufpNDJtiy2z4muOkabpAlAhDxEu8f2U7YgwTYY/ytDCwG0Zk/5cCZbbICcs7tO
	Y5e1s+KvWVyxSZ5La5FIY5yvkddc5kvv5u5eKnEAAB7oztfXSDUQndsPboBtUdKpMVICRkYUAx3
	nN1cpk4/klPd7uhKeLW4UeyImx0hguPzqXSWXYlD40vKYzZdUPT/4w0NizA8cbZZdoNDWC2c01z
	8iQS9LbhTkti93bTxg+Vy7FzYSFE9zvNiTn38IZHKsw3zoxuYHrdt3JwY=
X-Received: by 2002:a05:6122:861a:b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5c7d23a7284mr1512596e0c.0.1788386607854;
        Wed, 02 Sep 2026 15:03:27 -0700 (PDT)
Received: from localhost ([190.113.101.40])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9806714fd39sm3392041241.0.2026.09.02.15.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:03:27 -0700 (PDT)
From: Javier Tia <javier@peridio.com>
To: meta-arm@lists.yoctoproject.org
Cc: Javier Tia <javier@peridio.com>
Subject: [scarthgap PATCH 0/3] backport the CVE_PRODUCT fixes from master
Date: Wed,  2 Sep 2026 16:03:23 -0600
Message-ID: <20260902220326.2780674-1-javier@peridio.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 02 Sep 2026 22:03:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7148

The four CVE_PRODUCT commits from 2026-06-10 never reached the release
branches, so cve-check on scarthgap still scans these recipes under names
that match nothing in NVD. A recipe that matches nothing reports zero
CVEs, which is indistinguishable from a recipe that was scanned and found
clean.

Three of the four apply here; the fourth is scp-firmware, whose shared
meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc does not exist on
scarthgap (only the per-board meta-arm-bsp variants do), so it is sent
for wrynose only.

Measured against the NVD 2.0 API, replaying each CPE version range through
oe.cve_check.Version at the PVs that ship:

  trustedfirmware:trusted_firmware-a   7 records, none reachable today
  arm:arm-trusted-firmware             0 records
  arm:arm_trusted_firmware             0 records

For trusted-firmware-a that turns a silent zero into a real scan: TF-A
2.10 gains one genuine unpatched finding (CVE-2023-31339), while 2.12 and
2.14 gain the scan and no finding.

Note this makes affected recipes start reporting CVEs where they reported
none, which will look like a regression to anyone gating CI on a count.
That is the intended effect rather than a side effect.

Cherry-picked from master with no changes; each patch carries its
(cherry picked from commit ...) line. Found while auditing CVE_PRODUCT
coverage on an i.MX BSP built from scarthgap.

Jon Mason (3):
  arm/optee: modify CVE_PRODUCT
  arm/trusted-firmware-a: modify CVE_PRODUCT
  arm/trusted-firmware-m: add CVE_PRODUCT

 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 3 ++-
 .../recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc     | 2 ++
 meta-arm/recipes-security/optee/optee-os.inc                  | 4 +++-
 3 files changed, 7 insertions(+), 2 deletions(-)

-- 
Javier Tia


