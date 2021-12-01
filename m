Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A91BC433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 02:45:59 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.87107.1638326758568890136
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Nov 2021 18:45:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gJSqcwh9;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 j6-20020a17090a588600b001a78a5ce46aso19874423pji.0
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Nov 2021 18:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gJmuGyFNuwIQIEmYldUMXwD4inHqGIjM+8TU/vL5RyM=;
        b=gJSqcwh916yzXrTEG2L0JKQFpK7mqMahA0D8tn0XrDwsBtdfNnXWYng66iY7zwIWir
         jyDvrZ9JIX3DRZ09QzrrLigPmbINW7L8nNdVpFRsS3S2Q+f5WfuMpS4oBF7F2dh1D1Fq
         IQbIzgPOjW6ZWvRTJFZ6fbZDdvR3APNG5PTAamblkzJmVsR2NDvMVLC46r7w3b8moslk
         Fo7Cfur3nUqhPIaus4ubuQ8nNsPAzrE9aagOLDn+jEuWSmLOXuEOx1YOsP7ROH75ztwP
         5xmlg1RjbI/Rb+N/+3yzKKon8JhE/rSNTjdOWwvcpeItkExSwnu7Ziu+yPaVoCcrlbek
         HWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gJmuGyFNuwIQIEmYldUMXwD4inHqGIjM+8TU/vL5RyM=;
        b=mhWxxAYApUKBV8wTJASwiqXPUkin1SrnaKkHqIuADgggNDeUuqQQIppjZMsq5IxFuA
         MpjeB29n/m60falbpDB4Doqz97SeUpM1Im/I2BhJRhslr2Af62Hs7Z3sYTVmxYPk1C8H
         r6ZDT6Oobmm6YMZIfxYna4RhYASf/h1lLb2DuV+TIYMciHfpmhbwgX+g+qmImvgXCQma
         iqfyz0Jag0o36kns4Mkbf2CaLjb9Yay6rYH9DUFkAUFQn9Bs7/oEL6Y9kxVtSi1ywJEZ
         HP2CkwWCKZQg26FWVj+ZPVR7UiRJJMt2iELaVYv0ObYvP8C4PQ3s7E0XuQRGAbnoHvQ8
         TiAA==
X-Gm-Message-State: AOAM532Wum4Lxt9Ci1Rtjy6HjzpL3rELG48vzoZroL9Bbny+kZUFaxmO
	QPy0ANQI8IjlHKcI+Z6udmEiX29IJXYU3Q==
X-Google-Smtp-Source: 
 ABdhPJyx7lfNqcRtvtC4S1VUVS/yXfrlYRSIMU6NSPpnW8KEZLdsp5oZKa4r8xKRpa22uaEOr23zGA==
X-Received: by 2002:a17:90a:6e0c:: with SMTP id
 b12mr3722840pjk.41.1638326757944;
        Tue, 30 Nov 2021 18:45:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 f19sm23024736pfv.76.2021.11.30.18.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 18:45:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] edk2-firmware: Pin to arm and x86 only
Date: Tue, 30 Nov 2021 18:45:55 -0800
Message-Id: <20211201024555.1102657-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211201024555.1102657-1-raj.khem@gmail.com>
References: <20211201024555.1102657-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 Dec 2021 02:45:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2496

Other architectures are untested perhaps unsupported too

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend b/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
index c0fc262..ce57988 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
@@ -25,3 +25,5 @@ do_install:append:qemu-generic-arm64() {
     # QEMU requires that the images be minimum of 256M in size
     truncate -s 256M ${D}/firmware/SBSA_FLASH*.fd
 }
+
+COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
-- 
2.34.1


