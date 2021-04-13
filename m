Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.6732.1618306867103224447
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 02:41:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=j3RPKFNA;
 spf=pass (domain: blade-group.com, ip: 209.85.221.44, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wr1-f44.google.com with SMTP id w4so12009317wrt.5
        for <meta-arm@lists.yoctoproject.org>; Tue, 13 Apr 2021 02:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4k3JU3hovQwXb4oKbDjzLBID7Flh3wAgLocYv35y/p4=;
        b=j3RPKFNAcKd6zKG8VxrscvhX4umOTTwGKoSQrbT9ofYLq/T9Rm3nN8Cbox1jM2w1u5
         iWDf+8gICXAN3/44xJRCGCn+qRXHjWHZQ+6QBUZJ6SpZaiP6Lp/sblplJIsMIDbbKPbM
         Gd83GERAmVMwl8DBsZZ+bbgs1QDnqQgoFM8ubmMLJaiIKZXNyaP6Pv+G/Mg7I/9qGvqo
         EJAOt6Y6GDbffFvAMcnrunymo0bVPfDpWh0aT3JEPf2ERU8Bb6ON4HTbaa2/27IrRjRQ
         Sk+JefyYItUSyat7XKduI9Sm0QPnzhXgR9bpp66d7P+h0X+oVSvUWQ0vXTJRkMteWqjN
         pd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4k3JU3hovQwXb4oKbDjzLBID7Flh3wAgLocYv35y/p4=;
        b=bkjj/uSoU2pmdCgxTZIcG19OihZbFV6bWAb0pNmdytAcUvexd2coeB91gIeTHMR5Ci
         GhEMzGjK5V5i7itUdciH95T//z2/y6YK35muH2gz3IEhZWBe7qpMi7TA1vEoEwV0wXhz
         y1DjtIdAEVlFxghCtTLwTb2WLBv24y9jMYsIla85CfTGSO3CnEX3CO/zeHCaHeyFQaTG
         XmiPcTvC43U6R6KM0dXHkLK0mU8mNhUOmu4sCKH4XNtG7Rq9m+g1boNf7LUJgw3etRfQ
         TBXWPauHPlxv9H4hcKjTRcYDzBPLbXWNK/33H1+sQL7c/8xAgUOgLQXlBXcy+AYp/dfT
         0o9A==
X-Gm-Message-State: AOAM5314cyLgyEDylndFhDdqX3NmvU5m6FjpO4W5r+NfPKfa8pMuAnAz
	365o3W9vLgG2QvWNq6btDQVYJhYGOkAhjw==
X-Google-Smtp-Source: ABdhPJyKIUw3yqiW9NPYZ4iofi8/1v7kYPoZ2eDIA4G74WWw1pNysy/gR+gvMfz5UChg99YTuqhCsg==
X-Received: by 2002:adf:f80c:: with SMTP id s12mr25346140wrp.115.1618306865465;
        Tue, 13 Apr 2021 02:41:05 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id g12sm10544145wru.47.2021.04.13.02.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 02:41:05 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: meta-arm@lists.yoctoproject.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH 2/4] arm/optee-os: mark LDFLAGS patch as submitted
Date: Tue, 13 Apr 2021 11:40:36 +0200
Message-Id: <20210413094038.3577754-3-yann@blade-group.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413094038.3577754-1-yann@blade-group.com>
References: <20210413094038.3577754-1-yann@blade-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 .../optee-examples/0001-make-Pass-ldflags-during-link.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee/optee-examples/0001-make-Pass-ldflags-during-link.patch b/meta-arm/recipes-security/optee/optee-examples/0001-make-Pass-ldflags-during-link.patch
index 0894a7a..84202ef 100644
--- a/meta-arm/recipes-security/optee/optee-examples/0001-make-Pass-ldflags-during-link.patch
+++ b/meta-arm/recipes-security/optee/optee-examples/0001-make-Pass-ldflags-during-link.patch
@@ -8,7 +8,7 @@ for gnu_hash among others which sets the linking straight
 using LDFLAGS varible here means, we can affect the linker flags
 from build environment
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/linaro-swg/optee_examples/pull/85]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-- 
2.30.2

