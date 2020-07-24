Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.8417.1595604533013651659
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 24 Jul 2020 08:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=jNdX7u2y;
 spf=pass (domain: burtonini.com, ip: 209.85.221.67, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f67.google.com with SMTP id f2so8675520wrp.7
        for <meta-arm@lists.yoctoproject.org>; Fri, 24 Jul 2020 08:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CmvlZoP7QEU/fT/+Yv6FUDCc5COecVOrpWR8eXOvmWU=;
        b=jNdX7u2yRaY+K8cuRcTuOoL70FnbwxAa66qHDLFWdVcL9yXjYlaZVhl0lOurggPFi+
         KLDkP/HfzvQHbKwudgKpCRT/BO9nCZmDvwvrb+c1nwURFkkCNJ+eYgTzProuAZQZR3iJ
         9dp6fBgQ5MO/az5FgZbcRZm+27H9X6CR8r95HI1XDB6CZAFmfLDCOvI7Ambl2KlgPmGy
         glGf8A6TxnD4f71RVaXqtH13wXDc5aNgkAnaTCDzZMXcXjxLiKrLrroib5qOzTIkKN86
         npV3KFGGC5irJ3BEobluHzH4/rxmLLn+qXgE6P1XXgy8TGsDJYrplTcHj40ToNMPEFdX
         4eLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CmvlZoP7QEU/fT/+Yv6FUDCc5COecVOrpWR8eXOvmWU=;
        b=ZQflJEBEvvYPE78rp4gJKiVyo0skASQJFbNncUdxT38tRIUKdXdzWUtj3CI4viPCNx
         LhqRjF438w9ED/0a/heHU6ceDYHK7Oeda1esntuZnW2kKsmdxL9Emtc+7qVmE6sjl+AO
         mbaj+z51cvEKSsvQEQUAhzbkK2LJWkTP6CVGeYgQ9uofCr246rPlwVJtaHsO78EJnXBG
         Yq6zCvbGcUBaUY26LrRWq/lOOkXjwpsfT2AKnx9jfe9UftWU9CNoilK8qPw8hyOEjuBe
         lwuZEDU/Xw1NEF4TawN489/ESj4q8z6Diaf1fvDUO7z/nbve6jQmomoft047q3m6cTZG
         CAUg==
X-Gm-Message-State: AOAM53042oEwxd0fuKA1LeLA4C+rieJfbtOYjPeQmDrxLIuLvD800gLV
	wHHsrLTA45RpM7kHK/wJG14bnxV8wQs+Gw==
X-Google-Smtp-Source: ABdhPJznS2q66ADck7Rl5NgCqGNSJ/3inSXnhIzlLTVRQ2WXJh8492blPeVpXX/4LQmT1meqbq3YkQ==
X-Received: by 2002:a5d:4008:: with SMTP id n8mr8453212wrp.255.1595604531187;
        Fri, 24 Jul 2020 08:28:51 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id z207sm7593090wmc.2.2020.07.24.08.28.50
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 08:28:50 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/trusted-firmware-a: do verbose builds
Date: Fri, 24 Jul 2020 16:28:46 +0100
Message-Id: <20200724152846.453766-1-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

Verbose builds are useful when looking for compile problems, and as the logs
go directly to files we can simply turn them on by default.

Change-Id: I91c6314e331a5024543138ea77a111b1d59cf371
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index e57d3fe..b735420 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -78,6 +78,8 @@ do_configure[noexec] = "1"
 DEPENDS_append = " dtc-native openssl-native"
 DEPENDS_append_aarch64_qemuall ?= " optee-os"
 
+EXTRA_OEMAKE += "V=1"
+
 # Add platform parameter
 EXTRA_OEMAKE += "BUILD_BASE=${B} PLAT=${TFA_PLATFORM}"
 
-- 
2.26.2

